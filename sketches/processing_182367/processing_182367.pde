
/* Blob Trees
 * http://www.openprocessing.org/user/45793
 * Nellie Robinson (narobins) */

PVector spacing;

void setup() {
  size(600, 500);
  noLoop();
  noStroke();
  spacing = new PVector(200, 250);
}

void draw() {
  background(255);
  for (float i = spacing.x/2; i < width; i += spacing.x) {
    for (float j = spacing.y/2; j < height; j += spacing.y) {
      square_blob_tree(new PVector(i, j));
    }
  }
}

void square_blob_tree(PVector base) {
 float rad = 80;
 float trunk_length = 30; 
 base.y -= trunk_length / 2;
 float trunk_width = 8;
 color leaves = color(random(40, 120), random(80, 140), random(60, 100));
 stroke(60);
 strokeWeight(2);
 blob_trunk(base, new PVector(trunk_width, trunk_length + rad));
 fill(leaves);
 noStroke();
 for (int i = 0; i < 20; i++) {
   fill((leaves >> 16 & 0xFF) + random(-10, 10), 
       (leaves >> 8 & 0xFF) + random(-10, 10), 
       (leaves & 0xFF) + random(-10, 10));
   triangle_blob(base, rad);
   fill(255);
   square_blob(new PVector(base.x + random(-rad, rad), base.y + random(-rad, rad)),
               random(rad/16, rad/6));
 }
}

void triangle_blob(PVector c, float rad) {
 float y;
 beginShape();
 for (int i = 0; i < 8; i++) {
   y = random(-rad, rad);
   curveVertex(c.x + random(-rad, rad) * (rad + y) / (2 * rad), c.y + y); 
 }
 endShape(CLOSE); 
}

void square_blob(PVector c, float rad) {
  beginShape();
  for (int i = 0; i < 8; i++) {
    curveVertex(c.x + random(-rad, rad),  c.y + random(-rad, rad)); 
  }
  endShape(CLOSE); 
}

void blob_trunk(PVector start, PVector size) {
  for (int i = 0; i < 20; i++) {
   line(start.x + random(-size.x, size.x),
       start.y,
       start.x + random(-size.x, size.x),
       start.y + size.y);
  }
}

void mousePressed() {
 redraw(); 
}
