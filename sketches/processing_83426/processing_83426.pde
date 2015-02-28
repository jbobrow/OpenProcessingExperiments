
float x;
float y;
float graphx;
float graphy;

void setup(){
  size(500,500);
  smooth();
  background(46,54,64);
  
}

void draw(){
  drawTarget(width*0.25, height*0.4, 200, 4);
 stroke (30,245,78);
 strokeWeight (2);
 if (mousePressed == true) {
    line (pmouseX, pmouseY, mouseX, mouseY);
 stroke (35,103,87);
  }
  
//background 
  x = x+.2;
  y = sin(x)/cos(x)*sin(x);
  graphy= y*10+100;
  graphx= x*10;
  point(graphx,graphy);
  graphy= y*10+200;
  graphx= x*10;
  point(graphx,graphy);
  graphy= y*10+300;
  graphx= x*10;
  point(graphx,graphy);
  graphy= y*10+400;
  graphx= x*10;
  point(graphx,graphy);
  fill(200,20,40);
}

void drawTarget(float xloc, float yloc, int size, int num) {
  float grayvalues = 25/num;
  float steps = size/num;
  for (int i = 0; i < num; i++) {
    fill(0,200,70,10);
    ellipse(xloc, yloc, 900, 200);
  }
}
