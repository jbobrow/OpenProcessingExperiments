
float a;
float b;
float c;
float cc;
float Mirror;
   
 
 
 
 void setup() {
  size(750,750);
  smooth();
  background(0);
  a = 0.0;
 
  c = 5;
  b = c; 
  cc = c; 
  Mirror = 0;}
 
 
 
 void draw() {
  

   
  if (Mirror == 0) {
  a = (a + c);
  c = (c * 1.001);
  if (a >= height) {b = b + c; a = 0;};
  if (b >= width) {b = 0; a = 0;};
  stroke(0,0,0); // can be turned off for demostration purposes 
  fill(255,255,255,255 - c*7 / 1.22);
  ellipse(b,a, c,c );
  if (c >= width) {Mirror = 1;}; };
  
  
  if (Mirror == 1) {
    a = (a - c);
    c = (c * 0.999);
    if (a <= -height) { b = b - c; a = height;};
    if (b <= -width)  { b = width; a = height;};
    stroke(255,255,255);
    fill(0,0,0,700 - c*7);
    ellipse(b,a,c,c);
    if (c <= cc) {Mirror = 0;
    fill (0,0,0,1);
    rect(0,0,width,height);};
    
    
    
  }
  
  if (Mirror == 0 || c > width/2) {
  fill(0,0,0,0.1);
  rect(0,0,width,height);
  }  
  
  if (Mirror == 1 && c <= width/2) {
    fill (255,255,255,0.1);
    rect(0,0,width,height);
  }
  }




