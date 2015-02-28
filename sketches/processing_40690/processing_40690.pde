
// -*-c-*-

class Bom {
  color c;
  float x,y,vx,vy;
  float r;
  int timer;
  float v0 = 2;
  
  Bom(float x, float y){
    this.x = x;
    this.y = y;
    vx = 0;
    vy = 0;
    r = 40;
    c = color(random(0,100), 100, 100);
    timer = (int)random(10,300);
    // timer = 100;
  }

  boolean update(){
    vy += world.g;
    x += vx;
    y += vy;

    if(--timer < 0){
      if(r > 4){
	explode();
	return false;
      }
    }
    return true;
  }
  
  void draw(){
    noStroke();
    fill(c);
    ellipse(x, y, r, r);
  }

  void explode(){
    int noc = 10;
    if(world.boms.size() > 2000) noc = 5;
    for(int i=0;i<noc;i++){
      Bom b = new Bom(x,y);
      b.vx = random(-v0,v0);
      b.vy = random(-v0,v0);
      b.r =  r / 2;
      b.c = c;
      world.add(b);
    }
  }
  
}

