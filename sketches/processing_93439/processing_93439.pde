
float rando;
float randa;
float rondo;
int circleX = 100;
int circleY = 100;

void setup() {
 size(500, 500); 
 background(#0691d3);
}

void draw() {
  stroke(255);
  line(pmouseX, pmouseY, mouseX, mouseY);
}

void mousePressed() {
  rando = random(width);
  randa = random(height);
  rondo = random(0, 50);
  stroke(random(0, 255));
  strokeWeight(random(0, 4));
  fill(random(0, 255));
  ellipse(pmouseX, pmouseY, rondo, rondo);
  circleX = circleX+1;
}


