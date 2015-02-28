
float randomDiameter = 0;

void setup() {
  size (1200, 600);
  background (80, 83, 175);
    float a = 0.0;
float inc = TWO_PI/100.0;

for(int i=0; i<1200; i=i+4) {
 stroke(255,175,70,200); strokeWeight(3); line(i, 350, i, 300+sin(a)*200.0);
  a = a + inc;int value = 0;
}}

void draw() {
  
  stroke(90, 255, 41,15);
  strokeWeight(2);
line(30, 20, 1000, 20);
line(80, 500, 1200, 500);
stroke(255,255,0,3);
bezier(50, 500,  mouseX, 400,  400, mouseY,  50, 20);
  
  stroke(236, 58, 250, 15);
  strokeWeight(2);
line(40, 30, 800, 30);
line(100, 490, 1000, 490);
stroke(0, 0, 0,3);
bezier(50, 500,  30, 400,  400, mouseY,  mouseX, 400);

  stroke(250, 209, 58, 15);
  strokeWeight(2);
  line(40, 40, 800, 40);
line(60, 510, 1100, 510);
stroke(255,255,0,3);
bezier(mouseX, mouseY,  30, 400,  400, mouseY,  mouseX, 400);

  stroke(255, 15);
  strokeWeight(2);
  line(50, 30, 800, 50);
line(40, 480, 900, 480);
stroke(0,3);
bezier(1100, 59, 700, 43, 800, 600, mouseX, mouseY);

beginShape(POINTS);
vertex(mouseX, 20);
vertex(85,mouseY);
vertex(mouseX,mouseY);
vertex(30, 75);
endShape(CLOSE);
  ellipse(mouseX,mouseY,40,40);
  smooth();
  stroke(41,125,255,9);
  strokeWeight(4);
  fill(84, 203, 121, 3);
  randomDiameter = random(20, 40);
  if (randomDiameter<40) {
    randomDiameter++;
}
 else {
   randomDiameter=0;
 }
 ellipse(mouseX, mouseY, randomDiameter, randomDiameter);
}

void mouseMoved() {

  strokeWeight(4); 

  stroke(63, 229, 208, 12);

  line(50, 50, mouseX, mouseY);

  strokeWeight(4);

  line(500, 50, mouseX, mouseY);

  strokeWeight(3);

  line(1100, 50, mouseX, mouseY);

  strokeWeight(7);

  line(500, 500, mouseX, mouseY);

  strokeWeight(4);

  line(500, 300, mouseX, mouseY);

  strokeWeight(9);

  line(300, 400, mouseX, mouseY);

  strokeWeight(1);

  line(1100, 500, mouseX, mouseY);

  strokeWeight(1);

  line(345, 497, mouseX, mouseY);

  strokeWeight(1);

  line(48, 984, mouseX, mouseY);

  strokeWeight(1);

  line(1084, 23, mouseX, mouseY);

  strokeWeight(1);

  line(783, 123, mouseX, mouseY);

}

void mouseClicked() {
 fill(250,45,175,80);
 rect(mouseX,mouseY,40,30);

}
