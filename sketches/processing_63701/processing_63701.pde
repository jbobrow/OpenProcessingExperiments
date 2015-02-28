
//Ferenc Tobak 0171317
//Interface 2 - 3A

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
  
  
void draw()
{
 
  //mouse bkgd
  if(mousePressed==true)
  {
    background(0);
  }
  else
  {
    background(102);
  }
  
 //variables 

 float radd= dist(mouseX, mouseY, ex, ey); 
 
 int ew=(255);
 int eb=(0);
 int rw=(255);
 int rb=(0);

 
    //ellipse mod
  if (radd<(ed/2) && (radd>0) && (mousePressed == true))
  {
    fill(eb);
    int (rw=0);
  }
  if (radd<(ed/2) && (radd>0) && (mousePressed == false))
  {
    fill(255,0,0);
  }
  else{
    fill(ew);
    }
  
   ellipse(ex, ey, ed, ed);
  
  //rect mod
  
   if ((mouseX>rx) && (mouseX<rx+rd) && (mouseY>ry) && (mouseY<ry+rd) && (mousePressed==true))
  {
    fill(255,0,0);
    }
    if ((mouseX>rx) && (mouseX<rx+rd) && (mouseY>ry) && (mouseY<ry+rd)  && (mousePressed==false))
  {
    fill(rb);
    }
  else
  {
    fill(rw);
}
rect(rx, ry, rd, rd);

}



