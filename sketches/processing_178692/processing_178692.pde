
int num,cnt,px,py;
Particle[] particles;
boolean initialised=false,doClear=false;
float lastRelease=-1;
  
void setup() {
  size(800,400);
  background(200);
  smooth();
  rectMode(CENTER_DIAMETER);
  ellipseMode(CENTER_DIAMETER);
      
  cnt=0;
  num=150;
  particles=new Particle[num];
  for(int i=0; i<num; i++) particles[i]=new Particle();
  
  px=-1;
  py=-1;
}
  
void draw() {
  if(doClear) {
    background(255);
    doClear=false;
  }
    
  if(!initialised) {
    stroke(0);
    noFill();
    pushMatrix();
    strokeWeight(2);
    translate(width/2-28,height/2-3);
      
    scale(2,2);
    beginShape();
    vertex(5,0);
    vertex(0,0);
    vertex(0,5);
    vertex(5,5);
    endShape();
    beginShape();
    vertex(8,-3);
    vertex(8,5);
    endShape();
    line(11,-3,11,-1);
    beginShape();
    vertex(11,0);
    vertex(11,5);
    endShape();
    beginShape();
    vertex(19,0);
    vertex(14,0);
    vertex(14,5);
    vertex(19,5);
    endShape();
    line(22,-3, 22,5);
    line(22,2, 24,2);
    line(24,2, 27,-1);
    line(24,2, 27,5);
      
    popMatrix();
  }
    
  noStroke();
/*
  if(!mousePressed) cnt++;
  if(cnt@==0 && !mousePressed) {
    fill(255,255,255,20);
    rect(width/2,height/2,1024,768);
  }
*/
  
  if(mousePressed) {
    int partNum,i;
    float dir;
      
    if(px==-1) {
      px=mouseX;
      py=mouseY;
      dir=0;
    }
    else if(px==mouseX && py==mouseY) dir=int(random(36))*10;
    else dir=degrees(atan2(mouseY-py,mouseX-px))-90;
    
    i=0;
    while(i<num) {
      if(particles[i].age<1) {
        particles[i].init(dir);
        break;
      }
      i++;
    }
      
    px=mouseX;
    py=mouseY;
  }
    
  for(int i=0; i<num; i++)
    if(particles[i].age>0) particles[i].update();
}
  
void mousePressed() {
  if(!initialised) {
    doClear=true;
    initialised=true;
  }
  
  float time=millis();
  if(lastRelease!=-1 && (time-lastRelease)<200) {
    doClear=true;
    for(int i=0; i<num; i++) particles[i].age=0;
    lastRelease=-1;
  }
  else lastRelease=time;
}
  
  
class Particle {
  Vec2D v,vD;
  float dir,dirMod,speed;
  int col,age,stateCnt;
    
  Particle() {
    v=new Vec2D(0,0);
    vD=new Vec2D(0,0);
    age=0;
  }
  
  void init(float _dir) {
    dir=_dir;
  
    float prob=random(100);
    if(prob<80) age=15+int(random(30));
    else if(prob<99) age=45+int(random(50));
    else age=100+int(random(100));
      
    if(random(100)<80) speed=random(2)+0.5;
    else speed=random(2)+2;
  
    if(random(100)<80) dirMod=20;
    else dirMod=60;
      
    v.set(mouseX,mouseY);
    initMove();
    dir=_dir;
    stateCnt=10;
    if(random(100)>50) col=0;
    else col=1;
  }
      
  void initMove() {
    if(random(100)>50) dirMod=-dirMod;
    dir+=dirMod;
      
    vD.set(speed,0);
    vD.rotate(radians(dir+90));
  
    stateCnt=10+int(random(5));
    if(random(100)>90) stateCnt+=30;
  }
    
  void update() {
    age--;
      
    if(age>=30) {
      vD.rotate(radians(1));
      vD.mult(1.01f);
    }
      
    v.add(vD);
    if(col==0) fill(255-age,0,100,150);
    else fill(100,200-(age/2),255-age,150);
        
    pushMatrix();
    translate(v.x,v.y);
    rotate(radians(dir));
    rect(0,0,1,16);
    popMatrix();
      
    if(age==0) {
      if(random(100)>50) fill(200,0,0,200);
      else fill(00,200,255,200);
      float size=2+random(4);
      if(random(100)>95) size+=5;
      ellipse(v.x,v.y,size,size);
    }
    if(v.x<0 || v.x>width || v.y<0 || v.y>height) age=0;
      
    if(age<30) {
      stateCnt--;
      if(stateCnt==0) {
        initMove();
      }
    }
   }
    
}
  
// General vector class for 2D vectors
class Vec2D {
  float x,y;
  
  Vec2D(float _x,float _y) {
    x=_x;
    y=_y;
  }
  
  Vec2D(Vec2D v) {
    x=v.x;
    y=v.y;
  }
  
  void set(float _x,float _y) {
    x=_x;
    y=_y;
  }
  
  void set(Vec2D v) {
    x=v.x;
    y=v.y;
  }
  
  void add(float _x,float _y) {
    x+=_x;
    y+=_y;
  }
  
  void add(Vec2D v) {
    x+=v.x;
    y+=v.y;
  }
  
  void sub(float _x,float _y) {
    x-=_x;
    y-=_y;
  }
  
  void sub(Vec2D v) {
    x-=v.x;
    y-=v.y;
  }
  
  void mult(float m) {
    x*=m;
    y*=m;
  }
  
  void div(float m) {
    x/=m;
    y/=m;
  }
  
  float length() {
    return sqrt(x*x+y*y);
  }
  
  float angle() {
    return atan2(y,x);
  }
  
  void normalise() {
    float l=length();
    if(l!=0) {
      x/=l;
      y/=l;
    }
  }
  
  Vec2D tangent() {
    return new Vec2D(-y,x);
  }
  
  void rotate(float val) {
    // Due to float not being precise enough, double is used for the calculations
    double cosval=Math.cos(val);
    double sinval=Math.sin(val);
    double tmpx=x*cosval - y*sinval;
    double tmpy=x*sinval + y*cosval;
  
    x=(float)tmpx;
    y=(float)tmpy;
  }
}

