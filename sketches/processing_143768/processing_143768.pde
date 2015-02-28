
float t=0;
float radio=50;
float x=10,y=8;

void setup(){
  size(300,300); 
  background(0);
  noStroke();
  frameRate(120);
}

void draw(){
  translate(150,150);
  fill(color(t%255,radio%255,200),200);
  ellipse(cos(t%TWO_PI)*radio,sin(t%TWO_PI)*radio,5,5);
  t+=(x);
  radio = (radio+y)%200;
  println(mouseX,mouseY);
}

void mouseClicked(){
  x=map(mouseX,0,width,0,10);
  y=map(mouseY,0,height,0,10);
  background(0);
}


