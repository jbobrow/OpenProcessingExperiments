
//ANAIS FREITAS 
//PROCESSING FINAL
//FRIDAY 14HT DECEMBER 2012

PImage s;

Kettle k;
Flavour f;
MainCup m;
SugarandCream c;

void setup () {
  size (747, 560);
  s = loadImage ("BT.png");

  k = new Kettle();
  f =  new Flavour ();
  m = new MainCup ();
  c = new SugarandCream ();
};

void draw () {
  background (255);
  image (s, 0, 0);
  k.move_K();
  f.move_F();
  m.move_MC ();
  c.move_C();
};


