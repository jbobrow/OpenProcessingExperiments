
//hw5
//copyright jingjing chen jingjin1@andrew.cmu.edu

PFont font1;
PFont font2;

void setup(){
  size(400,400);
  smooth();
  background(0);
}

void draw(){
  fill(0,50);
  rect(0,0,400,400);
  figure (mouseX,mouseY);
  for(int x=10;x<=width-12;x+=5){
  for(int y=10;y<=height;y+=10){
    noStroke();
    fill(random(130),random(170),random(190),5);
    ellipse(x,y,20-y/10,20-y/10);
    }
  }
}

void figure(float x, float y){
  font1 = loadFont("KaiTi_GB2312-48.vlw");
  textFont(font1);
  textSize (x+=10);
  fill(0,0,x+y,x);
  text("乃们应该看不懂...",0.5*x,y);
  font2 = loadFont("SmudgerLetPlain-48.vlw");
  textFont(font2);
    fill(y+x,0,y-x,y-x);
    text("bad weather today...",x,0.85*y);
}
