
PVector center;
float rad;
float len;
float inc;
boolean update;
color bg = color(230, 235, 210);
color fg = color(30, 40, 20);
  

void setup() {
  size(400, 600);
  frameRate(10);
  fill(fg);
  noLoop();
  noStroke();
  background(bg);
  len = 100;
  inc = 2 * PI/len;
  center = new PVector(width/2, height - 20);
}

void blob2(PVector c, float scale) {
  beginShape();
  float noiseScale = mouseX / float(width);
  float noise, angle;
  for (int i = 0; i < len + 1; i++) {
    noise = random(scale/2, 3 * scale/2);
    angle = PI - (i * inc);
    curveVertex(c.x + (noiseScale * noise + scale * 3) * sin(angle), 
                c.y - (noiseScale * noise + scale) * (angle * angle));
  } 
  endShape(CLOSE);
}

void draw() {
  background(bg);
  blob2(center, 30);
  update = true;
}

void mouseMoved() {
  if (update) {
    update = false;
    blob2(center, 30);
    redraw();
    update = true;
  }
}
