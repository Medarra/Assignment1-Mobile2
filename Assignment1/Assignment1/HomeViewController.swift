//
//  HomeViewController.swift
//  Assignment1
//
//  Created by Student on 2026-10-09.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet var stack : UIStackView!
    @IBOutlet var listButton : UIButton!
    @IBOutlet var addButton : UIButton!
    @IBOutlet var titleLabel : UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.text = NSLocalizedString("study_group_organizer", comment: "")
        listButton.setTitle(NSLocalizedString("list_sessions", comment: ""), for: .normal)
        addButton.setTitle(NSLocalizedString("add_session", comment: ""), for: .normal)
    }
}
