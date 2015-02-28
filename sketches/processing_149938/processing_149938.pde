
//Degree Show 2014//
//Echo Triangles//
//by Mark Jones//

//STAGES - setup,draw, drawtriangle, drawbackground, drawEchotri



//RGB versions need array format change
//green(149,193,31) 96c11f
//GreenGrey (117,151,56) 759738
//grey (203,187,159) cbbb9f
//Pink (230,0,126) e6007e
//Maroon (149,43,44) 952b2c
//Brown (94,33,29) 5e211d
//PinkDark (192,22,94) c0165e

float gridSize = 70;
color[] colours = {#759538,#96c11f,#cbbb9f,#e6007e,#5e211d
,#952b2c,#c0165e};
float a, b, c;
 
void setup() {
  frameRate(40);
  size(800,480);
  background(255,255,255);
  c = gridSize;
  b = gridSize/2;
  a = 80;
 
}
 
void draw() {
  drawEchotri(a,b,c);
  drawBackground(a,b,c);
}
 
void drawTriangle(float a, float b, float c) {
  //Draw 4 triangles
  float m, t;
  //m = margin
  //t = tri size
  m = mouseY;
  t = mouseX;
  beginShape(TRIANGLES);
  //tri1
  vertex(0, 0);
  vertex(0, t);
  vertex(mouseY, mouseX);
  //tri2
  //vertex(m, m+t);
  //vertex(m+t, m+t);
  //vertex(m+t, m);
  //tri3
  //vertex(m*2+t, m+t);
  //vertex(m*2+t*2, m+t);
  //vertex(m*2+t, m);
  //tri4
  //vertex(m*3+t,0);
  //vertex(m*3+t*2, t);
  //vertex(m*3+t*2, 0);
  endShape();
}
 
void drawBackground(float a, float b, float c) {
  
  int i = 1;
  int j = 1;
  int k = 1;
 
  noStroke();
  
  fill(colours [int(random(0,7))]);
 //fill(230,0,126,5);
 //set to pink
 
 //This code sets the grid up need to fix this//
  for (k=1; k<=((height/(2*a))+1); k++) { 
    for (j=1; j<=2; j++) {
      for (i=1; i<=((width/(3*c))+3); i++) {
        drawTriangle(a,b,c);
        //translate(c*3,0);
        //Removed above and added below line
        translate(2*a+2,0);
      }
      translate(-(i*c*3),0);
      translate(c+b,a);
    }
    translate(3*c,0);
  }
}
 
void drawEchotri(float a, float b, float c) {
   
  boolean drawTriangle = false;
  boolean odd = false;
   
  float startX = 0;
  float startY = 0;
  float transX = 0;
  float transY = 0;
 
  for (float i=c; i<=(width+a); i=i+(c*3)) {
    if(mouseX > (i) && mouseX < (i+c)) {
      startX = mouseX%(2*a);
      startY = mouseY%(2*a);
      transX = mouseX-startX;
      transY = mouseY-startY;
      odd = true;
      drawTriangle = true;
    }
  }
   
  if (drawTriangle==false) {
    for (float i=-(c/2); i<=(width+c); i=i+(c*3)) {
      if(mouseX > (i) && mouseX < (i+c)) {
        startX = (mouseX+c)%(c*3);
        startY = (mouseY+a)%(a*2);
        transX = mouseX-startX;
        transY = mouseY-startY;
        odd = false;
        drawTriangle = true;
      }
    }
  }
 
  if (drawTriangle==true) {
     
    noStroke();
    //fill value for drawn over triangle//
    fill(149,193,31);
     
    if (odd==true) {
      translate(c*1.5,a);
    } else {
      translate(c,a);
    }
 
    translate(transX,transY);
    drawTriangle(a,b,c);
    translate(-transX,-transY);
     
    if (odd==true) {
      translate(-(c*1.5),-a);
    } else {
      translate(-c,-a);
    }
    drawTriangle = false;   
  } 
}

