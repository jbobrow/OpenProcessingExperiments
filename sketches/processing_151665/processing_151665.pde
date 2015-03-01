

Ball h;
Ball a;
Ball p;
Ball q;
Ball y;
Ball f;
Ball o;
Ball t;
Ball k;
Ball e;
Ball r;
Ball j;
Ball s;
Ball d;
Ball b;
Ball l;
boolean w;

  
void setup() {
  size(600,600);
  background(0,130,255);
  h = new Ball(30,30,"H");
  a = new Ball(90,40,"A");
  p = new Ball(150,50,"P");
  q = new Ball(210,60,"P");
  y = new Ball(270,70,"Y");
  f = new Ball(30,90,"F");
  o = new Ball(90,100,"A");
  t = new Ball(150,110,"T");
  k = new Ball(210,120,"H");
  e = new Ball(270,130,"E");
  r = new Ball(330,140,"R");
  j = new Ball(390,150,"'");
  s = new Ball(450,160,"S");
  d = new Ball(30,150,"D");
  b = new Ball(90,160,"A");
  l = new Ball(150,170,"Y");
  w = false;
  frameRate(60);
}
  
void draw(){
  background(0,130,255);
  h.display();
  a.display();
  p.display();
  q.display();
  y.display();
  f.display();
  o.display();
  t.display();
  k.display();
  e.display();
  r.display();
  j.display();
  s.display();
  d.display();
  b.display();
  l.display();
  if (mousePressed == true) {
    if (w == true) {
       w = false; 
    }else{
      w = true;
    }
  }
  if (w == true) {
  h.run();
  a.run();
  p.run();
  q.run();
  y.run();
  f.run();
  o.run();
  t.run();
  k.run();
  e.run();
  r.run();
  j.run();
  s.run();
  d.run();
  b.run();
  l.run();
  }
}
  
class Ball{
  float x = 0;
  float y = 0;
  float speedX = 4;
  float speedY = 0.5;
  String f;
    
  Ball(float _x, float _y, String s){
    x = _x;
    y = _y;
    f = s;
  }  
    
  void run(){
   move();
   bounce();
   gravity();
  }
    
  void gravity(){
   speedY += 0.8;
  }
    
  void bounce(){
    if(x > width-30){
      speedX = speedX * -1;
    }
    if(x < 0){
      speedX = speedX * -1;
    }
    if(y > height-30){
      speedY = speedY * -1;
    }
      if(y < 0){
      speedY = speedY * -1;
    }
  }
    
  void move(){
   x += speedX;
   y += speedY;
  }
    
  void display(){
    fill(255);
    noStroke();
    ellipse(x,y,60,60);
    fill(0,130,255);
    textSize(48);
    textAlign(CENTER,CENTER);
    text(f,x,y-5);
  }
    
    
    
}



