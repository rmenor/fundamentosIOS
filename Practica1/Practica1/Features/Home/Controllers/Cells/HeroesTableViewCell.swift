//
//  HeroesTableViewCell.swift
//  Practica1
//
//  Created by Ramón Menor Molina on 11/7/21.
//

import UIKit

class HeroesTableViewCell: UITableViewCell {
    static let cellIdentifier: String = String(describing: HeroesTableViewCell.self)
    
    @IBOutlet weak var cellViewHeroes: UIView!
    @IBOutlet weak var imagenPersonaje: UIImageView!
    @IBOutlet weak var nombre: UILabel!
    @IBOutlet weak var descripcion: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        selectionStyle = .none
        
        cellViewHeroes.layer.cornerRadius = 4.0
        cellViewHeroes.layer.shadowColor = UIColor.gray.cgColor
        cellViewHeroes.layer.shadowOffset = CGSize.zero
        cellViewHeroes.layer.shadowOpacity = 0.7
        cellViewHeroes.layer.shadowRadius = 4.0
    }
    
    override func prepareForReuse() {
        super .prepareForReuse()
        
        imagenPersonaje.image = nil
        nombre.text = nil
        descripcion.text = nil
    }
    
    func updateViews(personaje: Personaje) {
        update(imagen: personaje.imagen)
        update(nombre: personaje.nombre)
        update(descripcion: personaje.descripcion)
    }
    
    private func update(imagen: String?) {
        imagenPersonaje.image = UIImage(named: imagen ?? "")
    }
    
    private func update(nombre: String?) {
        self.nombre.text = nombre
    }
    
    private func update(descripcion: String?) {
        self.descripcion.text = descripcion
    }
}
