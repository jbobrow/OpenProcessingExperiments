
boolean botonCirGrande = false;
boolean botonCirChico = false;
boolean rectOver = false;
boolean circleOver = false;
int rectX, rectY;      // Position of square button
int circleX, circleY;  // Position of circle button
int rectSize = 90;     // Diameter of rect
int circleSize = 93;   // Diameter of circle

pincelCirculo cirGrande;
pincelCirculo cirPequeno;

void setup() {
  size(640, 360);
  smooth();
  circleX = width/40+circleSize/2+10;
  circleY = height/6;
  rectX = width/5-rectSize-10;
  rectY = height/2-rectSize/2;
  ellipseMode(CENTER);
 
}

void draw() {
  update(mouseX, mouseY);
if (mousePressed) {    
   if (botonCirGrande){
    cirGrande = new pincelCirculo(mouseX, mouseY, 20);
    cirGrande.display();
  
   }
   
  if (botonCirChico){
    cirPequeno = new pincelCirculo(mouseX, mouseY, 5);
      cirPequeno.display();
   
  }
}
strokeWeight(4);
  rect(rectX, rectY, rectSize, rectSize)
//stroke(0);
  ellipse(circleX, circleY, circleSize, circleSize);  
}

void update(int x, int y) {
  if ( overCircle(circleX, circleY, circleSize) ) {
    circleOver = true;
    rectOver = false;
  } else if ( overRect(rectX, rectY, rectSize, rectSize) ) {
    rectOver = true;
    circleOver = false;
  } else {
    circleOver = rectOver = false;
  }
}

void mousePressed() {
  if (circleOver) {
   botonCirGrande = true;
   botonCirChico = false;
  }
  if (rectOver) {
   botonCirChico = true;
   botonCirGrande = false;
  }

}

boolean overRect(int x, int y, int width, int height)  {
  if (mouseX >= x && mouseX <= x+width &&
      mouseY >= y && mouseY <= y+height) {
    return true;
  } else {
    return false;
  }
}

boolean overCircle(int x, int y, int diameter) {
  float disX = x - mouseX;
  float disY = y - mouseY;
  if (sqrt(sq(disX) + sq(disY)) < diameter/2 ) {
    return true;
  } else {
    return false;
  }
}


class pincelCirculo {

  float x;
  float y;
  int diameter;

pincelCirculo(float tempX, float tempY, int tempDiameter) {
    x = tempX;
    y = tempY;
    diameter = tempDiameter;
  }

  void display() {
    if (mousePressed == true);
    strokeWeight (diameter);
    line(pmouseX, pmouseY, x, y);   
  }
}

