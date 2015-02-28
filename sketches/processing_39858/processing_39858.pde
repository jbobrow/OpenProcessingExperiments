
int num = 20;
 
 
float[] x = new float[num];
float[] y = new float[num];
float[] speed = new float[num];
 
void setup() {
  size(300, 300);
  smooth();
 
   
  for (int w=0; w < num;w++) {
    x[w] = random(height);
    y[w] = w * (width/num);
    speed[w] = random(10);
  }
}
 
void draw() {
  background(75);
   
  for (int i=0; i < num; i++) {
     
    rectMode(CENTER);
    stroke(0);
    fill(255, mouseY, mouseX);
    rect(x[i], y[i], 20, 20);
    fill(0);
    rect(x[i], y[i], 10, 10);
    fill(255, mouseY, mouseX);
    rect(x[i]-40, y[i], 20, 20);
    fill(0);
    rect(x[i]-40, y[i], 10, 10);
 
    y[i] = y[i] + speed[i];
    if (y[i] > width + 10) {
      y[i] = -10;
    }
     
  }
   
}


