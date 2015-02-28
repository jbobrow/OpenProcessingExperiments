
class checkBox {
  boolean activo;
  int x, y;
  String tex;
  checkBox(int _x, int _y, boolean act, String _text) {

    x=_x;
    y=_y;
    activo=act;
    tex=_text;
  }
  void dibuja() {
    if (s.mousePressed ) {
      if (s.mouseX>(x+50) && s.mouseX<(x+65) && s.mouseY>(y-12) && s.mouseY<(y+3)) {
        if (activo)activo=false;
        else activo=true;
      }
    }

    s.fill(0);
    s.text(tex, x, y);
    s.fill(255);
    s.rect(x+50, y-12, 15, 15);
    if (activo) {
      s.fill(0);
      s.ellipse(50+x+15/2, y-12+15/2, 7, 7);
    }
    
  }
  boolean activo() {
    return activo;
  }
}


