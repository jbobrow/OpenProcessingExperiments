
int numShapes = 100;

void setup() {
  //size(displayWidth, displayHeight);
  size(1000, 600);
  rectMode(CENTER);
  fill(#007DB4, 90);
  noStroke();
  colorMode(HSB, 360, 100, 100, 100);
}

void draw() {
  background(360);

  for (int i = 1; i <= numShapes; i++) {
    int rectX = width/(numShapes+1) * i;
    int rectY = height/2;

    float theta = atan2(rectY - mouseY, rectX - mouseX);
    
    fill(map(i, 1, numShapes, 140, 220), 80, 90, 50);

    pushMatrix();
    translate(rectX, rectY);

    rotate(theta);
    rect(0, 0, 300, 300);

    translate(-50, 0);
    rect(0, 0, 50, 50);

    popMatrix();
  }
}

boolean sketchFullScreen() {
  return true;
}
