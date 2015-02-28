
/*Code by Sarah Tse
York Sheridan Joint Program of Design*/

//for the shape of the squares

float c;    //size
float d;    //rotation

//teal
float a;
float b;
//pink
float e;
float f;
//brown
float g;
float h;

//for the fill colours
//teal
float z;
float y;
float x;
//pink
float w;
float v;
float u;

float t;    //opacity

void setup(){
  size(400,400);
  background(71,50,39);
  translate(50,50);
  rectMode(CENTER);
  smooth();
  noStroke();
}

void draw(){
  frameRate(7);
  //teal
  a = random(width);
  b = random(height);
  c = random(10, 100);    //size
  d = random(0,1.5);    //rotation
  //pink
  e = random(width);
  f = random(height);
  //brown
  g = random(width);
  h = random(height);
  
  t = random(100,200);    //opacity
  
  //teal
  z = random(125); random(42); random(53);
  y = random(180,230); random(135,161); random(43,103);
  x = random(156,190); random(173,207); random(70,140);
  
  //pink
  w = random(173,207); random(180,230); random(24,53);
  v = random(70,140); random(135,161); random(125,196);
  u = random(156,190); random(43,103); random(42,66);
  
  rotate(d);
  fill(z,y,x,t);
  rect(a,b,c,c);
  fill(w,v,u,t);
  rect(e,f,c,c);
  fill(71,50,39);
  rect(g,h,c,c);
}


