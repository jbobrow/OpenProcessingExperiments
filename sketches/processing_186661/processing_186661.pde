
float x,y;
float xSpeed,ySpeed;

void setup(){
size(500,500);
x = random(width);
y = random(height);
xSpeed = random(-2,2);
ySpeed = 1;
}

void draw(){
  background(255);
  noStroke();
  
  x = x +xSpeed;
  y = y +ySpeed;
  
if (x > width - 25 || x < 25){
    xSpeed = xSpeed *-1;
}
if (y > width - 25 || y < 25){
    ySpeed = ySpeed *-1;
}
  fill(255,0,255,50);
  ellipse(x,y,50,50);
  fill(0);
  ellipse(x,y,2,2);
}
