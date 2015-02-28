
float x1;
float y1;
float x2;
float y2;
boolean button = false;

void setup() {
  size(500,500);
  background(255);
  frameRate(5);
  rect(100,100,300,300);
}

void draw() {
  
  int n = int(random(1,5));
  if(n>0 && n<=1) { pta(); }
  if(n>1 && n<=2) { ptb(); }
  if(n>2 && n<=3) { ptc(); }
  if(n>3 && n<=4) { ptd(); }
  
  int m = int(random(1,5));
  if(m>0 && m<=1) { pte(); }
  if(m>1 && m<=2) { ptf(); }
  if(m>2 && m<=3) { ptg(); }
  if(m>3 && m<=4) { pth(); }
  
  line (x1,y1,x2,y2);
}

void  pta() {
  y1 = 100;
  x1 = random(100,400);
}
void ptb() {
  x1 = 400;
  y1 = random(100,400);
}
void ptc() {
  y1 = 400;
  x1 = random(100,400);
}
void ptd() {
  x1 = 100;
  y1 = random(100,400);
}  
void  pte() {
  y2 = 100;
  x2 = random(100,400);
}
void ptf() {
  x2 = 400;
  y2 = random(100,400);
}
void ptg() {
  y2 = 400;
  x2 = random(100,400);
}
void pth() {
  x2 = 100;
  y2 = random(100,400);
}

void mousePressed() {
  button =! button;
  if (button) {
    noLoop();
  } else {
    loop();
  }
}
  
void keyPressed() {
   background(255);
   rect(100,100,300,300);
}  

