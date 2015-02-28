
import rita.*;

RiGrammar rg;
RiText rt;
PImage img;
//preload fc.png
void setup() {

  size(800, 200);

  img = loadImage("fc.png");

  rg = new RiGrammar();


  rg = new RiGrammar(this);
  rg.loadFrom("rita1.json");
 

  RiText.defaults.fontSize = 32;
  RiText.defaults.alignment = CENTER;



  rt = new RiText(this, "click to see your fortune", width/2, height/2);
  
}

void draw() {

  background(img);
  RiText.drawAll();
 
}
void mouseClicked() {

  String s = rg.expand();

  rt.text(s);
}


