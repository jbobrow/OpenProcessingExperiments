
int topx = 100;
int topy = 100;
int bottomx = 100;
int bottomy = 500;
int rightx = 500;
int righty = 100;
int leftx = 100;
int lefty = 500;
int r = 0;
int g = 0;
int b = 0;
int go = 1;

void setup(){
  size(600,600);
  noStroke();
}
void draw(){
  r = int(random(0,255));
  g = int(random(0,255));
  b = int(random(0,255));
  topx = 100 + int(random(-1,20))*20;
  fill(r,g,b);
  rect(topx,topy,20,20);
  bottomx = 100 + int(random(-1,20))*20;
  fill(r,g,b);
  rect(bottomx,bottomy,20,20);
  righty = 100 + int(random(-1,21))*20;
  fill(r,g,b);
  rect(rightx,righty,20,20);
  lefty = 100 + int(random(-1,20))*20;
  fill(r,g,b);
  rect(leftx,lefty,20,20);
  
}



