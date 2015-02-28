
float xPos = random(255);
float yPos = random(255);
int big = 20;


void setup() {
  size(500, 500);
  smooth();
}

void draw() {
  noStroke();
  background(0);
  fill(random(xPos), random(yPos), 100);
  ellipse(width/2, height/2, big, big);
}

void mousePressed() {

  big = big +10;
}

void keyPressed() {

  big=0;

}



