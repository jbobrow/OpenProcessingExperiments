
import ddf.minim.*;
Minim minim;
AudioSnippet snip;

String screen = "0";

            //<--------float------->//

float numBR1;
float numBR2;
char final_OP;
boolean lock;
PFont font;

             //<-------setup------->//
             
void setup() {
  colorMode( RGB, 255 );
  size(800,150);
  font = loadFont("OCRAStd-255.vlw"); 
  textFont(font, 90); 
  textAlign(RIGHT);
  smooth();
   minim = new Minim(this);
  }
  
  //<--------draw--------->//
 
void draw() {
  background(0,0);
  
  fill(0, 0, 0);
  stroke(255,20,70);
  rect(10, 5, 780, 140);
  rect(15, 10, 770, 130);

  fill(3,232,255);
  text(screen, 690, 100);
  
  fill(250,252,130);
  text(screen, 690, 110);
  
  fill(242,87,103);
  text(screen, 690, 120);
  
  fill(250,20,70);
  text(screen, 690, 130);
  
    filter(BLUR, 2);
    }
 
void keyPressed() {
    switch(key) {
      case 'c':
      CLR2();
      break;
  case '0':
  case '1':
  case '2':
  case '3':
  case '4':
  case '5':
  case '6':
  case '7':
  case '8':
  case '9':
  
    funct_num(str(key));
    
    break;
    
  case '+':
  case '-': 
  case '/':
  case '*': 
  
    funct_opr();
    break;
    case '=':
  
  //<---SOUND---->//
    snip = minim.loadSnippet("eroica.aiff");
    snip.play();
    if (numBR2 == 0)
      numBR2 = float(screen);
    procEQ();
    final_OP = key;
    break; 
  default:
    println("better_be_shift");
    break;
  }
}
 
void funct_num(String num) {
  if ( final_OP == '='|| lock == true )
    CLR2();
  if ( screen == "0" )
    screen = num;
  else
    screen += num;
}
 
void funct_opr() {
  if ( final_OP == '=') {
    numBR1 = float(screen);
    CLR();
  }
  else if (key == final_OP) {
    if ( numBR2 == 0)
      numBR2 = float(screen);
    final_OP = key;
    procEQ();
    numBR1 = float(screen);
    lock = true;
  }
  else if ( key != final_OP && lock == true) {
    CLR();
    lock = false;
  }
  else {
    final_OP = key;
    if (numBR1 == 0 ) {
      numBR1 = float(screen);
      screen = "0";
    }
    else {
      numBR2 = float(screen);
      procEQ();
    }
  }
}
 
void procEQ() {
  switch(final_OP) {
  case '+':
    screen = str(numBR1 + numBR2);
    break;
  case '-':
    screen = str(numBR1 - numBR2);
    break;
  case '*':
    screen = str(numBR1 * numBR2);
    break;
  case '/':
    screen = str(numBR1 / numBR2);
    break;
  default:
    println("ERR procEQ");
    break;
  }
}

void CLR() {
  numBR2 = 0;
  screen = "0";
  final_OP = key;
}
  void CLR2() {
  numBR1 = 0;
  numBR2 = 0;
  screen = "0";
  final_OP = 'c';
  lock = false;
}

void stop()
{
  snip.close();
  minim.stop();
  super.stop();
}

