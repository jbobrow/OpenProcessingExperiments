
void setup()
{
int triangleX1 = 300;
    size (500,500);
    background (255,100,20);
    
}

void draw(){  
int circleSize = 300;
int smallercircle = 200;
int circleX = mouseX;
int circleY = mouseY;
  fill (200,255,90);
  ellipse (250,250,circleSize,circleSize);
  ellipse (100,100,smallercircle,smallercircle);
  ellipse (400,400,smallercircle,smallercircle);
  fill (35,60,90);
  ellipse (100,100,175,175);
  fill (35,60,90);
  ellipse (400,400,175,175);
  fill (0,20,40);
  ellipse (250,250,smallercircle,smallercircle);
  fill (35,60,90);
  ellipse (250,250,100,100);
  fill (0,100,255);
  ellipse (mouseX,mouseY,100,100);
  triangle (1,1,300,300,500,500);
  triangle (1,500,1,500,500,1);
  PFont fontA = loadFont("Arial");
  textFont = (fontA,100);
  textSize (100);
  fill (255);
  text ("WARPED",40,270);
}

