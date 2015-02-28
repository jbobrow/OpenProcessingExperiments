

StringBuffer numberTyped = new StringBuffer(); 
PFont font;
int num1, num2, result;
float numbers;
char currentOp;
boolean numbStored1;
boolean numbStored2;
boolean prevCalc;

void setup() {
  size(300,400);
  font = loadFont("MyriadPro-Regular-48.vlw");
  textSize(22);
  smooth();

  numbStored1 = false;
  numbStored2 = false;
  
  }




void draw() {
  background(255);

  // Main background
  fill(0, 30);
  rect(40, 60, 215, 280);

  //screen

  numbers = int(numberTyped.toString());
  println(numbers);
    noStroke();
    fill(0, 70);
    rect(58, 75, 180, 45);
  text(numberTyped.toString(), 70, 70, width, height);

    // buttons
    //1st row
    noStroke();
    fill(0, 70);
    ellipse(75, 155, 40, 40);
    fill(30);
    text("1", 64, 172);

    noStroke();
    fill(0, 70);
    ellipse(125, 155, 40, 40);
    fill(30);
    text("2", 114, 172);

    noStroke();
    fill(0, 70);
    ellipse(175, 155, 40, 40);
    fill(30);
    text("3", 164, 172);

    //2nd row
    noStroke();
    fill(0, 70);
    ellipse(75, 205, 40, 40);
    fill(30);
    text("4", 63, 222);

    noStroke();
    fill(0, 70);
    ellipse(125, 205, 40, 40);
    fill(30);
    text("5", 115, 222);

    noStroke();
    fill(0, 70);
    ellipse(175, 205, 40, 40);
    fill(30);
    text("6", 163, 222);

    //3rd row
    noStroke();
    fill(0, 70);
    ellipse(75, 255, 40, 40);
    fill(30);
    text("7", 65, 273);

    noStroke();
    fill(0, 70);
    ellipse(125, 255, 40, 40);
    fill(30);
    text("8", 114, 273);

    noStroke();
    fill(0, 70);
    ellipse(175, 255, 40, 40);
    fill(30);
    text("9", 164, 273);

    //4th row
    noStroke();
    fill(0, 70);
    ellipse(75, 305, 40, 40);
    fill(30);
    text("0", 64, 321);

    noStroke();
    fill(0, 70);
    ellipse(125, 305, 40, 40);
    fill(30);
    text(".", 120, 310);

    noStroke();
    fill(0, 70);
    ellipse(175, 305, 40, 40);
    fill(30);
    text("c", 164, 317);

    // others

    noStroke();
    fill(0, 70);
    ellipse(225, 152, 30, 30);

    noStroke();
    fill(0, 70);
    ellipse(225, 190, 30, 30);

    noStroke();
    fill(0, 70);
    ellipse(225, 230, 30, 30);

    noStroke();
    fill(0, 70);
    ellipse(225, 270, 30, 30);

    noStroke();
    fill(0, 70);
    ellipse(225, 308, 30, 30);
  }


  //void processNumber(char number){
  ////print keypressed numbers
  //if(number == '0'){println('0');}if(number == '1'){println('1');}if(number == '2'){println('2');}if(number == '3'){println('3');}
  //if(number == '4'){println('4');}if(number == '5'){println('5');}if(number == '6'){println('6');}if(number == '7'){println('7');}
  //if(number == '8'){println('8');}if(number == '9'){println('9');}
  //}


  void outputText() {
  background(255);
  fill(0);
  text (numberTyped.toString());
 

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
    numberTyped.append(key);
    outputText();
    break;
  case '+':
  case '-':
  case '*':
  case '/':
  case '=':
    operatorType(key);
    break;
  }
  
}
  
  void operatorType(char theOp) {
   
  if(!numbStored1 && !numbStored2) { 
  num1 = int(numberTyped.toString()); 
  numbStored1 = true; 
  currentOp = theOp;
  numberTyped = new StringBuffer();
  outputText();
  }
  else if(numbStored1 && !numbStored2) { 
  num2 = int(numberTyped.toString()); 
  calcOutput(currentOp);
  num1 = result;
   numberTyped = new StringBuffer();
  currentOp = theOp;
  }
  else if(numbStored1 && numbStored2) { 
  calcOutput(theOp); 
  }
   
}
  
  
  
  void calcOutput(char op) {
   
  switch(op) {   
  case '-':
  result = num1 - num2;
  break;
  }
   

numberTyped = new StringBuffer("" + result + "");
  outputText();
  prevCalc = true;
}
  
  
  

  

  




