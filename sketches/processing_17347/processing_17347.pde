
String mytext = "the mouse position is...";
PFont myfont;


void setup() {
  size(400,400);
  myfont = loadFont("Bauhaus93-48.vlw");
}
void draw() {
  //  println(mytext+mouseX);
  background(100);
textFont(myfont);

  text(mytext,30,60,360,400);
  text("x="+mouseX,180,270);
  text("y="+mouseY,180,330);
}


