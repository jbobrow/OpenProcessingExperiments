
PFont font;//font variable
float x = 0;

void setup() {
  size(600, 150);
  smooth();
  background(0, 20);
  fill(0, 0, 255);
  font = loadFont("TypeEmbellishmentsOneLetPlain-48.vlw");//load & set fontvariable
  textFont(font, 80);//font variable, size
}

void draw() {
  background(0, 20);
  text("COMP SCI", x, 100);//WORDS, X/Y
  x++;
}


