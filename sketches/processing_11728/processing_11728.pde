
// -- -- -- Cell Class

class Cell{


  // - - - Variables

  PVector pos; // vector for position
  float radius; // variable for radius

    int age; // age counter
  int maxAge = 20; // variable to set age that die function resets cells

  Cell parent; // parent cell


  // - - - Constructor

  Cell(PVector _pos, Cell _parent, float _radius){ // feed in reference for position, parent cell and radius
    pos = _pos;
    parent = _parent;
    radius = _radius;
    age = 0; // start age counter at 0
    Cells.add(this); // add cell to arraylist  
  }


  // - - - Render Function

  void render (){

    noStroke();
    fill(255, 225-age*10,0); // change circle fill colour with cell age
    ellipse(pos.x,pos.y,radius*2,radius*2); // draw circle at cell position

    strokeWeight(radius*0.12); // change stroke weight relaive to radius
    stroke(0);
    if (parent != null){ // ignore cells without parents
      line(pos.x,pos.y,parent.pos.x,parent.pos.y); // draw line between cell and parent cell
    }

  }


  // - - - Grow Function

  void grow(){

    float nextradius = radius*0.95; // set radius of growth cell (related to radius of parent cell)

    for (int i=0; i<5; i++){ // attempt to grow 5 times
      boolean collide = false; // boolean switch for collisions

      float growAngle = random(TWO_PI); // select angle for growth attempt (random angle between 0 and 360)
      // determine position for growth cell (boundary touches boundary of parent cell)
      PVector growPos = new PVector( pos.x +  cos(growAngle)*(radius+nextradius), pos.y + sin(growAngle)*(radius+nextradius)); 

      // check all cells in arraylist for collisions
      for  (int c=0; c<Cells.size(); c++){
        Cell C = (Cell)  Cells.get(c);
        if (C != this  && growPos.dist(C.pos) < radius+C.radius) { // if boundary of growth cell overlaps boundary of an existing cell
          collide = true; // set boolean switch for collisions to true 
          nextradius*= 0.95; // and set new radius for next attempt
        }
      }
      // if there are no collisions then grow
      if (! collide) { // if boolean switch is false
        Cell newCell = new Cell(growPos,this,nextradius); // make new cell
        return; // return to call function (let next cell attempt to grow)
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
        float newradius = startradius+random(30); // determine radius for new start cell

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






