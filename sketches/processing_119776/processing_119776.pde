
int count = 10;
Ball[] ball = new Ball[count];

void setup(){
  size(400, 300);
  background(204);
  smooth();
  for(int i=0; i<10; i++){
    ball[i] = new Ball(random(width), random(50, height-50), random(10, 40), random(20));
  }
}
void draw(){
  background(204);
  for(int i=0; i<count; i++){
    ball[i].showBall();
    ball[i].moveBall();
  }
}

class Ball{
  float posx, posy;
  float x,y;
  float shinpuku;
  float ang;
  Ball(float _posx, float _posy, float _shinpuku, float _ang){
    x = _posx;
    posy = _posy;
    shinpuku = _shinpuku;
    ang = _ang;
  }
  void moveBall(){
    y = shinpuku * sin(ang) + posy;
    ang+=0.04;
  }
  void showBall(){
    ellipse(x, y, 10, 10);
  }
}
  


