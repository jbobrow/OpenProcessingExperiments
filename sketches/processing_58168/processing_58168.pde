
// Created by Katsuya Arai and Akiko Suzuki
// Arch 6509 Beyond Measurement: Generative Modeling in Architecture and Urbanism
// Department of Architecture, AAP, Cornell University

// The Porous City: Inversion of Land and Water Terrirory at Florida USA

// -- -- -- Cell Class

class Cell {


  // - - - Variables

  PVector pos; // vector for position
  float radius; // variable for radius

    int child; // number of children counter
  int age; // age counter
  int maxAge = 20; // variable to set age that die function resets cells

  Cell parent; // parent cell

  { 
    int count = 0; 
    //background(200); 
    int gap = 80; 
    int countMax =
      round(mouseX / gap) ; 
    println(countMax); 
    for (int i=0; count < countMax; i+= gap) { 
      rect (i, mouseY, 10, 10); 
      count ++ ;
    }
  } 
  // - - - Constructor

  Cell(PVector _pos, Cell _parent, float _radius) { // feed in reference for position, parent cell and radius
    pos = _pos;
    parent = _parent;
    radius = _radius;
    age = 0; // start age counter at 0
    child = 0; // start number of children counter at 0  
    Cells.add(this); // add cell to arraylist
  }


  // - - - Render Function

  void render () {

    noStroke();
    fill(50, 205-child*35, 255); // change circle fill colour by number of children
    rect(pos.x, pos.y, 0, 0); // draw circle at cell position

    if (parent == null) { // if a start cell (without parent)
      fill(255);
      rect(pos.x, pos.y, 15, 15); // draw a dot
    }

    strokeWeight(1);
    stroke(255);
    if (parent != null) { // ignore cells without parents
      line(pos.x, pos.y, parent.pos.x, parent.pos.y); // draw line between cell and parent cell
    }

    for  (int c=0; c<Cells.size(); c++) {
      Cell C = (Cell)  Cells.get(c);
      if (child<1) { // if a cell with no children
        fill(255);
        rect(pos.x, pos.y, 5, 5); // draw a dot
      }
    }
  }


  // - - - Grow Function

  void grow() {

    float nextradius = radius*0.7; // set radius of growth cell (related to radius of parent cell)

    for (int i=0; i<3; i++) { // attempt to grow 3 times
      boolean collide = false; // boolean switch for collisions

      float growAngle = int(random(8))*(PI/4); // select angle for growth attempt (0, 45, 90, 135, 180, 225, 270 or 315)    
      // determine position for growth cell (boundary touches boundary of parent cell)
      PVector growPos = new PVector( pos.x +  cos(growAngle)*(radius+nextradius), pos.y + sin(growAngle)*(radius+nextradius));

      // check all cells in arraylist for collisions
      for  (int c=0; c<Cells.size(); c++) {
        Cell C = (Cell)  Cells.get(c);
        if (C != this  && growPos.dist(C.pos) < radius+C.radius) { // if boundary of growth cell overlaps boundary of an existing cell
          collide = true; // set boolean switch for collisions to true
          nextradius*= 0.9; // and set new radius for next attempt
        }
      }
      // if there are no collisions then grow
      if (! collide) { // if boolean switch is false
        Cell newCell = new Cell(growPos, this, nextradius); // make new cell
        child++; // update number of children counter
        return; // return to call function (let next cell attempt to grow)
      }
    }
  }



  // - - - Die Function

    void die() {

    //age++; // age cell

    // if a cell reaches maxAge then clear all cells and start new drawing
    if (age > maxAge) {

      background(0); // redraw background


      { 
        int count = 0; 
        //background(200); 
        int gap = 80; 
        int countMax =
          round(mouseX / gap) ; 
        println(countMax); 
        for (int i=0; count < countMax; i+= gap) { 
          rect (i, mouseY, 10, 10); 
          count ++ ;
        }
      } 


      Cells.clear(); // clear arraylist (delete all cells)

      minRadius = random(5, 15); // change minimum radius

      Cell C = new Cell(new PVector(width/2+(random(-100, 100)), height/2+(random(-100, 100))), null, random(startradius-5, startradius+15)); // make new start cell
    }
  }
}






// Process Drawing - Circle Packing based on an Eden Growth Model

// Exploration C - 45 degree angle, varied start radius, varied minimum radius, long chain, cells can only grow once each frame



// -- -- -- Variables

int maxCells = 100; // reaching max no of cells (circles) terminates growth

float startradius = 30;
float minRadius = 10; // reaching minRadius terminates growth

ArrayList Cells = new ArrayList(); // arraylist to contain cells (circles)



// -- -- -- Setup

void setup() {
  size(900, 600);
  background(0);

  { 
    int count = 0; 
    //background(200); 
    int gap = 80; 
    int countMax =
      round(mouseX / gap) ; 
    println(countMax); 
    for (int i=0; count < countMax; i+= gap) { 
      rect (i, mouseY, 10, 10); 
      count ++ ;
    }
  } 


  frameRate(10); // slow frame rate to better see growth steps (every frame each cell has an opportunity to grow)
  noStroke();

  Cell C = new Cell(new PVector(width/2, height/2), null, startradius); // make start cell (circle)
}



// -- -- -- Draw

void draw() {

  background(0); // redraw background 


  { 
    int count = 0; 
    //background(200); 
    int gap = 80; 
    int countMax =
      round(mouseX / gap) ; 
    println(countMax); 
    for (int i=0; count < countMax; i+= gap) { 
      rect (i, mouseY, 10, 10); 
      count ++ ;
    }
  } 


  for (int c=0; c<Cells.size(); c++) {
    Cell C = (Cell) Cells.get(c); // get each cell from the arraylist
    C.render(); // draw the cell
    if (Cells.size() < maxCells && C.radius > minRadius) { // if the maximum number of cells has not been reached and if the cell is greater than the minimum radius
      C.grow(); // give the cell the opportunity to grow
    }
    C.die(); // run the die function
  }
}



// -- -- -- Start New Drawing

void mouseReleased() { // if mouse clicked

    background(0); // redraw background


  { 
    int count = 0; 
    //background(200); 
    int gap = 80; 
    int countMax =
      round(mouseX / gap) ; 
    println(countMax); 
    for (int i=0; count < countMax; i+= gap) { 
      rect (i, mouseY, 10, 10); 
      count ++ ;
    }
  } 


  Cells.clear(); // clear arraylist (delete all cells)

  minRadius = random(2, 10); // change minimum radius

  Cell C = new Cell(new PVector(mouseX, mouseY), null, random(startradius-5, startradius+15)); // make new start cell at mouse position
}


