
PGraphics pg;
final int MAX = 1000;

double ang = 0;

class V{
  PVector pos = new PVector();
  double a;
  int r;
  int g;
  int b;
  PVector vec = new PVector();
  boolean live = false;
  int size;
  
  V(){
  }
  
  void init(){
    pos = new PVector(-300, -300);
    vec = new PVector(random(4) + 0.2, random(4) + 0.2);
    a = 255;
    r = (int)random(128) + 127;
    g = (int)random(128) + 127;
    b = (int)random(128) + 127;
    live = true;
  }
  
  void create(float x, float  y, float vx, float vy, double _a, double _r, double _g, double _b){
    pos = new PVector(x, y);
    vec = new PVector(vx, vy);
    a = (int)_a;
    r = (int)_r;
    g = (int)_g;
    b = (int)_b;    
    live = true;
    size = (int)random(20);
  }
  
  void action(PGraphics pg){
    if(live){
      act();
      draw(pg);
    }
  }
  
  void act(){
    pos.add(vec);
    if(a <= 0){
      live = false;
    }    
    a-= 2;
  }

  void draw(PGraphics px){  
    pg.fill(r,g,b,(int)a);
    pg.rect(pos.x, pos.y, size, size);
  }
};

V[] v = new V[MAX];
int next = 0;

int getNext(){
  next++;
  if(next >= MAX){
    next = 0;
  }
  return next;
}

void create(){
  if(random(1) < 0.1){
    int type = (int)random(2);
    int h = (int)random(255);
    switch(type){
      case 0:
        {
          int nx = (int)random(10) + 1;
          int ny = (int)random(10) + 1;
          for(int x = 1; x < (int)random(20); x++){
            for(int y = 1; y < (int)random(10); y++){
              int id = getNext();
              v[id].create(-x * nx, y * ny, x * nx / 5, y * ny / 5, 255, h, 128, 255);
            }
          }
        }
      break;
      case 1:
        {
          int nx = (int)random(10) + 1;
          int ny = (int)random(10) + 1;
          for(int x = 1; x < (int)random(20); x++){
            for(int y = 1; y < (int)random(20); y++){
              int id = getNext();
              v[id].create(-x * nx, 0, x * nx / 5, y / 2.0, 255, h, 128, 255);
            }
          }
        }
      break;
      case 2:
        {
          int nx = (int)random(10) + 1;
          int ny = (int)random(10) + 1;
          for(int x = 1; x < (int)random(20); x++){
            for(int y = 1; y < (int)random(20); y++){
              int id = getNext();
              v[id].create(0, y * ny, x * nx / 5, y / 2.0, 255, h, 128, 255);
            }
          }
        }
      break;
    }
  }
}
 
void setup(){
  size(400, 400, OPENGL);
  noStroke();   
  pg = createGraphics(width, height);
 
 for(int i = 0; i < MAX; i++){
    v[i] = new V();
  }
}

void draw(){
  ang += 0.5;
  
  create();
  
  //  paint texture
  pg.beginDraw();
  pg.noStroke();
  pg.colorMode(HSB, 255);
  pg.background(0, 0, 0);
  for(int i = 0; i < MAX; i++){
    v[i].action(pg);
  }
  pg.endDraw();
 
  //  create shape
  beginShape(TRIANGLE_FAN);
  texture(pg.get());
  vertex(width / 2, height / 2, 0, 0, 0);
  for(int i = 0; i <= 180; i++){
     
    float x = cos(radians(i * 2)) * width / 2 + width / 2;
    float y = sin(radians(i * 2)) * height / 2 + height / 2;
     
    float td = abs((i * 2 + (int)ang) % 120 - 60);
    float tx = cos(radians(td)) * width / 2 + width / 2;
    float ty = sin(radians(td)) * width / 2 + width / 2;
    vertex(x, y, 0, tx, ty);
  } 
  endShape(CLOSE);
   
}
