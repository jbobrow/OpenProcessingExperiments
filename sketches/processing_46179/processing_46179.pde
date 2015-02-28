
PImage a;
PImage b;
PImage c;
PImage d;
PImage e;
PImage f;
PImage g;
PImage h;
PImage i;
PImage j;
PImage k;
PImage l;
PImage m;
PImage n;
PImage o;
PImage p;
PImage q;
PImage r;
PImage s;
PImage t;
PImage u;

void setup() {
  size(800,800);
  
  c = loadImage("3.jpg");
  
  e = loadImage("5.jpg");
  
  
  
  i = loadImage("9.jpg");

  k = loadImage("11.jpg");

  m = loadImage("13.jpg");


  p = loadImage("16.jpg");
  q = loadImage("17.jpg");

  s = loadImage("19.jpg");

  
  frameRate(10);
}

void draw(){
    background(255,255,255);
  
  
  
  
  image(c,random(0,800),random(0,800),100,100);
  
  image(e,random(0,800),random(0,800),100,100);
  
  
  image(i,random(0,800),random(0,800),100,100);
 
  image(k,random(0,800),random(0,800),100,100);

  image(m,random(0,800),random(0,800),100,100);
  

  image(p,random(0,800),random(0,800),100,100);
  image(q,random(0,800),random(0,800),100,100);
 
  image(s,random(0,800),random(0,800),100,100);

  }


