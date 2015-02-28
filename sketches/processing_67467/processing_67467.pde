
void setup() {
 size(500,500);
 background(0);
}

void draw() {
  stroke(255);
  noFill();
  quad(240,325,260,325,300,225,200,225);
  ellipse(250,200,250,250);
  fill(255);
  ellipse(250,350,40,60);
  fill(128);
  stroke(128);
  rectMode(CENTER);
  rect(250,325,150,25);
  rect(250,340,100,25);
  rect(250,350,80,25);
  fill(247,169,0);
  noStroke();
  rectMode(CORNERS);
  rect(430,380,480,480);
  noFill();
  stroke(0);
  rect(440,390,470,470);
}

void mousePressed() {
  if (mouseButton == LEFT) {
    stroke(255);
    fill(255,255,0);
    quad(240,325,260,325,300,225,200,225);
    ellipse(250,200,250,250);
    fill(255);
    ellipse(250,350,40,60);
    fill(128);
    stroke(128);
    rectMode(CENTER);
    rect(250,325,150,25);
    rect(250,340,100,25);
    rect(250,350,80,25);
  }
  if (mouseButton == RIGHT) {
    stroke(255);
    fill(0);
    quad(240,325,260,325,300,225,200,225);
    ellipse(250,200,250,250);
    fill(239,250,93);
    ellipse(250,350,40,60);
    fill(128);
    stroke(128);
    rectMode(CENTER);
    rect(250,325,150,25);
    rect(250,340,100,25);
    rect(250,350,80,25);
  }
}


