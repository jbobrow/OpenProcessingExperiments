

//Urbanears Medis at work.
//An interface by Juan Pablo Patino
//Major Studio 1: Interface

PFont myFont;

float theta = 0;

void setup() {

  size(600, 600);
  smooth();
}

void draw() {  

  background(255);
  translate(width/2, height/2);

  fill(0,200);
  myFont=createFont("Helvetica", 14, true);
  textFont(myFont);
  text("MEDIS by URBANEARS", -275, -275);
  text("Move mouse right to activate", -275, -260);

  rotate(theta); 

  pushMatrix();
  softP();
  hardP(); 
  metal();
  cord();
  plug();
  mic();
  popMatrix();
  
  // Picked up this gem if else sequence from the Processing book, page 210. Adjusted for my canvas size
  if (mouseX < width/3) {
    theta = 0; // Left
  } 
  else if ((mouseX >= width/3) && (mouseX <= 2*width/3)) {
    theta = map(mouseX, width/3, 2*width/3, 0, PI); // Middle
  } 
  else {
    theta += 1; // Right
  }
  
}
// --------------------------------------------------- METAL PIECE

void metal() {
  
  noStroke();
  fill(0,200);
  ellipse(16, -48, 240, 240);
  stroke(255);
  strokeWeight(5);
  ellipse(16,-48, 200, 200);
}

// --------------------------------------------------- SOFT PLASTIC

void softP() {
  noStroke();
  fill(0, 200);
  beginShape();
  vertex(0, -224);
  bezierVertex(23, -222, 67, -145, 42, -138);
  bezierVertex(21, -132, -50, -121, -69, -117);
  bezierVertex(-88, -111, -99, -118, -97, -147);
  bezierVertex(-96, -176, -21, -226, 0, -224);
  endShape(CLOSE);
}

// --------------------------------------------------- HARD PLASTIC

void hardP() {
  fill(0, 200);
  beginShape();
  vertex(2, -47);
  bezierVertex(60, -152, 147, -24, 170, 29);
  bezierVertex(202, 106, 132, 149, 63, 157);
  bezierVertex(38, 159, -129, 170, -104, 110);
  bezierVertex(-81, 54, -55, 57, 2, -47);
  endShape(CLOSE);
}

// --------------------------------------------------- CORD

void cord() {
  stroke(0, 200);
  strokeWeight(10);
  noFill();
  beginShape();
    vertex(176,176);
    bezierVertex(222,131,250,68,250,0);
    bezierVertex(250,-138,138,-250,0,-250);
    bezierVertex(-138,-250,-250,-138,-250,0);
    bezierVertex(-250,251,0,300,0,160);
    bezierVertex(0,5,0,0,0,0);
  endShape();
  
}

// --------------------------------------------------- PLUG

void plug() {
  fill(255);
  stroke(25);
  strokeWeight(1);
  rect(100,177,60,10);
  rect(130,177,40,20);
  beginShape();
    vertex(50,170);
    bezierVertex(40,170,40,184,50,184);
    vertex(71,184);
    vertex(71,170);
    vertex(50,170);
  endShape(CLOSE);
  fill(25);
  noStroke();
  rect(175,177,90,35);
}

// --------------------------------------------------- CONTROL MIC

void mic() {
  fill(25);
  noStroke();
  rectMode(CENTER);
  translate(-238, 0);
  rotate(-PI/2);
  rect(0, 0, 175, 36);
  fill(50);
  ellipse(0, 0, 25, 25);
}

