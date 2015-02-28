
import processing.opengl.*; 
PImage img;
float maxLength = 80;
color c1, c2;
void setup()
{
  size(800,600,OPENGL);
  img = loadImage("colombia.jpg");
  img.loadPixels();
  background(0);
  //smooth();
  frameRate(60);
}

void draw()
{
  maxLength *= 0.985;
  if(maxLength<2)
    maxLength=2;

  for(int i = 0; i < 6000; i++)
  {
    int rndX = (int)random(0,width);
    int rndY = (int)random(0,height);
    int rndX2 = constrain(rndX+(int)random(-maxLength,maxLength),0,width-1);
    int rndY2 = constrain(rndY+(int)random(-maxLength,maxLength),0,height-1);
    
    c1 = color(red(img.pixels[rndX+rndY*width]), green(img.pixels[rndX+rndY*width]), blue(img.pixels[rndX+rndY*width]), 255-maxLength*3);
    c2 = color(red(img.pixels[rndX2+rndY2*width]), green(img.pixels[rndX2+rndY2*width]), blue(img.pixels[rndX2+rndY2*width]), 255-maxLength*3);
    
    beginShape(LINES);
    stroke(c1);
    vertex(rndX,rndY,0);
    stroke(c2);
    vertex(rndX2,rndY2,0);
    endShape();
  }
}

void keyPressed()
{
  fill(0,0,0);
  rect(0,0,width,height);
  maxLength = 80; 
}



