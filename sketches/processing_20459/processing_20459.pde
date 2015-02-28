
boolean operatorSet = false; // is the operator set?
char lastUserOperator = ' '; // last operator
float accumulatedTotal = 0;
float lastUserInput = 0;
String inputBuffer = "";
PFont f;


void setup() {
  size(600,600);
  f = loadFont("text.vlw"); 
  rectMode(CENTER);
  textFont(f,48);
  rotate(radians(45));
  noStroke();
  fill(#FC0000);             //// red rects
  smooth();
  rect(120, 240, 40, 500);
  rect(200, 240, 40, 500);
  rect(280, 240, 40, 500);
  rect(360, 240, 40, 500);
  rect(440, 240, 40, 500);

  fill(#FCD300);             //// yellow rects
  rect(240, 0, 40, 300);
  rect(320, 0, 40, 300);
  rect(400, 0, 40, 300);
  rect(480, 0, 40, 300);
  rect(560, 0, 40, 300);
  rect(640, 0, 40, 300);
  rect(720, 0, 40, 300);

  fill(#100971);             //// blue rects
  rect(440, -260, 40, 500);
  rect(520, -260, 40, 500);
  rect(600, -260, 40, 500);
  rect(680, -260, 40, 500);
  rect(760, -260, 40, 500);

  fill(255);             //// numbers
  rotate(radians(-45)); 
  text("0",150,210);
  text("1",210,165);
  text("2",270,150);
  text("3",330,155);
  text("4",385,185);
  text("5",150,420);
  text("6",210,470);
  text("7",270,490);
  text("8",330,480);
  text("9",380,455);

  fill(#ffffff);    //// signs
  stroke(5);
  text("+",20,40);
  text("-",550,40);
  text("x",20,570);
  text("/",570,570);


  fill(#000000);
  textFont(f, 48); 
  text("clear",260,555);
}

void draw() {
  fill(0, 1);

  ellipse(300,300,300,300);

  fill(255, 4);
  text(Float.toString(accumulatedTotal), 370, 320, 360, 55, 200);
  
    text((inputBuffer), 390, 400, 360, 55, 200);
}


void keyPressed() {
  //println(key);
  switch(key) {
  case'1':
  case'2':
  case'3':
  case'4':
  case'5':
  case'6':
  case'7':
  case'8':
  case'9':
  case'0':
    getNumber(key);
    break;
  case'+':
  case'-':
  case'*':
  case'/':
  case'=':
    action(key);
    break;
  case'c':
  case's':
  case't':
    action(key);
    break;
  default:
    println("no key assigned");
  }
}


void mousePressed() {
  if(mouseX >= 130 && mouseX <= 170 && mouseY >= 190 && mouseY <= 230) {

    getNumber('0');
  }
  else if(mouseX >= 190 && mouseX <= 230 && mouseY >= 145 && mouseY <= 185) {

    getNumber('1');
  }
  else if(mouseX >= 250 && mouseX <= 290 && mouseY > 130 && mouseY <= 190) {

    getNumber('2');
  }
  else if(mouseX >= 310 && mouseX <= 350 && mouseY >= 135 && mouseY <= 175) {

    getNumber('3');
  }
  else if(mouseX >= 365 && mouseX <= 405 && mouseY >= 165 && mouseY <= 205) {

    getNumber('4');
  }
  else if(mouseX >= 120 && mouseX <= 170 && mouseY >= 400 && mouseY <= 440) {

    getNumber('5');
  }
  else if(mouseX >= 190 && mouseX <= 230 && mouseY >= 450 && mouseY <= 490) {

    getNumber('6');
  }
  else if(mouseX >= 250 && mouseX <= 290 && mouseY >= 470 && mouseY <= 510) {

    getNumber('7');
  }
  else if(mouseX >= 310 && mouseX <= 350 && mouseY >= 460 && mouseY <= 500) {

    getNumber('8');
  }
  else if(mouseX >= 360 && mouseX <= 400 && mouseY >= 435 && mouseY <= 475) {

    getNumber('9');
      }else if(mouseX >= 0 && mouseX <= 250 && mouseY >= 0 && mouseY <= 250){
     
     action('+');
     
     }else if(mouseX >= 400 && mouseX <= 600 && mouseY >= 0 && mouseY <= 200){
     
     action('-');
     }else if(mouseX >= 0 && mouseX <= 200 && mouseY >= 400 && mouseY <= 600){
     
     action('*');
     
     }else if(mouseX >= 400 && mouseX <= 600 && mouseY >= 400 && mouseY <= 600){
     
     action('/');
     
  }
  else if(mouseX >= 1 && mouseX <= 1 && mouseY >= 1 && mouseY <= 1) {
    doTheMath();
  }
  else if(mouseX >= 240 && mouseX <= 320 && mouseY >= 535 && mouseY <= 590) {

    action('s');
    clearNumbers();
    println("clearedededed");
  }
}

void getNumber(char numS) {
  // this will fail if there are two decimals inputted
  inputBuffer = inputBuffer + numS;
}


void action (char opS) {
  
  if(opS == 'c') {
    clearNumbers();
    return;
  }
  
  if(operatorSet == true && opS == '=') {
    lastUserInput = float(inputBuffer);      /// first saves the input buffer as the lastuserinput
    inputBuffer = "";                        /// now clears the input buffer
    doTheMath();
  } 
  else {
    operatorSet = true;
    lastUserOperator = opS;               // setting the last operator
    accumulatedTotal = float(inputBuffer);   //if you don't click =, meaning you click a +,-,*, or /, then the last user input saves first number
    inputBuffer = "";
  }
}



void doTheMath () {

  switch(lastUserOperator) {
  case'+':
    accumulatedTotal = (accumulatedTotal + lastUserInput);
    break;
  case'-':
    accumulatedTotal = (accumulatedTotal - lastUserInput);
    break;
  case'*':
    accumulatedTotal = (accumulatedTotal * lastUserInput);
    break;
  case'/':
    accumulatedTotal = (accumulatedTotal / lastUserInput);
    break;
  }

  operatorSet = false;  ///  the operator has not been set
  inputBuffer = "";    /// the input buffer is cleared
  lastUserOperator = ' ';   /// the last user operator is cleared?
}

void clearNumbers() {
  lastUserInput = 0;
  accumulatedTotal = 0; // clear accumulated total
  operatorSet = false;
  inputBuffer = "";
  lastUserOperator = ' ';
}



/*
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
*/


