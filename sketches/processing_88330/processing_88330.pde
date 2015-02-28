

int x=300;
int y=0;
int dir;

void setup () {
  size(600, 600);
  background(0,0,0);
  smooth();
  stroke(255,255,255);
  strokeWeight(6);

}

void draw () {
  strokeWeight(1);
  point(x,y);
  dir=int(random(1,4));
    if (dir==1) {
    x=x+((300-x)/2);
    y=y-(y/2);
    }

    if (dir==2) {
    x=x-(x/2);
    y=y+((600-y)/2);
    }    

    if (dir==3) {
    x=x+((600-x)/2);
    y=y+((600-y)/2);
    }
}
  

