
int circles = 200;
int[] x_values = new int[circles];
int[] y_values = new int[circles];
int beauty = 0;
int[] speed= new int[circles];
void setup() {
  colorMode(HSB);
  size(700, 700);
  for (int i = 0; i<x_values.length; i++) {
    x_values[i] = int( random(width) );
    y_values[i] = int( random(height) );
  }
}
void draw() {
  background(0);

  beauty=beauty+2;  
  for (int i = 0; i<x_values.length; i++) {
    for ( int j=0; j<x_values.length; j++) {
      noFill();
      stroke(beauty, 255, 255, 100);
      ellipse(x_values[i]+j, y_values[i], 30, 30);
      if (speed[i]>=x_values.length) {
        speed[i]=0;
      }
    }
  }
  if (beauty>=255) {
    beauty = 0;
  }
}
