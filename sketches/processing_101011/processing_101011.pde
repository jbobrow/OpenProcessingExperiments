
int arcNo = 40;
Circle[] circle = new Circle[arcNo];
void setup(){
  size (500,500);
  frameRate(60);
  noFill();
  stroke(0);
  strokeWeight(10);
  strokeCap(SQUARE);
  for (int x = 0; x < circle.length; x++){
    circle[x] = new Circle();
  }
}
void draw(){
  background(255);
  for (int x = 0; x < circle.length; x++){
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
    range = new PVector(random(0, 1.5 * PI), random (0, 1.5 * PI));
    range.add(addRange);
    size = 50 * random(1,8);
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
