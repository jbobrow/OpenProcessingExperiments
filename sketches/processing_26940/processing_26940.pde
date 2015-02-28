
//Action And movement


float x,y,directionX,directionY; 
void setup(){
  size(800,600);
  frameRate(35);
  y = 50; //beginning y-position
  directionX = 2; //horizontal speed/direction
  directionY = 1; //vertical speed/direction
}

void draw(){
  background(196, 203, 8);
  if(mousePressed) {
    background(67, 89, 103);
  } else {
    background(196, 203, 8);
  }
  smooth();
  noStroke();
  fill(67, 89, 103);
  
  if(mousePressed) {
    fill(196, 203, 8);
  } else {
    fill(67, 89, 103);
  }
  
  ellipse(x,y,50,50);
  x += directionX;
  y += directionY;
  
  
//bottom wall
  if(y > height){
    directionY = -1;
  }

//top wall
  if(y < 0){
    directionY = 1;
  }
  
//right wall
  if(x > width){
    directionX = -2;
  }
  
//left wall
  if(x < 0){
    directionX = 2;
  }
}



