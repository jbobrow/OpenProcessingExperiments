
PFont font;

void setup() {
  size(1000, 400);
  background(0);
  smooth();
  noLoop();
}

void draw() {
  String[] fontList = PFont.list();
  //println(fontList);

  String str = "ABC abc 123 あいう 安以宇";
  float font_size = 50;

  for (int i = 0; i < fontList.length;i++) {
    String[] font_name = splitTokens(fontList[i], "\"");
    font = createFont(font_name[0], font_size);

    textFont(font);
    text(str + " - " + font_name[0], 15, font_size * (i+1));
  }
}



