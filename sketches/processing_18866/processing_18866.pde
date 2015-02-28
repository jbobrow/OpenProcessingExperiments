
Float num1, num2, result;//numbers
char currentOp;// stores the current operator whenever it changes
boolean num1Stored; 
boolean num2Stored; 
boolean resultShown;
boolean memoryOn;
StringBuffer numString = new StringBuffer(); //string form from the text field
PFont font;



void setup() {
  size (400, 450);
  background(0);
  num1Stored = false;
  num2Stored = false;
  Float f = null; 
  currentOp = ' ';
  fill(0);
  font = createFont("Helvetica",48);//("HelveticaNeue-Bold-48");
  textFont(font);
  fill(255);
   text("THIS IS A", 25, 290);
   text("CALCULATOR", 35, 330);
}

void draw() {
 
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
    numString.append(key);
    outputText();
    break;
  case '+':
  case '-':
  case '/':
  case '%':
    processOperator(key);

    break;
  case '*':
  case 'x':
  case 'X':
    print("*");
    processOperator(key); 
    break;
  case '=':
  case ENTER:
    processOperator(key);  
    break;
  }
}

void processOperator(char theOp) {

  if(!num1Stored && !num2Stored) {
    println("neither number 1 or number 2 is stored");
    if(Float.isNaN(float(numString.toString())) == true) {
      println("not a number error");
      errorMessage("numbers only");
      numString = new StringBuffer();
      outputText();
    }
    else {

      num1 = float(numString.toString());
      num1Stored = true;
      currentOp = theOp;
      println("number 1 is " + num1 + "the operation is " + currentOp);
      numString=new StringBuffer();
      outputText();
    }
  }
  else if(num1Stored && !num2Stored) {
    println("number 1 is stored, but not 2");
    num2 = float(numString.toString());//convert it into a float and stick this in as number 2
    doTheMath(currentOp);
    num1 = result;
    //num2 = null;
    numString = new StringBuffer();
    //doTheMath(currentOp);
    //num1 = result;
    println("the second number is " + num2);
    //next time around an operator is hit we are doing math with numbers 1 and 2
    currentOp = theOp;
  }
  else if(num1Stored && num2Stored) {
    println("number 1 and number 2 are stored");
    doTheMath(currentOp);
  }
}

void outputText() {
  background(0);
  fill(255);
  text(numString.toString(), 25, 40, width-50, 200);
}


void deleteFunction() {
  background(255);
 

 
  String substr = numString.substring( 0, numString.length()-1);
  println(substr);
  text(substr, 25, 40, width-50, 200);
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
    numString = new StringBuffer("" + result + "");
    outputText();
    resultShown = true;
     text("DO ANOTHER", 25, 290);
   text("EQUATION", 35, 330);
  }
}



void errorMessage(String s) {
  fill(255);
  rect(25, 300, 300, 100);
  fill(0);
  text(s, 25, 300);
  println("printed");
}




void memoryBox() {
}


