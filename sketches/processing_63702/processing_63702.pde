
/*
ACCD Summer 2012
ID02
3a Boundaries
Charlene Chen
06/08/2012
*/

float value = 255;

float rx, ry;    // rectangle x- and y-coordinate
float rd = 100;  // rectangle width
  
float ex, ey;    // ellipse x- and y-coordinate
float ed = 106;  // ellipse diameter

float epos;
float epos2;
float epos3;
float epos4;
float epos5;
float epos6;

float rpos;
float rpos2;
float rpos3;
float rpos4;
float rpos5;
float rpos6;
  
void setup() {
  size(640, 360);
  smooth();
  
  // Set the x- and y-coordinates for the rectangle
  rx = width * 0.33 - rd/2;
  ry = height * 0.5 - rd/2;
   
  // Set the x- and y-coordinates for the ellipse
  ex = width * 0.66;
  ey = height * 0.5;
  
  epos= ex;
  epos2 = ey;
  epos3 = ex;
  epos4 = ey;
  epos5 = ex;
  epos6 = ey;
  
  rpos= rx;
  rpos2 = ry;
  rpos3= rx;
  rpos4 = ry;
  rpos5= rx;
  rpos6 = ry;
}
  
void draw() {
  if((mouseX>=rx) && (mouseX<=(rx+100)) && (mouseY>=ry) && (mouseY<=(ry+100)) && (mousePressed == true))
  {
     background(0); 
  }
  
  if((mouseX>=(ex-53)) && (mouseX<=(ex+53)) && (mouseY>=(ey-53)) && (mouseY<=(ey+53)) && (mousePressed == true))
  {
     background(200); 
  }
  
  noFill();
  stroke(129,117,167);
  strokeWeight(3);
  
  rect(rx, ry, rd, rd);
  
  stroke(255,119,28);
  ellipse(ex, ey, ed, ed);
  
  
  if((mouseX>=(ex-53)) && (mouseX<=(ex+53)) && (mouseY>=(ey-53)) && (mouseY<=(ey+53)))
  {
//    xpos = xpos + .5;
//    xpos2 = xpos2 + .5;
//    xpos3 = xpos3 +1;
//    xpos4 =xpos2 +.8;
//    xpos = ex;
//    xpos2 = ey;
//    xpos3 = ex;
//    xpos4 = ey;
    strokeWeight(3);
    stroke(255,119,28,10);
    epos = epos + random(-7,-1);
    epos2 = epos2 + random(-.5,10);
    epos3 = epos3 +random(-3,9);
    epos4 = epos4 + random(-2, 2);
    epos5 = epos5 +random(-1,-7);
    epos6 = epos6 + random(-10, 10);
    ellipse(epos, epos2, ed, ed);
    ellipse(epos2, epos, ed, ed);
    ellipse(epos4, epos3, ed, ed);
    ellipse(epos3, epos4, ed, ed);
    ellipse(epos5, epos6, ed, ed);
    ellipse(epos6, epos5, ed, ed);
    ellipse(epos5, epos2, ed, ed);
    ellipse(epos3, epos6, ed, ed);
  }
   else
  {
    stroke(255);
    strokeWeight(3);
    epos = ex;
    epos2 = ey;
    epos3 = ex;
    epos4 = ey;
    ellipse(epos, epos2, ed, ed);
    ellipse(epos3, epos4, ed, ed);
//    xpos = xpos + .5;
//    xpos2 = xpos2 + .5;
//    xpos3 = xpos3 +random(-3,9);
//    xpos4 =xpos2 + random(-20, 2);
  }
//  stroke(255);
//  strokeWeight(3);
  
  
  if((mouseX>=rx) && (mouseX<=(rx+100)) && (mouseY>=ry) && (mouseY<=(ry+100)) )
  {
    stroke(129,117,167,10);
    strokeWeight(3);
    rpos = rpos + random(-7,-1);
    rpos2 = rpos2 + random(-5,5);
    rpos3 = rpos3 +random(-10,3);
    rpos4 = rpos4 + random(3, 7);
    rpos5 = rpos5 +random(-.02,21);
    rpos6 = rpos6 + random(.5, 3);
    rect(rpos, rpos2, rd, rd);
    rect(rpos2, rpos, rd, rd);
    rect(rpos4, rpos3, rd, rd);
    rect(rpos3, rpos4, rd, rd);
    rect(rpos5, rpos6, rd, rd);
    rect(rpos6, rpos5, rd, rd);
    
  }
   else
  {
    strokeWeight(3);
    stroke(255);
    rpos = rx;
    rpos2 = ry;
    rpos3 = rx;
    rpos4 = ry;
    rect(rpos, rpos2, rd, rd);
    rect(rpos3, rpos4, rd, rd);
  }
}

//void mouseReleased() {
//   if(value == 0) {
//      value=0;
//   } 
//   else {
//      value = 200; 
//   }
//}


