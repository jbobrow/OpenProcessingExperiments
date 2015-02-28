
//variables
Ball a;
Ball b;
Ball c;
Ball d;
Ball e;
Ball f;
Ball g;
Ball h;
Ball i;
Ball j;
Ball k;
Ball l;
Ball m;
Ball n;
Ball o;
Ball p;
Ball q;
Ball r;
Ball s;
Ball t;

float y;

//setup document and assign variables
void setup() {
  size(800,200);
  frameRate(50);
  smooth();
  
//random initial position in y
  y=random(20,180);
  
//balls fill and color
  fill(0);
  noStroke();
  
  //color, pos x, pos y, speed
  a = new Ball(color(0),0,y,1);
  b = new Ball(color(0),0,y,2);
  c = new Ball(color(0),0,y,3);
  d = new Ball(color(0),0,y,4);
  e = new Ball(color(0),0,y,5);
  f = new Ball(color(0),0,y,4.8);
  g = new Ball(color(0),0,y,3.8);
  h = new Ball(color(0),0,y,2.8);
  i = new Ball(color(0),0,y,1.8);
  j = new Ball(color(0),0,y,2.4);
  k = new Ball(color(0),0,y,3.4);
  l = new Ball(color(0),0,y,4.4);
  m = new Ball(color(0),0,y,5.2);
  n = new Ball(color(0),0,y,4.2);
  o = new Ball(color(0),0,y,3.2);
  p = new Ball(color(0),0,y,2.2);
  q = new Ball(color(0),0,y,1.6);
  r = new Ball(color(0),0,y,2.6);
  s = new Ball(color(0),0,y,3.6);
  t = new Ball(color(0),0,y,4.6);
}
 
void draw() {
  background(50);
  
//calls functions move() and display()

  a.move();
  a.display();
  b.move();
  b.display();
  c.move();
  c.display();
  d.move();
  d.display();
  e.move();
  e.display();
  f.move();
  f.display();
  g.move();
  h.display();
  h.move();
  h.display();
  i.move();
  i.display();
  j.move();
  j.display();
  k.move();
  k.display();
  l.move();
  l.display();
  m.move();
  m.display();
  n.move();
  n.display();
  o.move();
  o.display();
  p.move();
  p.display();
  q.move();
  q.display();
  r.move();
  r.display();
  s.move();
  s.display();
  t.move();
  t.display();
   
}
 
//variables within class Ball
class Ball {
  color c;
  float xpos;
  float ypos;
  float xspeed;
 
//Constructor: Assigns parameters for class Ball(color, x, y, speed)
  Ball(color tempC, float xpos, float tempYpos, float tempXspeed) {
    c = tempC;
//    xpos = tempXpos;
  ypos = tempYpos;
    xspeed = tempXspeed;
  }
 
 
//displays the shapes
  void display() {
    noStroke();
    fill(c);
    ellipseMode(CENTER);
    ellipse(xpos,ypos,40,40);
  }
 
//move balls
//when hit limit, start again
  void move() {
    xpos = xpos + xspeed;
    if (xpos > width) {
      xpos = 0;
    }
  }
}
 
  

