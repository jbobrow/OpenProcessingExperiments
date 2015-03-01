
float lev;

void setup() {
  size(600, 600);
  background(0);
  stroke(30,180,40, 100);
  fill(196,98,4,6);
  strokeWeight(2);
  frameRate(36);
}

void draw() {
  rect(0,0,width,height);
  if(mousePressed){
  leaf(mouseX, mouseY, random(0.1,0.4), random(0,360));
  }
}


void leaf(int x, int y, float scale, float degree) {
  pushMatrix();
  translate(x, y);
  rotate(radians(-degree));
  scale(scale);
  line(0, 0, 0, 360);  

  for (int i =0; i<90; i++) {
    lev = 80*sin(radians(2*i));
    line(lev, i*4, -lev, i*4);
  }
  popMatrix();
}

