
/* Sierpinski Triangle using L-Systems, 2007-01-18 by Rick Companje */

int gen = 0;

void setup() {
  size(200,200);
  frameRate(4);
  stroke(255);
}

void draw() {
  float angle = radians(120);
  float len = width;
  String axiom = "F+F+F";

  background(0);
  translate(width,height-10);
  rotate(HALF_PI);
  
  for (int i=0; i < gen; i++) {
    axiom = axiom.replaceAll("F","F+F-F-F+F");
    len/=2;
  }

  for (int i=0; i < axiom.length(); i++) {
    switch (axiom.charAt(i)) {
      case 'F': line(0,0,0,len); translate(0,len); break;
      case '+': rotate(angle); break;
      case '-': rotate(-angle); break;
    }
  }
  
  if (gen++ > 5) gen=0;

}


