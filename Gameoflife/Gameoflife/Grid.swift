//
//  Grid.swift
//  Gameoflife
//
//  Created by Corey Harrilal on 6/24/16.
//  Copyright © 2016 Corey Harrilal. All rights reserved.
//

import Foundation

import SpriteKit

class Grid: SKSpriteNode {
    
    /* Grid array dimensions */
    let rows = 8
    let columns = 10
    
    /* Individual cell dimension, calculated in setup*/
    var cellWidth = 0
    var cellHeight = 0
    
    /* Creature Array */
    var gridArray = [[Creature]]()
    
    // New Creature Object
    //var creature: SKSpriteNode!
    
    
    
    func addCreatureAtGrid(x x: Int, y: Int) {
        /* Add a new creature at grid position*/
        
        /* New creature object */
        let creature = Creature()
        
        /* Calculate position on screen */
        let gridPosition = CGPoint(x: x*cellWidth, y: y*cellWidth)
        creature.position = gridPosition
        
        /* Set default isAlive */
        creature.isAlive = true
        
        /* Add creature to grid node */
        addChild(creature)
        
        /* Add creature to grid array */
        gridArray[x].append(creature)
    }
    
    
    func populateGrid() {
        /* Populate the grid with creatures */
        
        /* Loop through columns */
        for gridX in 0..<columns {
            
            /* Initialize empty column */
            gridArray.append([])
            
            /* Loop through rows */
            for gridY in 0..<rows {
                
                /* Create a new creature at row / column position */
                addCreatureAtGrid(x:gridX, y:gridY)
            }
        }
    }
    
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        /* Called when a touch begins */
        
        /* There will only be one touch as multi touch is not enabled by default */
        for touch in touches {
        
            
            /* Grab position of touch relative to the grid */
            let location  = touch.locationInNode(self)
        }
    }
    
    /* You are required to implement this for your subclass to work */
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        /* Enable own touch implementation for this node */
        userInteractionEnabled = true
        
        /* Calculate individual cell dimensions */
        cellWidth = Int(size.width) / columns
        cellHeight = Int(size.height) / rows
        
        /* Populate grid with creatures */
        populateGrid()
        
    }
}