
import java.util.*; 

Random generatorX; //x position
Random generatorY; //y position
Random generatorS; //size
Random generatorC; //color

int rot = 1;

void setup(){
  size(640,360);
  smooth();
  generatorX = new Random();
  generatorY = new Random();
  generatorS = new Random();
  generatorC = new Random();
  background(0);
}

void draw(){

  rot++;
  if (rot > 360) {
    rot = 0;
  }
  
float numX = (float) generatorX.nextGaussian();
float sdX = width/10;
float meanX = mouseX;

float numY = (float) generatorY.nextGaussian();
float sdY = height/10;
float meanY = mouseY;

float numC = (float) generatorC.nextGaussian();
float sdC = 30;
float meanC = 180;

float numS = (float) generatorS.nextGaussian();
float sdS = pmouseX-mouseX;
float meanS = pmouseX-mouseX;


float x = sdX * numX + meanX;
float y = sdY * numY + meanY;
float s = sdS * numS + meanS;
float c = sdC * numC + meanC;


pushMatrix();
  translate(x,y);
  rotate(rot);
  fill(c,c/3,c,10);
  stroke(mouseX/c,c,c/3*2,50);
  ellipseMode(CENTER);
  ellipse(0, 0, s/4, s/4);

  //draw circle
  fill(c,c/3,c,10);
  stroke(mouseX/c,c,c/3*2,50);
  ellipse(0-(s/16), 0, s/8, s/8);

  //draw circle
  fill(c,c/3,c,10);
  stroke(mouseX/c,c,c/3*2,50);
  ellipse(0+(s/16), 0, s/8, s/8);

  //draw circle
  fill(c,c/3,c,10);
  stroke(mouseX/c,c,c/3*2,50);
  ellipse(0, (0)+(s/16), (s/8), (s/8));

  //draw circle
  fill(c,c/3,c,10);
  stroke(mouseX/c,c,c/3*2,50);
  ellipse(0, (0)-(s/16), (s/8), (s/8));
  popMatrix();

}
