//
//  ViewController.swift
//  precoBitcoin
//
//  Created by Allef Sousa Santos on 17/02/19.
//  Copyright © 2019 Allef Sousa Santos. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let url = URL(string: "https://blockchain.info/ticker"){
            // tarefa para consultar o serviço
            let tarefa = URLSession.shared.dataTask(with: url){(dados,requisicao,erro) in
            
                if erro == nil{
                    print("Sucesso ao fazer consulta de preço")
                    if let dadosRetorno = dados{
                        
                        do{
                            if let objectJson = try JSONSerialization.jsonObject(with: dadosRetorno, options:[]) as? [String: Any]{
                                
                                if let blr = objectJson["BRL"] as? [String:Any]{
                                    if let pree = blr["buy"] as? Float{
                                        print(pree)
                                    }
                                   

                                }

                            }

                        }catch{
                            print("Erro ao formatar o retorno")
                            
                        }
                        
                    }
                    
                    
                }else{
                    print("Erro ao fazer consulta de preço")

                }
                
            }
            tarefa.resume()

        }
       
    }


}

