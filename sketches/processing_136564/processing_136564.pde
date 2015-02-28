
//PUNTO Y COMA


void setup() {
  size(600, 600);
  colorMode (HSB);
}

//inicio ; fin; variación  

void draw() {
  background(255);
  noCursor();
  for (int a = 0; a < 30; a++ ) {
    for (int b = 0; b < 60; b++ ) { 
      fill(mouseX*0.5, a*5, b*5);
      //ellipse(a*10, b*10, 10, 10);
      line(a*(mouseX*0.1), b*(mouseY*0.1), width/2, height/2);
    }
  }
}

