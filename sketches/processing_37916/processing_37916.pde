
void setup() {
  size (800, 400);
  fill(0, 0, 0);
  background(0,0,0);
  smooth();
  noStroke();
  frameRate(10);
}


void draw() {

  fill(0,0,0,20);
  rect(0,0,800,400);
  fill(255,255,255, 10);
  for (int i = 0; i< 40; i++) {
    int gap= i*20;
    int limit  = (800 - mouseX)/2;
    float r = random(1000);
    fill(random(255 - (mouseX/8),255), random(255 - mouseX/8,255) ,random(255 - mouseX/8,255), 50);
    triangle(gap, 0, gap+20, 0, gap+10, 10 + r*(i+1)/limit);
  }
  for (int i = 0; i< 40; i++) {
    int gap= i*20;
    int limit  = (800 - mouseX)/2;
    float r2 = random(1000);
    fill(random(255 - (mouseX/8),255), random(255 - mouseX/8,255) ,random(255 - mouseX/8,255), 50);
    triangle(gap, 400, gap+20, 400, gap+10, 390 - r2*(i+1)/limit - i);
  }
}


