//
//  _TableViewController.swift
//  Tables
//
//  Created by Daniel Sierra  F on 10/24/16.
//  Copyright © 2016 danieluchin. All rights reserved.
//

import UIKit

class _TableViewController: UITableViewController {
    
    var canciones: [String] = []

    @IBOutlet var myTable: UITableView!
    
    @IBOutlet var editBtn: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        let documentsPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        print(documentsPath.path)
        
        // Carga la lista de archivos del directorio documentos
        let fm = FileManager.default
        let allfiles = try? fm.contentsOfDirectory(atPath: documentsPath.path)
        print(allfiles!)
        
        canciones = allfiles!
        
    }

    @IBAction func editAction(_ sender: UIBarButtonItem) {
        if self.isEditing {
            setEditing(false, animated: true)
            editBtn.title = "Edit"
        } else {
            setEditing(true, animated: true)
            editBtn.title = "Done"
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.canciones.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableCell_", for: indexPath)
        
        cell.textLabel?.text = canciones[indexPath.row];

        return cell
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool
    {
        return true
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath)
    {
        if editingStyle == .delete
        {
            canciones.remove(at: indexPath.row)
            tableView.reloadData()
        } else if editingStyle == .insert {
            
        }
    }
    
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath){
        let element_removed = canciones.remove(at: fromIndexPath.row);
        canciones.insert(element_removed, at: to.row)
        print(canciones)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let selected = self.myTable.indexPathForSelectedRow!
        let s = segue.destination as! ViewController
        //s.song = canciones[selected.row]
        s.songList = canciones
        s.songPos = selected.row
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */


}
