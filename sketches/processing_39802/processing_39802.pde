
int num = 500;  

float [] x= new float[num]; //array to store x-coordinates
float [] y= new float[num]; //array to store y-coordinates

void setup() {
  size(300, 300);
  background(25);
  frameRate(15); //speed.
  smooth();

  for (int i=0; i<num; i++) {
    x[i] = random(width);
    y[i] = random(height);
  }
}

void draw() {

  for (int i=0; i<num; i++) {
    
    stroke(y[i]);
    point(x[i], y[i]);
    y[i] = y[i] + 1; //updates y coordinates.
  }
}


