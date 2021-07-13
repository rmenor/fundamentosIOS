//
//  VillanosTableViewController.swift
//  Practica1
//
//  Created by Ramón Menor Molina on 11/7/21.
//

import UIKit

class VillanosTableViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    private let datosPersonajes = DatosPersonajes()
    private var villanos: Personajes = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        leerDatos()
        tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destino = segue.destination as? DetailViewController,
              let personaje = sender as? Personaje else {
            return
        }
        
        destino.personaje = personaje
    }
    
    private func leerDatos() {
        villanos = datosPersonajes.listaVillanos
    }
    
    // MARK: - Cuando aparece la pantalla
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.isNavigationBarHidden = true
    }
}

extension VillanosTableViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return villanos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellVillanos = tableView.dequeueReusableCell(withIdentifier: VillanosTableViewCell.cellIdentifier, for: indexPath) as? VillanosTableViewCell
        
        if indexPath.row < villanos.count {
            let villano = villanos[indexPath.row]
            cellVillanos?.updateViews(personaje: villano)
        }
        
        return cellVillanos ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {        
        if indexPath.row < villanos.count {
            let villano = villanos[indexPath.row]
            
            // Option 1: Segue
            performSegue(withIdentifier: "SEGUE_FROM_HOME_TO_DETAIL", sender: villano)
            
            //let storyboardHome = UIStoryboard(name: "Detail", bundle: nil)
            //if let destino = storyboardHome.instantiateInitialViewController() as? DetailViewController {
                //destino.personaje = personaje
                //navigationController?.pushViewController(destino, animated: true)
            //}
        }
    }
}

