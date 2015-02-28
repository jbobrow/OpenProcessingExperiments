
// -- -- -- Cell Class

class Cell{


  // - - - Variables

  PVector pos; // vector for position
  float radius; // variable for radius

    int child; // number of children counter
  int age; // age counter
  int maxAge = 20; // variable to set age that die function resets cells

  Cell parent; // parent cell


  // - - - Constructor

  Cell(PVector _pos, Cell _parent, float _radius){ // feed in reference for position, parent cell and radius
    pos = _pos;
    parent = _parent;
    radius = _radius;
    age = 0; // start age counter at 0
    child = 0; // start number of children counter at 0   
    Cells.add(this); // add cell to arraylist  
  }


  // - - - Render Function

  void render (){

    noStroke();
    fill(50,205-child*35,255); // change circle fill colour by number of children
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


  // - - - Grow Function

  void grow(){

    float nextradius = radius*0.9; // set radius of growth cell (related to radius of parent cell)

    for (int i=0; i<3; i++){ // attempt to grow 3 times
      boolean collide = false; // boolean switch for collisions

      float growAngle = int(random(8))*(PI/4); // select angle for growth attempt (0, 45, 90, 135, 180, 225, 270 or 315)     
      // determine position for growth cell (boundary touches boundary of parent cell)
      PVector growPos = new PVector( pos.x +  cos(growAngle)*(radius+nextradius), pos.y + sin(growAngle)*(radius+nextradius)); 

      // check all cells in arraylist for collisions
      for  (int c=0; c<Cells.size(); c++){
        Cell C = (Cell)  Cells.get(c);
        if (C != this  && growPos.dist(C.pos) < radius+C.radius) { // if boundary of growth cell overlaps boundary of an existing cell
          collide = true; // set boolean switch for collisions to true 
          nextradius*= 0.9; // and set new radius for next attempt
        }
      }
      // if there are no collisions then grow
      if (! collide) { // if boolean switch is false
        Cell newCell = new Cell(growPos,this,nextradius); // make new cell
        child++; // update number of children counter
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
   
      minRadius = random(5,15); // change minimum radius

      Cell C = new Cell(new PVector(width/2+(random(-100,100)),height/2+(random(-100,100))),null,random(startradius-5,startradius+15)); // make new start cell
    }
  }

}





