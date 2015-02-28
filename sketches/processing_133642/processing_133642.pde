
/*
    Improvement over the code of Fun Programming episode 95
    http://funprogramming.org/95-Is-the-mouse-inside-a-square.html
    
    The linked code fails when dragging the rectangle too fast.
    
    This version adds a boolean, clickedInside, which becomes true
    when clicking inside the rectangle and only becomes false
    when releasing the mouse button. This fixes the high-speed drag issue.
*/
float x = 100;
float y = 100;
float sz = 100;
color bgcolor;

float current_weight = 2;
float target_weight = 2;

float current_alpha = 0;
float target_alpha = 0;

boolean clickedInside = false;

void setup() {
  size(400, 300);
  colorMode(HSB);
  noStroke();
  smooth();
  rectMode(CENTER);

  fill(random(255), 100, 200);
  bgcolor = color(random(255), 150, 255);
  background(bgcolor);
}
void draw() {
  background(bgcolor);

  if (clickedInside) {
    cursor(MOVE);
    x = lerp(x, mouseX, 0.2);
    y = lerp(y, mouseY, 0.2);
    target_weight = 10;
    target_alpha = 255;
  } else if (mouseInside()) {
    cursor(HAND);
    target_weight = 5;
    target_alpha = 255;
  } else {
    cursor(ARROW);
    target_alpha = 0;
  }

  current_weight = lerp(current_weight, target_weight, 0.2);
  strokeWeight(current_weight);

  current_alpha = lerp(current_alpha, target_alpha, 0.2);
  stroke(255, current_alpha);

  rect(x, y, sz, sz);
}
void mousePressed() {
  if (mouseInside()) {
    clickedInside = true;
  }
}
void mouseReleased() {
  clickedInside = false;
}
boolean mouseInside() {
  return mouseX > x-sz/2 && mouseX < x+sz/2 && mouseY > y-sz/2 && mouseY < y+sz/2;
}

