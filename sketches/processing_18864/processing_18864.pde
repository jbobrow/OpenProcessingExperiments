
char currentOp;
boolean num1Stored; 
boolean num2Stored; 
Float num1;
Float num2;
Float result;
boolean smiles; 
boolean resultShown;
String display = "0"; 
StringBuffer numString = new StringBuffer();
PFont font;



void setup() {
  size (700, 700);
    // resets function when delete key is pressed
  num1Stored = false;
  String display = "0"; 
  num2Stored = false;
  println("reset");
  resultShown = false;
  currentOp = 0;
  background(255);

  currentOp = ' ';
  fill(0);
  
   // font
  PFont font;
  smooth();
  font = loadFont("font.vlw");
  textFont(font, 72);
  fill(#00E819);

}




void draw() {


noFill();
rect(60,300,545,100);
textSize(22);
 
 
/////               fourth row

 // clear
fill(000000);
stroke(#FCF103);
rect(495,610,110,70);
fill(#00E819);
text("clear", 525 , 670);

 // pointless bar
fill(000000);
stroke(#FCF103);
rect(60,610,435,70);
fill(#00E819);
text("z", 225 , 670);


/////               third row

  // 0
fill(000000);
noStroke();
rect(60,540,110,70);
fill(#00E819);
text("0", 80, 600);

  // 1
fill(000000);
stroke(#FCF103);
rect(165,540,110,70);
fill(#00E819);
text("1", 200, 600);
 
  // 2
fill(000000);
stroke(#FCF103);
rect(275,540,110,70);
fill(#00E819);
text("2", 310, 600);
 
 
 // 3
fill(000000);
stroke(#FCF103);
rect(385,540,110,70);
fill(#00E819);
text("3", 415, 600);

 // =
fill(000000);
stroke(#FCF103);
rect(495,540,110,70);
fill(#00E819);
text("=", 525 , 600);

 
 
/////               second row

  // multiply
fill(000000);
stroke(#FCF103);
rect(60,470,110,70);
fill(#00E819);
text("*", 80, 530);

  // 4
fill(000000);
stroke(#FCF103);
rect(165,470,110,70);
fill(#00E819);
text("4", 200, 530);
 
  // 5
fill(000000);
stroke(#FCF103);
rect(275,470,110,70);
fill(#00E819);
text("5", 310, 530);
 
 
 // 6
fill(000000);
stroke(#FCF103);
rect(385,470,110,70);
fill(#00E819);
text("6", 415, 530);

 // -
fill(000000);
stroke(#FCF103);
rect(495,470,110,70);
fill(#00E819);
text("-", 525 , 530);


/////////                 first row

  // / division
fill(000000);
stroke(#FCF103);
rect(60,400,110,70);
fill(#00E819);
text("/", 80, 460);

  // 7
fill(000000);
stroke(#FCF103);
rect(165,400,110,70);
fill(#00E819);
text("7", 200, 460);
 
  // 8
fill(000000);
stroke(#FCF103);
rect(275,400,110,70);
fill(#00E819);
text("8", 310, 460);
 
 
 // 9
fill(000000);
stroke(#FCF103);
rect(385,400,110,70);
fill(#00E819);
text("9", 415, 460);

 // +
fill(000000);
stroke(#FCF103);
rect(495,400,110,70);
fill(#00E819);
text("+", 525 , 460);
 
 

}

void keyPressed() {
  if(keyCode == 8) {
    setup();
    println("deletion");
    deleteFunction(); 
    
  }
    else if(keyCode == 90) {
      text(" :) :) :) :) :) :) ", random(500), random(500));
      println("mystery");
  }
  




  switch(key) {
  case '0':
  outputText();
  numString.append(key);
  textSize(500);
  text("0", 250, 350);
  break;
  case '1':
  outputText();
  numString.append(key);
  textSize(500);
  text("1", 250, 350);
  break;
  case '2':
  outputText();
  numString.append(key);
  textSize(500);
  text("2", 250, 350);
  break;
  case '3':
    outputText();
  numString.append(key);
  textSize(500);
  text("3", 250, 350);
  break;
  case '4':
    outputText();
  numString.append(key);
  textSize(500);
  text("4", 250, 350);
  break;
  case '5':
    outputText();
  numString.append(key);
  textSize(500);
  text("5", 250, 350);
  break;
  case '6':
    outputText();
  numString.append(key);
  textSize(500);
  text("6", 250, 350);
  break;
  case '7':
    outputText();
  numString.append(key);
  textSize(500);
  text("7", 250, 350);
  break;
  case '8':
    outputText();
  numString.append(key);
  textSize(500);
  text("8", 250, 350);
  break;
  case '9':
    outputText();
  numString.append(key);
  textSize(500);
  text("9", 250, 350);
  break;
  case '.':
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
    processOperator(key);   
    break;
  }
}

void processOperator(char theOp) {
 
  if(!num1Stored && !num2Stored) {
    if(Float.isNaN(float(numString.toString())) == true) {
      numString = new StringBuffer();
      outputText();
    }
    else {

      num1 = float(numString.toString());
      num1Stored = true;
      currentOp = theOp;
      numString=new StringBuffer();
      outputText();
    }
  }
  else if(num1Stored && !num2Stored) {
    num2 = float(numString.toString());//convert it into a float and stick this in as number 2
    FinalMath(currentOp);
    num1 = result;
    numString = new StringBuffer();
    //doTheMath(currentOp);
    //num1 = result;
    //next time around an operator is hit we are doing math with numbers 1 and 2
    currentOp = theOp;
  }
  else if(num1Stored && num2Stored) {
    FinalMath(currentOp);
  }
}


void outputText() {
  background(255);
  fill(#00E819);
  text(numString.toString(), 205, 350, width-50, 200);
}


void deleteFunction() {
  background(255); 
  currentOp = 0;
  setup();
  
}

void FinalMath (char opDone) {

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
    numString = new StringBuffer("" + result + "");
    outputText();
    resultShown = true;
  }
}

void errorMessage(String s) {
  fill(255);
  rect(25, 300, 300, 100);
  fill(0);
  text(s, 25, 300);
}




/*
 if (up) {
   y -=5;  
 }
 else if (down) {
   y +=5;  
 }
 if (left) {
   x -= 5;  
 }
 else if (right) {
   x +=5;  
 }
 ellipse(x,y,20,20);
}
*/




