
void setup() {
  size(600, 450);
  background(10, 10, 50);
  smooth();
}

void draw() {

  background(10, 10, 50);
  noStroke();

  //FACE
  fill(0); 
  ellipse(300, 280, 300, 300);
  triangle(150, 100, 175, 235, 230, 150);
  triangle(460, 100, 425, 235, 370, 150);
  ellipse(300, 580, 200, 400);

  fill(255, 100, 0);
  triangle(290, 340, 300, 350, 310, 340);

  //EYE LEFT
  fill(255); 
  ellipse(230, 300, 60, 60); 
  rect(200, 270, 30, 30);
  rect(230, 300, 30, 30);

  //EYE RIGHT
  ellipse(370, 300, 60, 60);
  rect(370, 270, 30, 30);
  rect(340, 300, 30, 30);

  //MOVING EYES
  if (mousePressed) {
    fill(random(10), random(200), random(200));
  } else {
    fill(255, 204, 0);
  }
  float a;
  a = map(mouseX, 0, width, 215, 245);
  ellipse(a, 300, 30, 45);
  ellipse(a+140, 300, 30, 45);

  //FLY
  if (mousePressed) {
    fill(random(10), random(200), random(200));
  } else {
    fill(random(0), random(0), random(200));
  }
  strokeWeight(0);
  ellipse(mouseX, mouseY, random(30), random(30));
}

