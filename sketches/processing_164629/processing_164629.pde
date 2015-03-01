
// paper fountain
// by jared kant
// based on weaver and rotate() example from processing.org

float sl, hl, x = 0;
int wv, toggle = 0;
int i, b=255;

void setup()
{ 
  size(1000, 800);
  background(255);
}

void draw() {
  stroke(0);
  float angle=random(10);
  translate(width/2, height/2);
  float howrotate = cos(angle);
  rotate(howrotate);
  rectMode(CENTER );
  rect(0, 0, 200, 250);
  rect(0, 0, 200, 200);
  rect(0, 0, 150, 150);
  rect(0, 0, 100, 100);
  if (second() % 2 == 0) {
    for (hl=0; hl<360; hl++) {
      stroke(0);
      float angle2=random(10);
      translate(width/2, height/2);
      float howrotate2 = cos(angle2);
      rotate(howrotate2+hl);
      rectMode(CENTER );
      rect(0, 0, 100, 100);
    }
  }
} 

void mouseClicked() {
  toggle=toggle+1;
  if(toggle %2 == 1){
  fill(255, 25);
  }
  else{
    fill(255,255);
  }
}

