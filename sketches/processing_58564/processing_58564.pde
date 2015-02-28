
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
  size(1000, 500);
  background(255);
  frameRate(5);
  //text
  font = createFont("Dialog-24",24);
  textFont(font);
  textAlign(CENTER);
  textSize(18);
  //grammar
  grammar = new RiGrammar(this, "simple_grammar.g");
  //init grammar
  update();
  //display
  yOffset = 70;
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
    background(0);
    fill(200);
    //timer
    textAlign(CENTER);
    if(frameCount<30){
      text("A Series of Fairly Beleivable Assertions",500,250);
    }
    textAlign (LEFT);
    if(frameCount>40){
    if(frameCount%30==4) {
      update();
      println("frameCount calls update");
    }
    for(int i = 0; i<lines.length;i++) {
      text(lines[i],50,i*yOffset+yOffset+1);
    }
  }
  }

