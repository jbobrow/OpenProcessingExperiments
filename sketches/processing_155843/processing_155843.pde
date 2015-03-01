
float a;
float b;
float c;

void setup() {
  size(600, 450);
  background(10, 10, 70);
  smooth();
}

void draw() {

 noStroke();
if (mousePressed) {
     background(20, 20, 80);
  } else {
     background(10, 10, 60);
  }
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
  a = map(mouseX, 0, width, 215, 245);
  ellipse(a, 300, 30, 45);
  ellipse(a+140, 300, 30, 45);

  //HAND         
  pushMatrix();
  b= map(mouseX, 0, 500, 0, 220);
  c= map(mouseY, 0, 500, 250, 450);
  translate(b-50, c-300);
  fill(0);
  ellipse(50, 300, 60, 60);
  ellipse(50, 420, 65, 300);
  ellipse(48, 270, 35, 35);
  ellipse(26, 285, 35, 37);
  ellipse(70, 285, 35, 37);
  ellipse(50, 300, 40, 40);
  popMatrix();

  //FLY
  if (mousePressed) {
    fill(random(10), random(200), random(200));
  } else {
    fill(random(0), random(0), random(200));
  }
  strokeWeight(0);
  ellipse(mouseX*2, mouseY/2, random(30), random(30));
}

void keyPressed() {

  if (keyPressed) {
    if (key=='s'||key=='a') {
      saveFrame();
    }
  }
  println(key);
  println(frameCount);
}

