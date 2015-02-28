
void setup() {
  size(800, 800);
  fill(0);
}

void draw() {  

  rectMode(CENTER);
  background(255);
  translate(width/2, height/2);
  rotate(radians(frameCount)*2);
  drawCircle(0, 0, width);
}

void drawCircle(float x, float y, float diam) {
  //ellipse(x, y, diam, diam);
  fill(random(255), random(255), random(255));
  rect(x, y, diam, diam);
  fill(random(255), random(255), random(255));
  rect(x, y, diam*1/4, diam*1/4);
  fill(random(255), random(255), random(255));
  rect(x, y, diam*1/2, diam*1/2);
  fill(random(255), random(255), random(255));
  rect(x, y, diam*3/4, diam*3/4);



  if (diam > 10) {
    fill(255);
    drawCircle(x + diam/4, y, diam/2);
    drawCircle(x - diam/4, y, diam/2);
    drawCircle(x, y- diam/4, diam/2);
    drawCircle(x, y+ diam/4, diam/2);
    drawCircle(x, y, diam/2);
  }
}


