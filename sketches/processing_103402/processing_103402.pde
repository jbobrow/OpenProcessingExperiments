
void setup()
{
  size(400, 200);
  smooth();
}

void draw()
{
  background(255);
  int y=height/2; // 100
  int w=60;
  int h=60;
  int e=16;
  for (int x=80; x<width; x+=80)
  {
    drawZoog(x, y, w, h, e);
  }
}

void drawZoog(int x, int y, int w, int h, int e)
{
  kunas(x, y, w, h);
  galva(x, y, w, h);
  akys(x, y, w, h, e);
  kojos(x, y, w, h);
  rankos(x, y, w, h);
}

// gali buti ir paprastas x nebutina x_kunas nes vistiek cia lokalus kintamieji
void kunas(int x_kunas, int y_kunas, int w_kunas, int h_kunas)
{
  rectMode(CENTER);
  stroke(0);
  fill(175);
  rect(x_kunas, y_kunas, w_kunas/6, h_kunas*2);
}

void galva(int x_galva, int y_galva, int w_galva, int h_galva)
{
  fill(255);
  ellipse(x_galva, y_galva-h_galva/2, w_galva, h_galva);
}

void akys(int x_akys, int y_akys, int w_akys, int h_akys, int e_akys)
{
  fill(0);
  ellipse(x_akys-w_akys/3, y_akys-h_akys/2, e_akys, e_akys*2);
  ellipse(x_akys+w_akys/3, y_akys-h_akys/2, e_akys, e_akys*2);
}

void kojos(int x_kojos, int y_kojos, int w_kojos, int h_kojos)
{
  stroke(0);
  line(x_kojos-w_kojos/12, y_kojos+h_kojos, x_kojos-w_kojos/4, y_kojos+h_kojos+10);
  line(x_kojos+w_kojos/12, y_kojos+h_kojos, x_kojos+w_kojos/4, y_kojos+h_kojos+10);
}

void rankos(int x_rankos, int y_rankos, int w_rankos, int h_rankos)
{
  stroke(0);
  line(x_rankos-5, y_rankos+w_rankos/5, x_rankos-w_rankos/3, y_rankos+h_rankos/3);
  line(x_rankos+5, y_rankos+w_rankos/5, x_rankos+w_rankos/3, y_rankos+h_rankos/3);
}
