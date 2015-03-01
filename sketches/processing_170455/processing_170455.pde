
float circulox;
float circuloy;
float dimx;
float dimy;
float velocidad;
float r;
float g;
float b;
float t;
int switc;


void setup() {
  size(1000,700);
  smooth();
  circulox = random(950);
  circuloy = random(650);
  dimx = random(50,100);
  velocidad = random(4.00);
  r = random(0,256);
  g = random(0,256);
  b = random(0,256);
  t = random(101);
  switc = 0;
  
  

  // Parameters go inside the parentheses when the object is constructed.
}

void draw() {
  noStroke();
  randomize();
  //background(r,g,b);
  
  randomize();
  fill(r,g,b,t);
  
  randomize();
  if (switc == 0)
  ellipse(mouseX,mouseY,dimx,dimy);
  else {
    rectMode(CENTER);
    rect(circulox,circuloy,dimx,dimy);
  }
  
  dimx = random(50,100);
  dimy = random(50,100);
  velocidad = random(4.00);
  circulox = random(300,700);
  circuloy = random(200,400);
  dimx = dimy * velocidad * random(1.99);
  fill(r,g,b,t);
  if (switc == 0)
  ellipse(circulox,circuloy,dimx,dimy);
  else {
    rectMode(CENTER);
    rect(circulox,circuloy,dimx,dimy);
  }  dimy = random(50,300);
  dimy = dimx / velocidad;
  if (circulox > width)
    circulox = velocidad;
  if (circuloy > height)
    circuloy = velocidad;
    fill(255,random(20));
  rect(0,0,width,height,random(101));
}

void randomize() {
  r -= random(0,4);
  g -= random(0,4);
  b -= random(0,4);
  t -= random(0,10);
  if (r < 0 || g < 0 || b < 0 || t < 0){
    r = random(0,256);
    g = random(0,256);
    b = random(0,256);
    t = random(101);
  }
}

void mousePressed() {
  if (switc == 0)
  switc = 1;
  else
  switc = 0;
}


