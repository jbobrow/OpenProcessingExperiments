
int x;
PFont SkiaRegular;
PFont NewsGothicMT;
PImage mickey;


void setup(){
  size(800,600);
  background(255);
  x=0;
  SkiaRegular = loadFont("Skia-Regular-48.vlw");
  NewsGothicMT = loadFont("NewsGothicMT-48.vlw");
  mickey = loadImage("mickey.jpg");
}

void draw(){
  fill(0,20);
  textFont(NewsGothicMT);
  text("This is a mouse.",random(800),random(250));
  fill(255);
  textFont(SkiaRegular);
  text("This is a mouse.",40,80);
  tint(255,255,255,20);
  image(mickey, 400,300);
}

