//
//  FavoritesFilterPresenter.swift
//  Movies
//
//  Created by Renan Germano on 25/11/2018.
//  Copyright © 2018 Renan Germano. All rights reserved.
//

import UIKit

class FavoritesFilterPresenter: FavoritesFilterPresentation, FavoritesFilterInteractorOutput {
    
    // MARK: - Properties
    
    weak var view: FavoritesFilterView?
    var router: FavoritesFilterWireframe!
    var interactor: FavoritesFilterUseCase!
    private var currentAddedGenres: [Genre] = []
    private var currentRemovedGenres: [Genre] = []
    private var currentAddedYears: [Int] = []
    private var currentRemovedYears: [Int] = []
    
    // MARK: - Aux functions
    
    private func applyFilters() {
        self.currentAddedGenres.forEach { self.interactor.add(genre: $0) }
        self.currentAddedYears.forEach { self.interactor.add(year: $0) }
    }
    
    private func discardFilters() {
        self.currentRemovedGenres.forEach { self.interactor.remove(genre: $0) }
        self.currentRemovedYears.forEach { self.interactor.remove(year: $0) }
    }
    
    // MARK: - FavoritesFilterPresentation protocol functions
    
    func viewDidLoad() {
        self.interactor.getGenres()
        self.interactor.getYears()
    }
    
    func didSelect(genre: Genre) {
        self.interactor.add(genre: genre)
    }
    
    func didDeselect(genre: Genre) {
        self.interactor.remove(genre: genre)
    }
    
    func didSelect(year: Int) {
        self.interactor.add(year: year)
    }
    
    func didDeselect(year: Int) {
        self.interactor.remove(year: year)
    }
    
    func didPressFilterButton() {
        self.applyFilters()
        self.router.dismiss()
    }
    
    func didPressCancelButton() {
        self.discardFilters()
        self.router.dismiss()
    }
    
    // MARK: - FavoritesFilterInteractorOutput protocol functions
    
    func didGet(genres: [GenreFilterItem]) {
        self.view?.set(genres: genres)
    }
    
    func didGet(years: [YearFilterItem]) {
        self.view?.set(years: years)
    }
    
}