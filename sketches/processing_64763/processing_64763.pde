
// Koch Curve Variation up to 4 iterations
//References: 1. Sierpinski Triangle using L-Systems by Rick Companje 
//            2. http://algorithmicbotany.org/papers/WebApps/LSystems/LSys.html


int gen = 0;

void setup() {
  size(400, 400);
  frameRate(1);
  stroke(0);
  strokeWeight(0.5);
  background(255);
  smooth();
}

void draw() {
  float angle = radians(90);
  float len = width;
  String axiom = "F+F+F+F";

  background(255);
  translate(width, height-400);

  for (int i=0; i < gen; i++) {
    axiom = axiom.replaceAll("F", "FF+F+F+F+FF");
    len/=3;
  }

  for (int i=0; i < axiom.length(); i++) {
    switch (axiom.charAt(i)) {
    case 'F': 
      line(0, 0, 0, len); 
      translate(0, len); 
      break;
    case '+': 
      rotate(angle); 
      break;
    }
  }

  if (gen++ > 4) gen=0;
}

void keyPressed () {
  saveFrame ("koch-####.jpg");
}


