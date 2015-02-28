
//ten buttons, all with different functions
//ugly code is ugly :c

boolean isButtonOneWhite = true;
boolean isButtonTwoWhite = true;
boolean isButtonThreeWhite = true;
boolean isButtonFourWhite = true;
boolean isButtonFiveWhite = true;

boolean isButtonSixWhite = false;
boolean isButtonSevenWhite = false;
boolean isButtonEightWhite = false;
boolean isButtonNineWhite = false;
boolean isButtonTenWhite = false;

void setup(){
  size(200,500);
}

void draw(){
  smooth();
  textSize(20);
  
  //button one
  if ((mousePressed==true) && (mouseX<100) && (mouseY<100)){
    isButtonOneWhite = false;
  }
  if ((mousePressed==false) && (mouseX<100) && (mouseY<100)){
    isButtonOneWhite = true;
  }
  int buttonOneFill = int(isButtonOneWhite)*255;
  fill(buttonOneFill);
  stroke(0);
  rect(0,0,100,100);
  fill(255-buttonOneFill);
  text("↕",50,50);
 
  
  //button two
  int buttonTwoFill = int(isButtonTwoWhite)*255;
  fill(buttonTwoFill);
  rect(0,100,100,100);
  fill(255-buttonTwoFill);
  text("⇊",50,150);
  
  //button three
  int buttonThreeFill = int(isButtonThreeWhite)*255;
  fill(buttonThreeFill);
  rect(0,200,100,100);
  fill(255-buttonThreeFill);
  text("⇈",50,250);
  
  //button four
  if ((mousePressed==true) && (mouseX<100) && (300<mouseY) && (mouseY<400)){
    isButtonFourWhite = false;
  }
  int buttonFourFill = int(isButtonFourWhite)*255;
  fill(buttonFourFill);
  rect(0,300,100,100);
  fill(255-buttonFourFill);
  text("↓",50,350);
  
  //button five
  int buttonFiveFill = int(isButtonFiveWhite)*255;
  fill(buttonFiveFill);
  rect(0,400,100,100);
  fill(255-buttonFiveFill);
  text("↑",50,450);
  
  //button six
  if ((mousePressed==true) && (mouseX>100) && (mouseY<100)){
    isButtonSixWhite = true;
  }
  if ((mousePressed==false) && (mouseX>100) && (mouseY<100)){
    isButtonSixWhite = false;
  }
  int buttonSixFill = int(isButtonSixWhite)*255;
  fill(buttonSixFill);
  stroke(255);
  rect(100,0,100,100);
  fill(255-buttonSixFill);
  text("↕",150,50);
  
  //button seven
  int buttonSevenFill = int(isButtonSevenWhite)*255;
  fill(buttonSevenFill);
  rect(100,100,100,100);
  fill(255-buttonSevenFill);
  text("⇊",150,150);
  
  //button eight
  int buttonEightFill = int(isButtonEightWhite)*255;
  fill(buttonEightFill);
  rect(100,200,100,100);
  fill(255-buttonEightFill);
  text("⇈",150,250);
  
  //button nine
  if ((mousePressed==true) && (mouseX>100) && (300<mouseY) && (mouseY<400)){
    isButtonNineWhite = true;
  }
  int buttonNineFill = int(isButtonNineWhite)*255;
  fill(buttonNineFill);
  rect(100,300,100,100);
  fill(255-buttonNineFill);
  text("↓",150,350);
  
  //button ten
  int buttonTenFill = int(isButtonTenWhite)*255;
  fill(buttonTenFill);
  rect(100,400,100,100);
  fill(255-buttonTenFill);
  text("↑",150,450);
}

void mousePressed(){
  // button two
  if ((mouseX<100) && (mouseY>100) && (mouseY<200)){
    isButtonTwoWhite =! isButtonTwoWhite;
  }
  //button seven
  if ((mouseX>100) && (mouseY>100) && (mouseY<200)){
    isButtonSevenWhite =! isButtonSevenWhite;
  }
}

void mouseReleased(){
  // button three
  if ((mouseX<100) && (mouseY>200) && (mouseY<300)){
    isButtonThreeWhite =! isButtonThreeWhite;
  }
  
  // button eight
  if ((mouseX>100) && (mouseY>200) && (mouseY<300)){
    isButtonEightWhite =! isButtonEightWhite;
  }
  
  //button five
  if ((mouseX<100) && (mouseY>400) && (mouseY<500)){
    isButtonFiveWhite = false;
  }
  
  //button ten
  if ((mouseX>100) && (mouseY>400) && (mouseY<500)){
    isButtonTenWhite = true;
  }
}
