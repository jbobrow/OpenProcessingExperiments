
int x;
PFont Font1;
PFont Font2;
PImage Zepp;

void setup() {
  size(600,600);
  background(255,0,0);
  x = 0;
  Font1 = loadFont("font.vlw");
  Font2 = loadFont("Desdemona-48.vlw");
  Zepp = loadImage("Zepp.jpg");
}
  
   
void draw() {
  tint(255,255,255,10);
  image(Zepp,300,400);
   tint(255,255,255,2.5);
  image(Zepp,50,40);
  fill(234,55,67);
  textFont(Font1);
  text("Zepp", mouseX, mouseY);
  fill(0,30);
  textFont(Font2);
  text("LED ZEPPELIN",random(200),random(350));
  textFont(Font2);
  text("LED ZEPPELIN",200,350);
  textFont(Font2);
  text("LED ZEPPELIN",250,400);
  textFont(Font2);
  text("LED ZEPPELIN",300,450);
}

