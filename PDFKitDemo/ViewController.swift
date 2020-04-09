//
//  ViewController.swift
//  PDFKitDemo
//
//  Created by Pushpank Kumar on 09/04/20.
//  Copyright © 2020 Pushpank Kumar. All rights reserved.
//

import UIKit
import PDFKit

@objcMembers
class ViewController: UIViewController {
    
    var pdfView: PDFView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        createPDFView()
        loadPDFView()

    }

}

// Private Functions
extension ViewController {
    
    private func createPDFView() {
        pdfView = PDFView()
        view.addSubview(pdfView)
        setUpConstraints()
        setUpBarButtons()

    }
    
    private func setUpConstraints() {
        
        pdfView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            pdfView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            pdfView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            pdfView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            pdfView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private func setUpBarButtons() {
        let printSelectButton = UIBarButtonItem(title: "Selection", style: .plain, target: self, action: #selector(printSelection))
        let firstPageButton = UIBarButtonItem(title: "First", style: .plain, target: self, action: #selector(firstPage))
        let lastPageButton = UIBarButtonItem(title: "Last", style: .plain, target: self, action: #selector(lastPage))
        navigationItem.rightBarButtonItems = [printSelectButton, firstPageButton, lastPageButton]
        
    }
    
    private func loadPDFView() {
        let url = Bundle.main.url(forResource: "0793-building-a-mobile-application-using-the-ionic-framework", withExtension: "pdf")!
        pdfView.document = PDFDocument(url: url)
    }
}

// Selectors
extension ViewController {
    
    func firstPage() {
        pdfView.goToFirstPage(nil)
    }
    
    func lastPage() {
        pdfView.goToLastPage(nil)
    }
    
    func printSelection() {
        print(pdfView.currentSelection ?? "No Selection")
    }
}
