
PFont textF;
String txt = "Mein erster Txt aaaaaaaaaaaannnnnmnmnmnmnmnkzzkzkzlulululuaaaaaaaaa";

void setup() {
  size(400,600);
  textF = loadFont("MyriadPro-Black-20.vlw");
  textFont(textF);
  text("Mein erster Txt aaaaaaaaaaaaammmmmmmmmmmmmmmmmmmmmmkkkkkkkkaaaaaaaa",10,20);
  text(txt, 10,20,380,600);
  fill(0);
  textSize(25);
  textLeading(17);
}


void draw() {
}
