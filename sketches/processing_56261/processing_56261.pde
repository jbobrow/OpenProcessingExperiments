
float gravity = 0.8;
float CRestitution = 1;
Ball[] Balls;


void setup() {
  size (800, 450);
  background(30);
  Balls = new Ball[10];
  PVector aux;
  for (int i = 0; i<Balls.length; i++) {
    aux = new PVector(random(width), random(height));
    Balls[i] = new Ball(aux, new PVector(random(10),random(10)), int(random(5,15)),int(random(255)), int(random(255)), int(random(255)));
  }
}

void draw () {
  background(30);
  for (int i = 0; i<Balls.length; i++) {
    
    DetectCollisions (i, Balls);
    Balls[i].Udpate();
  }
}


class Ball {
  PVector direction;
  PVector position;
  float r;
  float mass;
  int R, G, B;
  Ball (PVector iposition, PVector idirection, int radio, int iR, int iG, int iB){
    R=iR;
    G=iG;
    B=iB;
    r=radio;
    mass = 3.14159*r*r;
    direction = idirection;
    position = iposition;
  }
  
  void Udpate(){
    direction.y = direction.y + gravity;
    position.x += direction.x;
    position.y += direction.y; 
    
    fill (R, G, B);
    ellipse (position.x, position.y, 2*r, 2*r);
    
    if (position.x >= width) {direction.x = -direction.x;}
    if (position.x <= 0) {direction.x = -direction.x;}
    
    if (position.y > height - r) {
      direction.y = -abs(direction.y);
      if (abs(direction.y)<1) {
        direction.y=0;
      }
      position.y = height - r;
    }
  } 
}
void DetectCollisions (int myIndex, Ball[] Balls) {
  float ui, uj, vi, vj;
  float d, r;
  int j = myIndex;
  for (int i = 0; i<Balls.length; i++) {
    if (i!=j) {
      if (dist(Balls[i].position.x,Balls[i].position.y, Balls[j].position.x, Balls[j].position.y)<(Balls[i].r+Balls[j].r)){
        d = dist(Balls[i].position.x,Balls[i].position.y, Balls[j].position.x, Balls[j].position.y);
        r = Balls[i].r+Balls[j].r;
        //Calcular nova velocitat
        ui = Balls[i].direction.x;
        uj = Balls[j].direction.x;          
        Balls[i].direction.x = (CRestitution*Balls[j].mass*(uj-ui) + Balls[i].mass*ui + Balls[j].mass*uj)/( Balls[i].mass + Balls[j].mass);
        Balls[j].direction.x = (CRestitution*Balls[i].mass*(ui-uj) + Balls[i].mass*ui + Balls[j].mass*uj)/( Balls[i].mass + Balls[j].mass);
        ui = Balls[i].direction.y;
        uj = Balls[j].direction.y;          
        Balls[i].direction.y = (CRestitution*Balls[j].mass*(uj-ui) + Balls[i].mass*ui + Balls[j].mass*uj)/( Balls[i].mass + Balls[j].mass);
        Balls[j].direction.y = (CRestitution*Balls[i].mass*(ui-uj)+ Balls[i].mass*ui + Balls[j].mass*uj)/( Balls[i].mass + Balls[j].mass);
        
      }
    }
  }
}
