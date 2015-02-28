

int a = 100;
float x1, y1, x2, y2;
float r1 = 20, r2 = 30;
float rSum = r1+r2;
float speed = 1.5, directionX = .4, directionY = .75, velocityX, velocityY;


void setup() {
  size(700, 400);
  noStroke();
  frameRate(30);
  smooth();
  x1 = width/2;
  y1 = height/2;

  
}

void draw() {
  background(0);

  fill(255);
  velocityX = directionX*speed;
  velocityY = directionY*speed;
  x1+=velocityX;
  y1+=velocityY;
  
{
 
  ellipse(x1, y1, random(20, 100), random(20, 100));
  ellipse(y1, y1, random(20, 100), random(20, 100));
  ellipse(a, y1, random(20, 100), random(20, 100));
  ellipse(x1, x1, random(20, 100), random(20, 100));
  ellipse(x1, a, random(20, 100), random(20, 100));
  ellipse(y1, a, random(20, 100), random(20, 100));
  ellipse(a, x1, random(20, 100), random(20, 100));
  fill(0);
   ellipse(x1, y1, random(20, 100), random(20, 100));
  ellipse(y1, y1, random(20, 100), random(20, 100));
  ellipse(a, y1, random(20, 100), random(20, 100));
  ellipse(x1, x1, random(20, 100), random(20, 100));
   ellipse(x1, a, random(20, 100), random(20, 100));
  ellipse(y1, a, random(20, 100), random(20, 100));
  ellipse(a, x1, random(20, 100), random(20, 100));
  
}
  
 

  x2 = mouseX;
  y2 = mouseY;
  fill(255,0,0,200);
  ellipse(x2, y2, 40, 40);


  float d = dist(x1, y1, x2, y2);
  if (d < rSum){
    directionX = (x1-x2)/d;
    directionY = (y1-y2)/d;
  
    x1 = x2+(rSum)*directionX;
    y1 = y2+(rSum)*directionY;
   
  }

 
  if (x1 > width-r1) {
  
    x1 = width-r1;
    directionX *= -1;
  } 
  else if (x1 < r1) {

    x1 = r1;
    directionX *= -1;
  } 
  else if (y1 > height-r1) {
  
    y1 = height-r1;
    directionY *= -1;
  } 
  else if (y1 < r1) {
    
    y1 = r1;
    directionY *= -1;
  }
  
}
 

