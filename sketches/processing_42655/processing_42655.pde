
void setup() {
  size (600, 600);
  background (#FFADF1);
  smooth();
}

float a=0;
void draw() {


  fill(#CBF5FF);
  stroke(#00CAFA);


  if ((mousePressed) && (a<255)) {
    a=(a +0.9)%width;
    fill(a, mouseX,255);
  
    ellipse(mouseX, mouseY, a, a);
  }

  else { 
    a=0;
  }
}


