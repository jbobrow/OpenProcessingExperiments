
int N = 50;
int M = 1;
int P = 50;

Particle[][][] p = new Particle[N][M][P];
ArrayList<Spring> s = new ArrayList();

float r = 100;
float pow = 0.02;

float l = 5;
float l2 = l*sqrt(2);
float l3 = l*sqrt(3);
final float oX = -100;
final float oY = 0;
final float oZ = -200;
float k = 0.1;
float b = 0.98;
boolean isStarted = true;
PVector g = new PVector(0,0);
PVector F = new PVector(0,0);

void setup(){
  size(800,600,P3D);
  
  rectMode(CENTER);
  
  for(int i=0; i<N; i++){
    for(int j=0; j<M; j++){
      for(int k=0; k<P; k++){
        p[i][j][k] = new Particle(oX+i*l, oY+l*j, oZ+l*k);
      }
    }
  }
  
  //p[8].pos.y += 30;
  //p[N+8].pos.y += 30;
  
  // fix points -- x
  for(int j=0; j<M; j++){
    for(int k=0; k<P; k++){
      p[0][j][k].fix();
      p[N-1][j][k].fix();
    }
  }
  
  // fix points -- z
  for(int i=0; i<N; i++){
    for(int j=0; j<M; j++){
      p[i][j][0].fix();
      p[i][j][P-1].fix();
    }
  }
  
  
  
  // bind x-axis
  for(int i=0; i<N-1; i++){
    for(int j=0; j<M; j++){
      for(int k=0; k<P; k++){
        s.add(new Spring(p[i][j][k],p[i+1][j][k],l));
      }
    }
  }
  
  // bind y-axis
  for(int i=0; i<N; i++){
    for(int j=0; j<M-1; j++){
      for(int k=0; k<P; k++){
        s.add(new Spring(p[i][j][k],p[i][j+1][k],l));
      }
    }
  }
  
  // bind z-axis
  for(int i=0; i<N; i++){
    for(int j=0; j<M; j++){
      for(int k=0; k<P-1; k++){
        s.add(new Spring(p[i][j][k],p[i][j][k+1],l));
      }
    }
  }
  
  // bind cross -- xy
  for(int i=0; i<N-1; i++){
    for(int j=0; j<M-1; j++){
      for(int k=0; k<P; k++){
        s.add(new Spring(p[i][j][k], p[i+1][j+1][k],l2));
        s.add(new Spring(p[i+1][j][k], p[i][j+1][k],l2));
      }
    }
  }
  
  // bind cross -- yz
  for(int i=0; i<N; i++){
    for(int j=0; j<M-1; j++){
      for(int k=0; k<P-1; k++){
        s.add(new Spring(p[i][j][k], p[i][j+1][k+1],l2));
        s.add(new Spring(p[i][j+1][k], p[i][j][k+1],l2));
      }
    }
  }
  
  // bind cross -- yz
  for(int i=0; i<N; i++){
    for(int j=0; j<M-1; j++){
      for(int k=0; k<P-1; k++){
        s.add(new Spring(p[i][j][k], p[i][j+1][k+1],l2));
        s.add(new Spring(p[i][j+1][k], p[i][j][k+1],l2));
      }
    }
  }
  
  // bind cross -- zx
  for(int i=0; i<N-1; i++){
    for(int j=0; j<M; j++){
      for(int k=0; k<P-1; k++){
        s.add(new Spring(p[i][j][k], p[i+1][j][k+1],l2));
        s.add(new Spring(p[i][j][k+1], p[i+1][j][k],l2));
      }
    }
  }
  
  // bind cross -- xyz
  for(int i=0; i<N-1; i++){
    for(int j=0; j<M-1; j++){
      for(int k=0; k<P-1; k++){
        s.add(new Spring(p[i][j][k], p[i+1][j+1][k+1],l3));
        s.add(new Spring(p[i+1][j][k], p[i][j+1][k+1],l3));
        
        s.add(new Spring(p[i][j+1][k], p[i+1][j][k+1],l3));
        s.add(new Spring(p[i+1][j+1][k], p[i][j][k+1],l3));
      }
    }
  }
  
}

void draw(){
  background(255);
  
  //F.x = 0.003*sin(frameRate/10.0);
  //F.y = 0.01*sin(frameRate/10.0)+0.01;
  
  if(random(1000)<5){
    pow = random(0.01, 0.03);
    r = random(200) + 20;
  }
  
  if(frameCount%r<r/2) F.y = -pow;
  else F.y = pow;
  
  for(Spring _s : s){
    if(_s!=null){
      _s.update();
    }
  }
  
  for(Particle[][] pss : p){
    for(Particle[] ps : pss){
      for(Particle _p : ps){
      
    if(_p!=null){
      _p.update();
      _p.draw();
    }
    
      }
    }
  }
  
  for(Spring _s : s){
    if(_s!=null){
      //_s.draw();
    }
  }
  
  camera(mouseX-width/2, mouseY-height/2, 220.0, // 視点X, 視点Y, 視点Z
  0.0, 0.0, 0.0, // 中心点X, 中心点Y, 中心点Z
  0.0, 1.0, 0.0); // 天地X, 天地Y, 天地Z
}

void mousePressed(){
  isStarted = true;
}



class Spring{
  Particle p1;
  Particle p2;
  float len;
  
  Spring(Particle _p1, Particle _p2, float _len){
    p1 = _p1;
    p2 = _p2;
    len = _len;
  }
  
  void update(){
    if(!isStarted) return;
    
    float dx = PVector.dist(p1.pos, p2.pos) - len;
  
    PVector f = PVector.sub(p2.pos, p1.pos);
    f.normalize();
    f.mult(-k*dx);
    
    p1.vel.sub(f);
    p1.vel.sub(f);
    p2.vel.add(f);
    p2.vel.add(f);
  }
  
  void draw(){
    stroke(100);
    line(p1.pos.x, p1.pos.y, p1.pos.z, p2.pos.x, p2.pos.y, p2.pos.z);
  }
}

class Particle{
  PVector pos;
  PVector vel = new PVector(0,0);
  
  boolean fixed = false;
  
  Particle(float _x, float _y, float _z){
    pos = new PVector(_x, _y, _z);
  }
  
  void fix(){
    fixed = true;
  }
  
  void update(){
    if(!isStarted) return;
    if(fixed) return;
    pos.add(vel);
    vel.mult(b);
    vel.add(g);
    vel.add(F);
  }
  
  void draw(){
     stroke(pos.x, pos.y, pos.z);
     pushMatrix();
     translate(pos.x, pos.y, pos.z);
     point(0,0,0);
     //box(2);
     popMatrix();
  }
}

