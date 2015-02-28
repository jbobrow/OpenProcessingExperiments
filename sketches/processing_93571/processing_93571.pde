
//Greg Conte
//Creative Computing
//Week 7
//3/18/13
Flow [] line = new Flow [2000];
 
void setup () {
  size(500,500);
  background(0);
  smooth();
 noStroke();
  for(int i = 0; i < line.length; i +=30) {
  float x = 50;
  float y = 80;
  line[i] = new Flow(x,y);
  }
}
 
void draw() {
  for (int i = 0; i <line.length; i+=30) {
  line[i].go();
  line[i].display();
  }
}
 
class Flow {
  float x;
  float y;
  float speed =12;
   
  Flow(float startX, float startY) {
  x=250;
  y=height/2;
  }
   
  void go() {
  x += random(speed);
  y += random(speed);
  if(mousePressed==true) {
     fill(mouseY,mouseX,mouseX,mouseY);
ellipse(250,250,mouseX,mouseY);

  }
  if((y>height) || (y<width)) {
    speed = -speed;
  }
  }
   
  void display() {
  fill(mouseX,mouseY,x,y);
  rect(x,y, 10,10);
  }
  }



