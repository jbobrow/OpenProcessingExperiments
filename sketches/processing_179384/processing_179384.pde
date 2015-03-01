
// DLA with moving seed instead to represent neutron

Cell[]myCells= new Cell[750];  //number of cells 750 to give good covering
 
 
void setup() {
  size(750, 750);
  for (int i=0; i <myCells.length; i++) {
    myCells[i]=new Cell();
  }
  myCells[0].isseed=true;
  // start position of the first seed cell
  myCells[0].location= new PVector(random(370,375),random(370,375));  //random location in the centre of canvas
  
   
}
 
 
void draw () {
   background(255);
  for (int i=0; i<myCells.length;i++) {
     myCells[i].display();
    myCells[i].update();
  }
  for (int i=0; i<myCells.length; i++) {
    if (myCells[i].isseed== false) {
      for (int j=0; j<myCells.length; j++) {
        if (myCells[j].isseed==true) { 
          float d;
          d= PVector.dist(myCells[i].location, myCells[j].location);
          if (d<5) { //distance check
            myCells[i].isseed=true;
           
          }
        }
      }
    }
  }
}
 
class Cell {
  PVector location= new PVector(); //vectors locations
  PVector velocity=new PVector();
  float dia;  //diameter of cells
  boolean isseed;  //seed true or false
  float lineweight;
    float randomx = random(-3, 3); // random direction to apply to new neutrons after collision
  float randomy = random(-3, 3);
 
  Cell() {
    location = new PVector(random(750), random(750));
    dia=8;
    isseed=false;
    lineweight=1;
  }
 
  void display() {
    strokeWeight(lineweight);
    if (isseed==true) {
      fill(0, 255, 255);
            velocity = new PVector(randomx, randomy); //gives neutrons random movement direction
      location.add(velocity);

    }
    if (isseed==false) {
      fill(255);
    }
 
    ellipse(location.x, location.y, dia, dia);
  }
  void update() {
    if (isseed==false) {
      velocity = new PVector(random(-0, 0), random(-0, 0)); //atoms fixed in place
      location.add(velocity);
    }
  }
}



