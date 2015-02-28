
// A silly example using many variables
float x1;
float x2;
float x3;
float x4;
float x5;

void setup() {
  size(300, 300);
  fill(0, 100, 255, 100);
  smooth();
  // assign a random number to each variable
  x1 = random(width);
  x2 = random(width);  
  x3 = random(width);  
  x4 = random(width);  
  x5 = random(width);
}

void draw() {
  background(255);
  float dia;
  
  // let the diameter of each circle be the distance
  // between the mouse and that circle. 
  dia = dist(x1, 150, mouseX, mouseY);
  ellipse(x1, 150, dia, dia);

  dia = dist(x2, 150, mouseX, mouseY);
  ellipse(x2, 150, dia, dia);

  dia = dist(x3, 150, mouseX, mouseY);
  ellipse(x3, 150, dia, dia);

  dia = dist(x4, 150, mouseX, mouseY);
  ellipse(x4, 150, dia, dia);

  dia = dist(x5, 150, mouseX, mouseY);
  ellipse(x5, 150, dia, dia);
}

