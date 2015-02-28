
// -*-c-*-

class Bom {
  color c;
  float x,y,vx,vy;
  float r;
  float k = 0.8;
  int timer;
  float v0 = 1.2;
  
  Bom(float x, float y){
    this.x = x;
    this.y = y;
    vx = 0;
    vy = 0;
    r = 40;
    c = color(random(0,100), 100, 100, 50);
    timer = (int)random(10,300);
  }

  boolean update(){
    vy += world.g;
    x += vx;
    y += vy;

    if(--timer < 0){
      if(explode()) return false;
      if(false){
	r *= 0.5;
	if(r < 1) return false;
	timer = (int)random(10,300);
      }
    }
    return true;
  }
  
  void draw(){
    noStroke();
    fill(c);
    ellipse(x, y, r, r);
  }

  boolean explode(){
    if(r > 10){
      int noc = 10;
      if(world.boms.size() > 2000) noc = 5;
      int t = (int)random(50,300);
      for(int i=0;i<noc;i++){
	Bom b = new Bom(x,y);
	b.vx = random(-v0,v0) + vx * k;
	b.vy = random(-v0,v0) + vy * k;
	if(b.y > height && b.vy > 0)
	  b.vy = -b.vy;
	b.r =  r / 2;
	b.c = c;
	b.timer = t;
	world.add(b);
      }
      return true;
    }
    return false;
  }
  
}

