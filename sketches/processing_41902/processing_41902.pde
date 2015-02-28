
int s;
int m;
int h;
PImage d; 
PImage p;


void setup() {
  size(750, 600);
  background(255);
  smooth();
  p = loadImage ("sky9.jpg"); 
  d = p; 
}

void draw() {
  //declaring time

  
  s = second();
  m = minute();
  h = hour();
  
      if (s <= 1) { 
    d = p; 

    }
  
  image (d, 0, 0); 
  stroke (255); 
  fill(237,2,2); 
  ellipse(s*12+25, 100, 10, 10);
  ellipse (m*12+25, 200, 10, 10); 
  ellipse (h*30+25, 300, 10, 10);
  


  //if (h <12) { 
    //image (
  //}
  //else { 
    //image (
  //}
  text (s, 380, 600); 
  text (m, 350, 600); 
  text (h, 320, 600); 
  
  
}


