
int num = 100;

float[] x = new float [num]; //x coordinate array
float[] y = new float [num]; //y coordinate array
color[] circleColor = new color[3]; //color options array

void setup() {
  size(300, 300);
  background(0);
  //creates the color options
  circleColor[0] = color(255, 0, 0, 75);
  circleColor[1] = color(0, 255, 0, 75);
  circleColor[2] = color(0, 0, 255, 75);
}

void draw() {
  for (int a = 0; a<num; a++) { //randomly select x,y placement
    x[a] = random(width);
    y[a] = random(height);
  }
  for (int a = 0; a<num; a++) {
    noStroke();
    fill(randomColor());
    ellipse(x[a], y[a], 25, 25); //draws the ellipse at the random coordinates
  }
  noLoop();
}

color randomColor() { //random color for the ellipses from above choices
  int c = int(random(3));
  return circleColor[c];
}

void mousePressed() { //repeats the program with a different iteration
  background(0);
  loop();
}


