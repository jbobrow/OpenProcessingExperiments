
void setup(){
  size (250,250);
  smooth();
  frameRate(10);
 //loading up the font that im going to be using
  PFont font;
  font = loadFont("BodoniMT-50.vlw");
  textFont(font);
}
  
  void draw() {
    background(#FFFFFF);
    //size of the text & color and random!
    textSize(30);
    fill(#005871, 150);
    text ("H9E 1A6",random(250), random(250));
    textSize(20);
    fill(#710035, 150);
    text ("H9E 1A6",random(250), random(250));
    
  }

