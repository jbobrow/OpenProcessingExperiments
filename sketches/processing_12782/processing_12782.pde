
import rita.*;

PImage bg;
PFont font1, font2, font3;

void setup(){
  size(500, 500);
  RiText.setDefaultFont("CopperplateGothic-Light-24.vlw");
 // RiText.setDefaultColor(255);
  RiGrammar rg = new RiGrammar(this, "grammar.g"); 
  RiText.createLines(this, rg.expand(), 40, 40, 20, 10);
  bg = loadImage("parthenon3.jpg");

}


void draw(){
  image(bg, 0, 0);
}

