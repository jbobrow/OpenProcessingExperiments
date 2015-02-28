
int [] x = new int[20];
int [] y = new int[20];

PFont font;
String become = "This is what I become.";

void setup(){
  frameRate(10);
  size(800,800);
  font=loadFont("ArialMT-48.vlw");
  textFont(font);
  textAlign(CENTER);
  smooth();
  
}

void draw(){
  background(0);
  for(int i=0; i<19; i++){
    x[i] = x[i+1];
    y[i] = y[i+1];
  }
  if (mousePressed==true){
    y[19]=mouseY;
  }
  
  for(int i=0; i<x.length; i++){
    textSize(40+i);
    fill(255, 50+i*5);
    text(become, x[i]+width/2, y[i]+random(-i/4,i/4));
  }
}
  


