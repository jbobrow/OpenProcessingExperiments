
int x,y;
int r=0;
int sz=30;

void setup() {
  size(500, 500);
  ellipseMode(CENTER);
  smooth();
  noStroke();
  fill(255);
}

void draw(){
  background(0);
  for(y=1;y<12; y++){
    for(x=1;x<12;x++){
      arc(x*(sz+4)+45, y*(sz+4)+45,sz,sz, 0+radians(r)+((x+y)*.33), PI+radians(r)+((x+y)*.33));
    }
  }
  r+=6;
}
