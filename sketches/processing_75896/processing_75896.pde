
float angle;
float angleIncriment;
float radius;
int colorCounter;
float colour;

float size = 40;


void setup() {
  background(0);
  colorMode(HSB);
  size(500, 500);
  noFill();

  angle = 1;
  angleIncriment = 5/PI;
  radius = 0;
}

void draw() {




  if (colorCounter == 0) {
    stroke(0, 0, 255);
  }
  if (colorCounter == 1) {
    stroke(70, 250, 250);
  }
  if (colorCounter == 2) {
    stroke(100, 250, 250);
  }
  if (colorCounter == 3) {
    stroke(150, 250, 250);
  }
  if (colorCounter == 4) {
    stroke(150, 250, 250);
  }





  if (mousePressed == true) {


    angle += angleIncriment;

    colour = random(0, 255);
    stroke(colour, 250, 250);


    pushMatrix();
    translate(mouseX, mouseY);
    rotate(angle);
    angle++;

    triangle(0, size, size/2, 0, size, size);
    popMatrix();
    //    size+=0.25;


    //  radius+= 2;
  }
}


void keyPressed() {
  radius = 0;
}


