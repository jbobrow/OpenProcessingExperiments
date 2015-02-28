
import lsystem.*;
import java.text.CharacterIterator;
import java.text.StringCharacterIterator;

Grammar grammar; 
float drawLength;
float xpos;
float ypos;
float DELTA = PI/3; // 60 degrees
float theta = 0;
String production;
ArrayList points;
int X = 0;
int Y = 1;
int X1 = 2;
int Y1 = 3;

void setup() {
  size(800, 900);
  createLSystem();
  points = new ArrayList();
  stroke(255);
  strokeWeight(3);
  smooth();
  xpos = width/3;
  ypos = height/4;
  translateRules();
  noLoop();
}

void createLSystem(){
  int generations = 6;
  String axiom = "FX-XFX-XFX-XFX-XFX-XF";
  grammar = new SimpleGrammar(this, axiom);
  grammar.addRule('F', "!F!-F-!F!");
  grammar.addRule('X', "!X");
  float startLength = 80;
  production = grammar.createGrammar(generations);
  drawLength = startLength * pow(0.6, generations); 
}

void translateRules() {
  boolean swap = false;
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
      theta += (swap ? DELTA : -DELTA);
      break;
    case 'X':
      break;
    case '!':
      swap = !swap;
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
    line(tmp[X], tmp[Y], tmp[X1], tmp[Y1]);
  }
}


