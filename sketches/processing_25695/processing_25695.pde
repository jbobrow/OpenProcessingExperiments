
float blink_t = 0, blink_next = 100;
float spit_t = 200, spit_dur = 50;
boolean blinking = false;

float mouseR, mouseA;

color eyeWhite;
color eyeBlack;
color bkg;
color lips;

void setup() {
  size(300, 300);
  smooth();
  
  background(bkg);
  
  eyeWhite = color(#ffffff);
  eyeBlack = color(0);
  bkg = color(0);
  lips = color(#ff5500);
}

void draw() {
  clear();
    
  trackFrom(width / 2, height / 2);
  eye(100, height / 2, 100, 40);
  eye(200, height / 2 , 100, 40);
  blink();
  
  mouth(width / 2, 225, mouseR, 25 * mouseA);
  
  if (spit_t < spit_dur)
    spit(width / 2, 225, 100);
}

void clear() {
  fill(bkg);
  noStroke();
  rect(0, 0, width, height);
}

void mouseClicked() {
  spit_t = 0;
}

void trackFrom(float x, float y) {
  mouseR = dist(x, y, mouseX, mouseY);
  mouseA = atan2(mouseY - y, mouseX - x);
}

void eye(float x, float y, float d, float p) {
  fill(eyeWhite);
  noStroke();
  
  ellipse(x, y, d, d);
  
  // Pupil
  
  fill(eyeBlack);
  noStroke();

  float r = mouseR;  
  if (mouseR > (d - p) / 2)
    r = (d - p) / 2;

  ellipse(
    x + r * cos(mouseA),
    y + r * sin(mouseA),
    p, p
  );
}

void mouth(float x, float y, float rx, float ry) {
  stroke(lips);
  strokeWeight(20);
  noFill();
  
  if (spit_t < spit_dur / 4) {
    float s = abs(cos(spit_t / spit_dur * PI * 4));
    
    rx = s * rx;
    ry = 20 + s * ry;
  }
  
  ellipse(x, y, rx, ry);
}

void blink() {
    
  blink_t ++;
  
  if (blink_t > blink_next) {
    if (blinking)
      blink_next = random(5, 250);
    else
      blink_next = 30;
      
    blinking = !blinking;

    blink_t = 0;    
  }
  
  if (blinking) {
    fill(0);
    rect(0, 0, width, (1 - abs(cos(PI * blink_t / blink_next))) * height);
  }
}

void spit(float x, float y, int n) {
  spit_t ++;
  
  for (int i = 0; i < n; i++) {
    saliva(x, y, spit_t);
  }
}

void saliva(float xx, float yy, float t) {
  float d = random(3, 10);
    
  float a = PI/2 + random(-0.3, 0.3);
  float v = random(2, 8);
  
  float x = xx + v * cos(a) * t;
  float y = yy + v * sin(a) * t;
  
  fill(#ffffff);
  noStroke();
  ellipse(x, y, d, d);
}


                
