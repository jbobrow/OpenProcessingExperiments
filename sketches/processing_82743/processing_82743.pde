
class Cuadro {

  PVector pos;
  int w;
  int s;

  Cuadro(int x, int y) {
    pos = new PVector(x, y, 0);
    w = 20;
    s = 5;
  }

  void show_a() {
    for ( int i = 0; i < s ; i++) {
      line(pos.x+i*s, pos.y+i*s, pos.x+i*s, pos.y+i*s+2*w);
    }
  }

  void show_b() {
    for ( int i = 0; i < s ; i++) {
      line(pos.x+i*s, pos.y+i*s, pos.x+i*s+2*w, pos.y+i*s);
    }
  }
  
 void show_c() {
    for ( int i = 0; i < s ; i++) {
//      line(pos.x+i*s, pos.y+i*s, pos.x+i*s+2*w, pos.y+i*s);
        ellipse(pos.x+i*s,pos.y,5,5);
    }
  }

};


