
void setup() {
  size(900,900);
  background(255);
  smooth();
  stroke(0,50);
  strokeWeight(2);
}
float x = 0;
float y = 0;
void draw() {
  int space = 5;
  int count = 0;
  x = x+50;

  while (count <200) {
    noFill();
    arc (x,count*space,100,70,0,radians (180));
    count = count+1;
  }
  count = 0;
  x = x+50;
  while (count <200) {
    arc (x,count*space,100,70,radians (180),radians (360));
    count = count+1;
  }
  count=0;
  while (count <200) {
    noFill();
    arc (count*space,y,70,100,radians(90),radians (270));
    count = count+1;
  }
  count = 0;
  x = x+50;
  while (count <200) {
    arc (count*space,y,70,100,radians (270),radians (360+90));
    count = count+1;
  }
  y=y+50;
}  


