
Particle part[];
int num;

void setup() {
  size(920,480);

  num=100;  
  part=new Particle[num];
  for(int i=0; i<num; i++) {
    if(random(100)>70) 
      part[i]=new StraightParticle(random(width),random(height));
    else 
      part[i]=new CurveParticle(random(width),random(height));
  }

  // Check to see what type of subclass is in use
  int cnt=0;
  for(int i=0; i<num; i++) if(part[i] instanceof StraightParticle) cnt++;
  
  println("StraightParticles: "+cnt);
  println("CurveParticles: "+(num-cnt));
}

void draw() {
//  background(200);
  for(int i=0; i<num; i++) part[i].update();
  for(int i=0; i<num; i++) part[i].draw();
}
class CurveParticle extends Particle {
  float dirD;
  
  public CurveParticle(float _x,float _y) {
    super(_x,_y);
    
    dir=random(360);
    dirD=random(0.2,1);
    if(random(100)>50) dirD=-dirD;
    
    speed=random(1,2);
    rad=10;
  }
  
  void update() {
    dir+=dirD;
    x=x+cos(radians(dir))*speed;
    y=y+sin(radians(dir))*speed;
    limitToScreen();
  }
  
  void draw() {
    ellipse(x,y, rad,rad);
  }
}
class Particle {
  float x,y,speed,dir,rad;
  
  public Particle(float _x,float _y) {
    x=_x;
    y=_y;
  }
  
  void update() {
  }
  
  void limitToScreen() {
    if(x<0) x=width;
    else if(x>width) x=0;
    if(y<0) y=height;
    else if(y>height) y=0;
  }
  
  void draw() { 
  }
}
class StraightParticle extends Particle {
  
  public StraightParticle(float _x,float _y) {
    super(_x,_y);
    
    dir=random(360);
    speed=random(1,2);
    rad=10;
  }
  
  void update() {
    x=x+cos(radians(dir))*speed;
    y=y+sin(radians(dir))*speed;
    limitToScreen();
  }
  
  void draw() {
    ellipse(x,y, rad,rad);
  }
}

