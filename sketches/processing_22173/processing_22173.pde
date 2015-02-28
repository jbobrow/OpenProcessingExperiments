
// The same silly example, but this time we are using an Array 
// to store our variables.
// This results in a marginally better version.. 

float x[] = new float[5]; // this creates an array of 5 floats 

void setup() {
  size(300, 300);
  fill(0, 100, 255, 100);
  smooth();
  // assign a random number to each variable in the array
  // note that the numbering ALWAYS starts at 0!
  x[0] = random(width);
  x[1] = random(width);  
  x[2] = random(width);  
  x[3] = random(width);  
  x[4] = random(width);
}

void draw() {
  background(255);
  float dia;
  
  // let the diameter of each circle be the distance
  // between the mouse and that circle. 
  dia = dist(x[0], 150, mouseX, mouseY);
  ellipse(x[0], 150, dia, dia);

  dia = dist(x[1], 150, mouseX, mouseY);
  ellipse(x[1], 150, dia, dia);

  dia = dist(x[2], 150, mouseX, mouseY);
  ellipse(x[2], 150, dia, dia);

  dia = dist(x[3], 150, mouseX, mouseY);
  ellipse(x[3], 150, dia, dia);

  dia = dist(x[4], 150, mouseX, mouseY);
  ellipse(x[4], 150, dia, dia);
}

