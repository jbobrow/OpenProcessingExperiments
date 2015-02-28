
CalcButton[] numButtons = new CalcButton[10];
CalcButton[] opButtons = new CalcButton[6];
CalcButton[] spButtons = new CalcButton[1];
 
//Global variables
String displayValue = "0";
String valueToCompute = "";
String valueToCompute2 = "";
float valueToComputeI = 0;
float valueToComputeI2 = 0;
float result = 0;
String opValue;
boolean firstNum;
//int keyResult;
 
void setup() {
  size(250, 310);
  background(225);
  //frameRate(10);
 
  // Number buttons
  numButtons[0] = new CalcButton(70, 250, 50, 50, 150).asNumber(0);
  numButtons[1] = new CalcButton(10, 190, 50, 50, 150).asNumber(1);
  numButtons[2] = new CalcButton(70, 190, 50, 50, 150).asNumber(2);
  numButtons[3] = new CalcButton(130, 190, 50, 50, 150).asNumber(3);
  numButtons[4] = new CalcButton(10, 130, 50, 50, 150).asNumber(4);
  numButtons[5] = new CalcButton(70, 130, 50, 50, 150).asNumber(5);
  numButtons[6] = new CalcButton(130, 130, 50, 50, 150).asNumber(6);
  numButtons[7] = new CalcButton(10, 70, 50, 50, 150).asNumber(7);
  numButtons[8] = new CalcButton(70, 70, 50, 50, 150).asNumber(8);
  numButtons[9] = new CalcButton(130, 70, 50, 50, 150).asNumber(9);
 
  // Operators
  opButtons[0] = new CalcButton(190, 250, 50, 50, 150).asOperator("+");
  opButtons[1] = new CalcButton(190, 190, 50, 50, 150).asOperator("-");
  opButtons[2] = new CalcButton(190, 130, 50, 50, 150).asOperator("×");
  opButtons[3] = new CalcButton(190, 70, 50, 50, 150).asOperator("÷");
  opButtons[4] = new CalcButton(10, 250, 50, 50, 150).asOperator("=");
  opButtons[5] = new CalcButton(10, 10, 50, 50, 150).asOperator("C");
 
  // Special buttons
  spButtons[0] = new CalcButton(130, 250, 50, 50, 150).asSpecial(".");
 
  firstNum = true;
}
 
void draw() {
  //Draw number buttons
  for (int i=0; i < numButtons.length; i++) {
    CalcButton inumButton = numButtons[i];
    inumButton.display();
  }
  for (int i=0; i<opButtons.length; i++) {
    CalcButton iopButton = opButtons[i];
    iopButton.display();
  }
  for (int i = 0; i<spButtons.length; i++) {
    CalcButton ispButton = spButtons[i];
    ispButton.display();
  }
  updateDisplay();
}
 
void mousePressed() {
  for (int i = 0; i<numButtons.length; i++) {
    CalcButton inumButton = numButtons[i];
    inumButton.clickButton();
    if (inumButton.overBox) {
      if (firstNum) {
        valueToCompute += int(inumButton.numButtonValue);
        displayValue = valueToCompute;
      }
      else {
        valueToCompute2 += int(inumButton.numButtonValue);
        displayValue = valueToCompute2;
      }
    }
  }
  for (int i=0; i<opButtons.length; i++) {
    CalcButton iOpButton = opButtons[i];
    iOpButton.clickButton();
    if (iOpButton.overBox) {
      if (iOpButton.opButtonValue == "C") {
        handleKeyPressOp("C");
      }
      else if (iOpButton.opButtonValue == "=") {
        //performCalculation();
        handleKeyPressOp("=");
      }
      else if (iOpButton.opButtonValue == "+") {
        handleKeyPressOp("+");
      }
      else if (iOpButton.opButtonValue == "-") {
        handleKeyPressOp("-");
      }
      else if (iOpButton.opButtonValue == "×") {
        handleKeyPressOp("×");
      }
      else if (iOpButton.opButtonValue == "÷") {
        handleKeyPressOp("÷");
      }
    }
  }
}
 
void performCalculation() {
  valueToComputeI = float(valueToCompute);
  valueToComputeI2 = float(valueToCompute2);
 
  //Perform calculation based on the appropriate operator
  if (opValue == "+") {
    result = valueToComputeI + valueToComputeI2;
    displayValue = str(result);
  }
  else if (opValue == "-") {
    result = valueToComputeI - valueToComputeI2;
    displayValue = str(result);
  }
  else if (opValue == "×") {
    result = valueToComputeI * valueToComputeI2;
    displayValue = str(result);
  }
  else if (opValue == "÷") {
    result = valueToComputeI / valueToComputeI2;
    displayValue = str(result);
  }
  if (firstNum) {
    valueToCompute = displayValue;
  }
  else {
    valueToCompute = displayValue;
    valueToCompute2 = "";
  }
}
 
void updateDisplay() {
  fill(255);
  rect(70, 10, 170, 50);
  fill(0);
  text(displayValue, 80, 40);
}
void handleKeyPressOp(String keyPress) {
  if (keyPress =="C") {
    displayValue = "0";
    opValue = "C";
    valueToCompute = "";
    valueToCompute2 = "";
    valueToComputeI = 0;
    valueToComputeI2 = 0;
    result = 0;
    firstNum = true;
  }
  else if (keyPress == "=") {
    firstNum = true;
    performCalculation();
  }
  else if (keyPress == "+") {
    if (result != 0) {
      opValue = "+";
      valueToCompute2 = "";
      firstNum = false;
      displayValue = "+";
    }
    else {
      opValue = "+";
      firstNum = false;
      displayValue = "+";
    }
  }
  else if (keyPress == "-") {
    if (result != 0) {
      opValue = "-";
      valueToCompute2 = "";
      firstNum = false;
      displayValue = "-";
    }
    else {
      opValue = "-";
      firstNum = false;
      displayValue = "-";
    }
  }
  else if (keyPress == "×") {
    if (result != 0) {
      opValue = "×";
      valueToCompute2 = "";
      firstNum = false;
      displayValue = "×";
    }
    else {
      opValue = "×";
      firstNum = false;
      displayValue = "×";
    }
  }
  else if (keyPress == "÷") {
    if (result != 0) {
      opValue = "÷";
      valueToCompute2 = "";
      firstNum = false;
      displayValue = "÷";
    }
    else {
      opValue = "÷";
      firstNum = false;
      displayValue = "÷";
    }
  }
}
 
class CalcButton {
 
  boolean isNumber;
  boolean isSpecial;
  float numButtonValue;
  String opButtonValue;
  String spButtonValue;
  float xpos;
  float ypos;
  int buttonW;
  int buttonH;
  boolean overBox = false;
  color buttonC;
 
  // Constructor
  CalcButton(float tempXpos, float tempYpos, int tempButtonW, int tempButtonH, color tempButtonC) {
    xpos = tempXpos;
    ypos = tempYpos;
    buttonW = tempButtonW;
    buttonH = tempButtonH;
    buttonC = tempButtonC;
    //println(numButtonValue);
  }
 
  CalcButton asNumber(float tempNumButtonValue) {
    isNumber = true;
    numButtonValue = tempNumButtonValue;
    return this;
  }
  CalcButton asOperator(String tempOpButtonValue) {
    opButtonValue = tempOpButtonValue;
    return this;
  }
  CalcButton asSpecial(String buttonValue) {
    isSpecial = true;
    spButtonValue = buttonValue;
    return this;
  }
 
 
  void display() {
    strokeWeight(2);
    stroke(0);
    textSize(24);
    if (isNumber) {
      fill(buttonC);
      rect(xpos, ypos, buttonW, buttonH, 10);
      fill(255, 255, 0);
      text(int(numButtonValue), xpos+17, ypos+35);
    }
    else if (isSpecial) {
      fill(buttonC);
      rect(xpos, ypos, buttonW, buttonH, 10);
      fill(0,0,255);
      text(spButtonValue, xpos+17, ypos+35);
    }
    else {
      fill(buttonC);
      rect(xpos, ypos, buttonW, buttonH, 10);
      fill(0,0,255);
      text(opButtonValue, xpos+17, ypos+35);
    }
  }
 
  void clickButton() {
    overBox = mouseX > xpos && mouseX < xpos+buttonW && mouseY > ypos && mouseY < ypos+buttonH;
  }
}

