
/* Uneven Hatching
 * http://www.openprocessing.org/user/45793
 * Nellie Robinson (narobins) */
 
/* Hatching properties */
PVector spacing = new PVector(-80, 2);
PVector messiness = new PVector(30, 1);
color line_color = color(0, 80);
color bg_color = color(255);
float angle = 0;
long seed = 1;

void setup() {
  size(500,500);
  background(bg_color);
  noFill();
  strokeWeight(2);
  stroke(line_color);
}

void draw() {
  background(bg_color);
  translate(width/2, height/2);
  rotate(angle);
  translate(-width/2, -height/2);
  rect(0, 0, width, height); // outline
  hatching();
}

void uneven(PVector start, PVector end, PVector messiness) {
  PVector curr = start;
  start.y += random(-messiness.y, messiness.y);
  end.y += random(-messiness.y, messiness.y);
  beginShape();
  curveVertex(start.x, start.y);
  curveVertex(start.x, start.y);
  curr.x += random(messiness.x);
  while (curr.x <= end.x + random(-messiness.x, messiness.x)) {
    curveVertex(curr.x, curr.y + random(-messiness.y, messiness.y)); 
    curr.x += random(messiness.x/2, messiness.x);
  }
  curveVertex(end.x, end.y);
  curveVertex(end.x, end.y);
  endShape();
}

void hatching() {
 float len;
 float xpos;
 randomSeed(seed);

 for (int i = 0; i < height; i+=spacing.y) {
    xpos = 0;
    while(xpos < width) {
      len = random(width);
      if (len + xpos > width) len = (width - xpos);
      uneven(new PVector(xpos, i), new PVector(xpos + len, i), messiness);
      xpos += len;
      if (xpos + len < width) xpos += random(spacing.x);
    }
  } 
}

void mouseMoved() {
 messiness.y = 10 * abs(mouseY) / height + 0.5;
 messiness.x = 80 * abs(mouseX) / width + 1;
 redraw();
}

