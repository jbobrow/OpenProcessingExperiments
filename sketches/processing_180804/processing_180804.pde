
class projectile{
  float x,y,speed,angle,angleSpeed,damage;
  projectile(float px, float py, float pa, float ps, float d){
    x=px;
    y=py;
    angle=pa;
    speed=ps;
    damage=d;
  }
  void paint(){
    fill(255,0,0);
    noStroke();
  }
};

class Ship{
  float x,y,speed,speedX,speedY,angle,health;
  Ship(float sx, float sy, float ss, float sa){
    health = 100;
    x=sx;
    y=sy;
    speed=ss;
    angle=sa;
  }
  void paint(){
    translate(x,y);
    rotate(radians(angle));
    stroke(random(100,255),random(100,255),random(100,255));
    noFill();
    triangle(0, 0, 10, 30, -10, 30);
    rotate(-radians(angle));
  }
  void move(){
    speedX=speed*-1*sin(angle);
    speedY=speed*-1*cos(angle);
    x-=speedX;
    y-=speedY;
  }
  void slow_down(){
    if(speed>0)
      speed-=0.0025;
    if(speed<0)
      speed+=0.0025;
  }
  void update(){
    angle%=360;
    paint();
    slow_down();
    move();
  }
};

Ship ION;

void setup() {
  size(300,300);
  ION = new Ship(width/2, height/2, 0, 0);
}

void draw() {
  background(0);
  ION.update();
}

void keyPressed(){
  if(keyCode == UP)
    ION.speed+=0.05;
  else if(keyCode == DOWN)
    ION.speed-=0.05;
  else if(keyCode == RIGHT)
    ION.angle+=3;
  else if(keyCode == LEFT)
    ION.angle-=3;
}
