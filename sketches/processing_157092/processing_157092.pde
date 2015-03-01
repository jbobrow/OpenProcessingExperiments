
Particle[] p = new Particle[5000];
int vmax = 10;
int vmin = 2;

void setup(){
  size(800, 600);
  for(int i = 0; i < 500; i++){
    p[i] = new Particle((int)random(800), (int)random(600), (int)random(vmin, vmax), (int)random(vmin, vmax), (int)random(255), (int)random(255), (int)random(255));
  }
}

void draw(){
  background(255);
  for(int i = 0; i < 500; i++){
    p[i].draw();
    p[i].move();
  }
}
class Particle{
  int px;
  int py;
  int vx;
  int vy;
  int cr;
  int cg;
  int cb;
  
  Particle(int px, int py, int vx, int vy, int cr, int cg, int cb){
    this.px = px;
    this.py = py;
    this.vx = vx;
    this.vy = vy;
    this.cr = cr;
    this.cg = cg;
    this.cb = cb;
  }
  
  void draw(){
    noStroke();
    fill(cr, cg, cb);
    ellipse(px, py, 10, 10);
  }
  
  void move(){
    px += vx;
    if(px > width - 10){
      px = width - 10;
      vx = -vx;
    }else if(px < 10){
      px = 10;
      vx = -vx;
    }
    
    py += vy;
    if(py > height - 10){
      py = height - 10;
      vy = -vy;
    }else if(py < 10){
      py = 10;
      vy = -vy;
    }
  }
}


