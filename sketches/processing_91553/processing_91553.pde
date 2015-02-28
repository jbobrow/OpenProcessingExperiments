
int i = 0;
int num = 50;
PVector vel = new PVector(3.5, 6);
PVector po2 = new PVector(200, 200);
mr[] array = new mr[(num*num)+1];
void setup() {
size(400, 400);
for(int y = 0; y < num; y ++) {
  for(int x = 0; x < num; x++) {
    i++;
    array[i] = new mr(x*width/num, y*width/num, width/num, height/num);
  }
}
}

void draw() {
  po2.x+=vel.x;
  po2.y+=vel.y;
  if(po2.x<0+30 || po2.x>width-30) {
    vel.x*=-1;
  }
  if(po2.y<0+30 || po2.y>height-30) {
    vel.y*=-1;
  }
  i = 0;
for(int y = 0; y < num; y ++) {
  for(int x = 0; x < num; x++) {
    i++;
    array[i].why();
  }
}
}
class mr {
  float x, y, w, h;
  mr(float xv, float yv, float wv, float hv) {
    x=xv;
    y=yv;
    w=wv;
    h=hv;
  }
  void why() {
    if(mousePressed) {
      if(dist(x, y, po2.x, po2.y) < 30) {
        fill(255);
      }
        else {
          fill(0);
        }
        stroke(255);
    }
        else {
          
      if(dist(x, y, po2.x, po2.y) < 30) {
        fill(0);
      }
        else {
          fill(255);
        }
        stroke(0);
        }
    rect(x, y, w, h);
  }
}
