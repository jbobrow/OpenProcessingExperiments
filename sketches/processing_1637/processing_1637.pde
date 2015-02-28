
int strokegrowth = +1;

int x = 1;

float c1 = random(255);
float c2 = random(255);
float c3 = random(255);
float c4 = random(255);

void setup() {
  size(400, 400);
  background(255);
  frameRate(20);
  smooth();

}

void draw() {

  x = (x + strokegrowth);
  if (x > 50) {
    strokegrowth = strokegrowth * -1;
  } else if (x < 1) {
    strokegrowth = +1;  
  }

}

void mouseDragged() {

  stroke(random(255), random(255), random(255));
  strokeWeight(x);
  line(pmouseX, pmouseY, mouseX, mouseY);
}

void keyPressed() {
  background(random(255), random(255),random(255), random(255));
}











