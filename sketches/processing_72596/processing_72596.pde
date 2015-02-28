
boolean doidraw = false;

void setup() {
  size(600, 600);
  background (0);
  stroke(0);
}

void draw(){
   if(doidraw){
       if(frameCount % 10 == 0){

          for (int diam = 400; diam > 20; diam = -50) {
          drawacircle(200,200,diam);
          frameCount = frameCount + 1;
       } 
    }
  }
}

void mousePressed() {
  doidraw = !doidraw;
}

void drawacircle(int centx, int centy, int circlesize) {
  fill(random(100,255),random(190),random(50),random(175));
  ellipse(mouseX,mouseY,circlesize,circlesize);
}



