
void setup () {
  size (600, 600);
  smooth();
}

void draw () {

  background(#57385c);

  if (mousePressed == true) {
    translate (-mouseX*4, -mouseY*4);
    scale (4);
  }

  noFill();
  stroke(#ffedbc);
  strokeWeight(0.5);
  rekurse(width/2, height*0.4, 300);
}

void rekurse(float x, float y, float d) {
  
  ellipse(x, y, d, d);

  if (d > 4) {
    
    rekurse (x+d/2, y, d/2);
    rekurse (x-d/2, y, d/2);
    rekurse (x, y+d/2, d/2);
  }
}

