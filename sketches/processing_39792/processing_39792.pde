
//Broken TV. I had this tv back in my young days and once in a
//while it would lose the picture and random red and dreen
//ellipses would appear on the screen.
// Iv shqevi
//Lecture 6.1 arrays

int num = 15; 
// creating the arrays
float[] speed = new float[num]; // repetition 
float[] y = new float[num]; // y axis
float[] x = new float[num]; // x axis


void setup() {
  size(300, 300);
  smooth();

  // seeding the arrays
  for (int tv=0; tv < num;tv++) {
    x[tv] = random(width);
    y[tv] = tv * (height/num);
    speed[tv] = 2;
  }
}

void draw() {
  background(0);

  for (int tv=0; tv < num; tv++) {
    noFill();
    stroke(255, 0, 0);
    ellipse(x[tv/2], width/2, y[tv], 2*height);
    stroke(0, 255, 0);
    ellipse(width/2, x[tv], 2*height, y[tv]);

    x[tv] = x[tv] + speed[tv];
    if (x[tv] > width) {
      x[tv] = 0;
    }
  }
}


