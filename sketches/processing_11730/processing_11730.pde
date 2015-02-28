
// -- -- -- Cell Class

class Cell{


  // - - - Variables

  PVector pos; // vector for position
  float radius; // variable for radius

    int child; // number of children counter
  int age; // age counter
  int maxAge = 10; // variable to set age that die function resets cells

  Cell parent; // parent cell


  // - - - Constructor

  Cell(PVector _pos, Cell _parent, float _radius){ // feed in reference for position, parent cell and radius
    pos = _pos;
    parent = _parent;
    radius = _radius;
    age = 0; // start age counter at 0
    child = 0;  // start number of children counter at 0 
    Cells.add(this); // add cell to arraylist   
  }


  // - - - Render Function

  void render (){

    noStroke();
    fill(45+child*10,255-child*35,0); // change circle fill colour by number of children
    ellipse(pos.x,pos.y,radius*2,radius*2); // draw circle at cell position

    if (parent == null){ // if a start cell (without parent)
      fill(255);
      ellipse(pos.x,pos.y,15,15); // draw a dot
    }

    strokeWeight(2);
    stroke(255);
    if (parent != null){ // ignore cells without parents
      line(pos.x,pos.y,parent.pos.x,parent.pos.y); // draw line between cell and parent cell
    }

    for  (int c=0; c<Cells.size(); c++){
      Cell C = (Cell)  Cells.get(c);
      if (child<1){ // if a cell with no children
        fill(255);
        ellipse(pos.x,pos.y,5,5); // draw a dot
      }
    }

  }


  // Grow

  void grow(){

    for (int j=0; j<12; j++){ // 12 times select an angle and attempt to grow

      float growAngle = int(random(8))*(PI/4); // set angle for growth attempts (0, 45, 90, 135, 180, 225, 270 or 315)
      float nextradius = radius*0.85; // set radius for growth attempt (related to radius of parent cell)

      for (int i=0; i<8; i++){ // for each angle attempt to grow 8 times
        boolean collide = false; // boolean switch for collisions
        
        // determine position for growth cell (boundary touches boundary of parent cell)
        PVector growPos = new PVector( pos.x +  cos(growAngle)*(radius+nextradius), pos.y + sin(growAngle)*(radius+nextradius)); 

        // check all cells in arraylist for collisions
        for  (int c=0; c<Cells.size(); c++){
          Cell C = (Cell)  Cells.get(c);
          if (C != this  && growPos.dist(C.pos) < nextradius+C.radius) { // if boundary of growth cell overlaps boundary of an existing cell
            collide = true; // set boolean switch for collisions to true 
          }
        }
        // if there are no collisions, and max cells or min radius has not been reached then grow
        if (! collide && Cells.size() < maxCells && nextradius > minRadius) {
          Cell newCell = new Cell(growPos,this,nextradius);
          child++; // update number of children counter
          // continue to attempt growing this cell in another direction until all growth possibilities are exhausted
        }
        if (collide) { // if there is a collision
         nextradius*= 0.85; // set a new radius for the next growth attempt
        }
      }
    }
  }


  // - - - Die Function

  void die(){

    age++; // age cell

    // if a cell reaches maxAge then clear all cells and start new drawing
    if (age > maxAge){

      background(0); // redraw background
      
      Cells.clear(); // clear arraylist (delete all cells)

      for (int j=0; j<random(5); j++){ // make multiple new start cells
        boolean collide = false; // boolean switch for collisions

        PVector newPos = new PVector(width/2+(random(-300,300)),height/2+(random(-100,100))); // determine position for new start cell
        float newradius = startradius+random(10); // determine radius for new start cell

        // check other new start cells in arraylist for collisions
        for  (int c=0; c<Cells.size(); c++){
          Cell C = (Cell)  Cells.get(c);
          if (C != this  && newPos.dist(C.pos) < newradius+C.radius) { // if boundary of growth cell overlaps boundary of an existing cell
            collide = true; // set boolean switch for collisions to true

          }
        }
        if (! collide) {  // if there are no collisions
          Cell C = new Cell(newPos,null,newradius); // make new start cell
        }
      }
    }
  }

}




