


Cell[] myCells = new Cell[3500];


void setup() {
  size(500, 500);
  for (int i = 0; i < myCells.length; i ++) {
    myCells[i] = new Cell();
  }
}

void draw() {
  //here i created a loop that relates the number of seeds
  //with the total number of cells. As k is an integer,
  //if i had 3500 cells, it will be divided by 1000 and three
  //starting seeds will appear.
  for (int k=0; k<myCells.length/1000; k++) {
    myCells[k].isseed = true;
  }
  //to make the first seed to begin in the center you have
  //to call the location fucntion that comes from the class.
  //as it is vector, you have to maintain its characteristics
  //of funtioning: "new PVector(x , y)".
  myCells[0].location =  new PVector(width/2, height/2);
  //background(255);
  for (int i=0; i< myCells.length; i++) {
    //myCells[i].display();
    myCells[i].update();
  }
  

  for (int i=0; i<myCells.length; i++) {
    if(myCells[i].isseed == false){
      for(int j=0; j<myCells.length;j++){
        if(myCells[j].isseed == true){
          float d;
          d = PVector.dist(myCells[i].location, myCells[j].location);
            if(d < 10){
              myCells[i].isseed = true;
              line(myCells[i].location.x, myCells[i].location.y, myCells[j].location.x, myCells[j].location.y); 
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


    

  
  
    
  


