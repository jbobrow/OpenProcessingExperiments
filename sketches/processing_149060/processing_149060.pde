
float xLast;
float yLast;

void setup() {
  size(600, 600);
  smooth();
  background(0);
}
void draw() {
      noStroke();
    fill(10,mouseX,mouseY,20);
    rect(mouseX, mouseY, 70, 70);
     title();
    xLast = pmouseX;
    yLast = pmouseY;
  }
 
 
void title() {
  fill(127);
  textAlign(RIGHT);
  text("KIM Hyungi, interactive Drawing with mouse, Dynamic Media, 2014", width-50, height-20);
}

