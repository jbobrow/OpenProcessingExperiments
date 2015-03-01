
void setup() {
  size(800, 800);//noStroke();
  background(0);
}

float rotRate=.01;

void draw() {

  drawCircle(width/2, height/2, 800, 10);
}
void drawCircle(float x, float y, float d, int level) {

  fill(x/2, y/2, d/2);
  ellipse(x, y,d,d);
  

  if (d>2) {
      strokeWeight(1/4);
    drawCircle(x+d/4*cos(pow(-1, level)*frameCount*rotRate), y+d/4*sin(pow(-1, level)*frameCount*rotRate), d/2, level-1);
    drawCircle(x-d/4*cos(pow(-1, level)*frameCount*rotRate), y-d/4*sin(pow(-1, level)*frameCount*rotRate), d/2, level-1);
  }
 
}



