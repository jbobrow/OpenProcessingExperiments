
Cell[] myCells = new Cell[2000];

void setup() {
  size(500, 500);
  for (int i = 0; i < myCells.length; i ++) {
    myCells[i] = new Cell();
  }
}

void draw() {
  //background(255);
  for (int i=0; i< myCells.length; i++) {
    //myCells[i].display();
    myCells[i].update();
  }
  myCells[0].isseed = true;

  for (int i=0; i<myCells.length; i++) {
    if(myCells[i].isseed == false){
      for(int j=0; j<myCells.length;j++){
        if(myCells[j].isseed == true){
          float d;
          d = PVector.dist(myCells[i].location, myCells[j].location);
            if(d < 10){ //distance between cells
              myCells[i].isseed = true;
              line(myCells[i].location.x, myCells[i].location.y, myCells[j].location.x, myCells[j].location.y); //adds lines between ellipse 
              ellipse(myCells[i].location.x, myCells[i].location.y, 5,5);
            }
          }
        }
      }
    }
  }




float speed = 1;
float angle = random(PI); //random angle
class Cell{
  
  PVector location = new PVector();
  PVector velocity = new PVector();
  float dia;
  boolean isseed;
  float cellred, cellgreen, cellblue;
  float lineweight;
   
  
  Cell(){
  
    location = new PVector(random(500), random(500)); //random location in canvas
    dia = 5;
    isseed = false;
    cellred = 255;
    cellgreen = 255;
    cellblue = 255;
    lineweight = 0.1;
  }
  
  void display(){
    stroke(lineweight);
    if(isseed == true){
      fill(255,0,0);
    }
    if(isseed == false){
    fill(cellred,cellgreen,cellblue);
    }
    ellipse(location.x, location.y, dia,dia);
  }
  void update(){
    if(isseed == false){
    velocity = new PVector(random(-1,1),random(-1,1));
    location.add(velocity);
    }
    
  }
}


  
  
    
  



