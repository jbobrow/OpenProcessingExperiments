
float lineX = 0;
float lineY = 0;
float xspeed = 10;
float rotation = 0;
float square1; 
float x = 0;

void setup() {
  x = 50;
  background (255);
  size(1000, 800);
  square1 = x;
}

void draw() {

  // cyan line bounce
  stroke(7, 221, 218, random(255));
  line(lineX, height, 1, 1);

  lineX = lineX + xspeed;

  if (lineX > 1000) {
    xspeed = -5;
  }

  if (lineX < 0) {
    xspeed = 5;
  }  

  // magenta line bounce
  stroke(241, 76, 119, random(255));
  line(width, lineY, 1, 1);
  lineY = lineY + xspeed;
  if (lineY > 1000) {
    xspeed = -5;
  }

  if (lineY < 0) {
    xspeed = 5;
  }

  rotation=rotation+0.06;
  fill(255, 255, 255, 100);
  noStroke();
  translate(500,400);
  rotate(rotation);
  ellipse(50, 50, 10, 10);

  rotation=rotation+0.06;
  fill(255, 255, 255, 100);
  noStroke();
  rotate(rotation);
  ellipse(100, 100, 10, 10);

  rotation=rotation+0.06;
  fill(255, 255, 255, 100);
  noStroke();
  rotate(rotation);
  ellipse(200, 200, 10, 10);

  rotation=rotation+0.06;
  fill(255, 255, 255, 100);
  noStroke();
  rotate(rotation);
  ellipse(300, 300, 10, 10);

  rotation=rotation+0.06;
  fill(255, 255, 255, 100);
  noStroke();
  rotate(rotation);
  ellipse(300, 300, 10, 10);
}



