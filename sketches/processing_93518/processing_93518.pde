
PShape star;
int a, b;
float xpos=0.0;
float ypos=0.0;
float angle = 0.0;
float scaler;
float yTeeth = 150.0;
float incrTeeth = 1.0;

void setup() {
  size(600, 600);
  scaler = height/2;
  background(loadImage("beach-1.jpg"));
  PImage img = loadImage("outer-space1.jpg");
  image(img, 0, 0);
  blend(img, 0, 0, 600, 600, 0, 0, 600, 600, EXCLUSION);
  smooth();
  translate(width/2, height/2);
  colorMode(HSB, 100);
  star= createShape();
  beginShape();
  fill(102);
  stroke(255);
  strokeWeight(2);
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
  smooth();
}

void draw() {
  //background(0);
  //translate((mouseX-100), (mouseY-100));
  //head
  fill(40, 50, 100);
  ellipse(300, 100, 200, 200);

  //hair
  fill(10, 80, 100);
  beginShape();
  vertex(250, 150);
  vertex(200, 130);
  vertex(180, 100);
  vertex(180, 80);
  vertex(190, 60);
  vertex(200, 40);
  vertex(230, 20);
  vertex(260, 0);
  vertex(300, 0);
  vertex(350, 20);
  vertex(340, 40);
  vertex(400, 60);
  vertex(375, 20);
  vertex(350, 10);
  vertex(300, 0);
  vertex(350, 25);
  endShape(CLOSE);

  //eyes
  fill(60, 55, 75);// outer eye
  ellipse(325, 100, 50, 50);
  ellipse(375, 100, 50, 50);

  fill(80, 100, 100);// outer eye
  ellipse(325, 100, 43, 43);
  ellipse(375, 100, 43, 43);

  fill(80, 125, 125);// outer eye
  ellipse(325, 100, 35, 35);
  ellipse(375, 100, 35, 35);

  fill(0);// black eye center
  //stroke(0);//  eye color
  //strokeWeight(5);// thicker stroke to act as eye color
  ellipse(325, 100, 30, 30);
  ellipse(375, 100, 30, 30);

  noStroke();

  a = mouseX;
  b = mouseY;
  if ( a > 250 && b < 250) {
    fill(100);// white dot
    ellipse(325, 100, 10, 10);
    ellipse(375, 100, 10, 10);
  }

//teeth
 yTeeth += incrTeeth;
  if ( yTeeth < 150 || yTeeth > 180 ) {
    incrTeeth*= -1;
    yTeeth += incrTeeth;
  }
  fill (100);
  triangle (300, yTeeth, 300, 150, 340, 150);
  triangle (310, yTeeth + 10, 310, 150, 350, 150);
  triangle (320, yTeeth + 20, 320, 150, 350, 150);

  //body
  beginShape();
  fill(75,50,100);
  vertex(300, 200);
  vertex(340,190);
  vertex(500,350);
  vertex(500,400);
  vertex(340, 250);
  vertex(340, 600);
  vertex(310, 600);
  endShape(CLOSE);
  
  xpos++;
 
  ypos = height/2 + (sin(angle) * scaler);
  angle+=0.3; 
 
  fill(30, 50, 100);
  //ellipse(width/2, ypos, 10,10);
  ellipse(xpos,ypos, 10,10);
}



