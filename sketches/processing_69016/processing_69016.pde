
// Ladybug

void setup() {
  size(400, 400);
  background(255);
  noLoop();
  smooth();
}

void draw() {
  
  // Head
  fill(0);
  ellipseMode(CENTER);
  ellipse(200, 160, 60, 80);
  
   // eyes
   fill(255, 255, 0);
   ellipse(185, 130, 5, 5);
   ellipse(215, 130, 5, 5);
  
  // antlers
  fill(0);
  strokeWeight(3);
  line(190, 125, 170, 95);
  ellipse(167, 95, 5, 5);
  line(210, 125, 230, 95);
  ellipse(233, 95, 5, 5);
  
  // Body
  fill(255, 0, 0);
  ellipse(200, 200, 140, 120);
  
  fill(0);
  strokeWeight(5);
  line(200, 140, 200, 260);
  strokeWeight(1);
  
  triangle(200, 250, 205, 260, 195, 260);
  
  // left dots
  fill(0);
  ellipse(140, 200, 8, 8);
  ellipse(155, 180, 7, 7);
  ellipse(165, 160, 8, 8);
  ellipse(158, 210, 6, 6);
  ellipse(172, 197, 8, 8);
  ellipse(185, 172, 9, 9);
  ellipse(180, 222, 8, 8);
  ellipse(164, 236, 8, 8);
  
  // right dots
  ellipse(210, 160, 8, 8);
  ellipse(222, 178, 7, 7);
  ellipse(235, 166, 6, 6);
  ellipse(213, 240, 8, 8);
  ellipse(210, 206, 9, 9);
  ellipse(240, 198, 7, 7);
  ellipse(252, 212, 8, 8);
  ellipse(232, 222, 8, 8);
}

