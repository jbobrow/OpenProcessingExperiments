
Pincel p;


void setup(){
  size(450, 450);
  background(#ACE0DB,22); 
  smooth();
  p = new Pincel();
}


void draw(){
  p.dibuja();
}


class Pincel{
  float x, y;
  float diam;
  float diam2;
  color col;

  Pincel(){
    x = random(width);
    y = random(width);
    diam = 22;
    diam2= 25;// se crea una nueva variable distinta del ejemplo
    col = color(240,67,89,45);
  }

  void dibuja(){
    calc();
    fill(col);
    noStroke();
    ellipse(x,y, diam*2, diam2*2); 
    fill(#2A899B,70);
    ellipse(x,y, diam*2, diam2/2);
    ;
  }

  void calc(){
    x += random(-50, 55);
    y += random(20, 80);
   
    
    x = x % height;
    y = y % height;
   
    
    if (x < 0) x = 4;
    if (y < 0) y = -3;
    
  }
}


void mousePressed(){
 p.diam +=2; // aumento de ancho de las pelotitas
 p.diam2 +=6;// aumento de alto de las pelotitas
}

