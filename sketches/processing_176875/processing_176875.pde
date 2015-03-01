
int num = 60; //number of circles
float[] y = new float[num]; //seeting up the array
 
void setup() {
  size(500, 300);
  smooth();
  background(0);
 
  for (int i = 0; i < y.length; i++) {
    y[i] = random(100); //width of line the ellipses come down in
  }
}
 
 
void draw() {
  stroke(random(255),random(255),random(255));
  noFill();
   
   
  for (int i = 0; i<y.length;i++) {
    ellipse((2*width/y.length) * i, y[i], 50, 15);
    y[i] = y[i]+1; //drags the ellipses down
    if (y[i] > height) y[i] = 0;
  }
}

