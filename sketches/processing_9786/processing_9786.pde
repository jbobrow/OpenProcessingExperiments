
/** 
* penroseTiling.pde
* Loosely based on a processing PenroseTiling
* processing sketch by Geraldine Sarmiento 
*
* My custom LSystem library available at Kenai version 0.6.5
* http://kenai.com/projects/l-system-utilities/downloads
*/

import lsystem.*; 


final float DELTA = PI/5; // 36 degrees
Grammar grammar; 
String axiom;
String rule;
String production;
float startLength;
float drawLength;
float theta;
float xpos;
float ypos;
PenStack ps;
int BLUE = 70<<24|0<<16|0<<8|200; // create color int using bit ops
int RED = 70<<24|200<<16|0<<8|0;

void setup() {
  size(600, 600);
  createLSystem();
  ps = new PenStack(this);
  strokeWeight(3);
  noFill();
  smooth();
  background(0);
  translateRules();
}

void createLSystem(){
  int generations = 4;               // set no of recursions
  axiom = "[X]2+[X]2+[X]2+[X]2+[X]"; // note use of abbreviated axiom and rules 
  grammar = new SimpleGrammar(this, axiom); // initialize custom library
  grammar.addRule('F', "");                 // add char substitution rules
  grammar.addRule('W', "YBF2+ZRF4-XBF[-YBF4-WRF]2+");
  grammar.addRule('X', "+YBF2-ZRF[3-WRF2-XBF]+");
  grammar.addRule('Y', "-WRF2+XBF[3+YBF2+ZRF]-");
  grammar.addRule('Z', "2-YBF4+WRF[+ZRF4+XBF]2-XBF");
  startLength = 600;
  production = grammar.createGrammar(generations);
  drawLength = startLength * pow(0.5, generations); 
}

void translateRules() {
  float x_temp, y_temp;
  int repeat = 1;
  Pen pen = new Pen(this, width/2, height/2, 0.0, RED);
  CharacterIterator it = grammar.getIterator(production);
  for (char ch = it.first(); ch != CharacterIterator.DONE; ch = it.next()){
    switch (ch) {
    case 'F':
      x_temp = pen.getX();
      y_temp = pen.getY();
      pen.setX(x_temp - drawLength * cos(pen.getTheta()));
      pen.setY(y_temp - drawLength * sin(pen.getTheta()));      
      stroke(pen.getColor());
      line(x_temp, y_temp, pen.getX(), pen.getY());
      break;
    case '+':
      pen.setTheta(pen.getTheta() + DELTA * repeat);
      repeat = 1;
      break;
    case '-':
      pen.setTheta(pen.getTheta() - DELTA * repeat);
      repeat = 1;
      break;
    case '[':
      ps.push(pen.clone()); 
      break;
    case ']':
      pen = ps.pop();
      break;
    case 'B':
      pen.setColor(BLUE);
      break;
    case 'R':
      pen.setColor(RED);
      break;  
    case 'W':   // do nothing other than
    case 'X':   // confirm W,X,Y&Z as valid grammar
    case 'Y':
    case 'Z':
      break;
    case '2':   // set repeat using char ascii code 
    case '3':   // 48 = ascii '0'
    case '4':
      repeat = (int)ch - 48;
      break;  
    default:
      System.err.println("character " + ch + " not in grammar");
      break;
    }
  }
}






