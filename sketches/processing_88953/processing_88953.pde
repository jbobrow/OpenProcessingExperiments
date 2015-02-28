
int x = 20;
float y = 50;
float z;

void setup() {
  size (600, 200);
  smooth();
  noStroke();
  
  // Assign a new value to an existing variable
  y = height;
  
  // Casting a variable
  float randomFloat = random(9);
  println("randomFloat = " + randomFloat);
  
  float randomInt = random(4);
  println("randomFloat = " + randomFloat);
}

void draw() {
  background(#333333);
  ellipse(x, y, 40, 40);
  
  x++;
  y *= 0.99;
  
  x = constrain(x, 0, width/2);
}
