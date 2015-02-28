
class Cell{

  int xp; // x position in the world
  int yp; // y position in the world
  int age = 5; // This is for the age of the cell
  Cell parent; // This is the parent cell
  float rot; // This controls the rotation of the rectangles
  
  Cell(int _xp, int _yp, Cell _parent ){// This tells the cell how to grow between the x and the y position
    xp = _xp;
    yp = _yp;
    parent = _parent;//This puts the parent cell into the world
    world[xp][yp] = 1; //This creates one cell and then it becomes and array of many cells 
   //age = 8;
    Cells.add(this); // This adds to the cell list
     rot = int(random(80))*TWO_PI/8; //This rotates the cell randomly
  }

  void render(){ // This draws the cell
     age++;// This double ++ age
    //fill(255 - age*100);//This controls the fill by the age of the cell
    //ellipse(cellsize*2,cellsize*2,cellsize*1.9,cellsize*1.9);
    //triangle(cellsize=30,cellsize=75,cellsize=50,cellsize=20,cellsize=86,cellsize=74); // This is the x & y position times the cell size which is 30.
    
    //noStroke();
    noFill();
   
    
    fill(154,205 - age*105,50,30);// This controls the fill colour
    //fill(154,205,50);
    //fill(0,126 - age*105,252,30);
    fill(random(126) -175,random(155),120,200);
    stroke(255);
    strokeWeight(3);
    //stroke(random(200));//color
    pushMatrix();// This pushes the rectangle cell when it is drawn
    translate(xp*cellsize,yp*cellsize);// This translates the cell into the space or the world
    rotate(rot); //This rotates the cells randomly
    rect(-cellsize*0.8,-cellsize*0.8,cellsize*1.9,cellsize*1.9);// This manipulates the shape and size of the cell
    
    line(-cellsize*0.8,-cellsize*0.8,cellsize*1.0,cellsize*1.0);
    rotateX(PI/3.0);
    //..........
    popMatrix();// When the cell is pushed, it transforms the position of the cell
    //stroke(255);

  }
  
  void grow(){// This tells the cell to grow
     age++;

    // pick a neighbouring spot at random and then grow the cell 
    int xoffset = round(random(-1,1)); // -1, 0 or 1
    int yoffset = round(random(-1,1)); // -1, 0 or 1
    if (xoffset == 0 && yoffset == 0) return; // Then the x and y position is offset, the cell stops growing
    
    int nxpos = xp + xoffset; // The cell is going to grow in the x position
    int nypos = yp + yoffset; // The cell is going to grow in the y position
    
    // If the value is 0, then the n position is larger or is equal to the world size for the x and the y position
    if (nxpos < 0 || nxpos >= worldsize) return;
    if (nypos < 0 || nypos >= worldsize) return;
    


    if ( world[nxpos][nypos] == 0 ){// This controls the space between the cells
      Cell newcell = new Cell(nxpos,nypos, this);//This makes a new cell object
    }
  }

}

