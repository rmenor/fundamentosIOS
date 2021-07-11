//
//  SplashViewController.swift
//  Practica1
//
//  Created by Ramón Menor Molina on 11/7/21.
//

import UIKit

class SplashViewController: UIViewController {
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Cuando aparece la pantalla
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.isNavigationBarHidden = true
        
        activityIndicator.startAnimating()
        leerDatos()
    }
    
    // MARK: - Cuando desaparece la vista
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        navigationController?.isNavigationBarHidden = false
        
        activityIndicator.stopAnimating()
    }
    
    // MARK: - Private methods
    private func leerDatos() {
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(3)) { [weak self] in
            let storyboardHome = UIStoryboard(name: "Home", bundle: nil)
            
            if let destino = storyboardHome.instantiateInitialViewController() {
                self?.navigationController?.setViewControllers([destino], animated: true)
            }
        }
    }
}
