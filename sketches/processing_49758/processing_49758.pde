
//mjmurdock 2012
//arc interface



// global variables
float theta;
float noisy = 0.5;
PFont f;

void setup() {
  size(800, 800);
//  lights();
  smooth();
  background(40);

  //import font
  f = createFont("Helvetica", 10, true);
}

void draw() {
  background(40);
  frameRate(30);
  strokeWeight(2);
  stroke(255, 255, 255, 30);
  float a = (mouseX / (float) width) * 90f;
  theta = radians(a);
  float noi = noise(40*frameCount);

  line(width/2, height/2, mouseX, mouseY);
  strokeWeight(4);
  line(30, 500, mouseX, mouseY);

//  noFill();
//  stroke(120, 120, 120, 255);
//  strokeWeight(.5);
//  pushMatrix();
//  translate(mouseX, mouseY, -350+mouseX/2);
//  rotateZ(90);
//  rotateY(90);
//  sphere(150);
//  popMatrix();


  beginShape();
  noStroke();
  fill(178, 31, 76);
  vertex(240, 10);
  vertex(mouseX, mouseY);
  vertex(346, 170);
  endShape(CLOSE);

  beginShape();
  noStroke();
  fill(244, 32, 88);
  vertex(240, 10);
  vertex(mouseX, mouseY);
  vertex(20, 100);
  endShape(CLOSE);



  textFont(f, 20);
  fill(255, 40);
  text("X pos////"+ mouseX, mouseX+20, mouseY+20);

  textFont(f, 17);
  fill(255, 70);
  text("Y pos////"+ mouseY, mouseX+25, mouseY-20);

  textFont(f, 50);
  fill(255, 2);
  text(noi, 30, 400);



  //  translate(width/2, height/2);
  translate(mouseX, mouseY);
  line(0, 0, 0, 0);
  //  translate(0,-120);
  branch(120);

  fill(120);
  ellipse(0, 0, 40, 40);
  //  translate(pmouseX/2,pmouseY/2);
  //  branch(5);
}

void branch(float h) {
  float n = frameCount/.5;



  for (int i =20; i< 300; i +=20) {

    for (int j =5; j< 100; j +=j) {
      noFill();
      stroke(255, 255, 255, 20);
      strokeWeight(6);
      arc(0, 0, (mouseX+i)/2, (mouseX+i)/2, radians(n+j+mouseY), radians(n+i+mouseY));
      rotate(radians(120));

      textFont(f, 10);
      fill(255, 20);
      text(i, i, j);
    }
  }
}


