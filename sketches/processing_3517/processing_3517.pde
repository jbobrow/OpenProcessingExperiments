
//Pincel tomado de  star by Florian Jenett 

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

    fill(ritoque.get(x,y));

    star( x, y, 3, 10, (frameCount%50)+2 ); 


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
void star (int x, int y, float radius_inner, float radius_outer, int spikes) { 
    float r = 0.0; 
 
    float res = 360.0/spikes; 
    float res_half = res/2; 
 
    beginShape(); 
 
    for (float i = 0; i < 360; i+=res){ 
        r = -HALF_PI + radians( i ); 
        vertex( x + cos(r) * radius_outer, y + sin(r) * radius_outer ); 
        r = -HALF_PI + radians( i+res_half ); 
        vertex( x + cos(r) * radius_inner, y + sin(r) * radius_inner ); 
    } 
 
    endShape( CLOSE );    
} 





