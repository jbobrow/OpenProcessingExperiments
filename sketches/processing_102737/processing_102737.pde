
int num,cnt,px,py;
Particle[] particles;
boolean initialised=false,doClear=false;
float lastRelease=-1;
Maxim maxim;
AudioPlayer player;
float power=0;
float threshold = 0.35;
int wait = 0;
boolean playit = false;
 
void setup() {
  size(800 ,600);
  background(255);
  smooth();
  rectMode(CENTER_DIAMETER);
  ellipseMode(CENTER_DIAMETER);
     
  cnt=0;
  num=150;
  particles=new Particle[num];
  for(int i=0; i<num; i++) particles[i]=new Particle();
 
  px=-1;
  py=-1;
  
  frameRate(20);
  maxim = new Maxim(this);
  player = maxim.loadFile("PudhuVellai.mp3");
  player.setLooping(true);
  player.setAnalysing(true);
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
    strokeWeight(3);
    translate(width/2-28,height/2-3);
     
    scale(3,4);
     
    popMatrix();
    
  if (true) {
    fill(255);
    player.play(); 
    power = player.getAveragePower(); 
    if (power>threshold && wait < 0) {
    wait=4;
     int partNum,i;
    float dir;
    if(px==-1) {
      px=mouseX;
      py=mouseY;
      dir=0;
    doClear=true;
    initialised=true;
      float time=millis();
  if(lastRelease!=-1 && (time-lastRelease)<200) {
    doClear=true;
    for(int i=0; i<num; i++) particles[i].age=0;
    lastRelease=-1;
  }
  else lastRelease=time;
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
  }else{
        int partNum,i;
    float dir;
     
    if(px==-1) {
      px=int(random(power))*10;;
      py=int(random(power))*10;;
      dir=0;
    }
    else if(px && py) dir=int(random(36))*10;
    else dir=degrees(atan2(mouseY-py,mouseX-px))-90;
   
    i=0;
    while(i<num) {
      if(particles[i].age<1) {
        particles[i].init(dir);
        break;
      }
      i++;
    }
      px=int(random(1/power))*10;;
      py=int(random(1/power))*10;;
  }
  wait--;
  }
  }
   
  noStroke();
   
  for(int i=0; i<num; i++)
    if(particles[i].age>0) particles[i].update();
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
    if(col==0) fill(150-age+50,0,100,150);
    else fill(100,100-(age/2)+50,255-age,150);
       
    pushMatrix();
    translate(v.x,v.y);
    rotate(radians(dir));
    rect(2,2,1,16);
    popMatrix();
     
    if(age==0) {
      if(random(100)>50) fill(220,0,0,200);
      else fill(20,200,255,200);
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



