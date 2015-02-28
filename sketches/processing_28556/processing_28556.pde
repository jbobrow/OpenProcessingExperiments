
int posq,posw,pose,posr,post,posy;
int qd = 3;
int wd = 3;

void setup() {
  size(600,400);
  smooth();
  rectMode(CENTER);
  posq = width/2-50;
  posw = height/2-15;
}

void draw() {
  background(255);
  fill(0,0,200);
  rect(300,80, 600, 40);
  rect(300,320, 600, 40);
  joo(posq,posw,pose,posr,post,posy);
  posq += qd;
  posw += wd;
  pose = posq+50;
  posr = posw+60;
  post = posq+100;
  posy = posw;
  if (post>=width) {
    qd = -qd;
  }
  if (posr>=300) {   
    wd = -wd;
  }
  if (posq<=0) {
    qd = -qd;
  }
  if (posr-80<=100) {   
    wd = -wd;
  }
}
void joo(int q,int w,int e,int r,int t,int y) {
  strokeWeight(7);
  stroke(0,0,200);
  noFill();
  triangle(q,w,e,r,t,y);
  triangle(q,w+40,e,r-80,t,y+40);
}


