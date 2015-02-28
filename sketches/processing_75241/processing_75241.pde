
//array
float[] x= new float[50];
float[] y= new float[50];
  
void setup() {
  size(250, 250);
  fill(170,175,175, 100);
  smooth();
  stroke(255);
 
  for (int i=0; i < x.length; i++) {
    x[i] = random(width);
    y[i] = random(height);
  }
}
  
void draw() {
  background(255);
  
  for (int i=0; i < x.length; i++) {
    float dia = dist(x[i], y[i], mouseX, mouseY);
    rect(x[i], y[i], dia, dia);
  }
}
