
////Sam Legros, Exercise 6, Question 1 

float[] x = new float[16];
float[] y = new float[16];
int[] n = new int[16];
float[] rotation = new float[16];

void setup() {
  size(500, 500);

  float tempX = 100;
  float tempY = 100;

  for (int i=0; i < x.length; i++) {    
    x[i] = tempX;
    y[i] = tempY;
    n[i] = i+1;
    tempX += 100;
    if (tempX >= width) { 
      tempX = 100;
      tempY += 100;
    }
  }
}

void draw() {
  background(0);   
  noStroke();

  for (int i=0; i < x.length; i++) {
    noStroke();
    myShape(x[i], y[i], 90, n[i]);
  }

  for (int i=0; i < x.length; i++) {
    pushMatrix();
    translate(x[i], y[i]);
    rotate(rotation[i]);
    noStroke();
    fill(mouseX, mouseY, 255);
    myShape(0, 0, 100, 2); 
    popMatrix();
    float d = dist(mouseX, mouseY, x[i], y[i]);
    float angle =  map(d, 0, 100, 0.1, 0);
    angle = constrain(angle, 0, 0.1);
    rotation[i] += angle;
  }
}

void myShape(float x, float y, float diameter, int numberOfCircles) {
  ellipseMode(CENTER);
  float angle = PI / numberOfCircles;
  float h = diameter / numberOfCircles;
  pushMatrix();
  translate(x, y);
  for (int i=0; i < numberOfCircles; i++) {
    ellipse(0, 0, diameter, h);    
    rotate(angle);
  }  
  popMatrix();
}



