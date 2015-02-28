
/**
 * By n7697409@mail.ncku.edu.tw
 */

void setup() {

  size(330, 500);
  background (255);
  smooth();
  int x=1;
}

float u = second();
float v = second();
float y = second();
float w = second();
float a = second();
float b = second();
float c = second();
float d = second();
float e = second();



void draw() {
  background (40, 60,85, 80);


  u = u+0.64;
  fill(255,255,255,50);
  ellipse(sin(u)+50, 580-u, 80, 80);

  v = v+0.2;
  fill(255,255,255,60);
  ellipse(sin(v)+150, 510-v, 10, 10);

  y = y+0.4;
  fill(255,255,255,40);
  ellipse(sin(y)+200, 530-y, 30, 30);

  w = w+0.5;
  fill(255,255,255,80);
  ellipse(sin(w)+300,550-w, 50, 50);

  a = a+0.55;
  fill(255,255,255,90);
  ellipse(sin(a)+10,840-a, 85, 85);

  b = b+0.3;
  fill(255,255,255,40);
  ellipse(sin(b)+210,990-b, 24, 24);

  c = c+0.2;
  fill(255,255,255,30);
  ellipse(sin(c)+340,505-c, 15, 15);

  d = d+0.5;
  fill(255,255,255,80);
  ellipse(sin(d)+250,1208-d, 50, 50);

  e = e+0.6;
  fill(255,255,255,60);
  ellipse(sin(e)+280,1140-e, 66, 66);


  if(u>600){
    u=0; 
  }
  if(y>640){
    y=0; 
  }
  if(v>600){
    v=0; 
  }
  if(w>600){
    w=0;
  }

  if(a>1000){
    a=0;
  }

  if(b>1000){
    b=0;
  }

  if(c>1500){
    c=0;
  }

  if(d>600){
    d=0;
  }
}



