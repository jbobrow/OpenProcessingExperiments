
class Point
{
  
  //Initiate location floats and ON/OFF switch
  float locX;
  float locY;
  float locZ;

  boolean on = false;
  
  //Constructor
  Point (float x, float y, float z) {
    
    //translate array position to physical location (locX refers to location in euclidian space,
    //posX refers to index in array)
    
    locX = x*cc + (z%2)*(cc/2);
    locY = y*cc + (z%2)*(cc/2);
    locZ = z*cc/2;
    
    //turn on centre seed
    if (x == int(extentX/2) && y == int(extentY/2) && z == 2) {
      on=true;
    }
    //turn on a random number of seeds on z=3
//     if (random(1)<0.003 && z == 3) {
//      on=true;
//    }
  
  }

  void display() {

    pushMatrix();
    translate (locX, locY, locZ);
    
    //Draws point in each lattice location
    //point(0,0,0);
    
    //Draws Octahedron
    if (on == true) {
      scale(scaleFactor);
      stroke(0);
      fill(255);

      //--------------- Rectangles
      //----- Top Rectangle
      beginShape(); 
      vertex(0,1,2);
      vertex(1,0,2);
      vertex(0,-1,2);
      vertex(-1,0,2);
      endShape(CLOSE);

      //---- Bottom Rectangle

      beginShape(); 
      vertex(0,1,-2);
      vertex(1,0,-2);
      vertex(0,-1,-2);
      vertex(-1,0,-2);
      endShape(CLOSE);

      //---- Side Rectangles

      // West Rectangle

      beginShape(); 
      vertex(-2,1,0);
      vertex(-2,0,1);
      vertex(-2,-1,0);
      vertex(-2,0,-1);
      endShape(CLOSE);

      // East Rectangle

      beginShape(); 
      vertex(2,1,0);
      vertex(2,0,1);
      vertex(2,-1,0);
      vertex(2,0,-1);
      endShape(CLOSE);

      // North Rectangle

      beginShape(); 
      vertex(0,2,1);
      vertex(1,2,0);
      vertex(0,2,-1);
      vertex(-1,2,0);
      endShape(CLOSE);

      // South Rectangle

      beginShape(); 
      vertex(0,-2,1);
      vertex(1,-2,0);
      vertex(0,-2,-1);
      vertex(-1,-2,0);
      endShape(CLOSE);

      //---------------------- Hexagons

      //----- Upper Hexagons

      // NW

      beginShape(); 
      vertex(-1,2,0);
      vertex(0,2,1);
      vertex(0,1,2);
      vertex(-1,0,2);
      vertex(-2,0,1);
      vertex(-2,1,0);
      endShape(CLOSE);

      // NE

        beginShape(); 
      vertex(1,2,0);
      vertex(0,2,1);
      vertex(0,1,2);
      vertex(1,0,2);
      vertex(2,0,1);
      vertex(2,1,0);

      endShape(CLOSE);

      // SE

        beginShape(); 
      vertex(1,-2,0);
      vertex(0,-2,1);
      vertex(0,-1,2);
      vertex(1,0,2);
      vertex(2,0,1);
      vertex(2,-1,0);
      endShape(CLOSE);

      // SW

      beginShape(); 
      vertex(-1,-2,0);
      vertex(0,-2,1);
      vertex(0,-1,2);
      vertex(-1,0,2);
      vertex(-2,0,1);
      vertex(-2,-1,0);
      endShape(CLOSE);

      //----- Lower Hexagons

      // NW

      beginShape(); 
      vertex(-1,2,0);
      vertex(0,2,-1);
      vertex(0,1,-2);
      vertex(-1,0,-2);
      vertex(-2,0,-1);
      vertex(-2,1,0);
      endShape(CLOSE);

      // NE

        beginShape(); 
      vertex(1,2,0);
      vertex(0,2,-1);
      vertex(0,1,-2);
      vertex(1,0,-2);
      vertex(2,0,-1);
      vertex(2,1,0);

      endShape(CLOSE);

      // SE

        beginShape(); 
      vertex(1,-2,0);
      vertex(0,-2,-1);
      vertex(0,-1,-2);
      vertex(1,0,-2);
      vertex(2,0,-1);
      vertex(2,-1,0);
      endShape(CLOSE);

      // SW

      beginShape(); 
      vertex(-1,-2,0);
      vertex(0,-2,-1);
      vertex(0,-1,-2);
      vertex(-1,0,-2);
      vertex(-2,0,-1);
      vertex(-2,-1,0);
      endShape(CLOSE);
    }
    popMatrix();
  }
}


