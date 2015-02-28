
//This is some of my early work, please excuse the hundreds of variables

/////FIRST SQUARES///////
float a;
float b;
float c;
float d;
float X;
float Y;

float Z;

float f;
float on;
float duh;
float r;

float l;
float o;

float na;
float ice;
float yu;
float mi;
float GUM;

//////////////SECOND SQUARES/////////

float YOU;
float ARE;

float Zoo;

float foo;
float ons;

float nan;
float iced;
float yur;
float mid;
 


void setup() {
  size(700, 700);
  background(255);
  stroke(50);

  a = 350;// random(0,350);
  b = 350;// random(0,350);
  f = 350;
  on =350;

  na = -4;
  ice = 4;

  YOU = 350;
  ARE = 350;
  foo = 350;
  ons = 350;

  nan = -4;
  iced = 4;
}

void draw() {
  stroke(yu, mi, 0);
  strokeWeight(GUM);

  c = random(0, ice);
  d = random(0, ice);
  X = a+c;
  Y = b+d;


  smooth();
  line(a, b, X, Y);
  a = X;
  b = Y;

  l = random(na, 0);
  o = random(na, 0);
  duh = f + l;
  r = on + o; 

  smooth();
  line(f, on, duh, r);
  f = duh;
  on = r;

  if (Y>700) {
    a = f = 350;
    b = on = 350;
    yu = random(0, 255);
    mi = random(0, 0);
    GUM = random(0, 1.5);
    na--;
    ice++;
  }
}


void mousePressed(){
  background(255);
    YOU = 350;
  ARE = 350;
  foo = 350;
  ons = 350;

  nan = -4;
  iced = 4;
  
   a = 350;
 b = 350;
 f = 350;
 on =350;

 na = -4;
 ice = 4;
}

