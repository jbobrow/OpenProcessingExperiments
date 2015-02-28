
void setup() {
  size(400, 600);
  background (100);
}

PFont fontA;
void draw() {
  smooth();


  fontA = loadFont("Vrinda-15.vlw");

  //clock top and bottom
  noStroke();
  fill(250, 250, 240);
  arc(200, 200, 300, 300, PI, 2*PI);
  arc(200, 450, 200, 200, 0, PI);

  //clock body
  noStroke();
  beginShape();
  vertex(300, 450);
  vertex(350, 200);
  vertex(50, 200);
  vertex(100, 450);
  endShape(CLOSE);

  //clock face
  stroke(50);
  strokeWeight(1);
  fill(240);
  ellipse( 200, 200, 250, 250);

  stroke(150);

  //dial  small tick marks
  int minirot=0;
  translate(200, 475);
  while (minirot <60) {
    rotate(radians(6));
    line(0, -35, 0, 35);
    minirot= minirot +1;
  }


  translate(-200, -475);

  //minute tick marks
  int rotation=0;
  translate(200, 200);
  while (rotation <60) {
    rotate(radians(6));
    line(0, -120, 0, 120);

    rotation=rotation+1;
  }

  //minute tick cover
  translate(-200, -200);
  noStroke();
  fill(240);
  ellipse( 200, 200, 230, 230);

  //hour tickmarks
  stroke(150);
  int rotation2=0;
  translate(200, 200);
  while (rotation2 <12) {
    rotate(radians(30));
    line(0, -120, 0, 120);

    rotation2=rotation2+1;
  }
  translate(-200, -200);

  //hour tick cover
  noStroke();
  ellipse( 200, 200, 220, 220);

  //dial tick cover
  fill(250);
  ellipse(200, 475, 65, 65);

  //center cover
  fill(125);
  ellipse(200, 200, 20, 20);

  //dial
  fill(235);
  noStroke();
  beginShape();
  curveVertex(-200, 75);
  curveVertex(200, 450);
  curveVertex(200, 450);
  curveVertex(600, 75);
  endShape();

  fill(240);
  beginShape();
  curveVertex(140, 100);
  curveVertex(200, 450);
  curveVertex(200, 450);
  curveVertex(260, 100);
  endShape();

  //clock face logo
    textFont(fontA, 8);

  fill(100);
  text("J U N G H A N S", 164, 160);

  //clock face numbers
  textFont(fontA, 18);
text("12", 193, 110);
text("1", 245, 120);
text("2", 280, 160);
text("3", 295, 207);
text("4", 280, 255);
text("5", 245, 290);
text("6", 193, 305);
text("7", 145, 290);
text("8", 110, 255);
text("9", 97, 207);
text("10", 110, 160);

text("11", 145, 120);

  //clock hands
  translate(200, 200);
  stroke(125);
  strokeWeight(10);
  rotate(radians(30)*hour());
  line(0, 0, 0, -75);
  rotate(radians(-30)*hour());

  strokeWeight(6);
  rotate(radians(6)*minute());
  line(0, 0, 0, -100);
  rotate(radians(-6)*minute());


  strokeWeight(2);
  rotate(radians(6)*second());
  line(0, 0, 0, -110);
  rotate(radians(-6)*minute());

  translate(-200, -200);
}


