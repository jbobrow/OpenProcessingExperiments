
int arcNo = 25;
color[] strk = new color[arcNo];
Circle[] circle = new Circle[arcNo];
void setup(){
  size (500,500);
  frameRate(60);
  noFill();
  stroke(255,255,255,170);
  strokeCap(SQUARE);
  for (int x = 0; x < circle.length; x++){
    strk[x] = int(random(1,20));
    circle[x] = new Circle();
  }
}
void draw(){
  background(0);
  for (int x = 0; x < circle.length; x++){
    strokeWeight(strk[x]);
    circle[x].display();
    if(x % 2 == 0){
      circle[x].movePos();
    }
    else{
      circle[x].moveNeg();
    }
  }
}
class Circle {
  //color strk;
  PVector range;
  float size;
  float centerX = width / 2;
  float centerY = height / 2;
  PVector addRange = new PVector(0, PI);
  PVector move = new PVector(PI / 90, PI / 90);
  Circle(){
    range = new PVector(random(0, PI), random (.5 * PI, 1.5 * PI));
    range.add(addRange);
    size = 50 * int(random(1,9));
    size += random(-10,10);
  }
  void display(){
      arc(centerX, centerY, size, size, range.x, range.y);
  }
  void movePos(){
    range.add(move);
  }
  void moveNeg(){
    range.sub(move);
  }
}
