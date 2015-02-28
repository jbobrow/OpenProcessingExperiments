
//Scott Holmes
//Introduction to Digital Media Fall 2012- assignment 1b
//Section A
//9/11/12
float randomDiameter = 0; //Global Variable - float -- Probably on test
float strokeGrey = 0;     //Global Varaible - float
color rectangle = color(255, 102, 102);
color ell = color (255, 102, 51);
float strokeBlack = 255;
boolean rectEllipse = false;

void setup() {
  size(1200, 600);
  background(132, 112, 255);
}

void draw() {
  //noStroke();       //re-drawing background that is slighlty transparent
  //fill(255,10);
  //rect (0,0,width,height); 

  smooth();
  strokeWeight(6);
  stroke(strokeGrey);
  fill(rectangle);
  if (rectEllipse == false) {
    rect(mouseX, mouseY, randomDiameter, randomDiameter);
  }
  else { 
    stroke (strokeBlack);
    fill(ell);
    ellipse(mouseX, mouseY, randomDiameter, randomDiameter);
  }
  //ellipse(mouseX, mouseY, randomDiameter, randomDiameter);
  //randomDiameter = random(20,100);
  if (randomDiameter <100) {
    randomDiameter++;
  }
  else { 
    randomDiameter=0;
  }
}


void mouseClicked() {

  if (strokeGrey == 0) {
    strokeGrey = 0;
  }
  else {                       //allows you to set it back to black
    strokeGrey = 0;
  }
  rectEllipse = !rectEllipse;
}

void keyPressed() {
  if (key=='s') {
    save("scottHolmes1b3.png");
  }
}
