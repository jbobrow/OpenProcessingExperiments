
//CLASS
class Cell{
  //defining what a 'Cell' is, to allow us to use this multiple times in the simulation
  PVector location = new PVector();
  PVector velocity = new PVector();
  float dia;
  //diameter variable
  boolean isseed;
  //is the seed frozen, as a 'seed'
  float cellred, cellgreen, cellblue;
  float lineweight;
  float str;
  
  //all the variables in the cell to change its behaviour and appearance
  
  //CONSTRUCTOR
  Cell(){
    location = new PVector(random(width),random(height));
    dia = random(1,10);
    str = 255;
    isseed = false;
    cellred = random(0,255);
    cellgreen = random(0,255);
    cellblue = random(0,255);
    lineweight = 0.5;
    //initialisation of the different values for the cell's variables
  }

  //FUNCTION
  void display(){
  strokeWeight(lineweight);
  stroke(str);
  noFill();
  //fill(cellred);
  ellipse(location.x,location.y,dia,dia);
 }
 
 void update(){
   velocity = new PVector(random(-18,18),random(-18,18));
      location.add(velocity);
 }
 
 void randomcol(){
   fill(cellred);
 }
 
}

