
class Column {

  //// Instance variables
  float ColRadius = random (minColRadius, maxColRadius);
  PVector CoLoc = new PVector (random(width), random(height), 0);



  ///////////////////////////
  ////// CONSTRUCTOR ///////
  /////////////////////////

  Column(
  PVector _CoLoc, 
  float _ColRadius
    )
  {
    // Push variables to local
    CoLoc = _CoLoc;
    ColRadius = _ColRadius;
  }

  ////////////////////////////////////////////////////////////////////////////////////////////////
  ////// FUNCTIONS //////////////////////////////////////////////////////////////////////////////
  //////////////////////////////////////////////////////////////////////////////////////////////

  ///////////////////////////////////////////////////////////////
  ////// Run calls what the Column will do //////////////////////
  ///////////////////////////////////////////////////////////////
  void run() {
    checkField();
    checkOthers();
    display();
  }

  void display() {
    stroke(200, 50);
    line(CoLoc.x, CoLoc.y, 0, CoLoc.x, CoLoc.y, depth);
    ellipse(CoLoc.x, CoLoc.y, ColRadius, ColRadius);
    for(int i=0; i<depth; i+=20) {
        stroke(255, map(i, 0, depth, 00, 80));
        pushMatrix();
        translate(0, 0, i);
        ellipse(CoLoc.x, CoLoc.y, ColRadius, ColRadius);
        popMatrix();
      }
  }

  void checkOthers() {
    for (int i=0;i<Columns.size();i++) {
      Column Other =  (Column) Columns.get(i);
      if (CoLoc.dist(Other.CoLoc) < (ColRadius+Other.ColRadius)*0.7) {
        PVector ReLoc = PVector.sub(CoLoc, Other.CoLoc);
        ReLoc.normalize();
        ReLoc.mult((ColRadius+Other.ColRadius)*0.7);
        
        CoLoc = PVector.sub(Other.CoLoc, ReLoc);
      }
    }
  }

  void checkField() {
   
      if (CoLoc.x < ColRadius) CoLoc.x = CoLoc.x+5;
      if (CoLoc.x > width-ColRadius) CoLoc.x = CoLoc.x-5;
      if (CoLoc.y < ColRadius) CoLoc.y = CoLoc.y+5;
      if (CoLoc.y > height-ColRadius) CoLoc.y = CoLoc.y-5;
     
  }
}


