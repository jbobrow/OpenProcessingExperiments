
float d =0;
float x, y;
int length=int(random(20, 50));
ArrayList <PVector> list = new ArrayList <PVector> () ;
void setup() {
  size(600, 450);
  frameRate(75);
}
void draw() {
  background(0);
  x+=sin(d)*5;
  y+=cos(d)*5;
  if(keyPressed && keyCode == LEFT) {
    d+=0.1;
  }
    if(keyPressed && keyCode == RIGHT) {
      d-=0.1;
    }
  if(x<0-25) {
    x=width;
  }
  if(x>width+25) {
    x=0;
  }
  if(y>height+25) {
    y=0;
  }
  if(y<0-25) {
    y=height;
  }
  text(list.size(), 200, 200);
  list.add(new PVector(x, y));
  for(int i = 0; i < list.size(); i++) {
    ellipse(list.get(i).x, list.get(i).y, 25, 25);
  }
  if(list.size() > int(length)) {
    list.remove(1);

  }
}
