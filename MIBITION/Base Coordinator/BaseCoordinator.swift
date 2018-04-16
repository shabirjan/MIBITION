//
//  BaseCoordinator.swift
//  MIBITION
//
//  Created by Shabir Jan on 3/13/18.
//  Copyright © 2018 Shabir Jan. All rights reserved.
//

import Foundation
import  RxSwift

class  BaseCoordinator<T> {
   
    /// Utility `DisposeBag` used by the subclasses.
    let disposeBag = DisposeBag()
    
    /// Unique identifier.
    private let identifier = UUID()
    
    /// Dictionary of the child coordinators. Every child coordinator should be added
    /// to that dictionary in order to keep it in memory.
    /// Key is an `identifier` of the child coordinator and value is the coordinator itself.
    /// Value type is `Any` because Swift doesn't allow to store generic types in the array.
    private var childCoordinators = [UUID: Any]()
    
    
    /// Stores coordinator to the `childCoordinators` dictionary.
    ///
    /// - Parameter coordinator: Child coordinator to store.
    private func store<T>(coordinator: BaseCoordinator<T>) {
        childCoordinators[coordinator.identifier] = coordinator
        
    }
    
    /// Release coordinator from the `childCoordinators` dictionary.
    ///
    /// - Parameter coordinator: Coordinator to release.
    private func free<T>(coordinator: BaseCoordinator<T>) {
        childCoordinators[coordinator.identifier] = nil
    }
    
    /// 1. Stores coordinator in a dictionary of child coordinators.
    /// 2. Calls method `start()` on that coordinator.

    /// - Parameter coordinator: Coordinator to start.
    func coordinate<T>(to coordinator: BaseCoordinator<T>)  {
        store(coordinator: coordinator)
        coordinator.start()
        .subscribe(onNext: {[weak self, coordinator] _ in self?.free(coordinator: coordinator)})
        .disposed(by: disposeBag)
        
    }
    
    /// Starts job of the coordinator.
    func start() -> Observable<Void> {
        fatalError("Start method should be implemented.")
    }
}
