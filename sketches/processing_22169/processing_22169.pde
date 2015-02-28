
PImage bg;
import imageadjuster.*;
int[] hue;

void setup() 
{
  size(400,875);
  frameRate(30);
  colorMode(HSB, 360, height, height);  
  bg = loadImage("overpasstraffic.jpg");
  noStroke();

}

void draw() 
{
  background(bg);
  
  ImageAdjuster adjust = new ImageAdjuster(this);
adjust.contrast(g,   (mouseX - 50), 0, 50, height, .75f);
adjust.contrast(g,   (mouseX + 50), 0, 50, height, 4f);


fill(mouseX, mouseY, 200, 200);
rect(mouseX, 0, 50, height);
fill(mouseX, mouseY, mouseY, 150);
rect((mouseX - 100), 0, 50, height);
fill(mouseY, mouseX, mouseY, 150);
rect((mouseX - 200), 0, 50, height);

fill(200, 200, mouseY, 150);
rect( 0, mouseY, width, 50);
  }



