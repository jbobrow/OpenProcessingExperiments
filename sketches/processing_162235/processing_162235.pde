
void setup() {
  size(600, 600);
}

void draw() {

  background(0);
  fill(160);
  noStroke();

  //main eye containers
  ellipse(200, 100, 180, 100);
  ellipse(400, 200, 170, 100);





  //left eye
  float leftXpos = constrain(map( mouseX, 0, 600, 150, 250), 150, 250);
  float leftYpos = constrain(map( mouseY, 0, 600, 180, 220), 180, 220);
  //outer eye
  fill(0, 149, 222);
  ellipse(leftXpos, leftYpos, 40, 40);
  //inner eye
  fill(0);
  ellipse(leftXpos, leftYpos, 20, 20);



  //right eye 
  float rightXpos = constrain(map( mouseX, 0, 600, 350, 450), 350, 450);
  float rightYpos = constrain(map( mouseY, 0, 600, 180, 220), 180, 220);
  //outer eye
  fill(125, 60, 24);
  ellipse(rightXpos, rightYpos, 40, 40);
  //inner eye
  fill(5);
  ellipse(rightXpos, rightYpos, 20, 20);

  //makes eyes blink
  if (mousePressed) {
    background(0);
  }
}



