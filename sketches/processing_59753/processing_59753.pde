
void setup () {
  size (900,700);
  background (225);
  smooth();
}

int durchmesser = 3;
int rot = 0;
int gruen = 0;
int blau = 0;
int weite = 50;

void draw () {
  
if (mousePressed) {
  strokeWeight(durchmesser);
  line (pmouseX, pmouseY, mouseX, mouseY);
}

stroke (rot,gruen,blau);

if (keyPressed) {
  if (key == '+') {
    durchmesser = durchmesser + 1;    // Durchmesser wird mit der +Taste um 1 größer
  }
  if (key == '-') {
    durchmesser = durchmesser - 1;    // Durchmesser wird mit der -Taste um 1 kleiner
  } 
  if (durchmesser < 1) {    // Durchmesser wird nie kleiner als 1
    durchmesser = 1;
  }
  
  if (key == 'r') {
    rot = rot + 2;    // Rotwert wird mit der r-Taste um 2 größer
  }
  if (key == 'e') {
    rot = rot - 2;    // Rotwert wird mit der e-Taste um 2 kleiner
  } 
  if (rot < 0) {    // Rotwert wird nie kleiner als 1
    rot = 0;
  }
  
  if (key == 'g') {
    gruen = gruen + 2;    // Grünwert wird mit der g-Taste um 2 größer
  }
  if (key == 'f') {
    gruen = gruen - 2;    // Grünwert wird mit der f-Taste um 2 kleiner
  } 
  if (gruen < 0) {    // Grünwert wird nie kleiner als 1
    gruen = 0;
  }
  
  if (key == 'b') {
    blau = blau + 2;    // Blauwert wird mit der b-Taste um 2 größer
  }
  if (key == 'v') {
    blau = blau - 2;    // Grünwert wird mit der v-Taste um 2 kleiner
  }
  if (blau < 0) {    // Blauwert wird nie kleiner als 1
    blau = 0;
  }
  
  if(key == ' ') {  
    background(225);
  }
  
if (key == '1') {
noStroke();
fill (rot,gruen,blau);
ellipse(mouseX, mouseY, 3*durchmesser, 3*durchmesser);
ellipse(mouseX - 1.5*durchmesser, mouseY - 2*durchmesser, durchmesser, durchmesser);
ellipse(mouseX + 1.5*durchmesser, mouseY - 2*durchmesser, durchmesser, durchmesser);
ellipse(mouseX, mouseY - 2.5*durchmesser, durchmesser, durchmesser);
  }
  
  
if (key == '2') {
  line (mouseX,mouseY, mouseX+random(-weite,weite), mouseY+random(-weite,weite));
}

if (key == '3') {
  ellipse (mouseX+random(-weite,weite), mouseY+random(-weite,weite),10, 10);
  fill (blau,gruen,rot);
}

if (key == '4') {
  line (mouseX,mouseY, mouseX+random(-weite,weite), mouseY+random(-weite,weite));
  ellipse (mouseX+random(-weite,weite), mouseY+random(-weite,weite),10, 10);
  fill (gruen,rot,blau);
}

  if (key == '.') {
    weite = weite+5;
}

  if (key == ',') {
    weite = weite-5;
}
  if (weite < 10) { 
    weite = 10;
  }
}

}



