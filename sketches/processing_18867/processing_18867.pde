
Float num1, num2, result;
char currentOp;
boolean num1Stored; 
boolean num2Stored; 
boolean prevCalc;
boolean resultShown;
boolean memoryOn;
StringBuffer numString = new StringBuffer(); 
PFont font;


void setup() {
  size (270, 360);
  background(150);
  num1Stored = false;
  num2Stored = false;
  currentOp = ' ';
  fill(0);
  font = createFont("Courier",48);
  textFont(font);

}

void draw() {
  strokeJoin(ROUND);
  stroke(50,100,150);
  strokeWeight(3);
  fill(255);

  rect(25,30,220,50);
  fill(0);
  textSize(18);
  text(numString.toString(), 40, 48, 195, 30);
  textSize(48);
  
  fill(255);
  rect(20,110,50,50);
  fill(0);
  text("1", 30, 150);
  

  fill(255);
  rect(20,170,50,50);
  fill(0);
  text("4", 30, 210); 

  fill(255);
  rect(20,230,50,50);
  fill(0);
  text("7", 30, 270);

  fill(255);
  rect(20,290,50,50);
  fill(0);
  text(".", 30, 330);

  fill(255);
  rect(80,110,50,50);
  fill(0);
  text("2", 90, 150);

  fill(255);
  rect(80,170,50,50);
  fill(0);
  text("5", 90, 210);

  fill(255);
  rect(80,230,50,50);
  fill(0);
  text("8", 90, 270);

  fill(255);
  rect(80,290,50,50);
  fill(0);
  text("0", 90, 330);

  fill(255);
  rect(140,110,50,50);
  fill(0);
  text("3", 150, 150);

  fill(255);
  rect(140,170,50,50);
  fill(0);
  text("6", 150, 210);

  fill(255);
  rect(140,230,50,50);
  fill(0);
  text("9", 150, 270);

  fill(255);
  rect(140,290,50,50);
  fill(0);
  text("=", 150, 330);

  fill(255);
  rect(200,110,50,50);
  fill(0);
  text("/", 210, 150);

  fill(255);
  rect(200,170,50,50);
  fill(0);
  text("*", 210, 210);

  fill(255);
  rect(200,230,50,50);
  fill(0);
  text("+", 210, 270);

  fill(255);
  rect(200,290,50,50);
  fill(0);
  text("-", 210, 330);

}

void mousePressed(){
  if ((mouseX > 20) && (mouseX < 70) && (mouseY > 110) 
    && (mouseY < 160) && mousePressed) {
    numString.append("1");}
  if ((mouseX > 80) && (mouseX < 130) && (mouseY > 110) 
    && (mouseY < 160) && mousePressed) {
    numString.append("2");
  }
  if ((mouseX > 140) && (mouseX < 190) && (mouseY > 110) 
    && (mouseY < 160) && mousePressed) {
    numString.append("3");
  }
  if ((mouseX > 20) && (mouseX < 70) && (mouseY > 170) 
    && (mouseY < 220) && mousePressed) {
    numString.append("4");
  }
  if ((mouseX > 80) && (mouseX < 130) && (mouseY > 170) 
    && (mouseY < 220) && mousePressed) {
    numString.append("5");
  }
  if ((mouseX > 140) && (mouseX < 190) && (mouseY > 170) 
    && (mouseY < 220) && mousePressed) {
    numString.append("6");
  }
  if ((mouseX > 20) && (mouseX < 70) && (mouseY > 230) 
    && (mouseY < 280) && mousePressed) {
    numString.append("7");
  }
  if ((mouseX > 80) && (mouseX < 130) && (mouseY > 230) 
    && (mouseY < 280) && mousePressed) {
    numString.append("8");
  }
  if ((mouseX > 120) && (mouseX < 190) && (mouseY > 230) 
    && (mouseY < 280) && mousePressed) {
    numString.append("9");
  }
  if ((mouseX > 80) && (mouseX < 130) && (mouseY > 290) 
    && (mouseY < 340) && mousePressed) {
    numString.append("0");
  }
  if ((mouseX > 20) && (mouseX < 70) && (mouseY > 290) 
    && (mouseY < 340) && mousePressed) {
    numString.append(".");
    
  }
  if ((mouseX > 200) && (mouseX < 250) && (mouseY > 230) 
    && (mouseY < 280) && mousePressed) {
    //numString.append("+");
    processOperatorInput(key);

  }
  if ((mouseX > 200) && (mouseX < 250) && (mouseY > 290) 
    && (mouseY < 340) && mousePressed) {
    //numString.append("-");
    processOperatorInput(key);
    println(key);

  }
  if ((mouseX > 200) && (mouseX < 250) && (mouseY > 170) 
    && (mouseY < 220) && mousePressed) {
    //numString.append("*");
    processOperatorInput(key);

  }
  if ((mouseX > 200) && (mouseX < 250) && (mouseY > 110) 
    && (mouseY < 160) && mousePressed) {
    numString.append("/");
    processOperatorInput(key);

  }
  if ((mouseX >140) && (mouseX < 190) && (mouseY > 290) 
    && (mouseY < 340) && mousePressed) {
    //numString.append("=");
    calculateOutput(key='=');

  }
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
    numString.append(key);
    outputText();
    break;
  case '+':
  case '-':
  case '*':
  case '/':
  case '=':
    processOperatorInput(key);
    break;
  default:
    println("unknown key");
  }
}


void processOperatorInput(char theOp) {
  
  if(!num1Stored && !num2Stored) { //if num1 and num2 are both NOT stored,
  num1 = float(numString.toString()); //store the input number as num1,
  num1Stored = true;
  println("num 1 stored"); //num1 is now stored.
  currentOp = theOp;
  println(currentOp);
  numString=new StringBuffer();
  outputText();
  }
  else if(num1Stored && !num2Stored) { //if num1 is stored, but num2 is not
  num2 = float(numString.toString());
  println("num 2 stored"); //stored the input number as num2,
  calculateOutput(currentOp);
  println("the current Operation is " + currentOp);
  num1 = result;
  numString = new StringBuffer();
  //num2Stored = true; //num2 is now stored
  currentOp = theOp;
  }
  else if(num1Stored && num2Stored) { //if both num1 and num2 are stored,
  calculateOutput(theOp); //do math
  }
}

void outputText() {
  background(150);
  fill(0);
  text(numString.toString(), 40, 48, 195, 30);
}

void processNumberInput(char number) {
  numString.append(number);

  fill(255);
  rect(200,200,200,200);
  fill(0);
  text(numString.toString(), 200, 250);
  // store numbers
  
  // decide where to store the numbers
  // if it's time, calculate the output
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
  
  numString = new StringBuffer("result");
  outputText();
  println("the result is " + result);
  prevCalc = true;
  
  
}

