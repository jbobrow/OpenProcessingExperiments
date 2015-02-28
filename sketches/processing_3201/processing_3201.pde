
Pincel[] p;
float n;
void setup(){
  size(500, 500);

  smooth();
n=0;
  p = new Pincel[100];

  for(int i = 0; i < 100; i++){
    p[i] = new Pincel();
    
  }
}


void draw(){
  for(int i = 0; i < 100; i++){
    p[i].dibuja();
  }
  velo();
}


class Pincel{
  float x, y;
  float diam;
  color col;
  int edad, edadMax;

  Pincel(){
    x = random(width);
    y = random(height);
    diam = 10;
    col = color(random(255));
    edad = 1;
    edadMax = round(random(1000, 2000));
  }
     
  void dibuja(){
    calc();
    noStroke();
    
    fill(col);
    ellipse(x,y, diam, diam); 
    
    fill(255);
    ellipse(x,y, diam/4, diam/2);
  }

  void calc(){
   //n+=0.01;
  
  float N = noise(n); 
    x += random(-4, 2);
    y += random(-4, 2);

    x = x % width;
    y = y % height;

    if (x < 0) x+= random(500) ;
    if (y < 0) y+= random(500);

    edad ++;

    if(edad >= edadMax) col = color(0,10);
  
  }
}


void keyPressed(){
  for(int i = 0; i < 100; i++){
    p[i].col = color(red(p[i].col) + random(-10, 10), green(p[i].col)  + random(-10, 10), blue(p[i].col)  + random(-10, 10));
  }
}

void velo(){
  fill(0,10);
  rect(0,0,width, height); 
}

void mousePressed () {
  setup();
}



