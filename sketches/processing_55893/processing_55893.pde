
float d = 0, dd = 0.01;

void setup() {
  size(200, 200);
  smooth();
  
  background(#ffffff);
  
  noStroke();
  fill(0, 0, 0, 40);
}

void draw() {  
  clear();
  
  for (float t = 0; t < TWO_PI; t += TWO_PI / 400) {
    fill(0, 230, 0, 40);  
    ellipse(
      width / 2 + (80 + 15 * sin(6 * (t - d))) * cos(t), 
      height / 2 + (60 + 10 * sin(6 * (t - d))) * sin(t), 
      20,
      20
    );
  
    fill(104, 0, 104, 40);  
    ellipse(
      width / 2 + (80 + 15 * sin(6 * (t - d))) * cos(3 * t ), 
      height / 2 + (60 + 10 * sin(11 * (t - d))) * sin(t ), 
      20 + 15 * sin(5 * t),
      20 + 15 * sin(5 * t)
    );
  }
  
  d += dd;
}

void clear() {
  fill(#ffffff, 20);
  rect(0, 0, width, height);
}
