
Sol Sol;
Luna Luna;
int x, y, t, cont, tamaPix, Gif;
float holi=frameCount;

void setup() {
  tamaPix=14; ////Cambiando este valor cambio la resolución de la pantalla, no en .js
  size(37*14, 52*14);
  Gif=9;
  x=120;
  y= height;
  cont=tamaPix;
  frameRate(3);
  Sol = new Sol();
  Luna = new Luna();
}
void draw() {
  noStroke();
  switch(Gif%9) {
  case 0:
    Frame1(tamaPix);
    break;
  case 1:
    Frame2(tamaPix);
    break;
  case 2:
    Frame3(0);
    break;
  case 3:
    Frame4(-tamaPix);
    break;
  case 4:
    Frame5(-2*tamaPix);
    break;
  case 5:
    Frame6(-3*tamaPix);
    break;
  case 6:
    Frame7(-4*tamaPix);
    break;
  case 7:
    Frame8(-5*tamaPix);
    break;
  case 8:
    Frame9(-6*tamaPix);
    break;
  }
  if ((frameCount%9)==0) {
    Gif++;
    save("Alpaca1.png");
  }
  if ((frameCount%9)==1) {
    Gif++;
    save("Alpaca2.png");
  }
  if ((frameCount%9)==2) {
    Gif++;
    save("Alpaca3.png");
  }
  if ((frameCount%9)==3) {
    Gif++;
    save("Alpaca4.png");
  }
  if ((frameCount%9)==4) {
    Gif++;
    save("Alpaca5.png");
  }
  if ((frameCount%9)==5) {
    Gif++;
    save("Alpaca6.png");
  }
  if ((frameCount%9)==6) {
    Gif++;
    save("Alpaca7.png");
  }
  if ((frameCount%9)==7) {
    Gif++;
    save("Alpaca8.png");
  }
  if ((frameCount%9)==8) {
    Gif++;
    save("Alpaca9.png");
  }
}

void Frame1( int cont) {
  smooth();
  fill(#549BF5); //Color celeste cielo
  rect(0, 0, width, height);
  fill(#5A2115); //Color suelo de puna oscuro
  rect(0, height-(tamaPix*16), width, height/3);
  fill(#A56C2F); //Color suelo de puna claro
  rect(0, (22*tamaPix), (6*tamaPix), (11*tamaPix));
  rect(0, (21*tamaPix), (3*tamaPix), tamaPix);
  rect(0, (28*tamaPix), width, (9*tamaPix));
  rect((26*tamaPix), (23*tamaPix), (3*tamaPix), tamaPix);
  rect((26*tamaPix), (24*tamaPix), (6*tamaPix), tamaPix);
  rect((26*tamaPix), (25*tamaPix), (7*tamaPix), tamaPix);
  rect((26*tamaPix), (26*tamaPix), (8*tamaPix), tamaPix);
  rect((26*tamaPix), (27*tamaPix), (9*tamaPix), tamaPix);
 /* fill(#084D07); // Color verde cactus
  rect(32*tamaPix), 30*tamaPix, 2*tamaPix, 11*tamaPix);*/
  Sol.mostrar(0, 3, #FFFF00);//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// SOL
  fill(#D19722); //Color beige alpaca
  rect(0, y-tamaPix, (28*tamaPix), tamaPix);
  t=0;
  while (t<9) {
    rect(0, y-cont-tamaPix, (30*tamaPix), tamaPix);
    cont+=tamaPix;
    t++;
  }
  rect(0, y-cont-tamaPix, (29*tamaPix), tamaPix);
  cont+=tamaPix;
  rect(0, y-cont-tamaPix, (29*tamaPix), tamaPix);
  cont+=tamaPix;
  rect(0, y-cont-tamaPix, (29*tamaPix), tamaPix);
  cont+=tamaPix;
  rect(0, y-cont-tamaPix, (28*tamaPix), tamaPix);
  cont+=tamaPix;
  rect(0, y-cont-tamaPix, (28*tamaPix), tamaPix);
  cont+=tamaPix;
  rect(0, y-cont-tamaPix, (28*tamaPix), tamaPix);
  cont+=tamaPix;
  rect(0, y-cont-tamaPix, (27*tamaPix), tamaPix);
  cont+=tamaPix;
  rect(0, y-cont-tamaPix, (27*tamaPix), tamaPix);
  cont+=tamaPix;
  rect(0, y-cont-tamaPix, (27*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((3*tamaPix), y-cont-tamaPix, (24*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((3*tamaPix), y-cont-tamaPix, (24*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((4*tamaPix), y-cont-tamaPix, (23*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((5*tamaPix), y-cont-tamaPix, (21*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((5*tamaPix), y-cont-tamaPix, (21*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((5*tamaPix), y-cont-tamaPix, (21*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((5*tamaPix), y-cont-tamaPix, (21*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((5*tamaPix), y-cont-tamaPix, (21*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((5*tamaPix), y-cont-tamaPix, (21*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((5*tamaPix), y-cont-tamaPix, (21*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((5*tamaPix), y-cont-tamaPix, (21*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((5*tamaPix), y-cont-tamaPix, (22*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((4*tamaPix), y-cont-tamaPix, (23*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((4*tamaPix), y-cont-tamaPix, (23*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((4*tamaPix), y-cont-tamaPix, (23*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((4*tamaPix), y-cont-tamaPix, (23*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((4*tamaPix), y-cont-tamaPix, (23*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((4*tamaPix), y-cont-tamaPix, (23*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((4*tamaPix), y-cont-tamaPix, (23*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((4*tamaPix), y-cont-tamaPix, (23*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((4*tamaPix), y-cont-tamaPix, (23*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((4*tamaPix), y-cont-tamaPix, (23*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((4*tamaPix), y-cont-tamaPix, (23*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((4*tamaPix), y-cont-tamaPix, (23*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((4*tamaPix), y-cont-tamaPix, (23*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((5*tamaPix), y-cont-tamaPix, (21*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((5*tamaPix), y-cont-tamaPix, (6*tamaPix), tamaPix);
  rect((20*tamaPix), y-cont-tamaPix, (6*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((6*tamaPix), y-cont-tamaPix, (5*tamaPix), tamaPix);
  rect((20*tamaPix), y-cont-tamaPix, (5*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((6*tamaPix), y-cont-tamaPix, (4*tamaPix), tamaPix);
  rect((21*tamaPix), y-cont-tamaPix, (4*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((6*tamaPix), y-cont-tamaPix, (4*tamaPix), tamaPix);
  rect((21*tamaPix), y-cont-tamaPix, (4*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((6*tamaPix), y-cont-tamaPix, (3*tamaPix), tamaPix);
  rect((22*tamaPix), y-cont-tamaPix, (3*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((6*tamaPix), y-cont-tamaPix, (2*tamaPix), tamaPix);
  rect((23*tamaPix), y-cont-tamaPix, (2*tamaPix), tamaPix);

  /////////////////////// Alpaca en beige /////////////////////////

  fill(0);
  rect((14*tamaPix), (21*tamaPix), (3*tamaPix), tamaPix);
  rect((15*tamaPix), (20*tamaPix), tamaPix, tamaPix);

  rect((8*tamaPix), (10*tamaPix), (4*tamaPix), (4*tamaPix));
  rect((7*tamaPix), (11*tamaPix), tamaPix, (2*tamaPix));
  rect((19*tamaPix), (10*tamaPix), (4*tamaPix), (4*tamaPix));
  rect((23*tamaPix), (11*tamaPix), tamaPix, (2*tamaPix));

  rect((14*tamaPix), (13*tamaPix), (3*tamaPix), (5*tamaPix));
  rect((13*tamaPix), (15*tamaPix), (5*tamaPix), (2*tamaPix));

  fill(#895233);
  rect((7*tamaPix), (5*tamaPix), (2*tamaPix), (3*tamaPix));
  rect((22*tamaPix), (5*tamaPix), (2*tamaPix), (3*tamaPix));
  rect((7*tamaPix), (4*tamaPix), tamaPix, tamaPix);
  rect((23*tamaPix), (4*tamaPix), tamaPix, tamaPix);

  fill(255);
  rect((9*tamaPix), (11*tamaPix), tamaPix, tamaPix);
  rect((20*tamaPix), (11*tamaPix), tamaPix, tamaPix);

  /////////////////////// Ojos, nariz, boca, orejas //////////////////
}
void Frame2(int cont) {
  smooth();
  fill(#4986D3); //Color celeste cielo
  rect(0, 0, width, height);
  fill(#5A2115); //Color suelo de puna oscuro
  rect(0, height-(tamaPix*16), width, height/3);
  fill(#A56C2F); //Color suelo de puna claro
  rect(0, (22*tamaPix), (6*tamaPix), (11*tamaPix));
  rect(0, (21*tamaPix), (3*tamaPix), tamaPix);
  rect(0, (28*tamaPix), width, (9*tamaPix));
  rect((26*tamaPix), (23*tamaPix), (3*tamaPix), tamaPix);
  rect((26*tamaPix), (24*tamaPix), (6*tamaPix), tamaPix);
  rect((26*tamaPix), (25*tamaPix), (7*tamaPix), tamaPix);
  rect((26*tamaPix), (26*tamaPix), (8*tamaPix), tamaPix);
  rect((26*tamaPix), (27*tamaPix), (9*tamaPix), tamaPix);
  Sol.mostrar(9, 1, #FF9900);//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// SOL
  fill(#D19722); //Color beige alpaca
  rect(0, y-tamaPix, (28*tamaPix), tamaPix);
  t=0;
  while (t<9) {
    rect(0, y-cont-tamaPix, (30*tamaPix), tamaPix);
    cont+=tamaPix;
    t++;
  }
  rect(0, y-cont-tamaPix, (29*tamaPix), tamaPix);
  cont+=tamaPix;
  rect(0, y-cont-tamaPix, (29*tamaPix), tamaPix);
  cont+=tamaPix;
  rect(0, y-cont-tamaPix, (29*tamaPix), tamaPix);
  cont+=tamaPix;
  rect(0, y-cont-tamaPix, (28*tamaPix), tamaPix);
  cont+=tamaPix;
  rect(0, y-cont-tamaPix, (28*tamaPix), tamaPix);
  cont+=tamaPix;
  rect(0, y-cont-tamaPix, (28*tamaPix), tamaPix);
  cont+=tamaPix;
  rect(0, y-cont-tamaPix, (27*tamaPix), tamaPix);
  cont+=tamaPix;
  rect(0, y-cont-tamaPix, (27*tamaPix), tamaPix);
  cont+=tamaPix;
  rect(0, y-cont-tamaPix, (27*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((3*tamaPix), y-cont-tamaPix, (24*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((3*tamaPix), y-cont-tamaPix, (24*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((4*tamaPix), y-cont-tamaPix, (23*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((5*tamaPix), y-cont-tamaPix, (21*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((5*tamaPix), y-cont-tamaPix, (21*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((5*tamaPix), y-cont-tamaPix, (21*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((5*tamaPix), y-cont-tamaPix, (21*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((5*tamaPix), y-cont-tamaPix, (21*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((5*tamaPix), y-cont-tamaPix, (21*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((5*tamaPix), y-cont-tamaPix, (21*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((5*tamaPix), y-cont-tamaPix, (21*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((5*tamaPix), y-cont-tamaPix, (22*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((4*tamaPix), y-cont-tamaPix, (23*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((4*tamaPix), y-cont-tamaPix, (23*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((4*tamaPix), y-cont-tamaPix, (23*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((4*tamaPix), y-cont-tamaPix, (23*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((4*tamaPix), y-cont-tamaPix, (23*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((4*tamaPix), y-cont-tamaPix, (23*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((4*tamaPix), y-cont-tamaPix, (23*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((4*tamaPix), y-cont-tamaPix, (23*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((4*tamaPix), y-cont-tamaPix, (23*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((4*tamaPix), y-cont-tamaPix, (23*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((4*tamaPix), y-cont-tamaPix, (23*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((4*tamaPix), y-cont-tamaPix, (23*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((4*tamaPix), y-cont-tamaPix, (23*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((5*tamaPix), y-cont-tamaPix, (21*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((5*tamaPix), y-cont-tamaPix, (6*tamaPix), tamaPix);
  rect((20*tamaPix), y-cont-tamaPix, (6*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((6*tamaPix), y-cont-tamaPix, (5*tamaPix), tamaPix);
  rect((20*tamaPix), y-cont-tamaPix, (5*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((6*tamaPix), y-cont-tamaPix, (4*tamaPix), tamaPix);
  rect((21*tamaPix), y-cont-tamaPix, (4*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((6*tamaPix), y-cont-tamaPix, (4*tamaPix), tamaPix);
  rect((21*tamaPix), y-cont-tamaPix, (4*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((6*tamaPix), y-cont-tamaPix, (3*tamaPix), tamaPix);
  rect((22*tamaPix), y-cont-tamaPix, (3*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((6*tamaPix), y-cont-tamaPix, (2*tamaPix), tamaPix);
  rect((23*tamaPix), y-cont-tamaPix, (2*tamaPix), tamaPix);

  /////////////////////// Alpaca en beige /////////////////////////

  fill(0);
  rect((13*tamaPix), (21*tamaPix), (5*tamaPix), tamaPix);
  rect((14*tamaPix), (20*tamaPix), 3*tamaPix, tamaPix);

  rect((8*tamaPix), (10*tamaPix), (4*tamaPix), (4*tamaPix));
  rect((7*tamaPix), (11*tamaPix), tamaPix, (2*tamaPix));
  rect((19*tamaPix), (10*tamaPix), (4*tamaPix), (4*tamaPix));
  rect((23*tamaPix), (11*tamaPix), tamaPix, (2*tamaPix));

  rect((14*tamaPix), (13*tamaPix), (3*tamaPix), (5*tamaPix));
  rect((13*tamaPix), (15*tamaPix), (5*tamaPix), (2*tamaPix));

  fill(#895233);
  rect((7*tamaPix), (5*tamaPix), (2*tamaPix), (3*tamaPix));
  rect((22*tamaPix), (5*tamaPix), (2*tamaPix), (3*tamaPix));
  rect((7*tamaPix), (4*tamaPix), tamaPix, tamaPix);
  rect((23*tamaPix), (4*tamaPix), tamaPix, tamaPix);

  fill(255);
  rect((10*tamaPix), (11*tamaPix), tamaPix, tamaPix);
  rect((21*tamaPix), (11*tamaPix), tamaPix, tamaPix);

  /////////////////////// Ojos, nariz, boca, orejas //////////////////
}
void Frame3(int cont) {
  smooth();
  fill(#3E72B4); //Color celeste cielo
  rect(0, 0, width, height);
  fill(#5A2115); //Color suelo de puna oscuro
  rect(0, height-(tamaPix*16), width, height/3);
  fill(#A56C2F); //Color suelo de puna claro
  rect(0, (22*tamaPix), (6*tamaPix), (11*tamaPix));
  rect(0, (21*tamaPix), (3*tamaPix), tamaPix);
  rect(0, (28*tamaPix), width, (9*tamaPix));
  rect((26*tamaPix), (23*tamaPix), (3*tamaPix), tamaPix);
  rect((26*tamaPix), (24*tamaPix), (6*tamaPix), tamaPix);
  rect((26*tamaPix), (25*tamaPix), (7*tamaPix), tamaPix);
  rect((26*tamaPix), (26*tamaPix), (8*tamaPix), tamaPix);
  rect((26*tamaPix), (27*tamaPix), (9*tamaPix), tamaPix);
  Sol.mostrar(16, 2, #F59219);//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// SOL
  fill(#D19722); //Color beige alpaca
  rect(0, y-tamaPix, (28*tamaPix), tamaPix);
  t=0;
  while (t<9) {
    rect(0, y-cont-tamaPix, (30*tamaPix), tamaPix);
    cont+=tamaPix;
    t++;
  }
  rect(0, y-cont-tamaPix, (29*tamaPix), tamaPix);
  cont+=tamaPix;
  rect(0, y-cont-tamaPix, (29*tamaPix), tamaPix);
  cont+=tamaPix;
  rect(0, y-cont-tamaPix, (29*tamaPix), tamaPix);
  cont+=tamaPix;
  rect(0, y-cont-tamaPix, (28*tamaPix), tamaPix);
  cont+=tamaPix;
  rect(0, y-cont-tamaPix, (28*tamaPix), tamaPix);
  cont+=tamaPix;
  rect(0, y-cont-tamaPix, (28*tamaPix), tamaPix);
  cont+=tamaPix;
  rect(0, y-cont-tamaPix, (27*tamaPix), tamaPix);
  cont+=tamaPix;
  rect(0, y-cont-tamaPix, (27*tamaPix), tamaPix);
  cont+=tamaPix;
  rect(0, y-cont-tamaPix, (27*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((3*tamaPix), y-cont-tamaPix, (24*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((3*tamaPix), y-cont-tamaPix, (24*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((4*tamaPix), y-cont-tamaPix, (23*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((5*tamaPix), y-cont-tamaPix, (21*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((5*tamaPix), y-cont-tamaPix, (21*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((5*tamaPix), y-cont-tamaPix, (21*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((5*tamaPix), y-cont-tamaPix, (21*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((5*tamaPix), y-cont-tamaPix, (21*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((5*tamaPix), y-cont-tamaPix, (21*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((5*tamaPix), y-cont-tamaPix, (21*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((5*tamaPix), y-cont-tamaPix, (21*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((5*tamaPix), y-cont-tamaPix, (22*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((4*tamaPix), y-cont-tamaPix, (23*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((4*tamaPix), y-cont-tamaPix, (23*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((4*tamaPix), y-cont-tamaPix, (23*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((4*tamaPix), y-cont-tamaPix, (23*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((4*tamaPix), y-cont-tamaPix, (23*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((4*tamaPix), y-cont-tamaPix, (23*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((4*tamaPix), y-cont-tamaPix, (23*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((4*tamaPix), y-cont-tamaPix, (23*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((4*tamaPix), y-cont-tamaPix, (23*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((4*tamaPix), y-cont-tamaPix, (23*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((4*tamaPix), y-cont-tamaPix, (23*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((4*tamaPix), y-cont-tamaPix, (23*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((4*tamaPix), y-cont-tamaPix, (23*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((5*tamaPix), y-cont-tamaPix, (21*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((5*tamaPix), y-cont-tamaPix, (6*tamaPix), tamaPix);
  rect((20*tamaPix), y-cont-tamaPix, (6*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((6*tamaPix), y-cont-tamaPix, (5*tamaPix), tamaPix);
  rect((20*tamaPix), y-cont-tamaPix, (5*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((6*tamaPix), y-cont-tamaPix, (4*tamaPix), tamaPix);
  rect((21*tamaPix), y-cont-tamaPix, (4*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((6*tamaPix), y-cont-tamaPix, (4*tamaPix), tamaPix);
  rect((21*tamaPix), y-cont-tamaPix, (4*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((6*tamaPix), y-cont-tamaPix, (3*tamaPix), tamaPix);
  rect((22*tamaPix), y-cont-tamaPix, (3*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((6*tamaPix), y-cont-tamaPix, (2*tamaPix), tamaPix);
  rect((23*tamaPix), y-cont-tamaPix, (2*tamaPix), tamaPix);

  /////////////////////// Alpaca en beige /////////////////////////

  fill(0);
  rect((13*tamaPix), (22*tamaPix), (5*tamaPix), 2*tamaPix);
  rect((14*tamaPix), (21*tamaPix), 3*tamaPix, tamaPix);

  rect((8*tamaPix), (11*tamaPix), (4*tamaPix), (4*tamaPix));
  rect((7*tamaPix), (12*tamaPix), tamaPix, (2*tamaPix));
  rect((19*tamaPix), (11*tamaPix), (4*tamaPix), (4*tamaPix));
  rect((23*tamaPix), (12*tamaPix), tamaPix, (2*tamaPix));

  rect((14*tamaPix), (14*tamaPix), (3*tamaPix), (5*tamaPix));
  rect((13*tamaPix), (16*tamaPix), (5*tamaPix), (2*tamaPix));

  fill(#895233);
  rect((7*tamaPix), (6*tamaPix), (2*tamaPix), (3*tamaPix));
  rect((22*tamaPix), (6*tamaPix), (2*tamaPix), (3*tamaPix));
  rect((7*tamaPix), (5*tamaPix), tamaPix, tamaPix);
  rect((23*tamaPix), (5*tamaPix), tamaPix, tamaPix);

  fill(255);
  rect((10*tamaPix), (12*tamaPix), tamaPix, tamaPix);
  rect((21*tamaPix), (12*tamaPix), tamaPix, tamaPix);

  /////////////////////// Ojos, nariz, boca, orejas //////////////////
}
void Frame4(int cont) {
  smooth();
  fill(#335E95); //Color celeste cielo
  rect(0, 0, width, height);
  fill(#5A2115); //Color suelo de puna oscuro
  rect(0, height-(tamaPix*16), width, height/3);
  fill(#A56C2F); //Color suelo de puna claro
  rect(0, (22*tamaPix), (6*tamaPix), (11*tamaPix));
  rect(0, (21*tamaPix), (3*tamaPix), tamaPix);
  rect(0, (28*tamaPix), width, (9*tamaPix));
  rect((26*tamaPix), (23*tamaPix), (3*tamaPix), tamaPix);
  rect((26*tamaPix), (24*tamaPix), (6*tamaPix), tamaPix);
  rect((26*tamaPix), (25*tamaPix), (7*tamaPix), tamaPix);
  rect((26*tamaPix), (26*tamaPix), (8*tamaPix), tamaPix);
  rect((26*tamaPix), (27*tamaPix), (9*tamaPix), tamaPix);
  Sol.mostrar(23, 3, #F58319);//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// SOL
  fill(#D19722); //Color beige alpaca
  rect(0, y-tamaPix, (28*tamaPix), tamaPix);
  t=0;
  while (t<9) {
    rect(0, y-cont-tamaPix, (30*tamaPix), tamaPix);
    cont+=tamaPix;
    t++;
  }
  rect(0, y-cont-tamaPix, (29*tamaPix), tamaPix);
  cont+=tamaPix;
  rect(0, y-cont-tamaPix, (29*tamaPix), tamaPix);
  cont+=tamaPix;
  rect(0, y-cont-tamaPix, (29*tamaPix), tamaPix);
  cont+=tamaPix;
  rect(0, y-cont-tamaPix, (28*tamaPix), tamaPix);
  cont+=tamaPix;
  rect(0, y-cont-tamaPix, (28*tamaPix), tamaPix);
  cont+=tamaPix;
  rect(0, y-cont-tamaPix, (28*tamaPix), tamaPix);
  cont+=tamaPix;
  rect(0, y-cont-tamaPix, (27*tamaPix), tamaPix);
  cont+=tamaPix;
  rect(0, y-cont-tamaPix, (27*tamaPix), tamaPix);
  cont+=tamaPix;
  rect(0, y-cont-tamaPix, (27*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((3*tamaPix), y-cont-tamaPix, (24*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((3*tamaPix), y-cont-tamaPix, (24*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((4*tamaPix), y-cont-tamaPix, (23*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((5*tamaPix), y-cont-tamaPix, (21*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((5*tamaPix), y-cont-tamaPix, (21*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((5*tamaPix), y-cont-tamaPix, (21*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((5*tamaPix), y-cont-tamaPix, (21*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((5*tamaPix), y-cont-tamaPix, (21*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((5*tamaPix), y-cont-tamaPix, (21*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((5*tamaPix), y-cont-tamaPix, (21*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((5*tamaPix), y-cont-tamaPix, (21*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((5*tamaPix), y-cont-tamaPix, (22*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((4*tamaPix), y-cont-tamaPix, (23*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((4*tamaPix), y-cont-tamaPix, (23*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((4*tamaPix), y-cont-tamaPix, (23*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((4*tamaPix), y-cont-tamaPix, (23*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((4*tamaPix), y-cont-tamaPix, (23*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((4*tamaPix), y-cont-tamaPix, (23*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((4*tamaPix), y-cont-tamaPix, (23*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((4*tamaPix), y-cont-tamaPix, (23*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((4*tamaPix), y-cont-tamaPix, (23*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((4*tamaPix), y-cont-tamaPix, (23*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((4*tamaPix), y-cont-tamaPix, (23*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((4*tamaPix), y-cont-tamaPix, (23*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((4*tamaPix), y-cont-tamaPix, (23*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((5*tamaPix), y-cont-tamaPix, (21*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((5*tamaPix), y-cont-tamaPix, (6*tamaPix), tamaPix);
  rect((20*tamaPix), y-cont-tamaPix, (6*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((6*tamaPix), y-cont-tamaPix, (5*tamaPix), tamaPix);
  rect((20*tamaPix), y-cont-tamaPix, (5*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((6*tamaPix), y-cont-tamaPix, (4*tamaPix), tamaPix);
  rect((21*tamaPix), y-cont-tamaPix, (4*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((6*tamaPix), y-cont-tamaPix, (4*tamaPix), tamaPix);
  rect((21*tamaPix), y-cont-tamaPix, (4*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((6*tamaPix), y-cont-tamaPix, (3*tamaPix), tamaPix);
  rect((22*tamaPix), y-cont-tamaPix, (3*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((6*tamaPix), y-cont-tamaPix, (2*tamaPix), tamaPix);
  rect((23*tamaPix), y-cont-tamaPix, (2*tamaPix), tamaPix);

  /////////////////////// Alpaca en beige /////////////////////////

  fill(0);
  rect((13*tamaPix), (23*tamaPix), (5*tamaPix), 3*tamaPix);
  rect((14*tamaPix), (22*tamaPix), 3*tamaPix, tamaPix);

  rect((8*tamaPix), (13*tamaPix), (4*tamaPix), (3*tamaPix));
  rect((7*tamaPix), (13*tamaPix), tamaPix, (2*tamaPix));
  rect((19*tamaPix), (13*tamaPix), (4*tamaPix), (3*tamaPix));
  rect((23*tamaPix), (13*tamaPix), tamaPix, (2*tamaPix));

  rect((14*tamaPix), (15*tamaPix), (3*tamaPix), (5*tamaPix));
  rect((13*tamaPix), (17*tamaPix), (5*tamaPix), (2*tamaPix));

  fill(#895233);
  rect((7*tamaPix), (7*tamaPix), (2*tamaPix), (3*tamaPix));
  rect((22*tamaPix), (7*tamaPix), (2*tamaPix), (3*tamaPix));
  rect((7*tamaPix), (6*tamaPix), tamaPix, tamaPix);
  rect((23*tamaPix), (6*tamaPix), tamaPix, tamaPix);

  fill(255);
  rect((10*tamaPix), (13*tamaPix), tamaPix, tamaPix);
  rect((21*tamaPix), (13*tamaPix), tamaPix, tamaPix);

  fill(#FC5040);
  rect(14*tamaPix, 24*tamaPix, 3*tamaPix, tamaPix);

  /////////////////////// Ojos, nariz, boca, orejas //////////////////
}
void  Frame5(int cont) {
  smooth();
  fill(#274871); //Color celeste cielo
  rect(0, 0, width, height);
  fill(#5A2115); //Color suelo de puna oscuro
  rect(0, height-(tamaPix*16), width, height/3);
  fill(#A56C2F); //Color suelo de puna claro
  rect(0, (22*tamaPix), (6*tamaPix), (11*tamaPix));
  rect(0, (21*tamaPix), (3*tamaPix), tamaPix);
  rect(0, (28*tamaPix), width, (9*tamaPix));
  rect((26*tamaPix), (23*tamaPix), (3*tamaPix), tamaPix);
  rect((26*tamaPix), (24*tamaPix), (6*tamaPix), tamaPix);
  rect((26*tamaPix), (25*tamaPix), (7*tamaPix), tamaPix);
  rect((26*tamaPix), (26*tamaPix), (8*tamaPix), tamaPix);
  rect((26*tamaPix), (27*tamaPix), (9*tamaPix), tamaPix);
  Sol.mostrar(34, 8, #F56D19);//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// SOL
  Luna.mostrar(0, 6);//////////////////////////////////////////////////////////////////////////////////LUNA
  fill(#D19722); //Color beige alpaca
  rect(0, y-tamaPix, (28*tamaPix), tamaPix);
  t=0;
  while (t<9) {
    rect(0, y-cont-tamaPix, (30*tamaPix), tamaPix);
    cont+=tamaPix;
    t++;
  }
  rect(0, y-cont-tamaPix, (29*tamaPix), tamaPix);
  cont+=tamaPix;
  rect(0, y-cont-tamaPix, (29*tamaPix), tamaPix);
  cont+=tamaPix;
  rect(0, y-cont-tamaPix, (29*tamaPix), tamaPix);
  cont+=tamaPix;
  rect(0, y-cont-tamaPix, (28*tamaPix), tamaPix);
  cont+=tamaPix;
  rect(0, y-cont-tamaPix, (28*tamaPix), tamaPix);
  cont+=tamaPix;
  rect(0, y-cont-tamaPix, (28*tamaPix), tamaPix);
  cont+=tamaPix;
  rect(0, y-cont-tamaPix, (27*tamaPix), tamaPix);
  cont+=tamaPix;
  rect(0, y-cont-tamaPix, (27*tamaPix), tamaPix);
  cont+=tamaPix;
  rect(0, y-cont-tamaPix, (27*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((3*tamaPix), y-cont-tamaPix, (24*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((3*tamaPix), y-cont-tamaPix, (24*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((4*tamaPix), y-cont-tamaPix, (23*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((5*tamaPix), y-cont-tamaPix, (21*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((5*tamaPix), y-cont-tamaPix, (21*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((5*tamaPix), y-cont-tamaPix, (21*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((5*tamaPix), y-cont-tamaPix, (21*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((5*tamaPix), y-cont-tamaPix, (21*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((5*tamaPix), y-cont-tamaPix, (21*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((5*tamaPix), y-cont-tamaPix, (21*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((5*tamaPix), y-cont-tamaPix, (21*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((5*tamaPix), y-cont-tamaPix, (22*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((4*tamaPix), y-cont-tamaPix, (23*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((4*tamaPix), y-cont-tamaPix, (23*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((4*tamaPix), y-cont-tamaPix, (23*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((4*tamaPix), y-cont-tamaPix, (23*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((4*tamaPix), y-cont-tamaPix, (23*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((4*tamaPix), y-cont-tamaPix, (23*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((4*tamaPix), y-cont-tamaPix, (23*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((4*tamaPix), y-cont-tamaPix, (23*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((4*tamaPix), y-cont-tamaPix, (23*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((4*tamaPix), y-cont-tamaPix, (23*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((4*tamaPix), y-cont-tamaPix, (23*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((4*tamaPix), y-cont-tamaPix, (23*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((4*tamaPix), y-cont-tamaPix, (23*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((5*tamaPix), y-cont-tamaPix, (21*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((5*tamaPix), y-cont-tamaPix, (6*tamaPix), tamaPix);
  rect((20*tamaPix), y-cont-tamaPix, (6*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((6*tamaPix), y-cont-tamaPix, (5*tamaPix), tamaPix);
  rect((20*tamaPix), y-cont-tamaPix, (5*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((6*tamaPix), y-cont-tamaPix, (4*tamaPix), tamaPix);
  rect((21*tamaPix), y-cont-tamaPix, (4*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((6*tamaPix), y-cont-tamaPix, (4*tamaPix), tamaPix);
  rect((21*tamaPix), y-cont-tamaPix, (4*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((6*tamaPix), y-cont-tamaPix, (3*tamaPix), tamaPix);
  rect((22*tamaPix), y-cont-tamaPix, (3*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((6*tamaPix), y-cont-tamaPix, (2*tamaPix), tamaPix);
  rect((23*tamaPix), y-cont-tamaPix, (2*tamaPix), tamaPix);

  /////////////////////// Alpaca en beige /////////////////////////

  fill(0);
  rect((13*tamaPix), (24*tamaPix), (5*tamaPix), 4*tamaPix);
  rect((14*tamaPix), (23*tamaPix), 3*tamaPix, tamaPix);

  rect((8*tamaPix), (14*tamaPix), (4*tamaPix), (3*tamaPix));
  rect((7*tamaPix), (14*tamaPix), tamaPix, (2*tamaPix));
  rect((19*tamaPix), (14*tamaPix), (4*tamaPix), (3*tamaPix));
  rect((23*tamaPix), (14*tamaPix), tamaPix, (2*tamaPix));

  rect((14*tamaPix), (16*tamaPix), (3*tamaPix), (5*tamaPix));
  rect((13*tamaPix), (18*tamaPix), (5*tamaPix), (2*tamaPix));

  fill(#895233);
  rect((7*tamaPix), (8*tamaPix), (2*tamaPix), (3*tamaPix));
  rect((22*tamaPix), (8*tamaPix), (2*tamaPix), (3*tamaPix));
  rect((7*tamaPix), (7*tamaPix), tamaPix, tamaPix);
  rect((23*tamaPix), (7*tamaPix), tamaPix, tamaPix);

  fill(255);
  rect((10*tamaPix), (14*tamaPix), tamaPix, tamaPix);
  rect((21*tamaPix), (14*tamaPix), tamaPix, tamaPix);

  fill(#FC5040);
  rect(14*tamaPix, 25*tamaPix, 3*tamaPix, 2*tamaPix);

  /////////////////////// Ojos, nariz, boca, orejas //////////////////
}
void  Frame6(int cont) {
  smooth();
  fill(#1E3758); //Color celeste cielo
  rect(0, 0, width, height);
  fill(#5A2115); //Color suelo de puna oscuro
  rect(0, height-(tamaPix*16), width, height/3);
  fill(#A56C2F); //Color suelo de puna claro
  rect(0, (22*tamaPix), (6*tamaPix), (11*tamaPix));
  rect(0, (21*tamaPix), (3*tamaPix), tamaPix);
  rect(0, (28*tamaPix), width, (9*tamaPix));
  rect((26*tamaPix), (23*tamaPix), (3*tamaPix), tamaPix);
  rect((26*tamaPix), (24*tamaPix), (6*tamaPix), tamaPix);
  rect((26*tamaPix), (25*tamaPix), (7*tamaPix), tamaPix);
  rect((26*tamaPix), (26*tamaPix), (8*tamaPix), tamaPix);
  rect((26*tamaPix), (27*tamaPix), (9*tamaPix), tamaPix);
  Luna.mostrar(5, 3);//////////////////////////////////////////////////////////////////////////////////LUNA
  fill(#D19722); //Color beige alpaca
  rect(0, y-tamaPix, (28*tamaPix), tamaPix);
  t=0;
  while (t<9) {
    rect(0, y-cont-tamaPix, (30*tamaPix), tamaPix);
    cont+=tamaPix;
    t++;
  }
  rect(0, y-cont-tamaPix, (29*tamaPix), tamaPix);
  cont+=tamaPix;
  rect(0, y-cont-tamaPix, (29*tamaPix), tamaPix);
  cont+=tamaPix;
  rect(0, y-cont-tamaPix, (29*tamaPix), tamaPix);
  cont+=tamaPix;
  rect(0, y-cont-tamaPix, (28*tamaPix), tamaPix);
  cont+=tamaPix;
  rect(0, y-cont-tamaPix, (28*tamaPix), tamaPix);
  cont+=tamaPix;
  rect(0, y-cont-tamaPix, (28*tamaPix), tamaPix);
  cont+=tamaPix;
  rect(0, y-cont-tamaPix, (27*tamaPix), tamaPix);
  cont+=tamaPix;
  rect(0, y-cont-tamaPix, (27*tamaPix), tamaPix);
  cont+=tamaPix;
  rect(0, y-cont-tamaPix, (27*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((3*tamaPix), y-cont-tamaPix, (24*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((3*tamaPix), y-cont-tamaPix, (24*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((4*tamaPix), y-cont-tamaPix, (23*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((5*tamaPix), y-cont-tamaPix, (21*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((5*tamaPix), y-cont-tamaPix, (21*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((5*tamaPix), y-cont-tamaPix, (21*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((5*tamaPix), y-cont-tamaPix, (21*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((5*tamaPix), y-cont-tamaPix, (21*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((5*tamaPix), y-cont-tamaPix, (21*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((5*tamaPix), y-cont-tamaPix, (21*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((5*tamaPix), y-cont-tamaPix, (21*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((5*tamaPix), y-cont-tamaPix, (22*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((4*tamaPix), y-cont-tamaPix, (23*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((4*tamaPix), y-cont-tamaPix, (23*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((4*tamaPix), y-cont-tamaPix, (23*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((4*tamaPix), y-cont-tamaPix, (23*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((4*tamaPix), y-cont-tamaPix, (23*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((4*tamaPix), y-cont-tamaPix, (23*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((4*tamaPix), y-cont-tamaPix, (23*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((4*tamaPix), y-cont-tamaPix, (23*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((4*tamaPix), y-cont-tamaPix, (23*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((4*tamaPix), y-cont-tamaPix, (23*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((4*tamaPix), y-cont-tamaPix, (23*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((4*tamaPix), y-cont-tamaPix, (23*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((4*tamaPix), y-cont-tamaPix, (23*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((5*tamaPix), y-cont-tamaPix, (21*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((5*tamaPix), y-cont-tamaPix, (6*tamaPix), tamaPix);
  rect((20*tamaPix), y-cont-tamaPix, (6*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((6*tamaPix), y-cont-tamaPix, (5*tamaPix), tamaPix);
  rect((20*tamaPix), y-cont-tamaPix, (5*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((6*tamaPix), y-cont-tamaPix, (4*tamaPix), tamaPix);
  rect((21*tamaPix), y-cont-tamaPix, (4*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((6*tamaPix), y-cont-tamaPix, (4*tamaPix), tamaPix);
  rect((21*tamaPix), y-cont-tamaPix, (4*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((6*tamaPix), y-cont-tamaPix, (3*tamaPix), tamaPix);
  rect((22*tamaPix), y-cont-tamaPix, (3*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((6*tamaPix), y-cont-tamaPix, (2*tamaPix), tamaPix);
  rect((23*tamaPix), y-cont-tamaPix, (2*tamaPix), tamaPix);

  /////////////////////// Alpaca en beige /////////////////////////

  fill(0);
  rect((13*tamaPix), (25*tamaPix), (5*tamaPix), 3*tamaPix);
  rect((14*tamaPix), (24*tamaPix), 3*tamaPix, tamaPix);

  rect((8*tamaPix), (16*tamaPix), (4*tamaPix), (2*tamaPix));
  rect((7*tamaPix), (16*tamaPix), tamaPix, tamaPix);
  rect((19*tamaPix), (16*tamaPix), (4*tamaPix), (2*tamaPix));
  rect((23*tamaPix), (16*tamaPix), tamaPix, tamaPix);

  rect((14*tamaPix), (17*tamaPix), (3*tamaPix), (5*tamaPix));
  rect((13*tamaPix), (19*tamaPix), (5*tamaPix), (2*tamaPix));

  fill(#895233);
  rect((7*tamaPix), (9*tamaPix), (2*tamaPix), (3*tamaPix));
  rect((22*tamaPix), (9*tamaPix), (2*tamaPix), (3*tamaPix));
  rect((7*tamaPix), (8*tamaPix), tamaPix, tamaPix);
  rect((23*tamaPix), (8*tamaPix), tamaPix, tamaPix);

  fill(255);
  rect((10*tamaPix), (16*tamaPix), tamaPix, tamaPix);
  rect((21*tamaPix), (16*tamaPix), tamaPix, tamaPix);

  fill(#FC5040);
  rect(14*tamaPix, 26*tamaPix, 3*tamaPix, tamaPix);

  /////////////////////// Ojos, nariz, boca, orejas //////////////////
}
void  Frame7(int cont) {
  smooth();
  fill(#122134); //Color celeste cielo
  rect(0, 0, width, height);
  fill(#5A2115); //Color suelo de puna oscuro
  rect(0, height-(tamaPix*16), width, height/3);
  fill(#A56C2F); //Color suelo de puna claro
  rect(0, (22*tamaPix), (6*tamaPix), (11*tamaPix));
  rect(0, (21*tamaPix), (3*tamaPix), tamaPix);
  rect(0, (28*tamaPix), width, (9*tamaPix));
  rect((26*tamaPix), (23*tamaPix), (3*tamaPix), tamaPix);
  rect((26*tamaPix), (24*tamaPix), (6*tamaPix), tamaPix);
  rect((26*tamaPix), (25*tamaPix), (7*tamaPix), tamaPix);
  rect((26*tamaPix), (26*tamaPix), (8*tamaPix), tamaPix);
  rect((26*tamaPix), (27*tamaPix), (9*tamaPix), tamaPix);
  Luna.mostrar(12, 1);//////////////////////////////////////////////////////////////////////////////////LUNA
  fill(#D19722); //Color beige alpaca
  rect(0, y-tamaPix, (28*tamaPix), tamaPix);
  t=0;
  while (t<9) {
    rect(0, y-cont-tamaPix, (30*tamaPix), tamaPix);
    cont+=tamaPix;
    t++;
  }
  rect(0, y-cont-tamaPix, (29*tamaPix), tamaPix);
  cont+=tamaPix;
  rect(0, y-cont-tamaPix, (29*tamaPix), tamaPix);
  cont+=tamaPix;
  rect(0, y-cont-tamaPix, (29*tamaPix), tamaPix);
  cont+=tamaPix;
  rect(0, y-cont-tamaPix, (28*tamaPix), tamaPix);
  cont+=tamaPix;
  rect(0, y-cont-tamaPix, (28*tamaPix), tamaPix);
  cont+=tamaPix;
  rect(0, y-cont-tamaPix, (28*tamaPix), tamaPix);
  cont+=tamaPix;
  rect(0, y-cont-tamaPix, (27*tamaPix), tamaPix);
  cont+=tamaPix;
  rect(0, y-cont-tamaPix, (27*tamaPix), tamaPix);
  cont+=tamaPix;
  rect(0, y-cont-tamaPix, (27*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((3*tamaPix), y-cont-tamaPix, (24*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((3*tamaPix), y-cont-tamaPix, (24*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((4*tamaPix), y-cont-tamaPix, (23*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((5*tamaPix), y-cont-tamaPix, (21*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((5*tamaPix), y-cont-tamaPix, (21*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((5*tamaPix), y-cont-tamaPix, (21*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((5*tamaPix), y-cont-tamaPix, (21*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((5*tamaPix), y-cont-tamaPix, (21*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((5*tamaPix), y-cont-tamaPix, (21*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((5*tamaPix), y-cont-tamaPix, (21*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((5*tamaPix), y-cont-tamaPix, (21*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((5*tamaPix), y-cont-tamaPix, (22*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((4*tamaPix), y-cont-tamaPix, (23*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((4*tamaPix), y-cont-tamaPix, (23*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((4*tamaPix), y-cont-tamaPix, (23*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((4*tamaPix), y-cont-tamaPix, (23*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((4*tamaPix), y-cont-tamaPix, (23*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((4*tamaPix), y-cont-tamaPix, (23*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((4*tamaPix), y-cont-tamaPix, (23*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((4*tamaPix), y-cont-tamaPix, (23*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((4*tamaPix), y-cont-tamaPix, (23*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((4*tamaPix), y-cont-tamaPix, (23*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((4*tamaPix), y-cont-tamaPix, (23*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((4*tamaPix), y-cont-tamaPix, (23*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((4*tamaPix), y-cont-tamaPix, (23*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((5*tamaPix), y-cont-tamaPix, (21*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((5*tamaPix), y-cont-tamaPix, (6*tamaPix), tamaPix);
  rect((20*tamaPix), y-cont-tamaPix, (6*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((6*tamaPix), y-cont-tamaPix, (5*tamaPix), tamaPix);
  rect((20*tamaPix), y-cont-tamaPix, (5*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((6*tamaPix), y-cont-tamaPix, (4*tamaPix), tamaPix);
  rect((21*tamaPix), y-cont-tamaPix, (4*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((6*tamaPix), y-cont-tamaPix, (4*tamaPix), tamaPix);
  rect((21*tamaPix), y-cont-tamaPix, (4*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((6*tamaPix), y-cont-tamaPix, (3*tamaPix), tamaPix);
  rect((22*tamaPix), y-cont-tamaPix, (3*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((6*tamaPix), y-cont-tamaPix, (2*tamaPix), tamaPix);
  rect((23*tamaPix), y-cont-tamaPix, (2*tamaPix), tamaPix);

  /////////////////////// Alpaca en beige /////////////////////////

  fill(0);
  rect((13*tamaPix), (26*tamaPix), (5*tamaPix), 2*tamaPix);
  rect((14*tamaPix), (25*tamaPix), 3*tamaPix, tamaPix);

  rect((8*tamaPix), (17*tamaPix), (4*tamaPix), (2*tamaPix));
  rect((7*tamaPix), (17*tamaPix), tamaPix, tamaPix);
  rect((19*tamaPix), (17*tamaPix), (4*tamaPix), (2*tamaPix));
  rect((23*tamaPix), (17*tamaPix), tamaPix, tamaPix);

  rect((14*tamaPix), (18*tamaPix), (3*tamaPix), (5*tamaPix));
  rect((13*tamaPix), (20*tamaPix), (5*tamaPix), (2*tamaPix));

  fill(#895233);
  rect((7*tamaPix), (10*tamaPix), (2*tamaPix), (3*tamaPix));
  rect((22*tamaPix), (10*tamaPix), (2*tamaPix), (3*tamaPix));
  rect((7*tamaPix), (9*tamaPix), tamaPix, tamaPix);
  rect((23*tamaPix), (9*tamaPix), tamaPix, tamaPix);

  fill(255);
  rect((10*tamaPix), (17*tamaPix), tamaPix, tamaPix);
  rect((21*tamaPix), (17*tamaPix), tamaPix, tamaPix);

  /////////////////////// Ojos, nariz, boca, orejas //////////////////
}
void  Frame8(int cont) {
  smooth();
  fill(#060B12); //Color celeste cielo
  rect(0, 0, width, height);
  fill(#5A2115); //Color suelo de puna oscuro
  rect(0, height-(tamaPix*16), width, height/3);
  fill(#A56C2F); //Color suelo de puna claro
  rect(0, (22*tamaPix), (6*tamaPix), (11*tamaPix));
  rect(0, (21*tamaPix), (3*tamaPix), tamaPix);
  rect(0, (28*tamaPix), width, (9*tamaPix));
  rect((26*tamaPix), (23*tamaPix), (3*tamaPix), tamaPix);
  rect((26*tamaPix), (24*tamaPix), (6*tamaPix), tamaPix);
  rect((26*tamaPix), (25*tamaPix), (7*tamaPix), tamaPix);
  rect((26*tamaPix), (26*tamaPix), (8*tamaPix), tamaPix);
  rect((26*tamaPix), (27*tamaPix), (9*tamaPix), tamaPix);
  Luna.mostrar(18, 1);//////////////////////////////////////////////////////////////////////////////////LUNA
  fill(#D19722); //Color beige alpaca
  rect(0, y-tamaPix, (28*tamaPix), tamaPix);
  t=0;
  while (t<9) {
    rect(0, y-cont-tamaPix, (30*tamaPix), tamaPix);
    cont+=tamaPix;
    t++;
  }
  rect(0, y-cont-tamaPix, (29*tamaPix), tamaPix);
  cont+=tamaPix;
  rect(0, y-cont-tamaPix, (29*tamaPix), tamaPix);
  cont+=tamaPix;
  rect(0, y-cont-tamaPix, (29*tamaPix), tamaPix);
  cont+=tamaPix;
  rect(0, y-cont-tamaPix, (28*tamaPix), tamaPix);
  cont+=tamaPix;
  rect(0, y-cont-tamaPix, (28*tamaPix), tamaPix);
  cont+=tamaPix;
  rect(0, y-cont-tamaPix, (28*tamaPix), tamaPix);
  cont+=tamaPix;
  rect(0, y-cont-tamaPix, (27*tamaPix), tamaPix);
  cont+=tamaPix;
  rect(0, y-cont-tamaPix, (27*tamaPix), tamaPix);
  cont+=tamaPix;
  rect(0, y-cont-tamaPix, (27*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((3*tamaPix), y-cont-tamaPix, (24*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((3*tamaPix), y-cont-tamaPix, (24*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((4*tamaPix), y-cont-tamaPix, (23*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((5*tamaPix), y-cont-tamaPix, (21*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((5*tamaPix), y-cont-tamaPix, (21*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((5*tamaPix), y-cont-tamaPix, (21*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((5*tamaPix), y-cont-tamaPix, (21*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((5*tamaPix), y-cont-tamaPix, (21*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((5*tamaPix), y-cont-tamaPix, (21*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((5*tamaPix), y-cont-tamaPix, (21*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((5*tamaPix), y-cont-tamaPix, (21*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((5*tamaPix), y-cont-tamaPix, (22*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((4*tamaPix), y-cont-tamaPix, (23*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((4*tamaPix), y-cont-tamaPix, (23*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((4*tamaPix), y-cont-tamaPix, (23*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((4*tamaPix), y-cont-tamaPix, (23*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((4*tamaPix), y-cont-tamaPix, (23*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((4*tamaPix), y-cont-tamaPix, (23*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((4*tamaPix), y-cont-tamaPix, (23*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((4*tamaPix), y-cont-tamaPix, (23*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((4*tamaPix), y-cont-tamaPix, (23*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((4*tamaPix), y-cont-tamaPix, (23*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((4*tamaPix), y-cont-tamaPix, (23*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((4*tamaPix), y-cont-tamaPix, (23*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((4*tamaPix), y-cont-tamaPix, (23*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((5*tamaPix), y-cont-tamaPix, (21*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((5*tamaPix), y-cont-tamaPix, (6*tamaPix), tamaPix);
  rect((20*tamaPix), y-cont-tamaPix, (6*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((6*tamaPix), y-cont-tamaPix, (5*tamaPix), tamaPix);
  rect((20*tamaPix), y-cont-tamaPix, (5*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((6*tamaPix), y-cont-tamaPix, (4*tamaPix), tamaPix);
  rect((21*tamaPix), y-cont-tamaPix, (4*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((6*tamaPix), y-cont-tamaPix, (4*tamaPix), tamaPix);
  rect((21*tamaPix), y-cont-tamaPix, (4*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((6*tamaPix), y-cont-tamaPix, (3*tamaPix), tamaPix);
  rect((22*tamaPix), y-cont-tamaPix, (3*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((6*tamaPix), y-cont-tamaPix, (2*tamaPix), tamaPix);
  rect((23*tamaPix), y-cont-tamaPix, (2*tamaPix), tamaPix);

  /////////////////////// Alpaca en beige /////////////////////////

  fill(0);
  rect((13*tamaPix), (27*tamaPix), (5*tamaPix), tamaPix);
  rect((14*tamaPix), (26*tamaPix), 3*tamaPix, tamaPix);

  rect((8*tamaPix), (18*tamaPix), (4*tamaPix), (2*tamaPix));
  rect((7*tamaPix), (18*tamaPix), tamaPix, tamaPix);
  rect((19*tamaPix), (18*tamaPix), (4*tamaPix), (2*tamaPix));
  rect((23*tamaPix), (18*tamaPix), tamaPix, tamaPix);

  rect((14*tamaPix), (19*tamaPix), (3*tamaPix), (5*tamaPix));
  rect((13*tamaPix), (21*tamaPix), (5*tamaPix), (2*tamaPix));

  fill(#895233);
  rect((7*tamaPix), (11*tamaPix), (2*tamaPix), (3*tamaPix));
  rect((22*tamaPix), (11*tamaPix), (2*tamaPix), (3*tamaPix));
  rect((7*tamaPix), (10*tamaPix), tamaPix, tamaPix);
  rect((23*tamaPix), (10*tamaPix), tamaPix, tamaPix);


  /////////////////////// Ojos, nariz, boca, orejas //////////////////
}
void  Frame9(int cont) {
  smooth();
  fill(0); //Color celeste cielo
  rect(0, 0, width, height);
  fill(#5A2115); //Color suelo de puna oscuro
  rect(0, height-(tamaPix*16), width, height/3);
  fill(#A56C2F); //Color suelo de puna claro
  rect(0, (22*tamaPix), (6*tamaPix), (11*tamaPix));
  rect(0, (21*tamaPix), (3*tamaPix), tamaPix);
  rect(0, (28*tamaPix), width, (9*tamaPix));
  rect((26*tamaPix), (23*tamaPix), (3*tamaPix), tamaPix);
  rect((26*tamaPix), (24*tamaPix), (6*tamaPix), tamaPix);
  rect((26*tamaPix), (25*tamaPix), (7*tamaPix), tamaPix);
  rect((26*tamaPix), (26*tamaPix), (8*tamaPix), tamaPix);
  rect((26*tamaPix), (27*tamaPix), (9*tamaPix), tamaPix);
  Luna.mostrar(26, 3);//////////////////////////////////////////////////////////////////////////////////LUNA
  fill(#D19722); //Color beige alpaca
  rect(0, y-tamaPix, (28*tamaPix), tamaPix);
  t=0;
  while (t<9) {
    rect(0, y-cont-tamaPix, (30*tamaPix), tamaPix);
    cont+=tamaPix;
    t++;
  }
  rect(0, y-cont-tamaPix, (29*tamaPix), tamaPix);
  cont+=tamaPix;
  rect(0, y-cont-tamaPix, (29*tamaPix), tamaPix);
  cont+=tamaPix;
  rect(0, y-cont-tamaPix, (29*tamaPix), tamaPix);
  cont+=tamaPix;
  rect(0, y-cont-tamaPix, (28*tamaPix), tamaPix);
  cont+=tamaPix;
  rect(0, y-cont-tamaPix, (28*tamaPix), tamaPix);
  cont+=tamaPix;
  rect(0, y-cont-tamaPix, (28*tamaPix), tamaPix);
  cont+=tamaPix;
  rect(0, y-cont-tamaPix, (27*tamaPix), tamaPix);
  cont+=tamaPix;
  rect(0, y-cont-tamaPix, (27*tamaPix), tamaPix);
  cont+=tamaPix;
  rect(0, y-cont-tamaPix, (27*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((3*tamaPix), y-cont-tamaPix, (24*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((3*tamaPix), y-cont-tamaPix, (24*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((4*tamaPix), y-cont-tamaPix, (23*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((5*tamaPix), y-cont-tamaPix, (21*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((5*tamaPix), y-cont-tamaPix, (21*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((5*tamaPix), y-cont-tamaPix, (21*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((5*tamaPix), y-cont-tamaPix, (21*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((5*tamaPix), y-cont-tamaPix, (21*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((5*tamaPix), y-cont-tamaPix, (21*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((5*tamaPix), y-cont-tamaPix, (21*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((5*tamaPix), y-cont-tamaPix, (21*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((5*tamaPix), y-cont-tamaPix, (22*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((4*tamaPix), y-cont-tamaPix, (23*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((4*tamaPix), y-cont-tamaPix, (23*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((4*tamaPix), y-cont-tamaPix, (23*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((4*tamaPix), y-cont-tamaPix, (23*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((4*tamaPix), y-cont-tamaPix, (23*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((4*tamaPix), y-cont-tamaPix, (23*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((4*tamaPix), y-cont-tamaPix, (23*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((4*tamaPix), y-cont-tamaPix, (23*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((4*tamaPix), y-cont-tamaPix, (23*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((4*tamaPix), y-cont-tamaPix, (23*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((4*tamaPix), y-cont-tamaPix, (23*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((4*tamaPix), y-cont-tamaPix, (23*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((4*tamaPix), y-cont-tamaPix, (23*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((5*tamaPix), y-cont-tamaPix, (21*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((5*tamaPix), y-cont-tamaPix, (6*tamaPix), tamaPix);
  rect((20*tamaPix), y-cont-tamaPix, (6*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((6*tamaPix), y-cont-tamaPix, (5*tamaPix), tamaPix);
  rect((20*tamaPix), y-cont-tamaPix, (5*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((6*tamaPix), y-cont-tamaPix, (4*tamaPix), tamaPix);
  rect((21*tamaPix), y-cont-tamaPix, (4*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((6*tamaPix), y-cont-tamaPix, (4*tamaPix), tamaPix);
  rect((21*tamaPix), y-cont-tamaPix, (4*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((6*tamaPix), y-cont-tamaPix, (3*tamaPix), tamaPix);
  rect((22*tamaPix), y-cont-tamaPix, (3*tamaPix), tamaPix);
  cont+=tamaPix;
  rect((6*tamaPix), y-cont-tamaPix, (2*tamaPix), tamaPix);
  rect((23*tamaPix), y-cont-tamaPix, (2*tamaPix), tamaPix);

  /////////////////////// Alpaca en beige /////////////////////////

  fill(0);
  rect((13*tamaPix), (28*tamaPix), (5*tamaPix), tamaPix);
  rect((14*tamaPix), (27*tamaPix), 3*tamaPix, tamaPix);

  rect((8*tamaPix), (19*tamaPix), (4*tamaPix), (2*tamaPix));
  rect((7*tamaPix), (19*tamaPix), tamaPix, tamaPix);
  rect((19*tamaPix), (19*tamaPix), (4*tamaPix), (2*tamaPix));
  rect((23*tamaPix), (19*tamaPix), tamaPix, tamaPix);

  rect((14*tamaPix), (20*tamaPix), (3*tamaPix), (5*tamaPix));
  rect((13*tamaPix), (22*tamaPix), (5*tamaPix), (2*tamaPix));

  fill(#895233);
  rect((7*tamaPix), (12*tamaPix), (2*tamaPix), (3*tamaPix));
  rect((22*tamaPix), (12*tamaPix), (2*tamaPix), (3*tamaPix));
  rect((7*tamaPix), (11*tamaPix), tamaPix, tamaPix);
  rect((23*tamaPix), (11*tamaPix), tamaPix, tamaPix);


  /////////////////////// Ojos, nariz, boca, orejas //////////////////
}
class Luna {
  color c;
  float xpos; //Está en cantidad de cuadrados
  float ypos; //Está en cantidad de cuadrados

  Luna() {
  }
  
  void mostrar(float xpos, float ypos) {
    fill(255);
    rect(xpos*tamaPix, ypos*tamaPix, 3*tamaPix, tamaPix);
    rect((xpos+1)*tamaPix, (ypos+1)*tamaPix, 3*tamaPix, tamaPix);
    rect((xpos+2)*tamaPix, (ypos+2)*tamaPix, 2*tamaPix, tamaPix);
    rect((xpos+2)*tamaPix, (ypos+3)*tamaPix, 2*tamaPix, tamaPix);
    rect((xpos+1)*tamaPix, (ypos+4)*tamaPix, 3*tamaPix, tamaPix);
    rect(xpos*tamaPix, (ypos+5)*tamaPix, 3*tamaPix, tamaPix);
  }
}
class Sol {
  color c;
  float xpos; //Está en cantidad de cuadrados
  float ypos; //Está en cantidad de cuadrados

  Sol() {
  }
  
  void mostrar(float xpos, float ypos, color c) {
    fill(c);
    rect(xpos*tamaPix, (ypos*tamaPix), (4*tamaPix), (6*tamaPix));
    rect(xpos*tamaPix-tamaPix, (ypos*tamaPix+tamaPix), (6*tamaPix), (4*tamaPix));
  }
}


