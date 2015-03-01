
float rot = 0.0;
float sca = 0.0;

void setup() {
  size(720, 480);
}

void draw()
{
  background(255);
  rot = map(mouseX, 0, width, -PI/4, PI/4);
  sca = map(mouseY, height, 0, 0.5, 2);
  drawBass(rot, sca);
}

void drawBass(float rotation, float scaleY)

{

  translate(360, 160);
  scale(0.4);
 rotate(rotation);

  scale(scaleY);

  //tuning keys
  pushMatrix();
  translate(0, -100);
  stroke(0);
  fill(182);
  triangle(14, -20, 15, -36, 30, -25);
  triangle(23, 7, 39, 3, 33, 21);
  triangle(-23, 7, -40, 2, -34, 20);
  triangle(-14, -20, -13, -36, -28, -25);
  popMatrix();

  pushMatrix();
  translate(0, -100);
  //headstock star outer
  fill(255);
  stroke(255, 0, 0);
  strokeWeight(5);
  beginShape();
  vertex(0, -50);
  vertex(14, -20);
  vertex(47, -15);
  vertex(23, 7);
  vertex(29, 40);
  vertex(0, 25);
  vertex(-29, 40);
  vertex(-23, 7);
  vertex(-47, -15);
  vertex(-14, -20);
  endShape(CLOSE);

  //headstock star inner
  stroke(255, 0, 0);
  strokeWeight(5);
  beginShape();
  fill(40, 40, 150);
  vertex(0*0.5, -50*0.5);
  vertex(14*0.5, -20*0.5);
  vertex(47*0.5, -15*0.5);
  vertex(23*0.5, 7*0.5);
  vertex(29*0.5, 40*0.5);
  vertex(0*0.5, 25*0.5);
  vertex(-29*0.5, 40*0.5);
  vertex(-23*0.5, 7*0.5);
  vertex(-47*0.5, -15*0.5);
  vertex(-14*0.5, -20*0.5);
  endShape(CLOSE);
  popMatrix();
  //body star outer
  fill(255);
  pushMatrix();
  rotate(PI);
  translate(0, -240);
  stroke(255, 0, 0);
  strokeWeight(5);
  beginShape();
  vertex(0*2.2, -50*2.2);
  vertex(14*2.2, -20*2.2);
  vertex(47*2.2, -15*2.2);
  vertex(23*2.2, 7*2.2);
  vertex(29*2.2, 40*2.2);
  vertex(0*2.2, 25*2.2);
  vertex(-29*2.2, 40*2.2);
  vertex(-23*2.2, 7*2.2);
  vertex(-47*2.2, -15*2.2);
  vertex(-14*2.2, -20*2.2);
  endShape(CLOSE);
  //body star inner
  fill(40, 40, 150);
  beginShape();
  vertex(0*1.5, -50*1.5);
  vertex(14*1.5, -20*1.5);
  vertex(47*1.5, -15*1.5);
  vertex(23*1.5, 7*1.5);
  vertex(29*1.5, 40*1.5);
  vertex(0*1.5, 25*1.5);
  vertex(-29*1.5, 40*1.5);
  vertex(-23*1.5, 7*1.5);
  vertex(-47*1.5, -15*1.5);
  vertex(-14*1.5, -20*1.5);
  endShape(CLOSE);
  popMatrix();

  //neck
  pushMatrix();
  translate(0, 70);
  stroke(0);
  strokeWeight(1);
  fill(102, 51, 0);
  rectMode(CENTER);
  rect(0, 0, 20, 280);
  popMatrix();

  //bridge
  pushMatrix();
  translate(-15, 290);
  fill(182);
  rectMode(CORNER);
  rect(0, 0, 28, 5);
  popMatrix();

  //truss rod cover
  pushMatrix();
  translate(0, -90);
  fill(102, 51, 0);
  triangle(-10, 20, 10, 20, 0, 0);
  popMatrix();

  //pickups
  pushMatrix();
  translate(-15, 250);
  stroke(255);
  fill(0);
  rectMode(CORNER);
  rect(0, 10, 28, 10);
  rectMode(CORNER);
  rect(0, -10, 28, 10);
  popMatrix();

  //strings
  pushMatrix();
  translate(-7, 290);
  stroke(0);
  strokeWeight(1);
  line(0, 0, 0, -360);
  line(4, 0, 4, -360);
  line(9, 0, 9, -360);
  line(14, 0, 14, -360);

  line(0, -360, -10, -386);
  line(4, -360, -3, -405);
  line(9, -360, 16, -405);
  line(14, -360, 24, -386);

  popMatrix();

  //tuning peg trees
  pushMatrix();
  translate(-7, 290);
  stroke(0);
  strokeWeight(1);
  fill(182);
  ellipse(-10, -386, 5, 5);
  ellipse(-3, -405, 5, 5);
  ellipse(16, -405, 5, 5);
  ellipse(24, -386, 5, 5);
  popMatrix();


  //knobs
  pushMatrix();
  translate(33, 240);
  fill(255);
  ellipse(0, 0, 7, 7);
  ellipse(11, 10, 7, 7);
  ellipse(22, 19, 7, 7);
  popMatrix();

  //toggle
  pushMatrix();
  translate(30, 200);
  fill(182);
  ellipse(0, 0, 10, 10);
  fill(230);
  ellipse(0, 0, 5, 5);
  popMatrix();
}

