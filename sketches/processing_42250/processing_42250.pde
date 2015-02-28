
PImage net;
PImage diosa;
PFont font;
String yeah = "Aprendiendo Processing :)";

void setup () {
  size(500,500);
  diosa = loadImage ("diosa.jpg");
  smooth();
  imageMode(CENTER);
  net= loadImage("vec.gif");
  font= loadFont("ForteMT-36.vlw");
  textFont(font);
}

void draw () {

  background(#573BC9);
  image(diosa,250,250);
  float diameter= map(mouseX,0,width,10,800);
  image(net,250,250,diameter,diameter);
  fill(#503900);
  textSize(40);
  text(yeah,25,250);
}

