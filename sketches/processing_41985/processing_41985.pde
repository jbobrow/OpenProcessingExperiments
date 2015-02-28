
PFont font;
void setup (){
  size(480,120);
  smooth ();
  font= loadFont ("Chiller-Regular-100.vlw");
  textFont (font);
}

void draw (){
  background (0);
  textSize(90);
  text("JROCKERS",100,70);
  fill (209,0,0);
}

