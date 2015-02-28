
/*
Animated Tarmac
Inspired by : http://simpledesktops.com/browse/desktops/2012/mar/30/tarmac/
from "Simple Desktops"

Coded by @ramayac
*/

int x1 = 203;
int y1 = 114;
int x2 = 213;

Cloud cl, c2, c3;

void setup(){
  size(616, 385);
  smooth();
  cl = new Cloud(327, 50, 0.4, 1);
  c2 = new Cloud(470, 70, -0.3, 0.9);
  c3 = new Cloud(44, 62, -0.2, 0.8);
}

class Cloud{
  float x, y;
  float escala = 1.0;
  float velocidad = 0.1;
  PGraphics n;
  
  Cloud(int x, int y, float vel, float esc){
    n = drawCloud();
    this.x = x;
    this.y = y;
    this.velocidad = vel;
    this.escala = esc;
  }
  
  void draw(){
    x += velocidad;
        
    float l_izq = -n.width;
    float l_der = width + n.width + (n.width*escala);
    
    if (x < l_izq){
      x = l_der;
    } else if (x >= l_der){
      x = l_izq;
    }
    
    scale(escala);
    image(n, x, y);
  }
  
}

PGraphics drawCloud(){
  PGraphics pg = createGraphics(117, 57, P2D);
  pg.beginDraw();
  pg.noStroke();
  pg.fill(255);
  pg.background(0, 0);
  pg.ellipse(50, 25, 50, 50);
  pg.ellipse(23, 30, 15, 15);
  pg.ellipse(80, 19, 20, 20);
  pg.ellipse(90, 35, 36, 36);
  pg.ellipse(14, 40, 25, 25);
  pg.rect(14, 35, 80, 18);
  pg.endDraw();
  return pg;
}

void draw(){
  noStroke();
  
  fill(#5C6B99);
  rect(0, height/3, width, (height/3)*2);
  
  fill(#333333);
  //triangle(x1, y1, x2, y2, x3, y3);  
  triangle(x1, y1, x2, height, x2+315, height);
  fill(255);
  triangle(x1, y1, x2+150, height, x2+150+10, height);
  
  fill(#9DB2F0);
  rect(0, 0, width, height/3);
  
  cl.draw();
  c2.draw();
  c3.draw();
}

void mouseMoved() {
  x2 = (int)constrain(mouseX, 0, width);
}

