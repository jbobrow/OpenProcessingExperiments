
boolean lightOn = false;

float x;
float y;
float n = 0;
float inc = 0.05;
float s = 0;
float sizeInc = 0.1;


void setup () {
  size (400, 400);
  rectMode (CENTER);
}

void draw () {
  background(10, 20, 30);

  if(lightOn) {
    background (255);
  }else {
    background (0);
  }
  ellipse (200,200,100,100);

  x = noise(n)*width;
  y = noise(n+5)*height;
  float s = noise(n+2)*100;
  rect(x, y, s, s);
  n = n + inc;
  s = s + sizeInc;
}

void mousePressed() {
 if (mouseX > 150 && mouseX < 250 && mouseY > 150 && mouseY < 250) {
   lightOn = !lightOn;
   fill(255,0,255);
 } 
}

void mouseReleased() {
  fill(255,0,0);
}


