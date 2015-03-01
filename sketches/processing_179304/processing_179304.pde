
Cell[] myCells = new Cell[40*40];
 
void setup() {
  size(750, 750);
  int i3=0;
  for (int i = 0; i < 40; i ++) {
    for (int i2 = 0; i2 < 40; i2 ++) {
      myCells[i3] = new Cell(i, i2);
      i3++;
    }
  }
 
  myCells[1].location.set(375, 375); 
 
  myCells[1].isseed = true ;
}
 
void draw() {
  background(255);
  for (int i=0; i< myCells.length; i++) {
    myCells[i].display();
    myCells[i].update();
  }
  myCells[0].isseed = false;    
 
 
 
 
  for (int i=0; i<myCells.length; i++) {
    if (myCells[i].isseed == false) {
      for (int j=0; j<myCells.length; j++) {
        if (myCells[j].isseed == true) {
          float d;
          d = PVector.dist(myCells[i].location, myCells[j].location);
          if (d < 2) {  //d=2 neutrons must have a direct hit to cause a fission reaction
            myCells[i].isseed = true;
          }
        }
      }
    }
  }
 
 
  for (int i=0;i<5;i++)
  {
 
    //draw object number i
  }
}
 
// ==========================================
 
class Cell {
 
  PVector location = new PVector();
  PVector velocity = new PVector();
  float dia; //neutron diameter
  public boolean isseed;
  float lineweight;
  float randomx = random(-1, 1); // random direction to apply to new neutrons after collision
  float randomy = random(-1, 1);
  float atomdia;  //atom diameter larger than neutron
 
 
  Cell(int i, int i2) {
 
    int factor1 = 0;
 
    // if even
    if (i2 % 2 == 0)
      factor1 = 22;
    else
      factor1 = 0;
 
    location = new PVector(  i*12+12+factor1, i2*17+12 ); //creates grid of atoms
    //  new PVector(random(750), random(750));
    dia = 8;
    atomdia = 20;
    isseed = false;
  }
 
  void display() {
    stroke(lineweight);
    if (isseed == true) {
      ellipse(location.x, location.y, dia, dia);
 
      fill(255, 0, 0);
      velocity = new PVector(randomx, randomy); //gives neutrons random movement direction
      location.add(velocity);
    }
    if (isseed == false) {
      fill(255);
    }
        ellipse(location.x, location.y, dia, dia); //atoms

  }
  void update() {
    if (isseed == false) {
      velocity = new PVector(random(-0, 0), random(-0, 0));
      location.add(velocity);
    }
  }
}


