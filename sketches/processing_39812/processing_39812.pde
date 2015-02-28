
//3 ARRAYS WITH 100 VARIABLES

int count = 300;

float[] x = new float[count]; //x COORDINATE
float[] y = new float[count]; //y COORDINATE
float[] speed = new float [count]; //SPEED ARRAY
color[] c = new color [count]; //COLOR ARRAY

void setup() {
  size(300, 300);
  background(50);
  colorMode(RGB);
  noStroke();

  for (int i=0; i<count; i+=10) {
    //SETS THE INDICES
    x[i] = random(width);
    y[i] = random(height);
    speed[i]= random(0, .03);
  }
}

void draw() {

  for (int i=0; i<width; i++) {

    noStroke();
    fill(0, random(50, 90), random(70, 99));
    rect(x[i], y[i], 20, random(10, 30)); //DRAWS THE RECTANGLE AT RANDOM CORDINATES

    x[i] = x[i] + speed[i]; //CONTROLS THE SPEED
    if (x[i] > 100) {
      x[i] = x[i]+100;
    }
  }
}
void mousePressed() { //REPEATS THE PROGRAM
  background(50);
  loop();
}


