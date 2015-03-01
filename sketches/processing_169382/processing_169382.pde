
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

void setup() {
  size(400, 400); 
  background(255); 
  smooth(); 
  frameRate(25); 
  strokeWeight(1);  

  mx = width/2; 
  my = height/2; 

  rSize = 200;
  angleR = 0; 
  rx = 0 - mx; 
  ry = height - rSize - my;  
  tx = rSize - mx; 
  ty = height - my;
  angleStep = 0.5;  

  rSize2 = 100;
  angleR2 = 0;
  tx2 = -rSize2; 
  ty2 = 0; 

  rSize3 = 50;
  angleR3 = 0;  
  tx3 = -rSize3; 
  ty3 = 0; 
}

void draw() {

  background(50); 
  stroke(0); 
  
  // rotate first rectangle
  for (float angle = 0; angle < TWO_PI; angle += PI/2) {   

    pushMatrix(); 
    translate(mx, my);   // midpoint of canvas
    rotate(angle); 

    pushMatrix();
    translate(tx, ty);   //lower right edge of rect1 
    rotate(radians(angleR));
    fill(#136E9B, 200);     
    rect(rx - tx, ry - ty, rSize, rSize);   
    // rotate second rectangle within first rectangle
    for (float angle1 = 0; angle1 < TWO_PI; angle1 += PI/2) {

      pushMatrix(); 
      translate(-rSize/2, -rSize/2);   // midpoint of rect1
      rotate(angle1); 

      pushMatrix();
      translate(tx2+rSize/2, ty2+rSize/2);  // lower right edge of rect2
      rotate(radians(angleR2)); 
      fill(255, 200); 
      rect(-rSize2, -rSize2, rSize2, rSize2); 
      // rotate third rectangle within second rectangle
      for (float angle2 = 0; angle2 < TWO_PI; angle2 += PI/2) {

        pushMatrix(); 
        translate(-rSize2/2, -rSize2/2); 
        rotate(angle2); 

        pushMatrix(); 
        translate(tx3+rSize2/2, ty3+rSize2/2);
        rotate(radians(angleR3));  
        fill(#136E9B, 150);
        rect(-rSize3, -rSize3, rSize3, rSize3);    
        popMatrix();     

        popMatrix();
      } // rotate third rectangle within second rectangle
      popMatrix();

      popMatrix();
    } // rotate second rectangle within first rectangle
    popMatrix(); 

    popMatrix();
  } // rotate first rectangle

  angleR += angleStep; 
  if (angleR > 90 || tx >= mx) {    
    angleR = 0; 
    rx = 0 - mx; 
    tx = rSize - mx;
  }

  angleR2 += angleStep*3; 
  if (angleR2 > 90) {
    angleR2 = 0; 
    tx2 = -rSize2;
  }

  angleR3 += angleStep*7.1; 
  if (angleR3 > 90) {
    angleR3 = 0; 
    tx3 = -rSize3;
  }

}



