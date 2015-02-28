

  color bgColor = color(255,255,0);
  PFont font;

  int screenWidth = 749 / 1;
  int screenHeight = 999 / 1;
  
  float xMargin = screenWidth / 10;
  float yMargin = screenHeight / 9;
  float triangleMargin = screenHeight / 3.74  ;
  int sm = 95;
  

void setup() {
  size(screenWidth,screenHeight);
  smooth();
  noLoop();

}

void draw() {
  background(255,255,0);
  fill(255,255,0);
 
  beginShape();  // Triangle
    strokeWeight(37);
    strokeCap(ROUND);
    strokeJoin(ROUND);
    vertex(0 + xMargin, screenHeight - yMargin - triangleMargin);
    vertex(screenWidth - xMargin, screenHeight - yMargin - triangleMargin);
    vertex(screenWidth / 2, yMargin);
  endShape(CLOSE);
  

  translate(width / 2, height / 2 - 55);
  
  fill(0);
  ellipse(0,0, 70,70);
  strokeCap(SQUARE);
 
  // Large
  strokeWeight(10);
  stroke(0);
  for (float i = 0; i < 240; i = i+30) {
  pushMatrix();
  rotate(radians(i));
  line(0, 140, 0, -140);
  popMatrix();
  
  }
  
  
  // Small
  stroke(0,0,0);

  for (float i = 0; i < 240; i = i+45) { 
  pushMatrix();
  rotate(radians(i));
  line(0, sm, 0, -sm);
  popMatrix();
  
  }
  
  
    // Small
  stroke(0,0,0);

  for (float i = 0; i < 240; i = i+45) { 
  pushMatrix();
  rotate(radians(i + 30));
  line(0, sm, 0, -sm);
  popMatrix();
  
  }

    // Small
  stroke(0,0,0);

  for (float i = 0; i < 240; i = i+45) { 
  pushMatrix();
  rotate(radians(i + 60));
  line(0, sm, 0, -sm);
  popMatrix();
  
  }
save("Laser_v2.png");
}
