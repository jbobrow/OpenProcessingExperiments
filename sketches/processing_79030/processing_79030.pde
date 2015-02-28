
//original sketch: http://www.openprocessing.org/sketch/47794//

float x;
float y;

 
void setup() {
  size(600, 300);
  background(0);
 
  smooth();
}
 
void draw() {
  noStroke();
  fill(0, 30);
  rect(0, 0, width, height);
 //describing the movement//
  for (int i = 0;i < 35;i++) {
    y = 100*sin(x+i);
    fill(255);
    rect(i*30, y+height/2, 50, 25);
  }
 //speed// 
  x += 0.08;
}
//what happens when mouse is pressed//
void mousePressed() {
   for (int i = 0;i < 25;i++) {
    y = 40*sin(x+i);
    fill(150);
    rect(i*30, y+height/2,50, 25);
  }  
  x += 2;
}
