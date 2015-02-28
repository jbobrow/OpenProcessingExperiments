
int ballNum = 30;

ball b = new ball(12,10);
ball[] bs = new ball[ballNum];

void setup(){
  size(500,500);
  background(0);
  smooth();
  b.vx = 10;
  b.vy = 3;
  
  for(int i=0;i<ballNum;i++){
    bs[i] = new ball(random(0,width),random(0,height));
    bs[i].vx = random(-3,3);
    bs[i].vy = random(-3,3);
    bs[i].mass = random(5) + 5;
  }
  
}

void draw(){
  background(0);
 
  for(int i=0;i<ballNum-1;i++){
    for(int j=i+1;j<ballNum;j++){
      
      //gravity(bs[i], bs[j]);
      spring(bs[i], bs[j]);
    }
  }
  
  for(int i=0;i<ballNum;i++){
    bs[i].update();
  }
  
}

void gravity(ball ba, ball bb){
  float dx, dy, distSQ, dista, force, ax, ay;
  dx = bb.x - ba.x;
  dy = bb.y - ba.y;
  distSQ = dx*dx + dy*dy;
  
  dista = sqrt(distSQ);
  force = ba.mass * bb.mass / distSQ;
   
  ax = force * dx / dista;
  ay = force * dy / dista;
  ba.vx += ax / ba.mass;
  ba.vy += ay / ba.mass;
  bb.vx -= ax / bb.mass;
  bb.vy -= ay / bb.mass;
 
  stroke(255, 0, 0, 255-dista);
  if(dista < 255){
    line(ba.x, ba.y, bb.x, bb.y);
  }
  
}

  
void spring(ball ba, ball bb){
  float dx, dy, dista, force, ax, ay;
  float springAmount = 0.0001;
  dx = bb.x - ba.x;
  dy = bb.y - ba.y;
  dista = sqrt(dx*dx + dy*dy);
  if(dista < 255){
    ax = dx * springAmount;
    ay = dy * springAmount;  
    ba.vx += ax;
    ba.vy += ay;
    bb.vx -= ax;
    bb.vy -= ay;
  }
  stroke(255, 255, 0, 255-dista);
  if(dista < 255){
    line(ba.x, ba.y, bb.x, bb.y);
  }
}
  
class ball{
  float x, y;
  float vx = 0, vy = 0;
  float mass = 0;
  ball(float _x, float _y){//constractor
    x = _x;
    y = _y;
  }
  
  void update(){
    ellipse(x,y,10,10);
    x += vx;
    y += vy;
    
    if(x < 0){
      x = width;
    }
    if(x > width){
      x = 0;
    }
    if(y < 0){
      y = height;
    }
    if (y > height){
      //vy = -vy;
      y = 0;
    }
    
  }
}


