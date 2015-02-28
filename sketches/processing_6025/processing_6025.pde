
float r; 
 
 
void setup () { 
  size (750,50); 
  translate( width/3, height); 
  smooth(); 
  noStroke(); 
} 
 
void draw () { 
 
  fill (random (0,255)); 
  r= map (mouseX,0,width,10,320); 
 
  rectMode (CENTER); 
 
  if (mousePressed) { 
    rect (width/2,height, width,r); 
  } 
  else { 
    rect (150,150, r,height); 
    rect (450,150, width/2,height); 
  } 
 
 
} 
 
 

