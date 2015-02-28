
int num= 6; //declare numder of objects
float rectSize = random(100);

Tile[] myTile= new Tile[num]; // declare name of new objects
color[] myColor= new color [5]; 

void setup() {
  
  size(300,300);
  
  myColor[0]= color(0,255,0,25);  //organize colors along array matrix
  myColor[1]= color(50,0,0,50);
  myColor[2]= color(50,0,255,50);
  myColor[3]= color(100,0,50,25);
  myColor[4]= color(255,0,0,75);
  
  for(int i=0; i<myTile.length; i++) {
    myTile[i]= new Tile();
  }
  
  
  
  noStroke();
  
  rectMode(CENTER);
}

void draw() {
  background(255);
  
  for(int i=0; i<myTile.length; i++) {
    myTile[i].update();
    myTile[i].draw();
  }
}

//set class variables
class Tile {
  
  //testing out class variables as unknowns, and them inputting those variables into a constructor
  
 // float xpos;
 // float ypos;
 // color col;
 // float rectSize;
  
  //Tile(float xpos_, float ypos_, color col_, float rectSize_){
  // xpos = xpos_
  // ypos = ypos_
  // col = col_
  // rectSize = rectSize_
  
  //using the data from original hard coded sketch of box array
  
 float xpos = random(20, width-20) ;
 float ypos = random(20, height-20) ;
 color col = myColor[floor(random(0,5))] ;
 float rectSize = random(100) ;
  
  Tile() {
  }
  
   void update() {
    rectSize++;
    if (rectSize > width) {
      rectSize = 1;
       
    }
  }
 
    void draw() {
      fill(col) ;
  
      rect(xpos,ypos,rectSize,rectSize) ;
    }
  }
  

