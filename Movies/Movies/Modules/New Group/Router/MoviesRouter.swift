//
//  MoviesRouter.swift
//  Movies
//
//  Created by Renan Germano on 20/11/2018.
//  Copyright © 2018 Renan Germano. All rights reserved.
//

import UIKit

class MoviesRouter: MoviesWireframe {
    
    // MARK: - Properties
    
    var view: UIViewController?
    
    // MARK: - MoviesWireframe protocol functions
    
    func presentMovieDetailsFor(_ movie: Movie) {
        
    }
    
    static func assembleModule() -> UIViewController {
        
        let presenter = MoviesPresenter()
        let interactor = MoviesInteractor()
        let router = MoviesRouter()
        
        presenter.interactor = interactor
        presenter.router = router
        
        interactor.output = presenter
        
        let storyboard = UIStoryboard(name: "Movies", bundle: nil)
        var viewController = storyboard.instantiateViewController(withIdentifier: "Movies")
        
        router.view = viewController
        
        if let moviesViewController = viewController as? MoviesViewController { 
            moviesViewController.presenter = presenter
            presenter.view = moviesViewController
        }
        
        viewController = UINavigationController(rootViewController: viewController)
        
        return viewController
        
    }
    
}
