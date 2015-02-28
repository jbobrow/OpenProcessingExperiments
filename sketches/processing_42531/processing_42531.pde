
PFont CliveBerker;
String str0 ="TO BUY";
String str1 ="Milk";
String str2 ="Bread";
String str3 ="Wine";
String str4 ="Eggs";
String str5 ="Pasta";
String str8 ="Thanks!";

float y=270;

void setup() {
  size(250, 400);
  smooth();
  background(0);
  CliveBerker = loadFont ("CliveBarker-48.vlw");
}


void draw() {

  background(0);
  textFont(CliveBerker, 30);
  noStroke();

  fill(255);
  text(str0, 30, y, 200, 200);
  text(str1, 30, y+40, 200, 200);
  text(str2, 30, y+80, 200, 200);
  text(str3, 30, y+120, 200, 200);
  text(str4, 30, y+160, 200, 200);
  text(str5, 30, y+200, 200, 200);
  text(str8, 30, y+320, 200, 200);

y -= 0.5;
}


