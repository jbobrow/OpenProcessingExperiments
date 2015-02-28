
// Koch Curve Variation up to 4 iterations
//References: 1. Sierpinski Triangle using L-Systems by Rick Companje 
//            2. http://algorithmicbotany.org/papers/WebApps/LSystems/LSys.html


int gen = 0;

void setup() {
  size(500, 500);
  frameRate(1);
  stroke(250, 255, 0, 90);
  strokeWeight(2 );
  background(0);
  smooth();
}

void draw() {
  float angle = radians(random(45, 90));
  float len = width;
  String axiom = "X ";
  fill(0, 60);
  rect(0, 0, width, height);
  translate(width, height-400);

  for (int i=0; i < gen; i++) {
    axiom = axiom.replaceAll("X", "XFYFX+F+YFXFY-F-XFYFX");
     
    len/=1.7;
  }

  for (int i=0; i < axiom.length(); i++) {
    switch (axiom.charAt(i)) {
    case 'X': 
      line(0, 0, 0, len); 
      translate(0, len);  
      break;
    case'-':
      //case'+':
    case 'Y': 
      line(0, 0, 0, 2/len);
      rotate(-angle); 
      break;
      //case'-':
    case'+':
    }
  }

  if (gen++ > 5) gen=0;
}

void keyPressed () {
  saveFrame ("koch-####.jpg");
}


