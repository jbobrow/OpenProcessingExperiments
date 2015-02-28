
PFont font;

void setup() {
size(300,300);
font = loadFont("OfficinaSans-Book-18.vlw");
textFont(font);
fill(0);
}

void draw() {
String l = "limbo";
text(l,random(0,300),random(0,300));
}



