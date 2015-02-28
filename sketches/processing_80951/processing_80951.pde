
PFont myFont;
int i = 0;
float j = 25, k = 25;

void setup() {
  size(700,200);
  fill(0);
  String[] fontList = PFont.list();
  println(fontList);
  myFont = createFont("Gabriola", 40);
  textFont(myFont);
  frameRate(2);
}

void draw() {
  if(i>=0 && i<=25) {
    char letra1 = char(i+65);
    char letra2 = char(i+97);
    text(letra1, j, 50);
    text(letra2, k, 100);
    i++;
    j += textWidth(letra1);
    k += textWidth(letra2);
  }
}

