

void setup() {
  size(500, 500); 
  background(0);
  colorMode(HSB);
}

void draw() {
  
}

void drawStar(float x, float y, float size, float orientation, color c, float outStroke, color s) {
  if(outStroke>0){
     drawStar(x, y, size+outStroke*2, orientation, s, 0,0);
  }
  fill(c);
  stroke(c); 
  beginShape();
  for (int a=0; a<5; a++) {
    vertex(x+cos(orientation)*(size), y+sin(orientation)*(size));
    orientation+=TWO_PI/5*2;
  }
  endShape(CLOSE);
}


void mouseReleased(){
  drawStar(mouseX, mouseY, 50, random(TWO_PI), color(random(255),255,255),10, color(255,0,255));
}
