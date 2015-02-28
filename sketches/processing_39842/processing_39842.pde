
//Alex Nelson

int num = 200; 

int[] x = new int[num];
int[] y = new int[num];


void setup() {
  size(300, 300);
  smooth();
  colorMode(HSB, 50);
}


void draw() {
  background(255, 0, 255);


  //all the lines array from the top left corner
  for (int i = num-100; i > 0; i--) {
    x[i] = x[i-1];
    y[i] = y[i-1];
  }

  //allowing the mouse to determine where the lines go
  x[0] = mouseX;
  y[0] = mouseY;


  //3 lines; 2 at the same length and one that is shorter than the other 2
  for (int i = 0; i < num; i++) {
    stroke(HSB, random(width));
    line(x[i]-10, y[i]-10, i/2, i/2); 
    line(x[i]+10, y[i]+10, i/2, i/2);
    line(x[i], y[i], i/4, i/4);
  }
}


