

//Interactive Design2
//Summer 2012, wk4
//Eonju Shin, #0227584



float rx, ry;    // rectangle x- and y-coordinate
float rd = 100;  // rectangle width
  
float ex, ey;    // ellipse x- and y-coordinate
float ed = 106;  // ellipse diameter
  
void setup() {
  size(640, 360);
  smooth();
   
  // Set the x- and y-coordinates for the rectangle
  rx = width * 0.33 - rd/2;
  ry = height * 0.5 - rd/2;
   
  // Set the x- and y-coordinates for the ellipse
  ex = width * 0.66;
  ey = height * 0.5;
}
  
void draw() {
  background(102);
  rect(rx, ry, rd, rd);
  ellipse(ex, ey, ed, ed);
  

  float rec= dist(mouseX, mouseY,rx,ry);
  float ell= dist(mouseX, mouseY,ex,ey);
  

//ellipse
  
    if (ell<(ed/2) && (ell>0) && (mousePressed == true))
  {
        fill(#fffc00);   
  
  }
  
 
  if (ell<(ed/2) && (ell>0) && (mousePressed == false))
  {
  fill(#004eff);

  }
  else{
       fill(#fffc00);
              noStroke();
    }
   
   ellipse(ex, ey, ed, ed);

//rect

 if ((mouseX>rx) && (mouseX<rx+rd) && (mouseY>ry) && (mouseY<ry+rd) && (mousePressed==true))
  {
    fill(#fffc00);

    }
    if ((mouseX>rx) && (mouseX<rx+rd) && (mouseY>ry) && (mouseY<ry+rd)  && (mousePressed==false))
  {
       fill(#fffc00);
       noStroke();
    }
  else
  {
    fill(#004eff);
}
rect(rx, ry, rd, rd);
 
}

