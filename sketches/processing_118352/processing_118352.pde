
//////    INITIAL CONFIGURATION   ////////
// This program is created in such a way where the user can
// produce very diverse results by adjustnig only the configuration
// in this part and leaving the rest of the code untouched.

/* Canvas Size */
//int canvas = 500;


/* Density of the nodes */
// 1st way: changing the number of the cells
float density = 1;
// The number is canvas size
int nodes = int(density * 500);
// 2nd way: Decreasing random range of possible initial positions
// used when createing a cell in the Cell class
int xbottom = 0;
int xup = 500;
int ybottom = 0;
int yup = 500;


/*  Dynamic Proximity  */
// Every fr framerates increase the proximity by inc
int proximity=1; // initialize proximity distance 
int fr = 48; // period in framerates
int inc = 2; // increase rate
int limit = 20; // maximum proximity


/*  Starting seeds */
// Give the locations of starting seeds
PVector[] seedsloc = {
  new PVector(100, 100), new PVector(200, 200), new PVector(300, 300)
}; // random locations can also be used


/* Circles and Lines */
// Choose if you want the cells or the lines between seeds, or both, to appear
// Warning: showing both cells and lines will cause the background not to be refreshed,
// thus having a trail of all the cells
boolean cells = true;
boolean lines = true;
// Show circles when new seed is created between old and new seed
// Warning: circles will cover the lines so no point using them together
boolean circles = false;
// future: modify colors also

/////////      END OF CONFIGURATION     //////////


//////       CODE       ////////

Cell[] myCells= new Cell[nodes];

void setup() {
  size(500,500);
  // Create the cells
  for (int i=0; i <myCells.length; i++) {
    myCells[i]=new Cell(xbottom, xup, ybottom, yup);
  }
  // Adding the iniitial seeds (does not matter which cell id, only location)
  for (int i=0; i<seedsloc.length; i++) {
    myCells[i].isseed = true;
    // overwrite the original location with the one provided in the 
    // configuration
    myCells[i].location = seedsloc[i];
  }
}


void draw () {
  // Set background
  if (!lines & !circles) {
    background(255);
  }
  // Manage Proximity
  if ( frameCount % fr == 0) {
    if (limit - proximity >= inc) {
      proximity = proximity + inc ;
    }
    else {
      proximity = limit;
    }
  }
  // Display and update cells
  for (int i=0; i<myCells.length;i++) {
    if (cells) {
      myCells[i].display();
    }
    myCells[i].update();
  }
  // Run the seed update algorithm
  for (int i=0; i<myCells.length; i++) {
    if (myCells[i].isseed== false) {
      for (int j=0; j<myCells.length; j++) {
        if (myCells[j].isseed==true) {
          float d;
          d= PVector.dist(myCells[i].location, myCells[j].location);
          if (d<proximity) {
            myCells[i].isseed=true;
            if (lines) {
              strokeWeight(random(1, 10));
              stroke(random(0, 255), random(0, 255), random(0, 255));
              line(myCells[i].location.x, myCells[i].location.y, myCells[j].location.x, myCells[j].location.y);
            }
            if (circles){
              fill(255,255,255);
              ellipse(myCells[j].location.x, myCells[j].location.y, 2*d, 2*d);
            }
          }
        }
      }
    }
  }
}

class Cell {
  PVector location= new PVector(); //creating vectors
  PVector velocity=new PVector();
  float dia;
  boolean isseed;
  float cellred, cellgreen, cellblue;
  float lineweight;

  Cell(int xbottom, int xup, int ybottom, int yup) {
    //changing the initial location of each cell we
    //we change the density
    location = new PVector(random(xbottom, xup), random(ybottom, yup)); 
    dia=5;
    isseed=false;
    cellred=225;
    cellblue=225;
    cellgreen=225;
    lineweight=0.1;
  }

  void display() {
    strokeWeight(lineweight);
    if (isseed==true) {
      fill(255, 0, 0);
    }
    if (isseed==false) {
      fill(cellred, cellgreen, cellblue);
    }

    ellipse(location.x, location.y, dia, dia);
  }
  void update() {
    if (isseed==false) {
      velocity = new PVector(random(-1, 1), random(-1, 1));
      location.add(velocity);
    }
  }
}



