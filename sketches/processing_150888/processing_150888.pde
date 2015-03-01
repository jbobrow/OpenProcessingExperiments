

  
float xLast;
float yLast;
 
void setup() {
  size(600, 600);
  smooth();
  background(#FFB9B9);
}
void draw() {
      noStroke();
    fill(18,mouseX,mouseY,88);
    triangle(mouseX, mouseY-50, mouseX-50, mouseY+50, mouseX+50, mouseY+50);

     title();
    xLast = pmouseX;
    yLast = pmouseY;
  }
  
  
void title() {
  fill(150);
  textAlign(RIGHT);
  text("LEE Hye ri, interactive Drawing with mouse, Dynamic Media, 2014", width-50, height-20);
}





