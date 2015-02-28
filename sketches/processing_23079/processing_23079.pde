
float x = 0;
float y = 0;
float speedX = 1;
float speedY = random(1);

void setup(){
  size(200,200);
  smooth();
}

void draw(){
  background(255);
  
  x = x + speedX;
  y = y + speedY;
  
  if ((x > width) || (x < 0)){
    speedX = speedX * -1;
  
  if ((y > height) || (y < 0))
  speedY = speedY * -1;
}
  stroke(0);
  fill(175);
  ellipse(x,y,32,32);
}

