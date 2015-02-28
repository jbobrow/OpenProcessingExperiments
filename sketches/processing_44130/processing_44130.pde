
void setup() {
  size(500,250);
  smooth();
}


void draw() {
background(0,33,200); // refresh background
noStroke();
fill(0, 200, 20);
rect(0, 10+mouseY/5, 500, 250);
fill(0, 190, 40);
rect(0, 10+mouseY/2.1, 500, 250);
fill(0, 180, 50);
rect(0, 10+mouseY/1.3, 500, 250);
fill(0, 170, 60);
rect(0, 10+mouseY, 500, 250);
}

