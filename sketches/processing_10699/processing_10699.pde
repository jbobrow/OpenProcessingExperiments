
/*
* Author: Jeremy Arca
* Date: 25-Feb-2010
*/

float xmag, ymag = 0;
float newXmag, newYmag = 0; 
int times = 0;
int z = 500;

void setup(){
  size(600,400, P3D);
  background(162);
  frameRate(15);
}

void draw(){
  //fill(0,40);
  // rect(0,0,width,height);
  background(162);

  pushMatrix();
  translate(width/2,height/2,-100);
  newXmag = mouseX/float(width) * TWO_PI;
  newYmag = mouseY/float(height) * TWO_PI;

  float diff = xmag-newXmag;
  if (abs(diff) >  0.01) { 
    xmag -= diff/4.0; 
  }
  diff = ymag-newYmag;
  if (abs(diff) >  0.01) { 
    ymag -= diff/4.0; 
  }
  rotateX(-ymag); 
  rotateY(-xmag); 
  float strc = 50 + (mouseY/2);

  //noFill();
  // fill(mouseY,mouseY,mouseY);
  fill(strc, mouseX, mouseY,50);
  sphere(5);
  times+=1;
  stroke(strc, mouseX, mouseX);
  for(int x = 0; x  < 200; x++)
  {
    translate(x,-x,0);
    rotate(radians(-times));
    ellipse(0,0,1,20);
  }
  delay(1);
  if(times > 720)
    times = 0;
  popMatrix();



}




