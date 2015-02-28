

void setup() {
 
  size(450,450);
  background(255);
  
}

void draw() {
}

void mousePressed() {
  float red = map(mouseX, 0, width, 0, 200);
  float green = map(mouseY, 0, height, 0, 200);
  float blue = dist(mouseX, mouseY, width/2, height/2);
  fill (red, green, blue, 50);
  noStroke();
  rectMode(CENTER);
  float rx = random(1, 2);
  float ry = random(1, 2);
  float rs = random(0.3, 0.8);
  
  if(rs >= 0.6) {
  rect(mouseX, mouseY, 50 * rx, 50 * ry);
  } else if (rs >= 0.5) { 
  triangle(mouseX,mouseY,mouseX+(100*rs),
          mouseY+(100*rs),mouseX-(100*rs),mouseY+(100*rs));
  } else if (rs >= 0.4) {
  triangle(mouseX,mouseY,mouseX+(100*rs),
          mouseY-(100*rs),mouseX-(100*rs),mouseY-(100*rs));
  } else {
  ellipse(mouseX, mouseY, 100*(1+rs), 100*(1+rs));
  }
}
