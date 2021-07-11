//
//  DatosPersonajes.swift
//  Practica1
//
//  Created by Ramón Menor Molina on 11/7/21.
//

import Foundation

class DatosPersonajes {
    var listaHerores: Personajes {
        [
            Personaje(imagen: "Baner_CapitanAmerica", nombre: "Capitán América", descripcion: "Un heroe"),
            Personaje(imagen: "Baner_BlackPanther", nombre: "Black Panther", descripcion: "Un heroe"),
            Personaje(imagen: "Baner_LaViudaNegra", nombre: "La viuda negra", descripcion: "Un heroe")
        ]
    }
    
    var listaVillanos: Personajes {
        [
            Personaje(imagen: "Baner_Yon-Rogg", nombre: "Yon Rogg", descripcion: "Un villano"),
            Personaje(imagen: "Baner_Dormammu", nombre: "Dormam Mu", descripcion: "Un villano"),
            Personaje(imagen: "Baner_Ego", nombre: "Ego", descripcion: "Un villano")
        ]
    }
}
