
import lsystem.*;
import java.text.CharacterIterator;
import java.text.StringCharacterIterator;

Grammar grammar; 
float drawLength;
float xpos;
float ypos;
float DELTA = PI/4; // 45 degrees
float theta = 0;
String production;
ArrayList points;

void setup() {
  size(800, 800);
  createLSystem();
  points = new ArrayList();
  stroke(255);
  strokeWeight(3);
  smooth();
  xpos = width/10;
  ypos = height/2;
  translateRules();
  noLoop();
}

void createLSystem(){
  int generations = 6;
  String axiom = "XFF--AFF--XFF--AFF";
  grammar = new SimpleGrammar(this, axiom);
  grammar.addRule('F', "");
  grammar.addRule('Y', "FFY");
  grammar.addRule('X', "+!X!FF-BQFI-!X!FF+");
  grammar.addRule('A', "BQFI"); 
  grammar.addRule('B', "AFF");
  drawLength = 15;
  production = grammar.createGrammar(generations);
}

void translateRules() {
  CharacterIterator it = new StringCharacterIterator(production);
  for (char ch = it.first(); ch != CharacterIterator.DONE; ch = it.next()) {
    switch(ch){
    case 'F':
      float[] temp = {
        xpos, ypos, (xpos += drawLength * cos(theta)), (ypos -= drawLength * sin(theta))
        };
        points.add(temp);
      break;
    case '+':
      theta += (DELTA);
      break;
    case '-':
      theta -= (DELTA);
      break;
    case 'X':
      break;
    case '!':
      DELTA = -DELTA;
      break;
    case 'Q':
      drawLength *= sqrt(2);
      break;
    case 'I':
      drawLength *= 1/sqrt(2);
      break;
    case 'A':
      break;
    case 'B':
      break;
    default:
      System.err.println("character " + ch + " not in grammar");
    }
  }
}

void draw() {
  background(0);
  float[] tmp; // placeholder for array of points that describe line 
  for (int i = 0; i < points.size(); i++)
  { 
    tmp = (float[])points.get(i);
    line(tmp[0], tmp[1], tmp[2], tmp[3]);
  }  
}

