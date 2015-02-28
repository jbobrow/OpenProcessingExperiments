
int numRect = 0;
float x = 100;
float y = 100;
float moved = 200.0; //
float rot = PI/4; // rotation of squares
float calcx = mouseX; // live position of x value of squares

float[] rectXps = new float[0]; // x position of squares
float[] rectYps = new float[0]; // y position of squares
float[] rotation = new float[0]; // rotation of squares

void setup() {
  size(700, 400);
  background(0);
  noStroke();
  smooth();
}

void draw() {

  calcx = calcx + (mouseX - calcx -(width/2))/10.0; // x axis movement of squares (in relation to mouse)

  int i = 0;
  background(0);
  while (i < numRect) {
    rectMode(CENTER);
    pushMatrix();
    translate(rectXps[i]+calcx, rectYps[i]+sin((frameCount+rectYps[i])/20.0)*100); // position of squares as they are drawn at the mouse x position
    rotate(rotation[i]); // adding rotation
    fill((sin((frameCount+rectYps[i])/20.0)+10)*205/2+50, 5); // fill with white, transparency depends on y position
    rect(0, 0, (rectYps[i]/2.0), (rectYps[i]/2.0));
    popMatrix();

    rotation[i] = rotation[i]+sin(frameCount/100.0)/100.0;
    i=i+1;
  }
}

void mouseDragged() {
  numRect = numRect + 1;

  rectXps = expand(rectXps, numRect); // expanding the arrays by 1 each time the code is 'read'
  rectYps = expand(rectYps, numRect);
  rotation = expand(rotation, numRect);

  rectXps[numRect-1] = mouseX;
  rectYps[numRect-1] = mouseY;
  rotation [numRect-1] = random(rot);
}
