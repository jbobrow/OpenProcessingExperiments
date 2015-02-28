

PGraphics pg;

float unit;
float bx;
float by;
color[] c_facc = new color[4];
int ic;
color cd;
color c_per;

c_rettangolo [] rettangolo = new c_rettangolo[2000];
int cc = 0;
int nr_rett = 0;

int fase = 0;
// ----------------------------------------------------------------

void setup() {
  size (800, 450);
  pg = g;
  colorMode(RGB, 255);

  // inizializza l'array
  for (int i=0; i<rettangolo.length; i++) {
    rettangolo[i] = new c_rettangolo();
  }  
  unit = (float)width / 50.0;
  c_facc[0] = color(193, 103,  92);
  c_facc[1] = color(231, 200, 156);
  c_facc[2] = color(168, 159, 116);
  c_facc[3] = color(186, 132,  58);

  initAll();      
}

// ----------------------------------------------------------------

void draw() {
  pg.beginDraw();
  switch(fase) {
    case 0:
      // bosco
      bosco();
      if (cc >= 15) { cc = 0; fase++; }
      break;
    case 1:    
      rettangolo[cc]._draw();
      cc++;
      if (cc >= nr_rett) { fase++; cc = 0; }
//if (cc >= 100) { fase++; cc = 0; }
      break;
    case 2:    
      // riflesso
      int py = riflesso();
      if (py >= 0.97 * height) { cc = 0; fase++; }
//fase++;
      break;
    case 3:
      for(int i=0; i<8; i++) {      
        barca(0.1 * width + random(0.8 * width), map(i, 0, 10, 0.78 * height, 0.82 * height), random(0.8, 1.2));
      }
      fase++;
      break;
    case 4:
      firma();
      fase++;
      break;
    default:
      noLoop();
      break;
  }
  pg.endDraw();
}

// ----------------------------------------------------------------

void mousePressed() {
  initAll();
  loop();
}

// ----------------------------------------------------------------

void initAll() {
  pg.background(255, 250, 240);
  cc = 0;
  bx = 1;
  by = 7;
  
  // case
  while (bx * unit < width - 6.00 * unit) casa();
  // molo
  rettangolo[cc]._init(0, color(100), unit, height -  by         * unit, width - 2 * unit, 0.50 * unit, true, 0);
  rettangolo[cc]._init(0, color( 70), unit, height - (by - 0.50) * unit, width - 2 * unit, 0.50 * unit, true, 0);
  for (int i=0; i<10; i++) {
    int px = int(0.1 * width + random(0.8 * width));
    int dex = int(random(0.60, 3.00) * unit);
    rettangolo[cc]._init(0, color(180), px, height - by * unit, dex, -random(0.30, 0.50) * unit, true, 0);
  }
  bx = 2;
  while (bx * unit < width - unit) {
    rettangolo[cc]._init(0, color(120), bx * unit, height - by * unit, 0.50 * unit, -0.80 * unit, true, 0);
    bx += 5.00;
  }
  nr_rett = cc;
//println(nr_rett);
  cc = 0;
  fase = 0;
}

// ----------------------------------------------------------------

void bosco() {
  pg.noStroke();
  for(int j=0; j<100; j++) {
    int cx = int(0.05 * width + random(0.9 * width));
    int cy = int(0.05 * height + random(0.3 * height));
    float lum = map(cy, 0, height / 3.0, 1.5, 0.5);
    pg.fill(color(lum * random(46, 76), lum * random(68, 98), lum * random(47, 77), 10));
    pg.ellipse(cx, cy, 50, 50);
  }
  cc++;
}

// ----------------------------------------------------------------

int riflesso() {
  int nrx = 200;
  int px = 0;
  int py = 0;
  int sy = 0;
  float dex = 0.9 * (float)width / (float)nrx;
  for(int i=0; i<nrx; i++) {
    px = int(0.05 * width + i * dex);
    py = height - int((by - 1.00) * unit - cc * dex);
    sy = height - int((by + 0.50) * unit + dex * 15.0 * (1.0 - 5.0 / (cc + 5.0)));
    pg.strokeWeight(2 * dex);
    color col = pg.get(px, sy);
    pg.stroke(0.9 * red(col), 0.9 * green(col), 0.9 * blue(col), 50);
    pg.line(px + 2.0 * random(-cc, cc) - 0.5 * dex, py + random(-1, 1), px + 1.5 * dex + 2.0 * random(-cc, cc), py + random(-1, 1));
  }
  cc++;
  return py;
}

// ----------------------------------------------------------------

void casa () {
  float r = random(1);
  int nr_fin = 1;
  if (r > 0.4) nr_fin = 2;
  
  r = random(1);
  int nr_pia = 4;
  if (r > 0.7) nr_pia = 3;
  else if (r > 0.6) nr_pia = 2;
  
  float sizx = random(2.4, 3.0);
  float sizy = random(2.8, 3.3);
  
  float lar = sizx * nr_fin;
  if ((bx + lar + 1.00) * unit > width) {
    bx += lar + 3.00;    
    return;
  }
  float alte = sizy * nr_pia;

  float basa = random(3.10, 3.80);

  ic = int(random(3.999));
  switch(ic) {
    case 0: // rosso
      cd = colore(1);
      break;
    case 1: // ocra
      cd = colore(0);
      break;
    case 2: // verde
      cd = colore(1);
      break;
    case 3: // ocra scuro
      cd = colore(0);
      break;
    default:
      cd = colore(1);
      break;
  }
  c_per = color(random(64, 94), random(88, 118), random(74, 104));

  // portico
  basamento(basa, lar, nr_fin, sizx);
  
  // fondo facciata
  facciata(by + basa, lar, alte, nr_fin, nr_pia, sizx, sizy);

  // finestre 
  for (int j=0; j<nr_pia; j++) {
    if (j == 3) bx += 1.00;
    for (int i=0; i<nr_fin; i++) {
      if (random(1) > 0.3) {
        persiana(c_per, bx + sizx / 2.0 + sizx * i - 0.525, by + basa + 1 + sizy * j, false);    
        persiana(c_per, bx + sizx / 2.0 + sizx * i        , by + basa + 1 + sizy * j, false);    
      }
      else {    
        rettangolo[cc]._init(0, color(200, 200, 200), (bx + sizx / 2.0 + sizx * i - 0.525) * unit, height - (by + basa + 1.00 + sizy * j) * unit, 1.05 * unit, -1.30 * unit, false, 0);        
        rettangolo[cc]._init(0, color(50, 50, 50)   , (bx + sizx / 2.0 + sizx * i - 0.440) * unit, height - (by + basa + 1.08 + sizy * j) * unit, 0.40 * unit, -1.14 * unit, false, 0);
        rettangolo[cc]._init(0, color(50, 50, 50)   , (bx + sizx / 2.0 + sizx * i + 0.040) * unit, height - (by + basa + 1.08 + sizy * j) * unit, 0.40 * unit, -1.14 * unit, false, 0);
        persiana(c_per, bx + sizx / 2.0 + sizx * i - 1.05 , by + basa + 1 + sizy * j, true);    
        persiana(c_per, bx + sizx / 2.0 + sizx * i + 0.525, by + basa + 1 + sizy * j, true);    
      }
    }
    // panni stesi
    if ((j < 3) & (random(1) > 0.8) & (nr_fin > 1)) {
      float psx = 0.00;
      while(psx < sizx + 1.00) {
        float psw = random(0.20, 0.60);
        rettangolo[cc]._init(0, color(random(240, 255), random(240, 255), random(240, 255)), (bx + sizx / 2.0 - 0.60 + psx) * unit, height - (by + basa + 0.70 + sizy * j) * unit, psw * unit, random(0.60, 1.00) * unit, true, 0);        
        psx += psw + 0.30;
      }
    }
  }

  // tetto
  tetto(lar, by + basa + alte, sizy, nr_pia == 4);
  
  bx += lar + 0.10;
}

// ----------------------------------------------------------------

color colore(int ic) {
  colorMode(HSB, 1);
  color col = color(hue(c_facc[ic]), saturation(c_facc[ic]) + random(-0.05, 0.05), brightness(c_facc[ic]) + random(-0.05, 0.05));
  colorMode(RGB, 255);
  return(col);
}

// ----------------------------------------------------------------

void basamento(float basa, float lar, int nr_fin, float sizx) {
  // con portico
  if ((nr_fin == 2) & (random(1) > 0.3)) {
    rettangolo[cc]._init(0, cd               ,  bx               * unit, height -  by                * unit, 0.60         * unit, - (basa - 1.00) * unit, true, 0);
    rettangolo[cc]._init(0, color(50, 50, 50), (bx +       0.60) * unit, height -  by                * unit, (lar - 1.20) * unit, - (basa - 1.00) * unit, false, 0);
    rettangolo[cc]._init(0, cd               , (bx + lar - 0.60) * unit, height -  by                * unit, 3.60         * unit, - (basa - 1.00) * unit, true, 0);
    rettangolo[cc]._init(0, cd               ,  bx               * unit, height - (by + basa - 1.00) * unit, (lar + 3.00) * unit, -         1.00  * unit, true, 0);
    for (int i=0; i<nr_fin; i++) {
      rettangolo[cc]._init(0, color(20, 20, 20), (bx + sizx / 2.0 + sizx * i - 0.40) * unit, height - by * unit, 0.80 * unit, -2.00 * unit, false, 0);
    }

    // tenda
    float ht = random(1.60, 2.00);
    rettangolo[cc]._init(0, color(255, 250, 230), (bx + 0.30 - 0.5*(basa - ht - 0.30)) * unit, height - (by + ht         ) * unit, (lar - 0.60) * unit, - (basa - ht - 0.30) * unit, true, 0.5);
    rettangolo[cc]._init(0, color(150, 145, 125), (bx + 0.30- 0.5*(basa - ht - 0.30)) * unit, height - (by + ht + 0.30  ) * unit, (lar - 0.60) * unit, - 0.10               * unit, true, 0);
    rettangolo[cc]._init(0, color(100)          , (bx + 0.30) * unit, height - (by + basa - 0.50) * unit, (lar - 0.60) * unit, - 0.20               * unit, true, 0);
  }
  // senza portico - portone
  else {
    rettangolo[cc]._init(0, cd   ,  bx                 * unit, height - by * unit, (lar + 3.00) * unit, - basa * unit, true , 0);
    for (int i=0; i<nr_fin; i++) {
      rettangolo[cc]._init(0, c_per, (bx + sizx / 2.0 + sizx * i - 0.60) * unit, height - by * unit, 1.20 * unit, -2.20 * unit, false, 0);
    }
  }
  rettangolo[cc]._init(0, color(100, 100, 100), (bx + lar - 0.10) * unit, height - by * unit, 0.10 * unit, - basa * unit, true, 0);
}

// ----------------------------------------------------------------

void facciata(float basa, float lar, float alte, int nr_fin, int nr_pia, float sizx, float sizy) {
  if (nr_pia < 4) {
    rettangolo[cc]._init(0, colore(ic), bx * unit, height - basa * unit, (lar + 3.00) * unit, - alte * unit, true, 0);
    rettangolo[cc]._init(0, colore(ic), (bx + lar) * unit, height - (basa + alte) * unit, 3.00 * unit, - 2.00 * unit, true, -0.75);
  }
  else {
    rettangolo[cc]._init(0, colore(ic), bx * unit, height - basa * unit, (lar + 3.0) * unit, - (alte - sizy) * unit, true, 0);
    rettangolo[cc]._init(0, colore(ic), (bx + 1.00) * unit, height - (basa + alte - sizy) * unit, (lar + 2.00) * unit, - sizy * unit, true, 0);
    rettangolo[cc]._init(0, colore(ic), (bx + lar + 1.00) * unit, height - (basa + alte) * unit, 2.00 * unit, - 1.33 * unit, true, -0.75);
  }
  
  // decori
  int tipo = round(random(2));
  if (nr_pia < 4) {
    rettangolo[cc]._init(0, cd,  bx               * unit, height - basa * unit, 0.30 * unit, - alte * unit, true, 0);
    rettangolo[cc]._init(0, cd, (bx + lar - 0.30) * unit, height - basa * unit, 0.30 * unit, - alte * unit, true, 0);
  }
  else {
    rettangolo[cc]._init(0, cd,  bx               * unit, height - basa * unit, 0.30 * unit, - (alte - sizy) * unit, true, 0);
    rettangolo[cc]._init(0, cd, (bx + lar - 0.30) * unit, height - basa * unit, 0.30 * unit, - (alte - sizy) * unit, true, 0);
    rettangolo[cc]._init(0, cd, (bx + 1.00)       * unit, height - (basa + alte - sizy) * unit, 0.30 * unit, - sizy * unit, true, 0);
    rettangolo[cc]._init(0, cd, (bx + lar + 0.70) * unit, height - (basa + alte - sizy) * unit, 0.30 * unit, - sizy * unit, true, 0);
  }
  for (int j=0; j<nr_pia; j++) {
    if (j == 3) bx += 1.00;    
    for (int i=0; i<nr_fin; i++) {
      rettangolo[cc]._init(0, cd, (bx + sizx / 2.0 + sizx * i - 0.65) * unit, height - (basa + 0.80 + sizy * j) * unit, 1.30 * unit, -1.62 * unit, true, 0);
      if (tipo > 0) {
        // sopra e sottoluce
        rettangolo[cc]._init(0, cd, (bx + sizx / 2.0 + sizx * i - 0.55) * unit, height - (basa + 0.10 + sizy * j) * unit, 1.10 * unit, -0.60           * unit, false, 0);
        rettangolo[cc]._init(0, cd, (bx + sizx / 2.0 + sizx * i - 0.50) * unit, height - (basa + 2.50 + sizy * j) * unit, 1.00 * unit, - (sizy - 2.80) * unit, false, 0);
      }
    }
    rettangolo[cc]._init(0, cd, bx * unit, height - (basa - 0.30 + sizy * j) * unit, lar * unit, -0.30 * unit, true, 0);
    if (tipo == 1) {
      rettangolo[cc]._init(0, cd, bx * unit, height - (basa + 0.60 + sizy * j) * unit, lar * unit, -0.20 * unit, true, 0);
    }
  }
  if (nr_pia < 4) {
    rettangolo[cc]._init(0, color(100, 100, 100), (bx + lar - 0.10) * unit, height - by * unit, 0.10 * unit, - (basa - by + alte) * unit, true, 0);
  }
  else {
    bx -= 1.00;
    rettangolo[cc]._init(0, color(100, 100, 100), (bx + lar - 0.10) * unit, height - by * unit, 0.10 * unit, - (basa - by + alte - sizy) * unit, true, 0);
  }
}

// ----------------------------------------------------------------

void persiana(color col, float px, float py, boolean ril) {
  int sx = round(px * unit);
  int dx = round(0.525 * unit);
  int sy = round(height - (py + 1.30) * unit);
  int dy = round(1.30 * unit);
  
  rettangolo[cc]._init(0, col, sx, sy, dx, dy, ril, 0);
}

// ----------------------------------------------------------------

void tetto(float lar, float alte, float sizy, boolean attico) {
  if (!attico) {
    rettangolo[cc]._init(0, color(200, 180, 160), bx * unit, height - alte * unit, lar * unit, - 2.00 * unit, true, 0.75);
  }
  else {
    rettangolo[cc]._init(0, color(200, 180, 160), bx * unit, height - alte * unit, lar * unit, - 1.33 * unit, true, 0.75);
  }
  // gronda
  rettangolo[cc]._init(0, color(50), bx * unit, height - alte * unit, lar * unit, - 0.1 * unit, true, 0);
  // comignoli
  if (random(1) > 0.5) {
    rettangolo[cc]._init(0, c_facc[ic], (bx + 1.00) * unit, height - (alte + 0.50) * unit, 0.50 * unit, - 0.50 * unit, true, 0);
    rettangolo[cc]._init(0, color(150), (bx + 0.90) * unit, height - (alte + 1.00) * unit, 0.70 * unit, - 0.30 * unit, true, 0);
  }
  if (random(1) > 0.5) {
    rettangolo[cc]._init(0, c_facc[ic], (bx + lar - 1.00) * unit, height - (alte + 0.50) * unit, 0.50 * unit, - 0.50 * unit, true, 0);
    rettangolo[cc]._init(0, color(150), (bx + lar - 1.10) * unit, height - (alte + 1.00) * unit, 0.70 * unit, - 0.30 * unit, true, 0);
  }
  
  if (attico) {
    bx -= 1.00;
    rettangolo[cc]._init(0, color(150, 140, 110), bx * unit, height - (alte - sizy      ) * unit, (lar + 1.00) * unit, - 0.5 * unit, true, 0);
    rettangolo[cc]._init(0, color(50)           , bx * unit, height - (alte - sizy      ) * unit, (lar + 1.00) * unit, - 0.1 * unit, true, 0);
    rettangolo[cc]._init(0, c_facc[ic]          , bx * unit, height - (alte - sizy + 0.5) * unit, (lar + 1.00) * unit, - 0.5 * unit, false, 0);
    // gerani
    if (random(1) > 0.5) {
      color col = color(0);
      switch (int(random(3))) {
        case 0: col = color(255, 220,  50, 100); break;
        case 1: col = color(170,   0,   0, 100); break;
        case 2: col = color( 50, 100,   0, 100); break;
      }
      for (int i=0; i<10 * lar; i++) {
        float px = (bx + random(lar)) * unit;
        float py = height - (alte - sizy + random(0.5, 1.0)) * unit;
        rettangolo[cc]._init(1, col, px, py, 8, 8, false, 0);
      }
    }
  }
}

// ----------------------------------------------------------------

class c_rettangolo {
  int tipo;
  color col;
  float fx1;
  float fy1;
  float fdex;
  float fdey;
  boolean ril;
  float inc;
  
  void _init(int tipo_, color col_, float fx1_, float fy1_, float fdex_, float fdey_, boolean ril_, float inc_) {
    tipo = tipo_;
    col = col_;
    fx1 = fx1_;
    fy1 = fy1_;
    fdex = fdex_;
    fdey = fdey_;
    ril = ril_;
    inc = inc_;
    cc++;
  }
  
  void _draw() {
    switch(tipo) {
      case 0: // rettangolo
        if ((max(abs(fdex), abs(fdey)) / min(abs(fdex), abs(fdey))) > 2.2) {  
          int x1 = round(fx1);
          int y1 = round(fy1);
          int dex = round(fdex);
          int dey = round(fdey);
          int delta = 1;  
          pg.stroke(red(col), green(col), blue(col), 200);
          pg.strokeWeight(5);
          float ra = 1;
          if (abs(dex) > abs(dey)) {
            if (dey < 0) delta = -1;
            for (int i=0; i<abs(dey); i+=3) {
              int si = delta * i;
              pg.line(x1 + i * inc + random(-ra, ra), y1 + si + random(-ra, ra), x1 + i * inc + dex + random(-ra, ra), y1 + si + random(-ra, ra));
            }
          }
          else {
            if (dex < 0) delta = -1;
            for (int i=0; i<abs(dex); i+=3) {
              int si = delta * i;
              pg.line(x1 + si + random(-ra, ra), y1 + i * inc + random(-ra, ra), x1 + si + random(-ra, ra), y1 + i * inc + dey + random(-ra, ra));
            }
          }    
        }
        else {    
          int nr = int(0.1 * abs(fdex) * abs(fdey));
          pg.fill(red(col), green(col), blue(col), 128);
          pg.noStroke();
          for (int i=0; i<nr; i++) {
            float y = random(fdey);
            pg.ellipse(fx1 + random(fdex) - y * inc, fy1 + y, 10, 10);
          }    
        }

        // contorni
        int x1 = round(min(fx1, fx1 + fdex));
        int y1 = round(min(fy1, fy1 + fdey));
        int x2 = round(max(fx1, fx1 + fdex));
        int y2 = round(max(fy1, fy1 + fdey));
        pg.strokeWeight(2);
        pg.noFill();
        colorMode(HSB, 255);
        if (ril) pg.stroke(hue(col),       saturation(col), 0.5 * brightness(col), 30);
        else     pg.stroke(hue(col), 0.1 * saturation(col), 255                  , 50);
        pg.line(x1             , y2, x2, y2);
        pg.line(x2 - inc * fdey, y1, x2, y2);
        if (ril) pg.stroke(hue(col), 0.1 * saturation(col), 255                  , 50);
        else     pg.stroke(hue(col),       saturation(col), 0.5 * brightness(col), 30);
        pg.line(x1 - inc * fdey, y1, x2 - inc * fdey, y1);
        pg.line(x1 - inc * fdey, y1, x1             , y2);

        colorMode(RGB, 255);
        break;
        
      case 1: // cerchio
        pg.noStroke();
        pg.fill(col);
        pg.ellipse(fx1, fy1, fdex, fdey);
        break;
    }
  }
}

// ----------------------------------------------------------------

void barca(float px, float py, float sc) {
  float sc1 = sc * unit;
  pg.strokeWeight(5);
  color col = color(0);
  switch(int(random(4))) {
    case 0:
    case 1:
      col = color(random(230, 250), random(230, 250), random(230, 250), 150);
      break;
    case 2:
      col = color(random(200, 210), random(20, 30), random(20, 30), 150);
      break;
    case 3:
      col = color(random(20, 30), random(20, 30), random(200, 210), 150);
      break;
  }
  pg.stroke(col);
  pg.line(px             , py - 0.10 * unit, px + sc1 * 5.05, py - 0.10 * unit);
  pg.line(px + sc1 * 5.05, py - 0.10 * unit, px + sc1 * 5.20, py -  sc1 * 0.90);
  pg.line(px + sc1 * 5.20, py -  sc1 * 0.90, px + sc1 * 4.50, py -  sc1 * 0.70);
  pg.line(px + sc1 * 4.50, py -  sc1 * 0.70, px + sc1 * 2.00, py -  sc1 * 0.60);
  pg.line(px + sc1 * 2.00, py -  sc1 * 0.60, px             , py -  sc1 * 0.70);
  pg.line(px             , py -  sc1 * 0.70, px             , py - 0.10 * unit);
  pg.line(px             , py -  sc1 * 0.30, px + sc1 * 5.10, py -  sc1 * 0.30);
  pg.line(px             , py -  sc1 * 0.50, px + sc1 * 5.15, py -  sc1 * 0.50);  
  pg.stroke(color(random(140, 150), 100, 20, 150));
  pg.line(px + sc1 * 5.20, py -  sc1 * 1.00, px + sc1 * 4.50, py -  sc1 * 0.80);
  pg.line(px + sc1 * 4.50, py -  sc1 * 0.80, px + sc1 * 2.00, py -  sc1 * 0.70);
  pg.line(px + sc1 * 2.00, py -  sc1 * 0.70, px - sc1 * 0.10, py -  sc1 * 0.80);
  pg.stroke(color(30, 30, 30, 150));
  pg.line(px             , py              , px + sc1 * 5.00, py - 0.10 * unit);
  // riflesso
  pg.stroke(color(30, 30, 30, 50));
  pg.line(px, py + 5, px + sc1 * 5.00, py + 5);
  int ppy = int(py + 10);
  int dey = 6;
  for(int i=0; i<4; i++) {      
    pg.stroke(color(red(col), green(col), blue(col), 60 - 14 * i));
    pg.line(px + 0 * i, ppy, px + sc1 * 5.00 - 0 * i, ppy);
    ppy += dey;
    dey *= 1.5;
  }
}

// ----------------------------------------------------------------

void firma() {
  pg.strokeWeight(4);
  pg.stroke(0, 0, 0, 120);
  int px = width - 140;
  int py = height - 40;
  float sc = 0.15;
  pg.beginShape();
  pg.curveVertex(px + sc *   1, py + sc *  89);
  pg.curveVertex(px + sc *  14, py + sc *  69);
  pg.curveVertex(px + sc *  54, py + sc *  27);
  pg.curveVertex(px + sc *  86, py + sc *  67);
  pg.curveVertex(px + sc * 106, py + sc * 134);
  pg.curveVertex(px + sc * 125, py + sc *  95);
  pg.curveVertex(px + sc * 161, py + sc * 107);
  pg.curveVertex(px + sc * 216, py + sc * 115);
  pg.curveVertex(px + sc * 308, py + sc * 103);
  pg.curveVertex(px + sc * 345, py + sc *  97);
  pg.endShape();
  pg.beginShape();
  pg.curveVertex(px + sc * 280, py + sc *  75);
  pg.curveVertex(px + sc * 280, py + sc *  94);
  pg.curveVertex(px + sc * 294, py + sc * 114);
  pg.curveVertex(px + sc * 310, py + sc * 103);
  pg.curveVertex(px + sc * 324, py + sc * 112);
  pg.curveVertex(px + sc * 341, py + sc * 112);
  pg.endShape();
  px = width - 160;
  pg.beginShape();
  pg.curveVertex(px + sc * 595, py + sc *  55);
  pg.curveVertex(px + sc * 592, py + sc *  39);
  pg.curveVertex(px + sc * 572, py + sc *  29);
  pg.curveVertex(px + sc * 458, py + sc *  55);
  pg.curveVertex(px + sc * 526, py + sc *  69);
  pg.curveVertex(px + sc * 617, py + sc *  67);
  pg.curveVertex(px + sc * 672, py + sc *  80);
  pg.curveVertex(px + sc * 597, py + sc * 100);
  pg.curveVertex(px + sc * 496, py + sc * 100);
  pg.curveVertex(px + sc * 703, py + sc *  88);
  pg.curveVertex(px + sc * 729, py + sc *  83);
  pg.endShape();
  pg.beginShape();
  pg.curveVertex(px + sc * 707, py + sc *  98);
  pg.curveVertex(px + sc * 702, py + sc *  88);
  pg.curveVertex(px + sc * 684, py + sc *  82);
  pg.curveVertex(px + sc * 673, py + sc *  91);
  pg.curveVertex(px + sc * 701, py + sc * 104);
  pg.curveVertex(px + sc * 727, py + sc *  92);
  pg.curveVertex(px + sc * 717, py + sc *  83);
  pg.curveVertex(px + sc * 702, py + sc *  73);
  pg.endShape();
}

// ----------------------------------------------------------------


