
float x;
float y;
float directionX;
float directionY;




void setup(){
  size(800,600);
  smooth();
  background(240, 10, 10);
  x = 0;
  directionX = 3;
}
 
void draw(){
  x += directionX;
  y += directionY;
   
ellipseMode(CENTER);
ellipse(x, 250, 100, 100);
fill(237, 203, 10);
  
 
if (x > width){
  directionX = -5;
  }
if (x < 0){
  directionX = 5;
  } 
}


