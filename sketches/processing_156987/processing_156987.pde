
float point;

void setup(){
  size(500, 500);
  frameRate(30);
}

void draw(){
  background(100);
  point+=1;
  triangle(100, 100, 200, 200, point, 100);
}


