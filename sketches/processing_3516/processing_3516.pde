
Pincel[] p;
PImage ritoque;
void setup(){
  noCursor();
  ritoque = loadImage("ritoque.JPG");
  size(ritoque.width, ritoque.height);
  colorMode(HSB, 255);
  smooth();
  p = new Pincel[100];
  for(int i = 0; i < 100; i++){
    p[i] = new Pincel();
  }
}


void draw(){
  for(int i = 0; i < 100; i++){
    p[i].dibuja();
  }
  // velo();
}


class Pincel{
 int x, y;
  float diam;
  color col;
  int edad, edadMax;

  Pincel(){
    x = round(random(width));
    y = round(random(height));
    diam = 5;
    //col = color(100);
    col = ritoque.get(x,y);
    edad = 500;
    edadMax = round(random(5000, 10000));
  }

  void dibuja(){
    calc();
    noStroke();

    ///fill(((mouseX*mouseX)/ritoque.width),((mouseY*mouseY)/ritoque.height),(1+mouseX/1+mouseY));
    fill(ritoque.get(x,y));

    rect(x,y, diam*3, diam*1.5); 


  }

  void calc(){
    x += random(-2, 4);
    y += random(-2, 5);

    x = x % width;
    y = y % height;

    if (x < 0) x *= -1;
    if (y < 0) y *= -1;

    edad ++;

    //if(edad >= edadMax) col = color(0);
    if(edad >= edadMax) col =  ritoque.get(x,y);
  }
}


void mousePressed(){
  for(int i = 0; i < 100; i++){

    p[i].col = color(100,0,0);
  }

}
void velo(){
  fill(0,10);
  rect(0,0,width, height); 
}






