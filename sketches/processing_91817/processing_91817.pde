
/*
  Programmer: Dan Olson
  03/03/2013
  Easing with random arrays */

int num = int(random(10,20));

int arrNum[] = new int [num];

int x[] = new int [num];
int y[] = new int [num];
int targetX[] = new int [num];
int targetY[] = new int [num];
int dx[] = new int [num];
int dy[] = new int [num];
float easing[] = new float [num];

void setup() {
size(300,300);

for ( int i = 0; i < arrNum.length; i++) {
x[i] = int(random(0,width));
y[i] = int(random(0,height));
easing[i] = .03;
num = int(random(10,20));
}
}

void draw() {

  for (int i= 0; i < arrNum.length; i++) {
  stroke(100);
  fill(random(230,255));
  ellipse(x[i],y[i],10,10);
  
  targetX[i] = mouseX;
  dx[i] = targetX[i] - x[i];
  if (abs(dx[i]) > 1) {
  x[i] += dx[i] *easing[i];
  }
 
  targetY[i] = mouseY;
  dy[i] = targetY[i] - y[i];
  if (abs(dy[i]) > 1) {
  y[i] += dy[i] *easing[i];
  
  }
  
}
}

void mousePressed(){
if (mouseButton == RIGHT){
noLoop();
}

if (mouseButton == LEFT) {
  for (int i= 0; i < arrNum.length; i++) {
  x[i] = int(random(0,width));
  y[i] = int(random(0,height));
  easing[i] = .03;
  num = int(random(10,20));
  
  loop();
  }
  
  }
}
