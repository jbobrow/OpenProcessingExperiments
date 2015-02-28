
void setup() {
  size(360,360);
  background(255);
}
void draw() {
  noStroke();
  fill(random(255),random(255),random(255),random(180));
  //triangle(random(0,360),random(90,270),90,360,270,360);
  triangle(180,180,random(0,360),random(0,360),random(0,360),random(0,360));
}
void mousePressed() { //press mouse to restart
background(255);
}
  


