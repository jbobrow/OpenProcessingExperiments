
int startColor = 255;
int fade;
int fadeTime = 5;

void setup() {
  size(600, 450);
}

void draw() {
  noStroke();
  fill(20, 70);
  rect(0, 0, width, height);

  fadeOut();

  for (int i = 0; i < 450; i += 5) {
    strokeWeight(0.2);
    line(0, i, 600, 450);
  }  
 }

void mousePressed() {
  startColor = 255;
  stroke(startColor);
}

void mouseReleased() {
  fade = 1;
}

void fadeOut() {
  if (fade == 1 && startColor > 0) {
    stroke(startColor-=fadeTime, 80);
  }
}


