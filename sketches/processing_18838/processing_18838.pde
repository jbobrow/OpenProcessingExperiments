
//B.Severns
//1-30-11
//Database Computational Design
//www.bseverns.com

Float num1, num2, result;//Number time
char currentOp;//Operator
boolean num1Stored;
boolean num2Stored;
boolean resultShown;
boolean error;
boolean memoryOn;
StringBuffer inputBuffer = new StringBuffer(); 
PFont font;
 
//basics of the program
void setup() {
  size (600, 600);
  num1Stored = false;
  num2Stored = false;
  currentOp = ' ';
  fill(0);
  font = loadFont("Futura-CondensedMedium-48.vlw");
  textFont(font, 36);
  
  errorMessage(" ");
}
 

void draw() {
  if (num1Stored == true) {//crazy time!!!
  background(random(255), random(255), random(255));
  } else {
    background(random(20), random(20), random(20));
  }
  textFields();
}
 
void keyPressed() {
  if(keyCode == 8) {
    deleteFunction();
  }
 
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
    inputBuffer.append(key);
    break;
  case '+':
  case '-':
  case '/':
  case '%':
  case '*':
  case 'x':
  case 'X':
    processOperator(key);
    break;
    case ENTER:
    case '=':
    if (inputBuffer.length() == 0) {
      result = 0.0;
    } 
    else if (currentOp != 0) {
      num2 = float(inputBuffer.toString());
      doTheMath(currentOp);
    } 
      break;
  }
}
 
void processOperator(char theOp) {
 
  if(!num1Stored && !num2Stored) {
    println("neither number 1 or number 2 is stored");
    if(Float.isNaN(float(inputBuffer.toString())) == true) {
      println("not a number error");
      error = true;
      errorMessage("numbers only");
      inputBuffer = new StringBuffer();
 
    }
    else {
      errorMessage(" " );
      num1 = float(inputBuffer.toString());
      num1Stored = true;
      currentOp = theOp;
      println("number 1 is " + num1 + "the operation is " + currentOp);
      inputBuffer=new StringBuffer();
 
    }
  }
  else if(num1Stored && !num2Stored) {
    println("number 1 is stored, but not 2");
    if(inputBuffer.length() == 1 && inputBuffer.charAt(0) =='.'){
      num2 = 0.0;
    }else{
    num2 = float(inputBuffer.toString());
    }
    doTheMath(currentOp);
    num1 = result;
    inputBuffer = new StringBuffer();
    println("the second number is " + num2);
    currentOp = theOp;
  }
  else if(num1Stored && num2Stored) {
    println("number 1 and number 2 are stored");
    doTheMath(currentOp);
  }
}

 
//Clear/Reset
void deleteFunction() {
  background(79);
  errorMessage(" ");
  num1Stored = false;
  num2Stored = false;
  currentOp = ' ';
  num1 = null;
  num2 = null;
  resultShown = true;
  inputBuffer = new StringBuffer();
}
 
void doTheMath(char opDone) {
  if(num1!=null && num2!=null && Float.isNaN(num1) == false && Float.isNaN(num2) == false) {
    switch(opDone) {
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
 
    case '%':
      result = num1 % num2;
      break;
    }
    println("the result is " + result);
    inputBuffer = new StringBuffer("" + result + "");
    resultShown = true;
  }
}

void errorMessage(String s) {
  noStroke();
  fill(255);
  rect(25, 250, 300, 100);
  fill(0);
  text(s, 25, 300);
  println("printed");
}
 
void textFields() {
  fill(255);
  rect(500, 0, 300, 150);
  fill(0);
  if(num1 == null){
    text("", 500, 40);
  }
  else{
        text("" + num1 + "", 500, 40);
  }
  text("" + currentOp + "", 500, 90);
  text(inputBuffer.toString(), 500, 140);
}

