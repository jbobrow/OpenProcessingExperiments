
void setup() {
  size(500, 500);
  noSmooth();
  fill(0);
  background(134,250,255);
}

void draw() {
  if (mousePressed) {
    stroke(0);
       fill(221,211,255);
    
  } else {
    stroke(0);
 fill(255,216,242);
}  
rectMode (CENTER);
rect (mouseX,mouseY,50, 50);
}


