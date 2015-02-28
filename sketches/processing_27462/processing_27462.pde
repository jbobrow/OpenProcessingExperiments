
int sides = 8; //symmeyry
int pnum = 2; //particles drawing
float p[] = new float[pnum]; //0 < p < 1; chance of turning
PVector[] pos = new PVector[pnum];
PVector[] vel = new PVector[pnum];
color[] col = new color[pnum];
boolean[] ref = new boolean[pnum];
 
void setup(){
  size(600,600,P2D);
  frameRate(30);
  restart();
}
 
void draw(){
  fill(0,0.00001);
  rectMode(CORNERS);
  rect(0,0,width,height);
  translate(width/2,height/2);
  stroke(255);
  for (int i=0;i<pnum;i++){
    pos[i].add(vel[i]);
    if(random(1) < p[i] || (pos[i].mag() > (width+height)/4 && pos[i].dot(vel[i])>=0)){
      float x = vel[i].x;
      vel[i].x = vel[i].y;
      vel[i].y = -x;
    }
    for(int j=0;j<sides;j++){
      rotate(TWO_PI/sides);
      stroke(col[i]);
      point(pos[i].x, pos[i].y);
      if (ref[i])
      point(-pos[i].x, pos[i].y);
    }
  }
}
 
void restart(){
  background(0);
  for(int i=0;i<pnum;i++){
    p[i] = random(0.2);
    pos[i]=new PVector();
    vel[i]=new PVector(0,1);
    col[i]=color(random(255), random(255), random(255));
    ref[i]=(random(2)<1);
  }
}
 
void mousePressed(){
  restart();
}

