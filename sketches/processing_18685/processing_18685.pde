
void setup() {
  background(0);
  smooth();
  size(250,250);
}

void draw() {

  background(random(255),random(13),random(70));
  frameRate(15);
  fill(0);
  ellipse(random(height),random(width),25,10);

  if(keyPressed){
    background(random(0),random(255),random(234));
    frameRate(5);
    fill(255);
    rect(random(height),random(width),random(height),random(width));
  }
}



