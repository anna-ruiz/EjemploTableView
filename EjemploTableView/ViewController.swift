//
//  ViewController.swift
//  EjemploTableView
//
//  Created by Anna Ruiz on 02/11/2023.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, ObtenerTarea {
    
    
    @IBOutlet weak var tablaTareas: UITableView!
    
    var listaTareas: [Tarea]!
    var tarea: Tarea!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        listaTareas = []//Inicializamos la vista
        tablaTareas.delegate = self
        tablaTareas.dataSource = self
        
    }
    
    //Implementamos los 2 metodos necesarios
    //esta devuelve la posicion / get items
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        listaTareas.count
    }
    
        
    //devuelve la fila
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //debemos recuperar de la lista la tarea
        let celda = tableView.dequeueReusableCell(withIdentifier: "CELDA", for: indexPath) as! CeldaTableViewCell
        
        //cogemos la tarea de la posicion en la q estoy
        tarea = listaTareas[indexPath.row]
        
        //rellenar los label de la fila
        celda.lbTitulo.text = tarea.titulo
        celda.lbContenido.text = tarea.contenido
        
        //devolver la fila/celda
        return celda
    }

    func obtener(dato: Tarea) {
        listaTareas.append(dato) //Añadimos la tarea q recibimos a la lista
        tablaTareas.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "CREAR" {
            let destino = segue.destination as! CrearTareaViewController
            destino.delegate = self
        }
    }
    
}

