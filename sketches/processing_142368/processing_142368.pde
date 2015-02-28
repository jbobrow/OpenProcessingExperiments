
/*
Konkuk University
 SOSi iDesign
 
 Name: CHOI JIhye 
 ID: 201420116
 
 */

int value = 0;

void setup() {
  setupAudio();
  size (600, 600);
  // noLoop();
  smooth();
  colorMode (RGB, 600);
}

void draw() {
  println(mouseX + " : " + mouseY);

  //face
  fill(#FCF505);
  ellipse (300, 280, 550, 580);




  // nose
  getVolume(); 
  float Y = map(volume, 0, 200, 2, 100); 
  float X = map(volume, 0, 200, 2, 200);
  fill(0);
  stroke(0);
  translate(width/15, height/15);
  ellipse(280, 278, X, Y);
  ellipse (320, 278, X, Y);

  //eyes
  float a = random(-5, 5);
  a=random(-5, 5);

  fill (255);
  stroke(0);
  strokeWeight(8);
  line (116+a, 106+a, 134, 147);
  line (208+a, 106+a, 193, 146);
  line (384+a, 106+a, 392, 145);
  line (461+a, 105+a, 452, 148);


  fill(#FAFAFA);
  ellipse (width*0.285, height*0.3, 150, 70);
  ellipse (width*0.7, height*0.3, 150, 70);

  float eyeLeftX = constrain (mouseX, 113, 226);
  float eyeLeftY = constrain (mouseY, 170, 207);
  float eyeRightX = map (mouseX, 0, width, 102, 182);
  float eyeRigteY = map (mouseY, 0, width, 151, 207);
  fill(0);
  ellipse (eyeLeftX, eyeLeftY, 30, 30);
  ellipse (eyeRightX+280, eyeLeftY, 30, 30);


  // mouth
  fill (#F01D39);
  bezier(width*0.25, height*0.7, 245, 480, 360, 480, width*0.75, height*0.7);
  line (149, 417, 448, 417);
  beginShape ();
  vertex (width*0.25, 418);
  vertex (255, 361);
  vertex (297, 396);
  vertex (348, 361);
  vertex ( width*0.75, 418);
  endShape();



  if (mousePressed) {

    float f = random(500);
    float b = random(150);
    float c = random(380);


    //eruption
    fill (constrain(mouseX, mouseY, f));
    beginShape();
    vertex(278, 284);
    vertex(222, 292);
    vertex(243, 297);
    vertex(207, 310);
    vertex(225, 314);
    vertex(207, 331);
    vertex(237, 324);
    vertex(245, 334);
    vertex(252, 312);
    vertex(272, 319);
    vertex(278, 284);
    endShape();

    //eyes


    // tears
    fill (random(100), f, b, c);
    quad (133, 211, 93, 469, 150, 519, 184, 219);
    quad (423, 218, 448, 523, 508, 461, 463, 210);



    fill(mouseX, mouseY, 500, 70);
    stroke(0);
    strokeWeight(2);
    ellipse(pmouseX, pmouseY, 50, 50);
  }
}

void keyPressed() {
  setup();
}

