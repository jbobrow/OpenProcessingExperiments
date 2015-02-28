
int x = 5;
float b = 400;
PFont myfont;

void setup(){
  size(1000,500);
  myfont = loadFont("Impact-48.vlw");
}

void draw(){
  if(frameCount < 1) return;
  fill(0,0,0,50);
  rect(0,0,1000,500);
  noStroke();
  
  textFont(myfont);
  textSize(mouseX);
  fill(255,255,255);
  text("STOP",mouseX,300);
  
  fill(255,3,3,49);
  ellipse(mouseX,270,mouseX,mouseX);
  fill(255,255,255,20);
  ellipse(mouseX,270,mouseX,mouseX);
  
  fill(0,0,0);
  rect(0,0,50,500);
}


