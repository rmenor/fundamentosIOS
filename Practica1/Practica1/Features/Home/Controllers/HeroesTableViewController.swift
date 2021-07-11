//
//  HeroesTableViewController.swift
//  Practica1
//
//  Created by Ramón Menor Molina on 11/7/21.
//

import UIKit

class HeroesTableViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    private let datosPersonajes = DatosPersonajes()
    private var heroes: Personajes = []
    
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
        heroes = datosPersonajes.listaHerores
    }
    
    // MARK: - Cuando aparece la pantalla
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.isNavigationBarHidden = true
    }
}

extension HeroesTableViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return heroes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellHeroes = tableView.dequeueReusableCell(withIdentifier: HeroesTableViewCell.cellIdentifier, for: indexPath) as? HeroesTableViewCell
        
        if indexPath.row < heroes.count {
            let heroe = heroes[indexPath.row]
            cellHeroes?.updateViews(personaje: heroe)
        }
        
        return cellHeroes ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row < heroes.count {
            let heroe = heroes[indexPath.row]
            
            // Option 1: Segue
            performSegue(withIdentifier: "SEGUE_FROM_HOME_TO_DETAIL", sender: heroe)
            
            //let storyboardHome = UIStoryboard(name: "Detail", bundle: nil)
            //if let destino = storyboardHome.instantiateInitialViewController() as? DetailViewController {
                //destino.personaje = personaje
                //navigationController?.pushViewController(destino, animated: true)
            //}
        }
    }
}
