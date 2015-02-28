

// Philip Grimmett
// IDEA2904: Assessment 1A

color[] palette = new color[5]; // Declare colour array
PFont london;
String city = "LONDON";

void setup() {
  size(600, 400);
  smooth();
  colorMode(HSB, 360, 100, 100, 100);
  background(0, 0, 100, 10);
  palette[0] = color(60, 100, 100); // Yellow
  palette[1] = color(330, 100, 100); // Magenta
  palette[2] = color(186, 100, 85); // Teal
  palette[3] = color(205, 100, 100); // Blue
  palette[4] = color(28, 100, 100); // Orange
  london = loadFont("GillSans-58.vlw");
  frameRate(3);
}

void draw() {
  noStroke();
  fill(200, 20, 100, 20);
  rect(0, 0, width, height);

  // Draw mountain  
  for (int i = height; i > 50; i -= 20) { // Starting at the bottom of the screen, move up to the summit  
    int base = int(random(-i/2, i/2)); // Progressively decrease layer width
    float shapeRotation = random(5);
    int colourPicker = int(random(1, 5)); // Select random colour from palette array
    shape1((width/2)+base, i, i/50, shapeRotation, palette[0], palette[colourPicker]);
  }
  for (int i = height; i > 50; i -= 20) {   
    int base = int(random(-i/2, i/2));
    float shapeRotation = random(5);
    int colourPicker = int(random(1, 5));
    shape2((width/2)+base, i, i/50, shapeRotation, palette[0], palette[colourPicker]);
  }

  // Draw Olympic rings
  stroke(0, 0, 100);
  strokeWeight(6);
  noFill();
  ellipse((width/2), height/2, 60, 60); 
  ellipse((width/2)-70, height/2, 60, 60);
  ellipse((width/2)+70, height/2, 60, 60);
  ellipse((width/2)-35, (height/2)+35, 60, 60);
  ellipse((width/2)+35, (height/2)+35, 60, 60);

  // Draw "LONDON" text
  noStroke();
  fill(0, 0, 100, 80);
  textFont(london, 58);
  textAlign(CENTER);
  rect(160, 280, 280, 50);
  fill(palette[1]);
  textAlign(CENTER);
  text(city, width/2, (height/2)+ 125);
}

// SHAPE FUNCTIONS

void shape1(int x, int y, float shapeScale, float rotation, color fill1, color fill2) {
  pushMatrix();
  translate(x, y); // Define center of shape1 as 0, 0
  scale(shapeScale/8);
  rotate(TWO_PI/rotation);
  fill(fill1);
  beginShape();
  vertex(19, -82);
  vertex(13, -77);
  vertex(7, -82);
  vertex(-34, -43);
  vertex(-45, -54);
  vertex(-48, -50);
  vertex(-52, -54);
  vertex(-95, 19);
  vertex(-8, 106);
  vertex(37, 68);
  vertex(50, 83);
  vertex(97, 13);
  vertex(92, 7);
  vertex(95, 3);
  endShape();
  fill(fill2);
  beginShape();
  vertex(7, -77);
  vertex(-37, -34);
  vertex(-51, -47);
  vertex(-90, 19);
  vertex(-6, 99);
  vertex(37, 58);
  vertex(51, 71);
  vertex(89, 4);
  endShape();
  popMatrix();
}

void shape2(int x, int y, float shapeScale, float rotation, color fill1, color fill2) { 
  pushMatrix();
  translate(x, y); // Define center of shape2 as 0, 0
  scale(shapeScale/8);
  rotate(TWO_PI/rotation);
  fill(fill1);
  beginShape();
  vertex(-52, -86);
  vertex(-54, -77);
  vertex(-58, -79);
  vertex(-82, -18);
  vertex(-49, -1);
  vertex(-80, 80);
  vertex(-76, 80);
  vertex(-78, 88);
  vertex(64, 77);
  vertex(41, 14);
  vertex(13, 14);
  vertex(32, -35);
  endShape(CLOSE);
  fill(fill2);
  beginShape();
  vertex(-55, -74);
  vertex(-77, -20);
  vertex(-44, -2);
  vertex(-72, 83);
  vertex(60, 74);
  vertex(34, 19);
  vertex(5, 21);
  vertex(21, -32);
  endShape(CLOSE);
  popMatrix();
}


