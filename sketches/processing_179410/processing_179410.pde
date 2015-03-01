

Cell[] myCells = new Cell[2000]; //2000 cell count

void setup() {

  size(500, 500);
  for (int i = 0; i < myCells.length; i ++) {
    myCells[i] = new Cell();
  }
}

void draw() {
     // background(255,99); //background off prevents looping

  for (int i=0; i< myCells.length; i++) {
    myCells[i].display();
    myCells[i].update();
  }
  myCells[0].isseed = true;

  for (int i=0; i<myCells.length; i++) {
    if(myCells[i].isseed == false){
      for(int j=0; j<myCells.length;j++){
        if(myCells[j].isseed == true){
          float d;
          d = PVector.dist(myCells[i].location, myCells[j].location);
            if(d < 5){
              myCells[i].isseed = true;
              strokeWeight(50); //large stroke gives impression of clouds
              line(myCells[i].location.x, myCells[i].location.y, myCells[j].location.x, myCells[j].location.y); //add lines
              //ellipse(myCells[i].location.x, myCells[i].location.y, 5,5); //add circles
            }
          }
        }
      }
    }
  }




float speed = 1;
float angle = random(PI);
class Cell{
  
  PVector location = new PVector();
  PVector velocity = new PVector();
  float dia;
  boolean isseed;
  float cellred, cellgreen, cellblue;
  float lineweight;
  float xspeed = random(-1,1);
  float yspeed = random(-1,1);
   
  
  Cell(){
  
    location = new PVector(random(500), random(500));
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
      velocity = new PVector(xspeed,yspeed);
    location.add(velocity);
      fill(255,0,0);
    }
    if(isseed == false){
    fill(cellred,cellgreen,cellblue);
    }
  //  ellipse(location.x, location.y, dia,dia);
  }
  void update(){
    if(isseed == false){
    velocity = new PVector(0,0);
    location.add(velocity);
    }
    
  }
}


  
  
    
  



