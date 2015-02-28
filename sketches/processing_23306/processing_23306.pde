
class Point
{
  
  //Initiate position floats and ON/OFF switch
  float locX;
  float locY;
  float locZ;
  
  int posX;
  int posY;
  int posZ;

  boolean on = false;
  
  float pA = 0.0;
  float pAN;
  
  //Constructor
  Point (float x, float y, float z) {
    
    //translate array position to physical location (locX refers to location in euclidian space,
    //posX refers to index in array)
    
    locX = x*cc + (z%2)*(cc/2);
    locY = y*cc + (z%2)*(cc/2);
    locZ = z*cc/2;
    
    posX=int(x);
    posY=int(y);
    posZ=int(z);
    
    //turn on centre seed
    if (x == int(extentX/2) && y == int(extentY/2) && z == 2) {
      on=true;
    }
     //turn on a random number of seeds on z=3
//     if (random(1)<0.003 && z == 3) {
//      on=true;
//    }
  
  }
  
  //The pheromone function sets the pheromoe to 1 if certain conditions are met (in 
  //this case that the cell is tuned on and touching the ground plane, if not it updates
  //the value based on a decay parameter and the amount in neighbouring cells. 
  
  void pheromone() {
   if (on == true && posZ==3) {
     pA = 1.0;
   }
   else {
     pA = pA*0.4+pAN*0.45;
     //constrain(pA,0.0,1.0);
   }
  }
    
  //Calculates the total amount of pheromone in neighbouring cells, weighs 
  //cells below higher to cause the theromode to diffuse upwards.
 
  //This part of the code is messy (quick and dirty, but it works). It needs 
  //rationalisation and cleaning up. 
   
  void pheromoneN () {
    float pAtot = 0.0;
    
    if (posZ%2 == 0) {
      pAtot = 
      lattice      [posX      ]  [posY      ]  [posZ  +2  ]  .pA*0.5 +
      lattice      [posX  -1  ]  [posY  -1  ]  [posZ  +1  ]  .pA*0.5 +
      lattice      [posX      ]  [posY  -1  ]  [posZ  +1  ]  .pA*0.5 +
      lattice      [posX  -1  ]  [posY      ]  [posZ  +1  ]  .pA*0.5 +
      lattice      [posX      ]  [posY      ]  [posZ  +1  ]  .pA*0.5 +
      lattice      [posX  -1  ]  [posY      ]  [posZ      ]  .pA*0.5 +
      lattice      [posX      ]  [posY  -1  ]  [posZ      ]  .pA*0.5 +
      lattice      [posX  +1  ]  [posY      ]  [posZ      ]  .pA*0.5 +
      lattice      [posX      ]  [posY  +1  ]  [posZ      ]  .pA*0.5 +
      lattice      [posX  -1  ]  [posY  -1  ]  [posZ  -1  ]  .pA*1 +
      lattice      [posX      ]  [posY  -1  ]  [posZ  -1  ]  .pA*1 +
      lattice      [posX  -1  ]  [posY      ]  [posZ  -1  ]  .pA*1 +
      lattice      [posX      ]  [posY      ]  [posZ  -1  ]  .pA*1 +
      lattice      [posX      ]  [posY      ]  [posZ  -2  ]  .pA*8;
    }
    else 
    {
      pAtot = 
      lattice      [posX      ]  [posY      ]  [posZ  +2  ]  .pA*0.5 +
      lattice      [posX  +1  ]  [posY  +1  ]  [posZ  +1  ]  .pA*0.5 +
      lattice      [posX      ]  [posY  +1  ]  [posZ  +1  ]  .pA*0.5 +
      lattice      [posX  +1  ]  [posY      ]  [posZ  +1  ]  .pA*0.5 +
      lattice      [posX      ]  [posY      ]  [posZ  +1  ]  .pA*0.5 +
      lattice      [posX  -1  ]  [posY      ]  [posZ      ]  .pA*0.5 +
      lattice      [posX      ]  [posY  -1  ]  [posZ      ]  .pA*0.5 +
      lattice      [posX  +1  ]  [posY      ]  [posZ      ]  .pA*0.5 +
      lattice      [posX      ]  [posY  +1  ]  [posZ      ]  .pA*0.5 +
      lattice      [posX  +1  ]  [posY  +1  ]  [posZ  -1  ]  .pA*1 +
      lattice      [posX      ]  [posY  +1  ]  [posZ  -1  ]  .pA*1 +
      lattice      [posX  +1  ]  [posY      ]  [posZ  -1  ]  .pA*1 +
      lattice      [posX      ]  [posY      ]  [posZ  -1  ]  .pA*1 +
      lattice      [posX      ]  [posY      ]  [posZ  -2  ]  .pA*8;
    }
    pAN=pAtot/14;
  }

  void display() {

    pushMatrix();
    translate (locX, locY, locZ);
    
    //Draws point in each lattice location where 
    stroke(255*pA,0,0);
    if (pA>0.05) {
      point(0,0,0);
    }
    //Draws Octahedron
    if (on == true) {
      scale(scaleFactor);
      stroke(0);
      fill(255);
      //noStroke();

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


