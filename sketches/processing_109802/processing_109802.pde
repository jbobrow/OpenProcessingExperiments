
int w = 600;
int h = 400;
int pointsize = 20;

void setup(){
  size(w, h);
  background(0,0,127);
  stroke(255);
}

void drawdot(){
  int x = round(random(w)/pointsize);
  int y = round(random(h)/pointsize);
  rect(x*pointsize,y*pointsize,pointsize,pointsize, pointsize/3);
}

void draw(){
  for(int i = 0; i < 10; i++){
    drawdot();
  }
}

void mousePressed(){
  background(0,0,127);
}
