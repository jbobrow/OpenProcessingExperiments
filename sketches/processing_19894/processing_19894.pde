
int w = 400;
int h = 400;
int d = 400;
float sx,sy,sz;

void setup() {
  size(700, 600, P3D);
  frameRate(15);
  camera(w*2, h*2, d*2, 0, 0, 0, 0, 0, -1);
}

void draw() {
  background(255);
  rotateZ(frameCount*PI/360);
  line(-w*2,0,0,w*2,0,0);
  line(0,-h*2,0,0,h*2,0);
  line(0,0,-d*2,0,0,d*2);
  sx= sin(PI/360*frameCount) * random(w);
  sy= sin(PI/360*frameCount) * random(h);
  sz= sin(PI/360*frameCount) * random(d);
  int m = 2;
  fill(random(255));
  for(int k=-m;k<m+1;k++){
    for(int j=-m;j<m+1;j++){
      for(int i=-m;i<m+1;i++){
        pushMatrix();
        translate(w*i/m,h*j/m,d*k/m);
        box(sx/m*2,sy/m*2,sz/m*2);
        popMatrix();
      }
    }
  }
}



