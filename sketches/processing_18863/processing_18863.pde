
Float num1, num2, result;//numbers
char currentOp;// stores the current operator whenever it changes
boolean num1Stored; 
boolean num2Stored; 
boolean resultShown;
boolean error;
boolean memoryOn;
StringBuffer numString = new StringBuffer(); //string form from the text field
PFont font;



void setup() {
  size (700, 400);
  background(79);
  num1Stored = false;
  num2Stored = false;
  currentOp = ' ';
  fill(0);
  font = loadFont("AvenirLTStd-Light-48.vlw");
  textFont(font);
  errorMessage(" ");//call this blank error message function to initially set up the white box space for the message
}

void draw() {

  //background(255);
  fill(255);
  noStroke();
  rect(25, 20, 400, 70);
  fill(0);
  text(numString.toString(), 25, 40, 300, 200);
  
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
    numString.append(key);
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
  }
}

void processOperator(char theOp) {
 //// SUCH A JANKY FUNCTION HERE. THERE HAS TO BE A SMARTER WAY OF DOING ALL THIS//////////

  if(!num1Stored && !num2Stored) {
    println("neither number 1 or number 2 is stored");
    if(Float.isNaN(float(numString.toString())) == true) {
      println("not a number error");
      error = true;
      errorMessage("numbers only");
      numString = new StringBuffer();

    }
    else {
      errorMessage(" " );//using this to clear out the error message text box
      num1 = float(numString.toString());
      num1Stored = true;
      currentOp = theOp;
      println("number 1 is " + num1 + "the operation is " + currentOp);
      numString=new StringBuffer();

    }
  }
  else if(num1Stored && !num2Stored) {
    println("number 1 is stored, but not 2");
    //cheching to see if the thing that just came in is a number 
    if(numString.length() == 1 && numString.charAt(0) =='.'){
      //if the second number after an operator is just the character . then make that a 0 so we can do math with it.
      num2 = 0.0;
    }else{
    num2 = float(numString.toString());
    }//convert it into a float and stick this in as number 2
    doTheMath(currentOp);
    num1 = result;
    numString = new StringBuffer();
    println("the second number is " + num2);
    //next time around an operator is hit we are doing math with numbers 1 and 2
    currentOp = theOp;
  }
  else if(num1Stored && num2Stored) {
    println("number 1 and number 2 are stored");
    doTheMath(currentOp);
  }
}
///make things show up on the screen

//delete is being wonky it only deletes once and when u hit a number 2 numbers come back
void deleteFunction() {
  background(79);
  errorMessage(" ");//call this blank error message function to initially set up the white box space for the message
  num1Stored = false;
  num2Stored = false;
  currentOp = ' ';
  num1 = null;
  num2 = null;
  resultShown = true;
  numString = new StringBuffer();
}

void doTheMath(char opDone) {
  // if number 1 and 2 are not set to null and if they are actually numbers not text do the math
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
  //noStroke();
  rect(500, 0, 200, 150);
  fill(0);
  if(num1 == null){
    text("", 500, 40);
  }
  else{
        text("" + num1 + "", 500, 40);
  }
  text("" + currentOp + "", 500, 90);
  text(numString.toString(), 500, 140);
}

