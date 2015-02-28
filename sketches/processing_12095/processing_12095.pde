
int penx = 0;
int peny = 0;
int de = 3;
cLista lista = new cLista();
int el0 = 0;

int by;

// ------------------------------------------------------------

void setup() { 
  size(800, 400);
  smooth();
  frameRate(30);
  colorMode(HSB, 1);
  stroke(0, 0, 0, 0.7);
  background(0, 0, 1);
  strokeWeight(0.5 * de);
  
  city();
}

// ------------------------------------------------------------

void draw() {
  int t = 0;
  while((t++ < 5) && (el0 < lista.nr)) {
    lista._draw(el0++);
  }
  if (el0 == lista.nr) {
    noLoop();
  }
}

// ------------------------------------------------------------

void mouseClicked() {
  lista.nr = 0;
  el0 = 0;
  city();
  background(0, 0, 1);
  loop();
}

// ------------------------------------------------------------

void keyPressed()
{
  if( key == 's') {
    save("city.tif");
  }
}

// ------------------------------------------------------------

void city() {
  by = height - 50;
  retth(0, by, width, height);
  rettf(0, by, width, height);

  // fila dietro
  int px0 = 0;
  while (px0 < 0.95*width) {
    int dey = int(random(80, 300));
    int dex = int(random(15000, 30000) / (80 + dey));
    if (px0 + dex > 0.95*width) dex = width - px0;
    palazzo(px0, by - dey, px0 + dex, by);
    px0 = px0 + dex + int(random(-5, 20));
  }
  
  // fila davanti
  px0 = 0;
  while (px0 < width) {
    int dey = int(random(50, 100));
    int dex = int(random(15000, 30000) / (80 + dey));
    if (px0 + dex > width) dex = width - px0;
    palazzo(px0, by - dey, px0 + dex, by);
    px0 = px0 + dex + int(random(-5, 20));
  }

  // vegetazione e altro
  for(int i=0; i<30; i++) {
    int px = int(random(width));
    int py = by - int(random(10, 20));
    linea(px, py, px, by);
    linea(px, py, px + int(random(-10, 10)), py);
  }
  for(int i=0; i<30; i++) {
    int px = int(random(width));
    int py = by - int(random(5, 20));
    linea(px, py, px, by);
    rett(px-5, py - 10, px + 5, py);
  }
}

// ------------------------------------------------------------

void palazzo(int sx, int sy, int ex, int ey) {
  int dex = ex - sx;
  int dey = ey - sy;
  
  // vani tecnici
  int [] h = new int [2];
  h[0] = int(random(5, 20));
  h[1] = int(random(5, 20));
  sy = sy + max(h[0], h[1]);
  for (int i=0; i<2; i++) {
    if (random(2) > 1) {
      int dex1 = int(random(10, dex-10));
      int dex2 = int(random(10, dex-10));
      lista.agg(0, sx + dex1, sy - h[i]);
      lista.agg(2, ex - dex2, sy);
      rett(sx + dex1, sy - h[i], ex - dex2, sy);
    }
  }
  
  // antenne
  if ((random(2) > 0) && (dey > 200)) {
    for(int i=0; i<2; i++) {
      int px = sx + int(random(10, dex - 10));
      dlinea(px, sy - int(random(10, 50)), px, sy);
    }
  }
  
  // fondo
  lista.agg(0, sx, sy);
  lista.agg(2, ex, ey);
  
  // ombra a dx
  if (random(2) > 1) {
    int om = int(random(10, 30));
    dlinea(ex, sy, ex, ey);
    rettf(ex-om, sy, ex, ey);
    ex = ex - om;
  }
  
  rett(sx, sy, ex, ey);
  
  if ((random(1.5) > 1) && (dex > 80)) {
    if (random(2) > 1) { // cupola
      int ox = 10;
      int cx = (sx + ex) / 2;
      int cy = sy + (cx - sx - ox);
      float rad = (cx - sx - ox) * 1.414;
      for (float beta=0; beta<=PI/2.0; beta+=PI/16.0) {
        lista.agg(0, sx + ox, sy);
        for (float alfa=PI/4.0; alfa<=PI*3.0/4.0; alfa+=PI/16.0) {
          lista.agg(1, cx - int(rad * cos(alfa) * cos(beta)), cy - int(rad * sin(alfa)));
        }  
      }
      for (float alfa=PI/4.0; alfa<PI/2.0; alfa+=PI/32.0) {
        linea(cx - int(rad * cos(alfa)), cy - int(rad * sin(alfa)), cx + int(rad * cos(alfa)), cy - int(rad * sin(alfa)));
      }  
    }
    else { // piramide
      int cdex = (ex - sx) / 2;
      int cdey = cdex / 2;
      linea(sx, sy, sx + cdex, sy - cdey);
      linea(sx + cdex, sy - cdey, ex, sy);
      for (int i=10; i<cdex; i+=10) {
        linea(sx + i, sy - i / 2, ex - i, sy - i / 2);
        linea(sx + i * 2, sy, sx + cdex + i, sy - cdey + i / 2);
        linea(ex - i * 2, sy, sx + cdex - i, sy - cdey + i / 2);
      }      
    }
  }

  // basamento
  int ba = 0;
  if (random(2) > 1) {
    ba = int(random(10, 20));
    dlinea(sx, ey-ba, ex, ey-ba);
    rettf(sx, ey-ba, ex, ey);
  }  

  // spalle
  if (random(2) > 1) {
    int sp = 10;
    sx = sx + sp;
    ex = ex - sp;
    dlinea(sx, sy, sx, ey);    
    dlinea(ex, sy, ex, ey);    
  }

  // architrave
  if (random(2) > 1) {
    sy = sy + int(random(10, 20));
    dlinea(sx, sy, ex, sy);    
  }

  // fascia verticale
  if (random(1.5) > 1) {
    int hf = 20;
    int p = (sx + ex) / 2;
    rettv(p-hf, sy, p+hf, ey);
  }

  // basamento bianco
  if (random(2) > 1) {
    ey = ey - ba - int(random(10, 20));
    dlinea(sx, ey, ex, ey);    
  }

  // fascia orizzontale
  if (random(1.5) > 1) {
    int hf = 8;
    int p = (sy + ey) / 2;
    retth(sx, p-hf, ex, p+hf);
  }
  
  // righe verticali
  if (random(2) > 1) {
    int sp = 10;
    dex = ex - sx;
    int nr = dex / sp;
    int ox = (dex - nr * sp) / 2;
    for (int i=0; i<nr; i++) {
      int j = sx + ox + i * sp;
      linea(j, sy, j, ey);
    }
  }
  
  // righe orizzontali
  if (random(2) > 1) {
    int sp = 30;
    dey = ey - sy;
    int nr = dey / sp;
    int oy = (dey - nr * sp) / 2;
    for (int i=0; i<nr; i++) {
      int j = sy + oy + i * sp;
      dlinea(sx, j, ex, j);
    }
  }

}

// ------------------------------------------------------------
// rettangolo vuoto
void rett(int sx, int sy, int ex, int ey) {
  dlinea(sx, sy, ex, sy);
  dlinea(sx, ey, ex, ey);
  dlinea(sx, sy, sx, ey);
  dlinea(ex, sy, ex, ey);
}

// ------------------------------------------------------------
// rettangolo pieno
void rettf(int sx, int sy, int ex, int ey) {
  
  int dex = ex - sx;
  int dey = ey - sy;
  lista.agg(0, sx, sy);
  for (int i=0; i<min(dex, dey); i+=2*de) {
    lista.agg(1, sx, sy + i);
    lista.agg(1, sx + i, sy);
  }
  if (dex > dey) {
    for (int i=0; i<dex-dey; i+=2*de) {
      lista.agg(1, sx + i, ey);
      lista.agg(1, sx + dey + i, sy);
    }
  }
  else {
    for (int i=0; i<dey-dex; i+=2*de) {
      lista.agg(1, sx, sy + dex + i);
      lista.agg(1, ex, sy + i);
    }
  }
  for (int i=min(dex, dey); i>=0; i-=2*de) {
    lista.agg(1, ex - i, ey);
    lista.agg(1, ex, ey - i);
  }
}

// ------------------------------------------------------------
// rettangolo pieno a righe verticali
void rettv(int sx, int sy, int ex, int ey) {
  lista.agg(0, sx, sy);
  for (int i=sx; i<ex; i+=de) {
    lista.agg(1, i, sy);
    lista.agg(1, i, ey);
  }
}

// ------------------------------------------------------------

// rettangolo pieno a righe orizzontali
void retth(int sx, int sy, int ex, int ey) {
  lista.agg(0, sx, sy);
  for (int i=sy; i<ey; i+=de) {
    lista.agg(1, sx, i);
    lista.agg(1, ex, i);
  }
}

// ------------------------------------------------------------

void linea(int sx, int sy, int ex, int ey) {
  lista.agg(0, sx + int(random(-de, de)), sy + int(random(-de, de)));
  lista.agg(1, ex + int(random(-de, de)), ey + int(random(-de, de)));
}

// ------------------------------------------------------------

void dlinea(int sx, int sy, int ex, int ey) {
  linea(sx, sy, ex, ey);
  linea(sx, sy, ex, ey);
}

// ------------------------------------------------------------

class cLista {
  int mat[][] = new int [10000][3];
  int nr = 0;
  
  void agg(int tipo, int px, int py) {
    mat[nr][0] = tipo;
    mat[nr][1] = px + int(random(-de, de));
    mat[nr][2] = py + int(random(-de, de));
    nr++;
  }
  
  void _draw(int el) {
    switch(mat[el][0]) {
      case 0: // move to
        penx = mat[el][1];
        peny = mat[el][2];
        break;
      case 1: // line to
        line(penx, peny, mat[el][1], mat[el][2]);
        penx = mat[el][1];
        peny = mat[el][2];
        break;
      case 2: // rettangolo pieno
        noStroke();
        fill(0, 0, 1);
        rect(penx, peny, mat[el][1] - penx, mat[el][2] - peny);
        stroke(0, 0, 0, 0.7);
        noFill();
        break;
    }
  }
}

// ------------------------------------------------------------


