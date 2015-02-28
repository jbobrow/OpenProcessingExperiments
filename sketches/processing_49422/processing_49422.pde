
float w = 10;

void setup () {
  
  size (400, 400);
  smooth (); 
  rectMode (CENTER); 
  ellipseMode (CENTER);
  background (110, 150, 200);
  
}

void draw () {
  
  noStroke ();
  fill (random(20), random(30, 100), random(200));
  ellipse (mouseX, mouseY, w, w);
  w = random(10);
   
}

void mousePressed () {
  
 fill (110, 150, 200);
 ellipse (mouseX, mouseY, 50, 50); 
  
  
}
