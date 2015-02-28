
Pyramid phead;

void setup(){
  size (370,390);
  smooth();
  phead= new Pyramid (100, 140);
  
}

void draw(){
  background (156);
  phead. display();
}

class Pyramid {
  float xpos;
  float ypos;
  
  //PYARMID COLORS
  int r1= 44; int g1= 13; int b1= 9;
  int r2= 100; int g2= 27; int b2= 19;
  int r3= 209; int g3= 204; int b3= 169;
  int r4= 85; int g4= 57; int b4= 30;
  
  Pyramid (float tempXpos, float tempYpos){
    xpos = tempXpos;
    ypos = tempYpos;
  }
  
  void display() {
    rectMode (CORNERS);
    ellipseMode (CENTER);
    
   strokeWeight (3);
   stroke (r1, g1, b1);
   fill (r4, g4, b4);
   rect (xpos-20, ypos+200, xpos-5, ypos+240);
   triangle (xpos-20, ypos+240, xpos-5, ypos+230, xpos+5, ypos+240);
   rect (xpos+20, ypos+200, xpos+35, ypos+240);
   triangle (xpos+20, ypos+240, xpos+35, ypos+230, xpos+45, ypos+240);
   fill (r3, g3, b3);
   triangle (xpos, ypos, xpos-50, ypos+200, xpos+80, ypos+200);
   fill (r2, g2, b2);
   triangle (xpos-40, ypos+30, xpos, ypos-100, xpos+200, ypos+30);
   rect (xpos-50, ypos+40, xpos+210, ypos+20);
   strokeWeight(5);
   line (xpos, ypos+100, xpos+10, ypos+150);
   strokeWeight(3);
   fill(r3, g3, b3);
   ellipse (xpos+10, ypos+150, 30, 30);
  }
}
