
//Kayla Stamey
//Introduction to Digital Media Fall 2012- Assignment 01b
//Section A
//9.11.12.


float randomDiameter =0; //global vairable - float
float strokeGray=0;  //global variable - float


void setup() {
  size (1200, 600);
  background (163, 255, 111);
}

void draw() {

  // background(255,10);
  smooth();
  stroke(strokeGray);
  strokeWeight(5);
  triangle(mouseX, mouseY, randomDiameter, randomDiameter, randomDiameter, randomDiameter);
  fill(100, 255, 101);
  {
    triangle(mouseX, mouseY, randomDiameter, randomDiameter, randomDiameter, randomDiameter);
    fill(100, 255, 233);
    strokeWeight(9);
  }
  triangle(randomDiameter, randomDiameter, randomDiameter, randomDiameter, mouseX, mouseY);
  fill(113, 100, 255);
  {
    triangle(randomDiameter, randomDiameter, mouseX, mouseY, 1200, 600);
    noFill();
    strokeWeight(3);
  }
  {
    stroke(121, 33, 234);
    fill(30, 133, 230);
  }
  {
    triangle(randomDiameter, randomDiameter, randomDiameter, randomDiameter, 0, 0);
    fill(0, 20, 30);
  }

  quad(mouseX, mouseY, 20, 29, 30, 100, 50, 50);


  ellipse(mouseX, mouseY, 0, 0);
  ellipse(mouseX, randomDiameter, randomDiameter, mouseY);

  rect (mouseX, mouseY, 30, 20);
  fill(255, 0, 0);
  rect (10, mouseY, mouseX, 20);
  fill(255, 240, 75);
  rect (mouseX, 20, mouseY, 10);
  fill (130, 170, 230);
  rect (0, mouseX, mouseY, 0);

  rect (mouseX, 0, 0, mouseY);
  fill (235, 220, 134);
  ellipse(1, 1, mouseX, mouseY);
  noFill();
  fill(0, 255, 0); //inside the circle

  //randomDiameter = random(100,200);

  if (randomDiameter <10) {
    randomDiameter++;
  }
  else {
    randomDiameter=500;
  }

  if (mouseX<1) {
    mouseX++;
  }

  else {
    mouseX=10;
  } 


  if (mouseY >10) {
    mouseY++;
  }

  else {
    mouseY=200;
  }

  for (int i = 0; i < 200; i = i+200) {
    line(600, i++, 300, i);
  }
}

void mouseClicked() {

  if (strokeGray == 0) { //conditional if stroke is black change it to white
    strokeGray=205;
  }
  else {
    strokeGray=0;        //or else, set stroke from white to
  }

  for (int i = 0; i < 1200; i = i+5) {
    line(0, i, 600, i);
  }




  beginShape(TRIANGLE_STRIP);
  vertex(300, 75);
  noFill();
  vertex(40, 600);
  fill(120, 103, 0);
  vertex(400, 75);
  fill(19, 193, 255);
  vertex(600, 340);
  vertex(70, 1175);
  vertex(1080, 20);
  vertex(190, 975);
  endShape();

  beginShape(TRIANGLE_FAN);
  vertex(1000, 550);
  fill(230, 0, 0);
  vertex(57.5, 15); 
  fill(123, 246, 30);
  vertex(689, 350); 
  fill(0, 0, 230);
  vertex(738, 23285); 
  fill(58, 0, 192);
  vertex(1500, 250); 
  fill(49, 200, 255);
  vertex(557.5, 215); 
  fill(239, 200, 0);
  endShape();

{
  beginShape();
  vertex(30, 20);
  bezierVertex(100, 0, 60, 875, 630, 875);
  bezierVertex(750, 80, 60, 725, 30, 20);
  endShape();
  fill(223,0,0);
}
}

void keyPressed() {
  if (key == 's') {
    save("KaylaStamey.pde");
  }
}
