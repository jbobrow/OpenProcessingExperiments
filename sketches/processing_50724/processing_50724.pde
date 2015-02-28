
/*
  ***ASSIGNMENT***
  - Load a Font
    - get a font
  - capture key characters that are valid
    - `if a number, add to string
    - if operator, convert previous string to
      a number and store operation
    - if there are 2 numbers and operator, apply
    - display result
    - rinse, repeat
    
   ***NOTE : FIGURE OUT HOW TO PREVENT DIVIDING
      BY ZERO!!***
*/

PFont myFont;

char currentOp;    // will store current operator whenever it changes
Float num1, num2, result;    //numbers
boolean num1Stored;
boolean num2Stored;
boolean resultShown;
boolean error;
StringBuffer numString = new StringBuffer();

void setup(){
  size(600,400);
  smooth();
  background(42);
  
  myFont = loadFont("Geneva.vlw");
  textFont(myFont, 20);
  
  num1Stored = false;
  num2Stored = false;
  
  errorMessage(" ");
}

void draw(){
  textBox();
}

void keyPressed() {
  if(keyCode == 8){
    deleteFunction();
  }
  
  switch(key){
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
      numString.append(key);
      break;
    case '+':
    case '-':
    case '*':
    case '/':
      processOperator(key);
      break;
    case ENTER:
    case '=':
      if(numString.length() == 0){
        result = 0.0;
  } else if (currentOp !=00){
      num2 = float(numString.toString());
      doMath(currentOp);
  }
    break;
  }
}

//Math doing

void processOperator(char theOp){
  
  if(!num1Stored && !num2Stored){
    println("nothing is stored");
    if(Float.isNaN(float(numString.toString())) == true){
      println("not math");
      error = true;
      errorMessage("numbers only bitch");
      numString = new StringBuffer();
      
    } else {
      errorMessage(" ");
      num1 = float(numString.toString());
      num1Stored = true;
      currentOp = theOp;
      println("number 1 is " + num1 + "the operation is " + currentOp);
      numString = new StringBuffer();
    }
 
  } else if(num1Stored && !num2Stored) {
    println("first num in");
    if(numString.length() == 1 && numString.charAt(0) == '.'){
      num2 = 0.0;
    } else {
      num2 = float(numString.toString());
    }
    doMath(currentOp);
    num1 = result;
    numString = new StringBuffer();
    println("the second number is " + num2);
    currentOp = theOp;
    
  } else if(num1Stored && num2Stored) {
    println("everyone is at the party");
    doMath(currentOp);
  }
}

// Clear and reset
  
void deleteFunction(){
  background(42);
  errorMessage(" ");
  num1Stored = false;
  num2Stored = false;
  currentOp = ' ';
  num1 = null;
  num2 = null;
  resultShown = true;
  numString = new StringBuffer();
}

void doMath(char opDone){
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
    }
        
      println("the result is " + result);
      numString = new StringBuffer("" + result + "");
      resultShown = true;
  }
}
    
void errorMessage(String s){
    noStroke();
    fill(42);
    rect(25,250,300,100);
    fill(0);
    text(s, 25, 300);
    println("printed");
}

void textBox(){
  fill(255);
  rect(150, 50, 175, 150);
  fill(0);
  if(num1 == null){
    text("", 150, 90);
  } else {
    text("" + num1 + "", 150,90);
  }
  text("" + currentOp + "", 150, 140);
  text(numString.toString(), 150, 160);
}


