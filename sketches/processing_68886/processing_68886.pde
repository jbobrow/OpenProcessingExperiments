
PImage img;
int numCircle = 20;
float[] cirX = new float[numCircle];
float[] cirY = new float[numCircle];
float newY;

void setup() {
  size(925, 521);
  smooth();
  
  img = loadImage("data/sky.jpg");

  for (int i = 0; i < numCircle; i++) {
    cirX[i] = random(0, 925);
    cirY[i] = random(0, 521);
  }
}



void draw() {

  image(img, 0, 0);

  lensflare();

  if (mousePressed ==true) {

    if (mouseY > 0 && mouseY < 521) {
      newY = mouseY;
      noFill();
      strokeWeight(3);
      //red  
      stroke(234, 0, 0, 80);
      arc(mouseX, mouseY, newY, 100, PI, TWO_PI);
      //orange
      stroke(255, 141, 0, 80);
      arc(mouseX, mouseY+3, newY, 100, PI, TWO_PI);
      //yellow
      stroke(250, 255, 23, 80);
      arc(mouseX, mouseY+6, newY, 100, PI, TWO_PI);
      //green
      stroke(0, 234, 13, 80);
      arc(mouseX, mouseY+9, newY, 100, PI, TWO_PI);
      //blue
      stroke(0, 95, 255, 80);
      arc(mouseX, mouseY+12, newY, 100, PI, TWO_PI);
      //navy
      stroke(0, 9, 165, 80);
      arc(mouseX, mouseY+15, newY, 100, PI, TWO_PI);
      //purple
      stroke(136, 0, 222, 80);
      arc(mouseX, mouseY+18, newY, 100, PI, TWO_PI);
    }
  }
}

//draw lens flare
void lensflare() {
  noStroke();  
  fill(random(254, 256), random(255, 256), random(157, 256), random(50));
  for (int i=0; i < numCircle; i++) {
    ellipse(cirX[i], cirY[i], 40, 40);
  }
}


