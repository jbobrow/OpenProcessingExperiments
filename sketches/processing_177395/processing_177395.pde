
float x;
float y;
float easing = 0.25;
float l =66;
float nowX = width/2;
float nowY = height/2;

void setup() {
  size(1080, 720); 
  noStroke();
}

void draw() { 
  background(51);

  float targetX = nowX;
  float dx = targetX - x;
  if (abs(dx) > 1) {
    x += dx * easing;
  }

  float targetY = nowY;
  float dy = targetY - y;
  if (abs(dy) > 1) {
    y += dy * easing;
  }
fill(255);
  rect(x-l/2, y-l/2, l, l);
  fill(52);
  rect(x-l/2+10, y-l/2+10, l, l);

  if (dist(mouseX, mouseY, width/2, height/2)<=l) {
    nowX = width/2 - 100; 
    nowY = height/2 - 100;
  } else {
    nowX = width/2; 
    nowY = height/2;
  }

  mirror(1080, 720, 1, 1);
  mirror(width-1080, 720, 1, -1);

  pushMatrix();
  translate(1080, 0);
  scale(-1, 1);
  image(get(0, 0, width/2, height), 0, 0);
  popMatrix();

  if (dist(mouseX, mouseY, width/2, height/2)<=l) {
    fill(255);
    textSize(32);
    text("START", width/2 - l/1.3, height/2+l/4);
  }
  if (millis()<800) {background(51);}
  
  if (mousePressed){nowX = width/2 - 100; 
    nowY = height/2 - 100;}
    
}

void mirror(int tlx, int tly, int scx, int scy) {
  pushMatrix();
  translate(tlx, tly);
  scale(scx, scy);
  image(get(0, 0, width/2, height/2), 0, 0);
  popMatrix();
}
