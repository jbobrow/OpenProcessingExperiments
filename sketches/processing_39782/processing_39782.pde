
int num=30;

//creating the arrays
float[] y = new float[num]; 
float[] x =new float[num];  

void setup() {
  size(300, 300);
  smooth();
  noStroke();


  //seeding the arrays
  for (int i = 0; i < y.length; i++) {
    y[i] = random(height);
  }
  for (int j = 0; j < x.length; j++) {
    x[j] = random(width);
  }
}


void draw() {
  background(0);

  //using the arrays to draw the red and white rectangles.
  fill(255, 0, 0);
  for (int i = 0; i < num; i++) {
    rect((width/y.length)*i, y[i], 10, 150);
    y[i] = y[i]+1;
    if (y[i] > width) y[i] = 0;
  }

  fill(255);
  for (int j =0; j < num; j++) {
    rect((height/x.length)*j, x[j], 10, 50);
    x[j]=x[j]+1;
    if (x[j] > height) x[j] = 0;
  }
}


