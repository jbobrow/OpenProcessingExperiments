
//Graham Strang HW week 3

float x;
float y;
float directionX;
float directionY;


void setup(){
  size(700, 700);
  smooth();
  background(255);
  frameRate(30);
  x = 10;                            // variable set
  y = 10;
  directionX = 5;
  directionY = 5.5;
 
  
}

void draw(){
 
 
 x += directionX;                  //setup of line vertex motion
 y += directionY;


 if (x > width){                   //color and direction changes
   directionX = -5;
   stroke(0, 0, 150, 100);
   fill(255,125,0,255);
 }
 if (y > height){
    directionY = -5.5;
    stroke(150, 0, 0, 100);
    fill(0, 255, 0, 255);
 }
 if (x <  0){
   directionX = 5;
   stroke(0, 150, 0, 100);
   fill(255, 0, 0, 255);
 }
 if (y < 0){
   directionY = 5.5;
   stroke(0, 0, 0, 100);
   fill(255, 255, 255, 255);
 }
 
 
 
  for (int i = 0; i <= width; i += width/4){      //lines
    for(int j = 0; j <= height; j += width/4){
      strokeWeight(1);
      line(i, j, x, y);
    }
  }
  ellipse(x+random(-10,10), y+random(-10,10),5,5);
}

