
//mouse x and y delayed calculated by the lerp func
float x;
float y;

void setup() {
  size(1200, 1000);
  smooth();
}
void draw() {
  // lerp() calculates a number between two numbers at a specific increment. 
  x = lerp(x, mouseX, 0.015);
  y = lerp(y, mouseY, 0.015);
  
  background(240, 75, 127);
  //anntenae

  strokeWeight(1);
  stroke(0);
  line(x+78.0, y-266.0, x+92.0, y-286.0);
  line(x+92.0, y-286.0, x+80.0, y-311.0);
  line(x+80.0, y-311.0, x+129.0, y-286.0);
  line(x+129.0, y-286.0, x+121.0, y-311.0);
  line(x+121.0, y-311.0, x+134.0, y-320.0);
  noStroke();
  fill(random(255), random(255), random(255));
  ellipse(x+134.0, y-320.0, 15, 15);

  fill(255);

  //head
  stroke(0);
  beginShape();
  vertex(x-36.0, y-102.0);
  vertex(x-12.0, y-255.0);
  vertex(x+78.0, y-266.0);
  vertex(x+149.0, y-220.0);
  vertex(x+82.0, y-54.0);

  endShape(CLOSE);
  strokeWeight(3);

  //head
  fill(255);
  ellipse(x+92.0, y-184.0, 50, 50); // big eye
  fill(240, 10, 10);
  ellipse(x+92.0, y-184.0, 3, 3);
  fill(255);
  ellipse(x+16.0, y-205.0, 10, 10); // Small eye
  strokeWeight(6);
  strokeCap(ROUND);
  //mouth
  line(x+3.0, y-139.0, x-5.0, y-109.0);
  line(x+15, y-100.0, x+25.0, y-136.0);
  line(x+34.0, y-108.0, x+40.0, y-125.0);
  line(x+48.0, y-95.0, x+60.0, y-128.0);

  //neck
  strokeWeight(2);
  line(x+27.0, y-74.0, x+21.0, y-51.0);
  line(x+2.0, y-85.0, x+4.0, y-53.0);

  //body
  strokeWeight(1);
  float x1 = lerp(x, mouseX, 0.05);
  float y1 = lerp(y, mouseY, 0.05);
  float x2 = lerp(x, mouseX, 0.1);
  float y2 = lerp(y, mouseY, 0.1);
  ellipse(x, y+20, 150, 150);
  ellipse(x1, y1+65.0, 150, 150);
  ellipse(x2, y2+130, 150, 150);
}

