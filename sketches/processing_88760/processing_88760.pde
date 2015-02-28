
float rx, ry;    // rectangle x- and y-coordinate
float rd = 100;  // rectangle width
   
float ex, ey;    // ellipse x- and y-coordinate
float ed = 110;  // ellipse diameter
   
void setup() {
  size(600, 300);
  smooth();
    
  // Set the x- and y-coordinates for the rectangle
  rx = width * 0.33 - rd/2;
  ry = height * 0.5 - rd/2;
    
  // Set the x- and y-coordinates for the ellipse
  ex = width * 0.66;
  ey = height * 0.5;
}
   
void draw() {
  background(0);
  rect(rx, ry, rd, rd);
  ellipse(ex, ey, ed, ed);
   
 
  float rec= dist(mouseX, mouseY,rx,ry);
  float ell= dist(mouseX, mouseY,ex,ey);
   
 
//ellipse
   
    if (ell<(ed/2) && (ell>0) && (mousePressed == true))
  {
        fill(0,25,255);  
   
  }
   
  
  if (ell<(ed/2) && (ell>0) && (mousePressed == false))
  {
  fill(0,25,255);
 
  }
  else{
       fill(255,5,15);
              noStroke();
    }
    
   ellipse(ex, ey, ed, ed);
 
//rect
 
 if ((mouseX>rx) && (mouseX<rx+rd) && (mouseY>ry) && (mouseY<ry+rd) && (mousePressed==true))
  {
    fill(0,25,255);
 
    }
    if ((mouseX>rx) && (mouseX<rx+rd) && (mouseY>ry) && (mouseY<ry+rd)  && (mousePressed==false))
  {
       fill(0,25,255);
       noStroke();
    }
  else
  {
    fill(190,255,0);
}
rect(rx, ry, rd, rd);
  
}
float rx, ry;    // rectangle x- and y-coordinate
float rd = 100;  // rectangle width
   
float ex, ey;    // ellipse x- and y-coordinate
float ed = 110;  // ellipse diameter
   
void setup() {
  size(600, 300);
  smooth();
    
  // Set the x- and y-coordinates for the rectangle
  rx = width * 0.33 - rd/2;
  ry = height * 0.5 - rd/2;
    
  // Set the x- and y-coordinates for the ellipse
  ex = width * 0.66;
  ey = height * 0.5;
}
   
void draw() {
  background(0);
  rect(rx, ry, rd, rd);
  ellipse(ex, ey, ed, ed);
   
 
  float rec= dist(mouseX, mouseY,rx,ry);
  float ell= dist(mouseX, mouseY,ex,ey);
   
 
//ellipse
   
    if (ell<(ed/2) && (ell>0) && (mousePressed == true))
  {
        fill(0,25,255);  
   
  }
   
  
  if (ell<(ed/2) && (ell>0) && (mousePressed == false))
  {
  fill(0,25,255);
 
  }
  else{
       fill(255,5,15);
              noStroke();
    }
    
   ellipse(ex, ey, ed, ed);
 
//rect
 
 if ((mouseX>rx) && (mouseX<rx+rd) && (mouseY>ry) && (mouseY<ry+rd) && (mousePressed==true))
  {
    fill(0,25,255);
 
    }
    if ((mouseX>rx) && (mouseX<rx+rd) && (mouseY>ry) && (mouseY<ry+rd)  && (mousePressed==false))
  {
       fill(0,25,255);
       noStroke();
    }
  else
  {
    fill(190,255,0);
}
rect(rx, ry, rd, rd);
  
}
