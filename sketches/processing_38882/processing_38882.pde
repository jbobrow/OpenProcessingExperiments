


void setup()
{
 size(500, 500);
 background(0); 
 smooth();
 colorMode(HSB, 100);
   
  noStroke();

  
  
}

void draw(){

for(int i = 0; i < 11; i = i+1){  
  
dDraw(i*width/10, mouseY, 0, .5, random(100) ); 
 
}

}

void dDraw(int xPos, int yPos, float dRotation, float dScale, float dColor){

  pushMatrix();
  translate(xPos, yPos);
  rotate(dRotation);
  fill(dColor, 100, 100);
  arc(0, 0, 200*dScale, 220*dScale, PI, TWO_PI);
  rect(-100*dScale, 0, 200*dScale, 400*dScale);
  popMatrix();
  return;
  
}
