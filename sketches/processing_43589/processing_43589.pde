
////////////////////////////////////////-----Class-----//////////

class Cell {
  color c;
  PVector CELLPOSITION;
  float CELLRADIUS;

  Cell PARENTCELL;

  Cell(PVector _CELLPOSITION, Cell _PARENTCELL, float _CELLRADIUS) {

    CELLPOSITION = _CELLPOSITION;
    PARENTCELL = _PARENTCELL;
    CELLRADIUS = _CELLRADIUS;
    Cells.add(this);
  }

  ////////////////////////////////////////-----BRANCHING CODE-----////////////////

  void branch () {

    float NEXTCELLRADIUS = CELLRADIUS*0.8;                                      // as the system grows, the radius of cells INCREMENTALLY DECREASES
    for (int i=0; i < 2; i++) {                                                 // BRANCHING occurs as each parents has two potential offspring
      boolean collide = false;                                                  // boolean SWITCH created to determine whether or not each offspring can be created
      c = img.get(int(CELLPOSITION.x), int(CELLPOSITION.y));                    // PIXEL DATA FROM IMAGE at the position of cells
      float value = brightness (c);                                             // BRIGHTNESS DATA
      println(value);
      int THRESH = 50;                                                          // THRESHOLD used for brightness
      float GROWANGLE = int(random(8))*(PI/4);                                  // RESTRICTION of GROWTH ANGLES to 45 degree angles
      PVector GROWPOSITION = new PVector (CELLPOSITION.x + cos(GROWANGLE)*(CELLRADIUS + NEXTCELLRADIUS), CELLPOSITION.y + sin(GROWANGLE)*(CELLRADIUS + NEXTCELLRADIUS));
      for (int c=0; c < Cells.size(); c++) {
        Cell C = (Cell) Cells.get(c);
        if (C != this && GROWPOSITION.dist(C.CELLPOSITION) < CELLRADIUS) {                // FIRST COLLISION RULE :  IF THE NEW CELL's POSITION IS WITHIN THE RADIUS OF ANOTHER CELL, COLLISSION OCCURS and THE NEW CELL IS NOT MADE
          collide = true;
          NEXTCELLRADIUS = CELLRADIUS;
        }
        if ( brightness(img.get(int(CELLPOSITION.x),int(CELLPOSITION.y))) < THRESH) {     // SECOND COLLISION RULE :  IF THE BRIGHTNESS AT THE NEW CELL's POSITION IS BELOW THE THRESHOLD, COLLISION OCCURS and THE NEW CELL IS NOT MADE
          collide = true;
        }
      }
      if (! collide) {
        Cell newCell = new Cell(GROWPOSITION, this, NEXTCELLRADIUS);                      // IF COLLISSION DOESN'T OCCUR, then A NEW CELL IS CREATED
        return;
      }
    }
  }
  
  ////////////////////////////////////////-----RENDERING CODE-----////////////////

  void render () {
    
    noStroke();
    stroke(c,20);
    fill(c, 20);
    strokeWeight(.06);
    ellipse(CELLPOSITION.x, CELLPOSITION.y, CELLRADIUS, CELLRADIUS);            // creating a representation for new cells
    if (PARENTCELL == null) {                                                   // ORIGIN of each branching system is represented by a larger ellipse, EPICENTER
      fill(c,5);                                                                // fill and stroke utilize the underlaying color of the image
      stroke(c,20);
      ellipse(CELLPOSITION.x,CELLPOSITION.y,100,100);
    }
    strokeWeight(.06);
    c= img.get(int(CELLPOSITION.x), int(CELLPOSITION.y));
    float value = brightness (c);
    stroke(255-value, (value/255)*100);                                         // stroke and transparency for lines are determined by the value of pixel brightness
    if (PARENTCELL != null) {                                                   // BRANCHING LINES to illustrate the growth of the system
      line(CELLPOSITION.x, CELLPOSITION.y, PARENTCELL.CELLPOSITION.x, PARENTCELL.CELLPOSITION.y);
    }
  }
}


