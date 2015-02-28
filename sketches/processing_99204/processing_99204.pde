
// Butterfly
//
// 'r' to reset

float t=0,s,p,k,l,x,y,x2,y2,x3,y3,x4,y4,a1,b1,a2,b2,a3,b3,a4,b4;

void setup() {
  size(650, 600);
  background(0);
  noFill();
  frameRate(60);
  smooth(8);
  s = random(90, 100);
}


void draw() {
  translate(325, 350);
  p=t+0.15;
  k = exp(cos(t)) - 2*cos(4*t) - pow(sin(t/12), 5.0);
  l = exp(cos(p)) - 2*cos(4*p) - pow(sin(p/12), 5.0);
  x = sin(t)*k*s;
  y = -cos(t)*k*s;
  x2 = sin(p)*l*s;
  y2 = -cos(p)*l*s;
  x3 = sin(-t)*k*s;
  y3 = -cos(-t)*k*s;
  x4 = sin(-p)*l*s;
  y4 = -cos(-p)*l*s;
  a1 = s*1.62+ cos(t)*(s/3);
  b1 = -s*1.78+ sin(t)*(s/3);
  a2 = s*1.62+ cos(p*2)*(s/3);
  b2 = -s*1.78+ sin(p*2)*(s/3);
  a3 = -s*1.62- cos(t)*(s/3);
  b3 = -s*1.78- sin(-t)*(s/3);
  a4 = -s*1.62- cos(p*2)*(s/3);
  b4 = -s*1.78- sin(-p*2)*(s/3);
  stroke(dist(x, y, 0, 0), 0, 255, 2000/dist(x, y, 0, 0));
  line(x, y, 0, 0);
  stroke(0, 0, 10*dist(x3, y3, 0, 0), 2000/dist(x3, y3, 0, 0));
  line(x3, y3, 0, 0);
  stroke(0, 10*dist(x3, y3, x4, y4), 255, 500/dist(x3, y3, x4, y4));
  line(x3, y3, x4, y4);    
  stroke(10*dist(x, y, x2, y2), 0, 255, 500/dist(x, y, x2, y2));
  line(x, y, x2, y2);
  stroke(255, 10*dist(a1, b1, a2, b2), 0, 100/dist(a1, b1, a2, b2));
  line(a1, b1, a2, b2);
  stroke(255, 10*dist(a3, b3, a4, b4), 0, 100/dist(a3, b3, a4, b4));
  line(a3, b3, a4, b4);
  t+=0.01;
}

void keyPressed() {
 if (key == 'r') { background(0); t=0; s = random(90, 100);  } 
}


