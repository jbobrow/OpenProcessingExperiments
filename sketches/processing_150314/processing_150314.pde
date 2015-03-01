
float rectWidth = 100;
float ellipseRadius = rectWidth/2;
float thickness = 1;

void setup() {
  size(800, 800);
  smooth();
}

void draw() {
  background(#000000);
  for (int x = 0; x < width; x+=rectWidth) {
    for (int y = 0; y < height; y+=rectWidth) {
      drawTile(x, y);
    }
  }
}

void drawTile(float x, float y) {
  noFill();
  stroke(#FFFFFF);
  strokeWeight(thickness);

  rectMode(CENTER);
  ellipseMode(CENTER);

  rect(x+rectWidth/2, y+rectWidth/2, rectWidth, rectWidth);
  ellipse(x+rectWidth/2, y+rectWidth/2, ellipseRadius*2, ellipseRadius*2);
  ellipse(x+rectWidth, y+rectWidth, ellipseRadius/2, ellipseRadius/2);
}  

void keyPressed() {
  if (keyCode == LEFT) {
    ellipseRadius -= 10;
  } else if (keyCode == RIGHT) {
    ellipseRadius += 10;
  } else if (keyCode == UP) {
    thickness += 1;
  } else if (keyCode == DOWN) {
    thickness -= 1;
  }

  ellipseRadius = constrain(ellipseRadius, 10, 2000);
  thickness = constrain(thickness, 1, 10);
  // println("ellipseRadius: "+ellipseRadius);
  // println("thickness: "+thickness);
}



