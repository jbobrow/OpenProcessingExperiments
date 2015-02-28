
float x=0;
float y=0;
float prevX=0;
float prevY=0;
float easing = 0.014;

void setup() {
  size(900, 700);
  smooth();
  stroke(0, 10);
  fill(0,200)
  strokeWeight(30);
  background(254);  
  textSize(13);
  textAlign(RIGHT);
  frameRate(90);
  text("press the left mouse button to refresh", width-10, height-9);
}

void draw() {
  x+= (mouseX-x)*easing;
  y+= (mouseY-y)*easing;
  strokeWeight(dist(x, y, mouseX, mouseY)/2.0);
  line(x, y, prevX, prevY);
  prevX=x;
  prevY=y;
  if (mousePressed) { 
    background(253);
    text("press the left mouse button to refresh", width-10, height-9);
  };
}
