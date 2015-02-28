
void setup() { 
  size(250,250);
  background(15, 34, 80);
  smooth();
}

void draw() {
  strokeWeight(random(3));
  noFill();
  stroke(15, 34, 80);
 frameRate(6);
  bezier(mouseX, mouseY, random(270), random(270), random(270), random(270), 125, 125);
///the BLUE lines behind the white rectangles



fill(255,10);
noStroke();
smooth();
frameRate (4);
rect(0, -20, 250, 40); // white, horizontal triangles 
rect(0, 30, 250, 20);
rect(0, 120, 250, 20);
rect(0, 180, 250, 20);
rect(0, 60, 250, 20);
rect(0, 150, 250, 20);
rect(0, 210, 250, 20);
rect(0, 90, 250, 20);
rect(0, 240, 250, 20);


}


