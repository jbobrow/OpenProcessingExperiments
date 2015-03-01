
float x = 200;
float y = 50;
float gravity = 1.15;
float speed = 0;
float bounce = -.97;
PImage imageV;
float speedO = 0;
float bounceO= -.4;
float gravityO = 1.1;


void setup() 
{
  size(800,800);
  imageV= loadImage("bwater.jpg");
  smooth();
  noStroke();
  
}
void draw() {
  image(imageV, 0,0);
  fill(0,150,250);
  stroke(1);
  strokeWeight(1);
  ellipse(x, y, 30, 30);
  
  
//Ball 2
  strokeWeight(1);
  ellipse(x+50, y, 15, 15);
  
//bounce ball 2
  speedO+=gravityO;
  y+=speedO;
  if(y>height-12);
  {
    speedO *=bounceO;
  }
  
  
//Bounce Ball 1
  speed+=gravity;
  y += speed;
  if(y > height - 12)
  {
    speed *= bounce;
  }

 
  
}



