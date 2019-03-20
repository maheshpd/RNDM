//
//  ViewController.swift
//  RNDM
//
//  Created by ArfeenKhanmac on 16/03/19.
//  Copyright © 2019 ArfeenKhanmac. All rights reserved.
//

import UIKit
import Firebase
enum ThoughtCategory : String  {
    case serious = "serious"
    case funny  = "funny"
    case crazy  = "creazy"
    case popular   = "popular"
}

class MainVC: UIViewController, UITableViewDataSource, UITableViewDelegate {

    //Outlets
    
    @IBOutlet private weak var segmentControl: UISegmentedControl!
    @IBOutlet private weak var tableView: UITableView!
    
    //Variables
    private var thoughts = [Thought]()
    private var thoughtsCollectionRef: CollectionReference!
    private var thoughtsListener: ListenerRegistration!
    private var selectedCategory = ThoughtCategory.funny.rawValue
    private var handler: AuthStateDidChangeListenerHandle?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.estimatedRowHeight = 80
        tableView.rowHeight = UITableView.automaticDimension
        
        thoughtsCollectionRef = Firestore.firestore().collection(THOUGHTS_REF)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setListener()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        thoughtsListener.remove()
    }
    
    @IBAction func categoryChanged(_ sender: Any) {
        switch segmentControl.selectedSegmentIndex {
        case 0:
            selectedCategory = ThoughtCategory.funny.rawValue
        case 1:
            selectedCategory = ThoughtCategory.serious.rawValue
        case 2:
            selectedCategory = ThoughtCategory.crazy.rawValue
        default:
            selectedCategory = ThoughtCategory.popular.rawValue
        }
        
        thoughtsListener.remove()
        setListener()
        
    }
    
    func setListener(){
        if selectedCategory == ThoughtCategory.popular.rawValue {
            thoughtsListener = thoughtsCollectionRef
                .order(by: NUM_LIKES, descending: true)
                .addSnapshotListener { (snapshot, error) in
                    if let err = error {
                        debugPrint("Error fetching doc: \(err)")
                    }else {
                        self.thoughts.removeAll()
                        self.thoughts = Thought.parseData(snapshot: snapshot)
                        self.tableView.reloadData()
                    }
            }
        }else {
            thoughtsListener = thoughtsCollectionRef
                .whereField(CATEGORY, isEqualTo: selectedCategory)
                .order(by: TIMESTAMP, descending: true)
                .addSnapshotListener { (snapshot, error) in
                    if let err = error {
                        debugPrint("Error fetching doc: \(err)")
                    }else {
                        self.thoughts.removeAll()
                        self.thoughts = Thought.parseData(snapshot: snapshot)
                        self.tableView.reloadData()
                    }
            }
        }
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return thoughts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "thoughtCell", for: indexPath) as? ThoughtCell {
        
            cell.configureCell(thought: thoughts[indexPath.row])
            return cell
        }else {
            return UITableViewCell()
        }
    }
    
}

