
float angle = 0.0;
PImage masker;
  
void setup()
{


  masker = loadImage("mask.png");
  imageMode(CENTER);
  
  size(294, 198);
  noFill();
  //ellipseMode(CENTER);
  stroke(255);
  strokeWeight(1);
  smooth();
}


void draw()
{
 background(191,34,40);
 image(masker, width/2,height/2);
 translate(width/2, height/2);
 float x = cos(angle) * 100;
 float y = sin(angle) * 100;

 
 for (int i=0; i<12; i++)
 {
   rotate(radians(15 + angle));
   ellipse(0, 0, 25, 145);
 }
 
 angle += 0.03;
}

