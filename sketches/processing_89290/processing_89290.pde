
int mode = 0 ;
 
 
int x=0;
int y=0;
 
void setup () {
  size (800, 700);
  background (0);
  smooth();
  frameRate (50);
}

float i = 0;
float j = 255;
float k = -510;
float l = 1020;
float m = -1275;
float n = 1785;
float o = -2040;
float p = 2550;
float q = -2805;
float r = 3315;
 
 
void draw () {
 
  
  noStroke ();
  if (mode == 1) {
    if ( mousePressed) {
      
 
 
      x = mouseX;
      y = mouseY;
 
      fill(10,255,77) ;
      ellipse (x, y, 50, 50);
    }
  }
 
  
 
  if (mode==2) {
    if ( mousePressed) {
      
      x = mouseX;
      y = mouseY;
 
      fill(0,random(10,151),255);
      ellipse (x,y,70,70);
    }
  }
 
  
 
  if (mode==3) {
 
    if (mousePressed) {
 
  i = i + .1;
  j = j - 1;
  k = k + 1;
  l = l - 1;
  m = m + 1;
  n = n - 1;
  o = o + 1;
  p = p - 1;
  q = q + 1;
  r = r - 1;
  
  translate(mouseX, mouseY);
  noStroke();
  rotate(i);
  if(j>-255) {
  fill(j, 0, 0);
  } else if(j>-510){
  fill(0, k, 0);
  } else if(j>-300){
  fill(0, l, 0);
  } else if(j>-1275){
  fill(0, 0, m);
  } else if(j>-1530){
  fill(0, 0, n);
  } else if(j>-2040){
  fill(o, 0, o);
  } else if(j>-2295){
  fill(p, 0, p);
  } else if(j>-2805){
  fill (q, q, 0);
  } else {
  fill(r, r, 0);
  }
   
  beginShape();
  vertex(-50, -50);
  vertex(0, -100);
  vertex(50, -50);
  vertex(50, 50);
  vertex(0, 100);
  vertex(-50, 50);
  endShape(CLOSE);
   
  beginShape();
  vertex(-25, -25);
  vertex(0, -50);
  vertex(25, -25);
  vertex(25, 25);
  vertex(0, 50);
  vertex(-25, 25);
  endShape(CLOSE);
     
  rotate(TWO_PI-i);

    }
  }
  
   if (mode==4) {
 
    if (mousePressed) { 
  
      x = mouseX;
      y = mouseY;
 
      fill(0) ;
      ellipse (x, y, 100, 100);
      }
   }
}
 

 
void keyPressed () {
  if (key=='1') {
    mode = 1;
  }
  if (key=='2') {
    mode = 2;
  }
  if (key=='3') {
    mode = 3;  
  }
    if (key=='4') {
    mode = 4;
    
  }
}

