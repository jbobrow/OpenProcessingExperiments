
float gravity = 0.8;
Ball[] Balls;


void setup() {
  size (800, 450);
  background(30);
  Balls = new Ball[100];
  PVector aux;
  for (int i = 0; i<Balls.length; i++) {
    aux = new PVector(random(width), random(height));
    Balls[i] = new Ball(aux, new PVector(random(10),random(10)),int(random(255)), int(random(255)), int(random(255)));
  }
}

void draw () {
  background(30);
  for (int i = 0; i<Balls.length; i++) {
    Balls[i].Udpate();
  }
}

class Ball {
  PVector direction;
  PVector position;
  int R, G, B;
  Ball (PVector iposition, PVector idirection, int iR, int iG, int iB){
    R=iR;
    G=iG;
    B=iB;
    direction = idirection;
    position = iposition;
  }
  
  void Udpate(){
    direction.y = direction.y + gravity;
    position.x += direction.x;
    position.y += direction.y; 
    
    fill (R, G, B);
    ellipse (position.x, position.y, 20, 20);
    
    if (position.x >= width) {direction.x = -direction.x;}
    if (position.x <= 0) {direction.x = -direction.x;}
    
    if (position.y > height) {
      direction.y = -abs(direction.y);
      if (abs(direction.y)<1) {
        direction.y=0;
      }
      position.y = height;
    }
  } 
}

