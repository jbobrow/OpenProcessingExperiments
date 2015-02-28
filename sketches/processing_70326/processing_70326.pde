
float inc;
float xPos;
float yPos;
float rad;

void setup() {
  size(500, 500);
  background(0);
  inc = 0;
  rad = 0;
}

void draw() {
  background(0);
  translate(width/2, height/2);  

  for (float i = 0; i < 360; i++) {
    pushMatrix();
    noFill();
    rotate(radians(i*20));
    ellipse(0, 0, 50, 300);
    stroke (255, 35, 55);
    popMatrix();
  }

  for (float j = 0; j < 300; j++) {
    pushMatrix();
    rotate(radians(j*50));
    ellipse(0, 0, 50, 200);
    stroke (50, 90, 30);
    popMatrix();
  }

  ellipse(0, 0, 325, 325);
  stroke (150, 190, 230);

  for ( int inc=0; inc < 360; inc +=10) {
    float angle = radians(inc); 
    float x = cos(angle) * 175;
    float y = sin (angle) * 175;
    noFill();
    ellipse (x, y, 3, 3);
  }
}
