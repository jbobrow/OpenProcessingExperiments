
Pig[] piggs;
int numPigs = 25;

void setup(){
 
 size(500, 500);
 colorMode(HSB, 100);
 smooth();
 
 piggs = new Pig[numPigs];
 
 for(int i = 0; i < numPigs; i++) {
  
  piggs[i] = new Pig();
   
 }
 
  
}

void draw(){
  
  fill(0, 2);
  rect(0, 0, width, height);
   
  for (int i = 0; i < numPigs; i++) {
   
   piggs[i].update();
   piggs[i].ddraw(); 
    
  }
  
}


class Pig {
  
 int xPos, yPos, aColor, bColor, ourState;
 float aArm, bArm, cArm, dArm, eArm;
 float rrRot, ranRot;

 Pig () {
  
   xPos = (int)random(width);
   yPos = (int)random(height);
   aColor = (int)random(100);
   bColor = (int)random(100);
   ourState = 1;
   aArm = -1;
   bArm = -1;
   cArm = 1;
   dArm = 1;
   eArm = 2;
   rrRot = 0;
   ranRot = .05 - random(.1);
 } 
  
 void update() {
   
   ourState++;
   
   if ((ourState % 20) > 10) {
     aArm *= 1 + random(.2);
     bArm *= 1 + random(.2);
     cArm *= 1 + random(.2);
     dArm *= 1 + random(.2);
     eArm *= 1 + random(.4);
   } else {
     aArm *= .8 + random(.2);
     bArm *= .8 + random(.2);
     cArm *= .8 + random(.2);
     dArm *= .8 + random(.2);
     eArm *= .6 + random(.4);
   }
   
   aArm *= 1/abs(1 - aArm);
   bArm *= 1/abs(1 - bArm);
   cArm *= 1/abs(1 - cArm);
   dArm *= 1/abs(1 - dArm);
   eArm *= 1/abs(1 - eArm); 
   
   rrRot += ranRot;
   
   
 }
  
  
 void ddraw() {
   
   if ((ourState % 10) > 5) {
     
     fill(aColor, 100, 100);
   } else {
     fill(bColor, 100, 100);
   }
   
   pushMatrix();
   translate(width/2, height/2);
   rotate(rrRot);
   translate((xPos+yPos) / 3, 0);
   beginShape();
   vertex(-10 * aArm, -10 * bArm);
   vertex(10 * cArm, -10 * dArm);
   vertex(10 * eArm, 10 * eArm);
   vertex(10 * bArm, -10 * cArm);
   endShape(CLOSE);
   popMatrix();   
   
   
 }
  
  
}
