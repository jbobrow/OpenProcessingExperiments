
void setup()
{
  size(500,500);
  background(255);
  smooth();
  ellipseMode(CENTER);
  frameRate(10);
  rectMode(CENTER);
}

void draw() {
  if (key == 'e') {
    for (int i=0; i < 40; i++) {
      strokeWeight(1);
      fill(0,113,150,50);
      stroke(150,10,10,50);
      ellipse(random(width),random(height),i,i);
    }
  }
  if (key == 'r') {
    for (int i=0; i < 40; i++) {
      strokeWeight(1);
      stroke(0,113,150,50);
      fill(150,10,10,50);
      ellipse(random(width),random(height),i,i);
    }
  }
  if (key == 'd') {
    for (int i=0; i < 40; i++) {
      strokeWeight(1);
      stroke(250,128,114,50);
      fill(255,165,0,50);
      rect(random(width),random(height),i,i);
    }
  }
  if (key == 'f') {
    for (int i=0; i < 40; i++) {
      strokeWeight(1);
      fill(250,128,114,50);
      stroke(255,165,0,50);
      rect(random(width),random(height),i,i);
    }
  }
  if (key == 'c') {
    for (int i=0; i < 40; i++) {
      strokeWeight(1);
      fill(255,20,147,50);
      stroke(34,139,34,50);
      triangle(i,i, random(width),random(height),i+20,i);
    }
  }
}

void keyPressed() {
  if (key == 's') {
    save("CirclesSquaresLinerangles_"+second()+"_"+millis()+".tif");
  }
}


