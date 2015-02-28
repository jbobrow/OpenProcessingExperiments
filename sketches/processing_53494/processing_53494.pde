
HScrollbar scrollbar;
float r;
int lineNum = 5;
int margine = 10;

final color RED = color(255,0,0,90);
final color WHITE = color(255);

void setup(){
  size(256,256+25);
  scrollbar = new HScrollbar(0,0,width/lineNum,20,2);
  noStroke();
}

void draw(){
  background(WHITE);
  fill(200);
  rect(0,0,width,25);
  scrollbar.update();
  scrollbar.display();
  r = scrollbar.getPos();

  for(int i=0; i<lineNum; i++){
    drawTateLine((int)(i*256/lineNum),25,r,RED);
    drawYokoLine(0,(int)(i*256/lineNum)+25,r,RED);
  }
}

void drawTateLine(int sx, int sy, float wide,color c){
  rectMode(CORNER);
  fill(c);
  rect(sx, sy, wide, 256);
}

void drawYokoLine(int sx, int sy, float wide,color c){
  rectMode(CORNER);
  fill(c);
  rect(sx, sy, 256, wide);
}

void mousePressed(){
  if(mouseButton == CENTER){
    save("check" + nf(second(),2) + ".png");
  }
}

