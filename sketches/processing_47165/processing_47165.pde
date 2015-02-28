
import processing.pdf.*;
 
float perlinPosition = 0;
float perlinSpeed = 0.01;

boolean PDFing = false;

int y = 100;
int speed = 5;

void setup() 
{
  size(400, 300);
  background (#2bb23e);
}

void draw() 
{
  filter(BLUR, 3);
  smooth();
  translate(width/2, height/2);
  rotate(frameCount*.01);
  float armLength = noise(perlinPosition)*300;
  ellipse(armLength, 0, 1, 100);
  perlinPosition= perlinPosition + perlinSpeed;
}


void mousePressed()
{
 background (#2bb23e);
}


                
                
