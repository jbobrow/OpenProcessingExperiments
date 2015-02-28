
PVector[] pts;
PVector[] vls;
int i=500;
float z = 255 / i;
void setup(){
  size(600,600);
  colorMode(HSB);
  pts = new PVector[i];
  vls = new PVector[i];
  for(int n=0; n<i; n++){
    pts[n] = new PVector(random(width),random(height));
    vls[n] = new PVector();
  }
}
void draw(){
  fill(0,0,0,10);
  rect(-1,-1,width+1,height+1);
  for(int n=0; n<i; n++){
    stroke(255);
    for(int m=0; m<10; m++){
      if(pts[n].dist(pts[m]) < 20){
        float ab = pts[n].dot(pts[m]);
        vls[n].add(new PVector(sin(ab),cos(ab)));
        line(pts[n].x,pts[n].y,pts[m].x,pts[m].y);
      }
    }
    
    if(n>10){
      vls[n].mult(.95);
    }else{
      vls[n].limit(5);
    }
    pts[n].add(vls[n]);
    pts[n].x %= width;
    pts[n].y %= height;
    stroke(n,255,255);
    point(pts[n].x,pts[n].y);
  }
}

