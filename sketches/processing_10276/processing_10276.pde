
/* Koch Curve, 2007-01-18 by Rick Companje */

int gen = 0;

void setup() {
  size(450,150);
  frameRate(5);
  stroke(255);
}

void draw() {
  float angle = PI/3;
  float len = width;
  String axiom = "F";

  background(0);
  translate(0,height-10);
  rotate(1.5*PI);
  
  for (int i=0; i<gen; i++) {
    axiom = axiom.replaceAll("F","F-F++F-F");
    len/=3;
  }

  for (int i=0; i<axiom.length(); i++) {
    switch (axiom.charAt(i)) {
      case 'F': line(0,0,0,len); translate(0,len); break;
      case '+': rotate(angle); break;
      case '-': rotate(-angle); break;
    }
  }
  
  if (++gen>5) gen=0;
}


