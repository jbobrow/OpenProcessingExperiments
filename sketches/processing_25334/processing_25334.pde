
void setup() {
  size(900,900);
  smooth();
  stroke(0,100);
  strokeWeight(5);
}
float x = 0;
float y = 0;
void draw() {
  int space = 5;
  int count = 0;

  while (count <200) {
    noFill();
    arc (x,count*space,200,140,0,radians (180));
    count = count+1;
  }
  count = 0;
  while (count <200) {
    arc (x,count*space,200,140,radians (180),radians (360));
    count = count+1;
  }
  x = x + 200;

count = 0;
while (count <200) {
  noFill();
  arc (count*space,y,140,200,radians (90),radians (270));
  count = count+1;
}
y=y+200;
}


