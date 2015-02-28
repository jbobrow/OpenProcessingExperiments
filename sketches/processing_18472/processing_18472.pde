
float x = 50.0;
float y = 0.3;

void setup(){
  size(250, 250);}

void draw(){
  background(0);
  strokeWeight(y);
  noFill();
  frameRate(10);
  stroke(y, x, 255, 70);
  line(pmouseX, pmouseY, x, random(250));
  line(pmouseX, pmouseY, x, random(250));
  line(pmouseX, pmouseY, y, random(250));
  line(pmouseX, pmouseY, y, random(250));
  line(pmouseX, pmouseY, 40, random(250));
  line(pmouseX, pmouseY, 40, random(250));
  line(pmouseX, pmouseY, 100, random(250));
  line(pmouseX, pmouseY, 100, random(250));
  line(pmouseX, pmouseY, -30, random(250));
  line(pmouseX, pmouseY, -30, random(250));
  line(pmouseX, pmouseY, 200, random(250));
  line(pmouseX, pmouseY, 200, random(250));
  line(pmouseX, pmouseY, 20, random(250));
  line(pmouseX, pmouseY, 20, random(250));
  line(pmouseX, pmouseY, 300, random(250));
  line(pmouseX, pmouseY, 300, random(250));
  stroke(x, y, 255, 70);
  line(pmouseX, pmouseY, x, random(250));
  line(pmouseX, pmouseY, x, random(250));
  line(pmouseX, pmouseY, y, random(250));
  line(pmouseX, pmouseY, y, random(250));
  line(pmouseX, pmouseY, 40, random(250));
  line(pmouseX, pmouseY, 40, random(250));
  line(pmouseX, pmouseY, 100, random(250));
  line(pmouseX, pmouseY, 100, random(250));
  line(pmouseX, pmouseY, -30, random(250));
  line(pmouseX, pmouseY, -30, random(250));
  line(pmouseX, pmouseY, 200, random(250));
  line(pmouseX, pmouseY, 200, random(250));
  line(pmouseX, pmouseY, 20, random(250));
  line(pmouseX, pmouseY, 20, random(250));
  line(pmouseX, pmouseY, 300, random(250));
  line(pmouseX, pmouseY, 300, random(250));
  x += 3;}

void mouseDragged(){
  y += 2;}
  


