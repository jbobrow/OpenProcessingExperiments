
PFont font;
float x = 0;
float y = 0;
float z = 0;

void setup(){
  size(250, 250);
  background(0);
  smooth();
  font = loadFont("HelveticaNeue-UltraLight-48.vlw");
  textFont(font);
  rectMode(CENTER);
}

void draw(){
  frameRate(20);
  background(0);
  fill(x);
  textSize(random(12));
  text("H9X 2E6", mouseX,random(100, 150), mouseY-20);
  fill(y);
  text("H9X 2E6", mouseX,random(100, 150), mouseY-30);
  fill(z);
  text("H9X 2E6", mouseX,random(100, 150), mouseY-40);
  fill(random(255));
  rect(random(250), random(250), 2, 20);
}

void mousePressed() {
  if (mouseEvent.getClickCount()==1){
    x = 255;
  }
  if (mouseEvent.getClickCount()==2){
    y = 255;
  }
  if (mouseEvent.getClickCount()==3){
    z = 255;
  }
  
  if (mouseEvent.getClickCount()==4){
    x = 0;
    y = 0;
    z = 0;
  }
}

