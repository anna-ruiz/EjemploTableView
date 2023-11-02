//
//  CrearTareaViewController.swift
//  EjemploTableView
//
//  Created by Anna Ruiz on 02/11/2023.
//

import UIKit

class CrearTareaViewController: UIViewController {
    
    
    @IBOutlet weak var txtContenido: UITextField!
    @IBOutlet weak var txtTitulo: UITextField!
    
    var delegate: ObtenerTarea?
   
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    
    @IBAction func btnInsertarTarea(_ sender: Any) {
        let titulo = txtTitulo.text!
        let contenido = txtContenido.text!
        
        if !titulo.isEmpty && !contenido.isEmpty {
            let tarea = Tarea(titulo: titulo, contenido: contenido)
            
            delegate?.obtener(dato: tarea)
        
            self.dismiss(animated: true, completion: nil)
        }
    }


}
