
//Wave lines make delicate patterns while the color of them changes. 
//The initial window is blank, then you click the mouse, drawing starts.
//then click again, the window turns to white. 
//Then click again, drawing starts again from the last continuation.
//You can save a screenshot with pressing the key 's' or 'S'.


//Clicking mouse starts and stops drawing 
boolean click = false;

//for the wave of left to right
float posX = 0;
float posY = 0;
float baseR = 0;
// for the color change 
float n = 0.01;

void setup() {
  size(1280, 600);
  smooth();
  colorMode(HSB, 360, 100, 100, 100);
  background(360);
}

void draw() {
  //local variables
  int circleR = 7;//if 10, looks like line
  float radius;
  radius = 120;
  float angle = 1080;
  
  // when the mouse is clicked 
  if (click) {
    pushMatrix();
  // for the translate x and y position 
    float baseT = 0.0;
    baseT++;
    float rad = radians(baseT);
    baseR += 10;
    posX = cos(rad)*baseR;
    posY = sin(rad)*baseR + height/2;
    translate(posX, posY);
    if (posX > width +100) {
      baseT = 0.0;
      baseR = 0;
    }
    // rotate lines
    rotate(radians(frameCount*2 % 360));
    // circle lines
    beginShape();
    float h = 60+noise(n)*300;
    n += 0.01;
    stroke(h, 100, 100, 100);
    strokeWeight(0.1);
    noFill();
    for (int i = 0; i <= circleR; i++) {
      float theta = radians(angle)/circleR;
      float x = cos(theta*i)*radius;
      float y = sin(theta*i)*radius;
      radius += 10;
      vertex(x, y);
    }
    endShape();
    popMatrix();
  }

}

void keyPressed() {
  if (key == 's' || key == 'S') saveFrame("screenshot###.jpg");
}

void mouseReleased() {
  click = !click;
  background(360);
}



