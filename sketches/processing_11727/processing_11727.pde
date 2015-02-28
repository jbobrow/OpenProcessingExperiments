
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
    fill(col2*50, 255-(col*20)-age*10,col*50); // change circle fill colour with cell age
    ellipse(pos.x,pos.y,radius*2,radius*2); // draw circle at cell position

    strokeWeight(2);
    stroke(255);
    if (parent != null){ // ignore cells without parents
      line(pos.x,pos.y,parent.pos.x,parent.pos.y); // draw line between cell and parent cell
    }

  }


  // - - - Grow Function

  void grow(){

    float nextradius = radius*r; // set radius of growth cell (related to radius of parent cell)

    for (int i=0; i<5; i++){ // attempt to grow 5 times
      boolean collide = false; // boolean switch for collisions

      float growAngle = int(random(4))*(PI/2);  // select angle for growth attempt (orthogonal - 0, 90, 180 or 270)
      // determine position for growth cell (boundary touches boundary of parent cell)    
      PVector growPos = new PVector( pos.x +  cos(growAngle)*(radius+nextradius), pos.y + sin(growAngle)*(radius+nextradius)); 

      // check all cells in arraylist for collisions
      for  (int c=0; c<Cells.size(); c++){ 
        Cell C = (Cell)  Cells.get(c);
        if (C != this  && growPos.dist(C.pos) < radius+C.radius) { // if boundary of growth cell overlaps boundary of an existing cell
          collide = true; // set boolean switch for collisions to true 
          nextradius*= r; // and set new radius for next attempt
        }
      }
      if (! collide) { // if there are no collisions
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

      col = int(random(5)); // change circle fill colour
      col2 = int(random(5));

      r = random(0.75,0.99); // change rate of radius change between parent and child

      Cell C = new Cell(new PVector(width/2+(random(-100,100)),height/2+(random(-100,100))),null,random(startradius-5,startradius+15)); // make new start cell at random position

    }
  }
}




