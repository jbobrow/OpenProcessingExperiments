
int distance = 120;
//stars
int numpoints = 200;
float[] a = new float[numpoints];  
float[] b = new float[numpoints]; 


void setup() {
  size(600, 400);
  // for little background cells  
  for (int i = 0; i < numpoints; i++) {  
    a[i] = random(width);  
    b[i] = random(height);
  }
}

void draw() {
  noStroke();
  background(0);
  drawStars();
  drawRound();
  drawA();
  drawPlus();
  drawT();
}


void drawPlus() {
  fill(random(0, 255), random(0, 255), random(0, 255));
  rectMode(CENTER);
  rect(width/2, height/2, 20, 80, 10);
  rect(width/2, height/2, 80, 20, 10);
}

void drawA() {
  fill(random(0, 255), random(0, 255), random(0, 255));
  rectMode(CENTER);
  rect(width/2-distance, height/2, 100, 100, 10);
  fill(0, 0, 255);
  rect(width/2-distance, height/2+45, 50, 50, 10);
  rect(width/2-distance, height/2-12, 50, 30, 10);
}

void drawT() {
  fill(random(0, 255), random(0, 255), random(0, 255));
  rectMode(CENTER);
  rect(width/2+distance, height/2, 100, 100, 10);
  fill(0, 0, 255);
  rectMode(CENTER);
  rect(width/2+distance-40, height/2+15, 50, 80, 10);
  rect(width/2+distance+40, height/2+15, 50, 80, 10);
}

void drawRound() {
  fill(random(0, 255), random(0, 255), random(0, 255));
  ellipse(width/2, height/2, 420+mouseX/20, 320+mouseY/20);
  fill(0, 0, 255);
  ellipse(width/2, height/2, 400+mouseX/20, 300+mouseY/20);


}

void drawStars() {
  fill(255, random(10, 80));  
  for (int i = 0; i < numpoints; i++) {  
    ellipse(a[i], b[i], 2, 2);
  }
}
