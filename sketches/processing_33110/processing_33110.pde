
//Nicole Del Senno
//N00211488

//declare variables
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

//setup the canvas and assign variables
void setup() {
  size(600,400);
  frameRate(30);
  smooth();
  a = new Ball(color(255,182,193),0,20,1.5); 
  b = new Ball(color(0,0,255),0,100,1);
  c = new Ball(color(30,144,255),0,50,.75); 
  d = new Ball(color(224,102,255),0,20,1);
  e = new Ball(color(202,225,255),0,75,1.4); 
  f = new Ball(color(100,149,237),0,90,1.8);
  g = new Ball(color(244,102,255),0,15,2); 
  h = new Ball(color(255,0,255),0,60,1.1);
  i = new Ball(color(135,206,255),0,30,2.2); 
  j = new Ball(color(230,230,250),0,110,.9);
  k = new Ball(color(238,58,220),0,55,2); 
  l = new Ball(color(224,120,255),0,80.5,2.2);
  m = new Ball(color(219,112,147),0,27,1.4); 
  n = new Ball(color(255,255,255),0,85,2.15);
  o = new Ball(color(255,20,147),0,36,.6); 
  p = new Ball(color(131,111,255),0,105,2.3);
  q = new Ball(color(255,240,245),0,102,2); 
  r = new Ball(color(255,187,255),0,88,.88);
  s = new Ball(color(155,48,255),0,43,1); 
  t = new Ball(color(152,245,255),0,101,2.1);
}

//calls functions move() and display()
void draw() {
  background(0);
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

//Declares variables within class Ball
class Ball { 
  color c;
  float xpos;
  float ypos;
  float xspeed;

//Constructor: Assigns parameters for class Ball(color, x, y, speed)
  Ball(color tempC, float tempXpos, float tempYpos, float tempXspeed) { 
    c = tempC;
    xpos = tempXpos;
    ypos = tempYpos;
    xspeed = tempXspeed;
  }


//displays the shapes
  void display() {
    noStroke();
    fill(c);
    ellipseMode(CENTER);
    ellipse(xpos,ypos,30,30);
  }

//moves the shapes
  void move() {
    xpos = xpos + xspeed;
    if (xpos > width) {
      xpos = 0;
    }
  }
}

  


