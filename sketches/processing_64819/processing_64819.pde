
class Boton {
  color fondo;
  color borde;
  int anchoborde;
  PVector centro, tama;
  String texto;
  int tamaTexto;
  color colorTexto;
  boolean estaSobre=false;
  int valorAuxiliar;

  Boton(color t_fondo, color t_borde, int t_anchoborde, int t_X, int t_Y, int t_ancho, int t_alto, String t_texto, int t_tt, color t_ct) {
    fondo = t_fondo;
    borde = t_borde;
    anchoborde = t_anchoborde;
    centro = new PVector (t_X, t_Y);
    tama = new PVector (t_ancho, t_alto);
    texto = t_texto;
    tamaTexto=t_tt;
    colorTexto=t_ct;
  }

  void dibuja() {
    rectMode(CENTER);
    if (estaSobre) {
      stroke(fondo);
      fill(borde);
    }
    else {
      stroke(borde);
      fill(fondo);
    }
    strokeJoin(ROUND);
    strokeWeight(anchoborde);
    rect(centro.x, centro.y, tama.x, tama.y);
    noFill();
    strokeWeight(1);
    strokeJoin(MITER);
    noStroke();
    rectMode(CORNER);
    textAlign(CENTER, CENTER);
    fill(colorTexto);
    textSize(tamaTexto);
    text(texto, centro.x, centro.y);
  }

  boolean sobreBoton(float c_x, float c_y) {
    if (c_x>centro.x-(tama.x/2) && c_x<centro.x+(tama.x/2) && c_y>centro.y-(tama.y/2) && c_y<centro.y+(tama.y/2)) return true;
    else return false;
  }
}


