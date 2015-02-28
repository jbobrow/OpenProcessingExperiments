
/*
*@ desc SimpleGrammar
 *
 */
import rita.*;

RiGrammar grammar;
String[] lines;

PFont font;

int yOffset;


void setup() {
  size(500, 100);
  background(255);
  frameRate(5);
  //text
  font = createFont("Dialog-24",24);
  textFont(font);
  textAlign(LEFT);
  textSize(24);
  //grammar
  grammar = new RiGrammar(this, "adage.g");
  //init grammar
  update();
  //display
  yOffset = 30;
  }
  
  void mouseClicked(){
    update();
  }  
  
  void update() {
    String result = grammar.expand();
    lines = result.split("%");
    println("lines length: " + lines.length);
  }
  
  
  void draw(){
    background(255);
    fill(#999999);
    //timer
    if(frameCount%(lines.length*30)==0) {
      update();
      println("frameCount calls update");
    }
    for(int i = 0; i<lines.length;i++) {
      text(lines[i],40,(i+1)*yOffset);
    }
  }

