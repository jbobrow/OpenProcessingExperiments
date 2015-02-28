
void setup() {
  size(500, 500);
  background(255, 245, 220);
  smooth();
}

void draw() {
  float ran = 0;
  float ran2 = 100;
  float followX = mouseX + (random(-ran, ran));
  float followY = mouseY + (random(-ran, ran));
  float r = 0.1;

  if (mousePressed == true) {
    translate(width/2, height/2);
    r = r + 1;
    rotate(r);
    ring(followX, followY, 100, 100);
    //translate(-width/2, -height/2);
  } 
  else{
    ring(followX, followY, 100, 100);
  }
}

void ring(float x, float y, float wdth, float hght) {
  float diffX = 1;
  float diffY = 1;

  noStroke();
  fill(70, 30, 10, 25);
  ellipse(x, y, wdth, hght);
  fill(230, 200, 155, 200);
  ellipse(x+diffX, y+diffY, wdth/2, hght/2);
}

void mouseClicked() {
  save(frameCount+".jpg");
}

