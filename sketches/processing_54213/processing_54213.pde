
//kite class
class Kite {
  int x; //x position of kite 
  int y; //y position of kite 
  color k; //kite color is set
  float s;//scal for kite
  float spdX; //horizontal kite speed
  float spdY;//vertical kite speed
  float gravity=.03;//gracit


  //kite constructor
  Kite(int tempX, int tempY) {
    y = tempY;
    x = tempX;
    k = color(random(255), random(255), random (255));
    spdX = 1;
    spdY = 0;
    s = 2;
  }
//conditions for kite movement within sketch
  void update () {
    x+=spdX;
    spdY-=gravity;
    y+=spdY;
    s = s*.995;

    if (x-20<0 || x-20>width) {
      spdX*=-1;
    }
    if (y<0 ||y>height) {
      spdY*=-1;
    }
    if (s<.1) {
      x= -100;
      y= -100;
    }
  }

  void display () {
    fill (k);
    smooth ();
    stroke (0);
    strokeWeight (2);    
    quad (x-20*s, y, x, y-30*s, x+20*s, y, x, y+80*s);
    line (x-20*s, y, x+20*s, y);
    line (x, y-30*s, x, y+80*s);
    noFill();
    stroke (0);
    beginShape ();
    curveVertex(x, y+80*s);
    curveVertex(x, y+80*s);
    curveVertex (x+10*s, y+90*s);
    curveVertex (x-10*s, y+100*s);
    curveVertex (x+10*s, y+110*s);
    curveVertex (x-10*s, y+120*s);
    curveVertex (x+10*s, y+125*s);
    curveVertex (x-10*s, y+130*s);
    curveVertex (x-10*s, y+130*s);
    endShape ();
  }
}   


