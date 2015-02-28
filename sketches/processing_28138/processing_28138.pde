
void setup() {
  size(600,400);
  smooth();
  fill(0);
}

void draw() {

  if (mousePressed == true) {
    fill(0);
  } 
  else {
    fill(255);
  }


  rect(-5,-5,650,450);
  float angle = atan2(mouseY-height/2, mouseX-width/2);

  //draw nose
  fill(255);
  ellipse(300, 265, 35, 35);


  fill(255);
  stroke(204, 92, 0);
  rect(304, 335, 18, 18);
  rect(282, 335, 18, 18);


  //draw mouth
  fill(255);
  stroke(204, 92, 0);
  arc(301, 322, 50, 45, 0, PI/1);


  //draw one eye
  pushMatrix();
  translate(width*0.4,height/2);
  fill(255);
  ellipse(0,0,50,50);
  popMatrix();
  strokeWeight(3);
  pushMatrix();
  translate(width*0.4,height/2);
  rotate(angle);
  fill(0);
  ellipse(16,0,16,16);
  popMatrix();


  pushMatrix();
  translate(width*0.6,height/2);
  rotate(angle);

  noFill();
  popMatrix();
  translate(width*0.6,height/2);
  fill(255);
  ellipse(0,0,50,50);
  rotate(angle);
  fill(0);
  ellipse(16,0,16,16);
}


