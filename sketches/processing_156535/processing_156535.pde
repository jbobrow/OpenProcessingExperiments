
float angleC;
float mx, my;
float angleStep;

float rSize; 
float rx, ry; 
float tx, ty; 
float angleR;

float rSize2; 
float rx2, ry2; 
float tx2, ty2; 
float angleR2;

float rSize3; 
float rx3, ry3; 
float tx3, ty3; 
float angleR3;

float rSize4; 
float rx4, ry4; 
float tx4, ty4; 
float angleR4; 

void setup() {
  size(400, 400); 
  background(255); 
  smooth(); 
  frameRate(25); 
  strokeWeight(2); 

  angleC = 0; 
  mx = width/2; 
  my = height/2; 

  rSize = 200;
  angleR = 0; 
  rx = 0 - mx; 
  ry = height - rSize - my;  
  tx = rSize - mx; 
  ty = height - my;
  angleStep = 1; 

  rSize2 = 100;
  angleR2 = 0; 
  rx2 = 0 - mx; 
  ry2 = height - rSize2 - my;  
  tx2 = rSize2 - mx; 
  ty2 = height - my;

  rSize3 = 50;
  angleR3 = 0; 
  rx3 = 0 - mx; 
  ry3 = height - rSize3 - my;  
  tx3 = rSize3 - mx; 
  ty3 = height - my;

  rSize4 = 25;
  angleR4 = 0; 
  rx4 = 0 - mx; 
  ry4 = height - rSize4 - my;  
  tx4 = rSize4 - mx; 
  ty4 = height - my;
}

void draw() {

  background(200); 
  stroke(0); 

  for (float angle = 0; angle < TWO_PI; angle += PI/2) {   

    pushMatrix(); 
    translate(mx, my); 
    rotate(angle); 

    pushMatrix();
    translate(tx, ty);  
    rotate(radians(angleR));
    fill(0, 100);     
    rect(rx - tx, ry - ty, rSize, rSize);       
    popMatrix(); 

    pushMatrix();
    translate(tx2, ty2);  
    rotate(radians(angleR2)); 
    fill(255, 200); 
    rect(rx2 - tx2, ry2 - ty2, rSize2, rSize2);       
    popMatrix(); 

    pushMatrix();
    translate(tx3, ty3);  
    rotate(radians(angleR3)); 
    fill(0, 100); 
    rect(rx3 - tx3, ry3 - ty3, rSize3, rSize3);       
    popMatrix(); 

    pushMatrix();
    translate(tx4, ty4);  
    rotate(radians(angleR4)); 
    fill(255, 200); 
    rect(rx4 - tx4, ry4 - ty4, rSize4, rSize4);       
    popMatrix();

    popMatrix();
  }

  /*     */
  angleR += angleStep; 
  if (angleR > 90) {    
    angleR = 0; 
    rx += rSize; 
    tx += rSize;
  }

  angleR2 += angleStep*3; 
  if (angleR2 > 90) {
    angleR2 = 0; 
    rx2 += rSize2; 
    tx2 += rSize2;
  }

  angleR3 += angleStep*7.1; 
  if (angleR3 > 90) {
    angleR3 = 0; 
    rx3 += rSize3; 
    tx3 += rSize3;
  }

  angleR4 += angleStep*16; 
  if (angleR4 > 90) {
    angleR4 = 0; 
    rx4 += rSize4; 
    tx4 += rSize4;
  }

  if (tx >= mx) {
    angleC -= 90; 
    angleR = 0; 
    rx = 0 - mx; 
    tx = rSize - mx;

    angleR2 = 0; 
    rx2 = 0 - mx; 
    tx2 = rSize2 - mx;

    angleR3 = 0; 
    rx3 = 0 - mx; 
    tx3 = rSize3 - mx;

    angleR4 = 0; 
    rx4 = 0 - mx; 
    tx4 = rSize4 - mx;
  }
}



