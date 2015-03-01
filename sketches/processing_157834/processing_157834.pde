

boolean map[][] = new boolean[1000][1000];
float tx, ty;
float x,y;
int rad;
boolean run;

void setup(){
  frameRate(100);
  size(400,400);
  for(int i=0;i<width;i++){
    for(int j=0;j<height;j++){
      map[i][j]=false;
    }
  }
  background(0);
  x=width/2;y=height/2;
  tx=x;ty=y;
  rad=30;
  run = true;
  
}

void draw(){
  fill(0, 1); // semi-transparent white
  noStroke();
  rect(0, 0, width, height);
  
  float c = random(210,230);
  fill(255);
  smooth();
  stroke(c);
  strokeWeight(1);
  rect(x-rad/2,y-rad/2,rad,rad);
  fillrect();
  if (((int)x==(int)tx)&&((int)y==(int)ty)) {
    getNewTarget();
  }
  stroke(200,100,100);
  strokeWeight(5);
  point(tx,ty);
  float cx=x-tx;
  float cy=y-ty;
  if (abs(cx)>abs(cy)){
    cy=cy/abs(cx);
    cx=cx/abs(cx);
  }
  else{
    cx=cx/abs(cy);
    cy=cy/abs(cy);
  }
  if (run){
  x=x-cx;
  y=y-cy;
  }
  
  if (check()){
    setup();
  }
}

boolean check(){
  float bump = rad+10;
  if (tx+rad+bump>width) return true;
  if (ty+rad+bump>height) return true;
  if (tx-rad-bump<0) return true;
  if (ty-rad-bump<0) return true;
  return false;
}

void fillrect(){
  for(int i=-(rad/2);i<=rad/2;i++){
    for(int j=-(rad/2);j<=rad/2;j++){
      map[(int)x+i][(int)y+j]=true;
    }
  }
}

void getNewTarget(){
  
  float mx=tx, my=ty;
  float min=999999;
  for(int i=0;i<width;i++){
    for(int j=0;j<height;j++){
      if (!map[i][j]){
        if (min>dist(width/2,height/2,i,j)){
          min=dist(width/2,height/2,i,j);
          mx=i;my=j;
        }
      }
    }
  }
  
  tx=mx;ty=my;
}

