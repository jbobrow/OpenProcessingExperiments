
float num1, num2, result;//numbers
float numberOfSlices;
StringBuffer typedStuff= new StringBuffer();
char currentOp;
boolean num1Stored;
boolean num2Stored;
boolean prevCalc;


PFont font;

void setup() {

  size(600,600);
  background(random(0,255),random(0,255),random(0,255));
  fill(0);
  font = loadFont("Courier-Bold-255.vlw");
  textFont(font, 255);

  num1Stored = false;
  num2Stored = false;
}

void draw() {
  //background(random(0,255),random(0,255),random(0,255));
  numberOfSlices = int(typedStuff.toString());
  //println(numberOfSlices);
  for(int i=0; i<numberOfSlices; i++) {
    noStroke();
    fill(random(0,255),random(0,255),random(0,255));
    rect(i* (width/numberOfSlices), 0, (width/numberOfSlices), height);
  }
  fill(random(0,255),random(0,255),random(0,255));
  textAlign(CENTER,CENTER);
  text(typedStuff.toString(), 0, 0, width, height);
}

void keyPressed() {
  switch(key) {
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
  case '.':
    typedStuff.append(key);
    outputText();
    break;
  case '+':
  case '-':
  case '*':
  case '/':
    processOperatorInput(key);
    break;
  case '=':
  case ENTER:
    processOperatorInput(key);
    outputText();
    break;
  case BACKSPACE:
    println("cleared");
    reset();
    break;
  }
}

void processOperatorInput(char theOp) {

  if(!num1Stored && !num2Stored) { //if num1 and num2 are both NOT stored,
    num1 = float(typedStuff.toString()); //store the input number as num1,
    num1Stored = true; //num1 is now stored.
    currentOp = theOp;
    typedStuff= new StringBuffer();
  }
  else if(num1Stored && !num2Stored) { //if num1 is stored, but num2 is not
    num2 = float(typedStuff.toString()); //store the input number as num2,
    calculateOutput(currentOp);
    num1 = result;
    typedStuff = new StringBuffer();
    //num2Stored = true; //num2 is now stored
    currentOp = theOp;
  }
  else if(num1Stored && num2Stored) { //if both num1 and num2 are stored,
    calculateOutput(theOp); //do math
  }
}

void outputText() {
  background(random(0,255),random(0,255),random(0,255));
  fill(random(0,255),random(0,255),random(0,255));
  textAlign(CENTER,CENTER);
  text(typedStuff.toString(), 0, 0, width, height);
  
  for(int r=0; r<result; r++) {
    noStroke();
    fill(random(0,255),random(0,255),random(0,255));
    rect(r* (width/result), 0, (width/result), height);
    noStroke();
    text("" + result + "", 0, 0, width, height);
  }
  
}


void calculateOutput(char op) {

  switch(op) {

  case '+':
    result = num1 + num2;
    break;

  case '-':
    result = num1 - num2;
    break;

  case '*':
    result = num1 * num2;
    break;

  case '/':
    result = num1 / num2;
    break;
  }

  typedStuff = new StringBuffer("" + result + "");
  outputText();
  prevCalc = true;
}

void reset () {
  
  num1Stored = false;
  num2Stored = false;
  result = 0;
  outputText();
  
  
}


