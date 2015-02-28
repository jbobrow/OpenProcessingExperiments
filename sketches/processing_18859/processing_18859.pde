
// variables to keep track of:
// incoming numbers, are numbers stored?
// incoming operators, is operator stored?
// visual information
char currentOp;// stores the current operator whenever it changes
PFont font;
String display = "0";
Float num1, num2, result;//numbers
boolean num1Stored;
boolean num2Stored;
boolean resultShown;
StringBuffer numString = new StringBuffer();

void setup() {
  frameRate(30);
  size (300, 342);
  num1Stored = false;
  num2Stored = false;
  resultShown = false;
  currentOp = ' ';
  background(200);
}


void draw() {
  strokeWeight(2);
  stroke(204, 102, 0);
  fill(200);
  ///top


  // outputText()
  fill(200,0);
  rect(0,0,298,57);
  fill(200);

  //1st row

  rect(0,57,148,57);

  rect(150,57,73,57);
  rect(225,57,73,57);


  //2nd row

  rect(0,114,73,57);
  rect(75,114,73,57);
  rect(150,114,73,57);
  rect(225,114,73,57);

  //3nd row

  rect(0,171,73,57);
  rect(75,171,73,57);
  rect(150,171,73,57);
  rect(225,171,73,57);

  //4th row

  rect(0,228,73,57);
  rect(75,228,73,57);
  rect(150,228,73,57);
  rect(225,228,73,114);

  //5th row

  rect(0,285,148,57);

  rect(150,285,73,57);



  font = loadFont("MyriadPro-Bold-25.vlw"); 
  fill(90);
  textFont(font, 25); 




  text("9", 184, 149);
  text("8", 103, 149);
  text("7", 30, 149);
  text("6", 184, 206);
  text("5", 103, 206);
  text("4", 30, 206);
  text("3", 184, 268);
  text("2", 103, 268);
  text("1", 30, 268);
  text("0", 68, 325);
  text(".", 184, 325);
  text("C", 68, 92);
  text("/", 184, 92);
  text("x", 253, 92);
  text("-", 253, 149);
  text("+", 253, 206);
  text("=", 253, 325);

}


void keyPressed() {
  if(keyCode == 8) {
    setup();
    println("deletion");
    deleteFunction();
  }
  /*  else if (keyCode == 90) {
   text("Happy Day", random(500), random(500));
   }*/


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
    processOperatorInput(key);
    println(key);

    break;
  case '*':
  case 'x':
  case 'X':
    print("*");
    processOperatorInput(key); 
    break;
  case '=':
    processOperatorInput(key);   
    break;
  }
}

void processOperatorInput(char theOp) {
  // do checks
  // do we have a number in storage?
  // if so, store this operator
  if(!num1Stored && !num2Stored) {
    if(Float.isNaN(float(numString.toString())) == true) {
      numString = new StringBuffer();
      outputText();
    }
    else {

      num1 = float(numString.toString());
      num1Stored = true;
      currentOp = theOp;
      numString = new StringBuffer();
      outputText();
    }
  }
  else if(num1Stored && !num2Stored) {
    num2 = float(numString.toString());
    FinalMath(currentOp);
    num1 = result;
    numString =  numString = new StringBuffer();
    currentOp = theOp;
  }
  else if(num1Stored && num2Stored) {
    FinalMath(currentOp);
  }
}

//function to write text
void outputText() {
  fill(200);
  rect(0,0,298,57);
  fill(90);
  text(numString.toString(), 30, 20, width-50, 200);
  fill(200);
}

void deleteFunction() {

  setup();
}

void FinalMath (char opDone) {

  if(num1!=null && num2!=null && Float.isNaN(num1) == false && Float.isNaN(num2) == false) {
    // process the decimal point
    switch(opDone) {
    case '+':
      result = num1 + num2;
      break;

    case '-' :
      result = num1 - num2;

    case '*' :
      result = num1 * num2;
      break;

    case '/':
      result = num1 / num2;
      break;

    case '%':
      result = num1 % num2;
      break;
    }
    numString = new StringBuffer("" + result + "");
    outputText();
    resultShown = true;
  }
}

void errorMessage(String s) {
  fill(0);
  rect(25, 300, 300, 100);
  fill(0);
  text(s, 25, 300);
}


