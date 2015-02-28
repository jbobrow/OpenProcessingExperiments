
int a = 480;
int b = 0;
int c = 500;
int d = 20;
int e = 0;
int f = 0;
int g = 30;


void setup(){
  
  size(500,500);
  background(0);
  strokeWeight(5);
  
}

void draw(){
  
  while(a > -500){
    stroke(random(0,255),random(0,255),random(0,255));
    line(a,b,c,d);
    a = a - 30;
    d = d + 30;
  }
  
  while (f < 600){
  while(e < 600){
  noFill();
  stroke(random(0,255),random(0,255),random(0,255));
  strokeWeight(2);
  ellipse(e,f,g,g);
  e = e + 20;
  }
  e = 0;
  f = f + 20;
  }
  
}

