

PImage masker;

float growScale;
float startScale;
boolean grow; 
int minWidth = 7;
int maxWidth = 50;

void setup()

{
  size(294, 198);
  smooth();
  ellipseMode(CENTER);
  //imageMode(CENTER);
  masker = loadImage("mask.png");
  startScale = 10;
  growScale = 0.2;
  grow = true;
  strokeWeight(2);
  
}


void draw()

{
  float x = width / 2;
  float y = height / 2;

  background(30,142,154);

  noFill();
  
  if (grow) {

    for (float i=0; i<width; i+=startScale)
    {
      ellipse(x, y, i, i);
      stroke(255,i);
    }  

    //println(startScale);
  }
  else {
    for (int i=maxWidth; i>=0; i-=startScale)
    {
      ellipse(x, y, i, i);
    }
    
    //println(startScale);
  }
  //if (myScale >=0) {
  //  grow= true;
      
 // }
  if (startScale >=maxWidth || startScale<minWidth) {
    growScale*= -1;
  }
  
  startScale+=growScale;
  
  /*if (grow)
  myScale+=0.2;
  else
  myScale-=0.2;
*/

 image(masker,0,0, width, height);
}


