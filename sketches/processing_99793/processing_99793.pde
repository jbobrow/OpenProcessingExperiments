
void setup(){
  size(500, 500);
  background(255);
  smooth();
  noStroke();
  fill(255, 0, 0);
}

int x = 30;
int y, r;
int s = 3;

void draw(){
  background(255);
  y = height/2;
  r = 30;
  ellipse(x, y, r, r);
  if(x>width-r/2){
    s*=-1;
  }
  if(x<0+r/2){
    s*=-1;
  }
  x+=s;
  println(s);
}


