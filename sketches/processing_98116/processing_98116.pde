
int count = 300;
Line[] lines = new Line[count];

void setup() {
  size(512,512);
  smooth();
  stroke(255);
  for(int i=0; i<count; i++){
    lines[i] = new Line();
  }
}

void draw() {
  background(0);
  for(int i=0; i<count; i++){
    lines[i].update();
  }
}

class Line {
  int begin = 30;
  int start = begin;
  int stop = begin;
  int leng = int(random(10,100));
  int velo = int(random(1,10));
  float rot = random(0, TWO_PI);

  void update() {
    if(start>360){
      begin = 30;
      start = begin;
      stop = begin;
      leng = int(random(10,100));
      velo = int(random(1,10));
      rot = random(0, TWO_PI);
    }
    if(stop-start<leng){
      stop = stop + velo;
    }
    if(stop-start>=leng){
      start = start + velo;
      stop = stop + velo;
    }

    pushMatrix();
    translate(255,255);
    rotate(rot);
    line(0,start,0,stop);
    popMatrix();
  }
}
