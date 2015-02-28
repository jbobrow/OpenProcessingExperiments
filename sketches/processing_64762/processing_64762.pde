
// Snake Kolam up to 4 iterations
//References: 1. Sierpinski Triangle using L-Systems by Rick Companje 
//            2. http://algorithmicbotany.org/papers/WebApps/LSystems/LSys.html


int gen = 0;

void setup() {
  size(400, 400);
  stroke(255);
  strokeWeight(4);
  background(0);
  smooth();
  frameRate(1);
}

void draw() {
  fill(0, 40);
  rect(0, 0, width, height);
  float angle = radians(90);
  float len = width;
  String axiom = "F+XF+F+XF";
  translate(width, height-400);

  for (int i=0; i < gen; i++) {
    axiom = axiom.replaceAll("X", "XF-F-F+XF+F+XF-F-F+X");
    len/=1.9;
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

void keyPressed() {
saveFrame("snake-####.jpg");
}


