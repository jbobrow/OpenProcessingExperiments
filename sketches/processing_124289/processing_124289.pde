
ring[] rs;
int num=100;
int current=0;
void setup() {
  size(500, 500);
  smooth();

  rs=new ring[num];
  for (int i=0;i<num;i++) {
    rs[i]=new ring();
  }
}
void draw() {
      fill(5, 40, 60,20);
    rect(0, 0, width, height);
  for (int i=0;i<num;i++) {

    rs[i].grow();
    rs[i].display();
  }

}
void mousePressed() {
  rs[current].start(mouseX, mouseY);
  current++;
  if (current>=num) {
    current=0;
  }
}

class ring {
  float x, y, d;
  boolean on=false;
  void start(float xp, float yp) {
    x=xp;
    y=yp;
    on=true;
    d=1;
  }
  void grow() {
for(float g=1.0;g>0.1;g--){
    if (on == true) {
      d+=g;
      if (d>1000) {
        on=false;
      }
    }
  }
  }
  void display() {
    if (on==true) {
          fill(5, 40, 60,40);
    rect(0, 0, width, height);
       fill(5, 40, 60,30);
      strokeWeight(3.5);
      stroke(80, 120,180,150);
      ellipse(x, y, d, d);
      strokeWeight(3);
      ellipse(x, y, d+10, d+10);
      strokeWeight(2);
      ellipse(x, y, d+18, d+18);
      strokeWeight(1);
      ellipse(x, y, d+23, d+23);
    }
  }
}



