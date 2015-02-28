
PFont myFont;
PFont myFont2;
int i=65;
int width1=0, r,g,b;
 
void setup () {
  size (990, 300);
  String[] fontList = PFont.list();
  println(fontList);
 
  myFont = createFont("AppleCasual", 42);
  myFont2 = createFont("SimSun", 52);
 
  background (0);
  smooth();
  frameRate(5);
}
 
void draw () {
 
  textFont (myFont);
  
  if (i<=90) {
    fill(150, 0, 200);
    text(char(i), width1, 100);
    width1 += textWidth(char(i))+15;
    i++;
  }
  if (i>=91 && i<=97) {
    i++;
    width1=0;
  }
  textFont (myFont2);
  if (i>=97 && i<=122) {
    fill(r, g, b);
    text(char(i), width1, 200);
    width1+=textWidth(char(1))+30;
    i++;
  }
}

