
int number = 20;

void setup() {
  size(512, 512);
  noStroke();
}

void draw() {
  
  // MOVE 0/0 POINT TO CENTER
  translate(width/2, height/2);
  
  // OVERWRITE CANVAS WITH TRANSPARENT IMAGE 
  fill(255,51);
  rect(-width/2, -height/2, width, height);
  
  // CALL FUNCTION TO DRAW PLANET 20 TIMES
  for (int i=0; i<number; i++) {
    color c3 = color(random(0, 255), random(0, 255), random(0, 255));
    drawPlanet(random(-width/2, width/2), random(-height/2, height/2), c3, random(50, 100));
  }
}

// FUNCTION TO DRAW PLANET. RECEIVES PARAMETERS FOR X, Y, COLOR AND SIZE 
void drawPlanet(float in_x, float in_y, color in_color, float in_size) {
  fill(in_color);
  ellipse(in_x, in_y, in_size, in_size);
}

