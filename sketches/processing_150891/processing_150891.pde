

  float xLast;
float yLast;

void setup() {
  size(600, 600);
  smooth();
  background(0);
}
void draw() {
    
   noStroke();
  
    fill(mouseX,mouseY,255,40);
    ellipse(mouseX, mouseY, 100,50);
     title();
    xLast = pmouseX;
    yLast = pmouseY;
  }
 
 
void title() {
  fill(127);
  textAlign(RIGHT);
  text("LEE Hyejin, interactive Drawing with mouse, Dynamic Media, 2014",width-50, height-20);
