
import processing.opengl.*;

PImage firstImage;
float counter=0;
int switchCases[]={0,0,1};



void setup() 
{
  size(600, 600, P3D);
  firstImage= loadImage("monroe.png");
  textureMode(NORMALIZED);
  noStroke();
}

void draw() 
{
  backgroundTranslateScaleRotate();
  texturedCubes();
  
  if(frameCount%500==0)
  switchCases[int(random(0,switchCases.length))]=int(random(0,3));
  
  
}

void backgroundTranslateScaleRotate()
{
  background(74,197,193);
  translate(width/2 +20, height/2+20, 0);
  scale(width/20);
}


void texturedCubes() 
{
  
  for(int x=-7;x<7;x+=2)
  for(int y=-7;y<7;y+=2)
  {
  
  pushMatrix();

  translate(x,y);
  rotateY(counter+=.0003);
  
  for(int b=0;b<switchCases.length;b++)
  switch(switchCases[b])
  {
  case 0:rotateX(counter);break;
  case 1:rotateZ(counter);break;
  case 2:rotateY(counter);break;
  }
  
  
  
  beginShape(QUADS);
  int helper = int(firstImage.width/7.0);
  texture(firstImage.get((x+7)*helper/2,(y+7)*helper/2,helper,helper));

  vertex(-1, -1,  1, 0, 0);
  vertex( 1, -1,  1, 1, 0);
  vertex( 1,  1,  1, 1, 1);
  vertex(-1,  1,  1, 0, 1);
  
  endShape();
  
  popMatrix();

  }
}









