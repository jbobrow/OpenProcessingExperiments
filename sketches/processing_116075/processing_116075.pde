
int num_squares = 200;
int[] x_values = new int [num_squares];
int[] y_values = new int [num_squares];
int radius = 50;
float x = 0;
float speed = 1 ;
int direction = 2;
float y = 500;
float i = 0;
float j=0;
void setup () {
  size (600, 600);
  for (int i = 0; i<x_values.length; i++) {
    x_values[i]= int(random(width));
  }
  for (int i=0; i<y_values.length; i++) {
    y_values[i]= int (random(height));
  }
  smooth();
  ellipseMode(RADIUS);
}

void draw() {
  background(255, 163, 93);
  for (int i=0; i<x_values.length; i++) {
    rect(x_values[i]+(y += speed*direction*.005), y_values[i], 20, 20);
    if (i==50) {
      fill(200, 50, 0);
    } 
    else {
      fill(255);
    }
    rect(x_values[i], y_values[i], 10, 10);
  }


  fill(170, 255, 196);
  noStroke();
  x +=speed *direction; 
  if (x>width-radius) {
    x = -radius;
  }
  arc (x, 100, radius, radius, 0.52, 5.76);

  fill(170, 255, 196);
  noStroke();
  x +=speed *direction; 
  if (x>width-radius) {
    x = -radius;
  }
  arc (x, 300, radius, radius, 0.52, 5.76);

  fill(170, 255, 196);
  noStroke();
  x +=speed *direction; 
  if (x>width-radius) {
    x = -radius;
  }
  arc (x, 500, radius, radius, 0.52, 5.76);

  fill(105, 93, 255);
  noStroke();
  x +=speed *direction; 
  if (x>width-radius) {
    x = -radius;
  }
  arc (x, 200, radius, radius, 0.52, 5.76);

  fill(105, 93, 255);
  noStroke();
  x +=speed *direction; 
  if (x>width-radius) {
    x = -radius;
  }
  arc (x, 400, radius, radius, 0.52, 5.76);


  fill(170, 255, 196);
  noStroke();
  y +=speed *direction; 
  if (y>height-radius) {
    y = -radius;
  }
  arc (100, y, radius, radius, 0.52, 5.76);

  fill(255, 111, 44);
  noStroke();
  y +=speed *direction; 
  if (y>height-radius) {
    y = -radius;
  }
  arc (300, y, radius, radius, 0.52, 5.76);

  fill(99, 44, 155);
  noStroke();
  y +=speed *direction; 
  if (y>height-radius) {
    y = -radius;
  }
  arc (500, y, radius, radius, 0.52, 5.76);
fill(0);
  float distance = dist(mouseX, mouseY, i, j);
  rect(mouseX, mouseY, distance, distance);
}



