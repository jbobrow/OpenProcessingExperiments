
//Vanessa Faienza
//Problem Set 3 - Question 4

float x[] = new float[50];
float y[] = new float[50];
  
void setup() {
  size(800, 200);
  fill(175, 145, 240, 100);
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
    ellipse(x[i], y[i], dia, dia);
  }
}
