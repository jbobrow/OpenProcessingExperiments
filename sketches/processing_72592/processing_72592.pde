
boolean doidraw = false;

void setup() {
  size(600, 600);
  background (0);
  stroke(0);
}

void draw(){
   if(doidraw){
      for (int diam = 500; diam > 20; diam = -50) {
      drawacircle(200,200,diam);
    }
  }
}

void mousePressed() {
  doidraw = !doidraw;
}

void drawacircle(int centx, int centy, int circlesize) {
  fill(random(100,255),random(190),random(50),random(255));
  ellipse(mouseX,mouseY,circlesize,circlesize);
}



