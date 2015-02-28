
import peasy.*;

PeasyCam cam;
PImage myImg;

float jumpFactor;
float beatSpeed;

int complexityFactor;
int pointSize;
int pointTransparency;


void setup() {
  size(640, 396, P3D);
  cam = new PeasyCam(this, 350);
  cam.setMinimumDistance(5);
  cam.setMaximumDistance(5000);
  
  myImg = loadImage("sma.jpg");
  loadPixels(); 
  
  loadDefaults();
  
  rotateX(-.5);
  rotateY(-.5);
}

void loadDefaults()
{
  jumpFactor = 2;
  complexityFactor = 50;
  beatSpeed = 30;  
  pointSize = 9;
  pointTransparency = 200;
}



void draw() {

  background(0);
  translate(-width/2, -height/2);
  int pcount =0;
  for (int y = 0; y < height; y++) 
  {
    for (int x = 0; x < width; x++) 
    {
      int loc = x + y*width;
      if (pcount % complexityFactor ==0) 
      {
        stroke(color(myImg.pixels[loc]), pointTransparency);
        strokeWeight(pointSize);
        point(x, y, (brightness(myImg.pixels[loc])/jumpFactor)*sin(frameCount/beatSpeed));
      }
      pcount++;
    }
  }
}


void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      beatSpeed+=1;
    } 
    else if (keyCode == DOWN) {
      beatSpeed-=1;
    }
  } 
  else {
    if (key == 'b') 
    {
      pointSize++;
    } 
    else if (key == 'B')
    {
      pointSize--;
    }
    else if (key == 'c') 
    {
      complexityFactor++;
    } 
    else if (key == 'C')
    {
      complexityFactor--;
    }    
    else if (key == 't') 
    {
      pointTransparency+=10;
    } 
    else if (key == 'T')
    {
      pointTransparency-=10;
    }
    else if (key == 'h') 
    {
      jumpFactor++;
    } 
    else if (key == 'H')
    {
      jumpFactor--;
    }
    else if (key == 'r' || key == 'R')
    {
      loadDefaults();
    }
  }
}


