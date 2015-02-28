
Point p;
Point p2;
float C;
void setup(){
  size(900,450);
  background(0);
  stroke(255);
  smooth();
  C = 255;
  frameRate(300);
  p = new Point(0,20);
  p2 = new Point(0,40);
}
void draw(){
  p.draw();
  p2.draw();
  stroke(C);
  line(p.x,p.y,p2.x,p2.y);
}
class Point{
  float x;
  float y;
  Point(float _x, float _y){
    x = _x;
    y = _y;
  }
  void draw(){
    //point(x,y);
    if(x < width){
       x ++;
    }else{
      x = 0;
      y += 40;
      C -= 5;
    }
    if(y < height){
      y += sin(x*y);
    }
    else{
      y = 0;
      C = 255;
    }
  }
}
