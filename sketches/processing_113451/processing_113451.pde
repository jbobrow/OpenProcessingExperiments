
//Guilherme Vargas Garcia

float x;
float y;
float speedX = 3;
float speedY = 5.5;

void setup (){
  size(500, 500);
  rectMode(CENTER);
  noCursor();
  noStroke();
}

void draw(){
  x += speedX;
  y += speedY;
  
  ellipse(x, y, 30, 30);
  
  
  if (x > width){
    speedX *= -1;
    fill(17,237,132);
  }
  if (x<0){
    speedX *= -1;
    fill(23,21,45);
  }
  
  if (y > height) {
    speedY *= -1;
    fill(34,100,24);
  }
  if (y < 0) {
    speedY *= -1;
    fill(98,200,200);
  }
}
