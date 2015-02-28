
int h=80, c=0, i=65;
PFont comicSans;
  int width1=0;

void setup() {
  size(600, 600);
  String[] fontList=PFont.list();
  println(fontList);
  frameRate(3);
  comicSans=createFont("ComicSansMS",h);
}

void draw() {
  textFont(comicSans);
  if(i<=90||(i>=97&&i<=122)) {
    text(char(i),width1, h);
    width1+=textWidth(char(i))+3;
    if(width1+textWidth(char(i))+3>=width){
      h+=80+3;
      width1=0;
    }
    i++;
    if(i==91)
    i=97;
  }
}
