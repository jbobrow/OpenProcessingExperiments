
/*Labb 2 - Claudia Yamao - hkr vt 2012 */

import guicomponents.*; //import the library

color bColor; //background color

//color buttons
GButton pinkButton; 
GButton orangeButton;
GButton blueButton;

//radioButtons for the images
private GOptionGroup optGroup;
private GOption optCat;
private GOption optFlower;
private GOption optHeart;

//images
PImage cat;
PImage flower;
PImage heart;

//rectangle 
GCheckbox checkboxRect; //checkbox draw the rectangle
int rectSize; //rect size

GTextField textFieldRectSize; //text field rect size
GButton okButtonRectSize; //OK button rectsize

//font
PFont instructions;
PFont message;

//variables for the userInputText
String userInputText; //userInputText
GTextField textField;//textField - userInputText
GButton okButton; //OK for the userInputText

void setup () {
  size (320,480);
  smooth ();
  bColor = color(255, 255, 255); //initial color
  
  //create backgroundcolor buttons
  pinkButton = new GButton(this, " pink", 15, 25, 50, 30);
  pinkButton.setFont("Georgia", 16, false);
  pinkButton.setTextAlign(GAlign.LEFT);
  
  orangeButton = new GButton(this, " orange", 120, 25, 60, 30);
  orangeButton.setFont("Georgia", 16, false);
  orangeButton.setTextAlign(GAlign.LEFT);
  
  blueButton = new GButton(this, " aqua", 240, 25, 50, 30);
  blueButton.setFont("Georgia", 16, false);
  blueButton.setTextAlign(GAlign.LEFT);
  
  //change the button colors
  //nameButton.setColours (color (normal), color (mouseOver), color (pressedColor));
  pinkButton.setColours (color(247, 20, 247), color(250, 204, 250), color(247, 20, 247));
  orangeButton.setColours (color(247, 187, 20), color(252, 223, 176), color(247, 187, 20));
  blueButton.setColours (color(107, 222, 215), color(195, 245, 244), color(107, 222, 215));
  
  //radio butons: image
  optGroup = new GOptionGroup();
  optCat = new GOption(this, "cat", 125, 70, 100);
  optFlower = new GOption(this, "flowers", 125, 90, 100);
  optHeart = new GOption (this, "heart", 125, 110, 100);

  optGroup.addOption(optCat);
  optGroup.addOption(optFlower);
  optGroup.addOption(optHeart);

  //set default selected image
  optGroup.setSelected(optCat);
  
  //images
  cat = loadImage ("cat.gif");
  flower = loadImage ("flowers.gif");
  heart = loadImage ("heart.gif");
  
  //setup font
  instructions = createFont ("DejaVuSans", 12, true);
  message = createFont ("BradleyHandITC", 20, true);
  
  //set the initial rect size
  rectSize = 280; //rect initial size 
    
  //create text field for the rect size
  textFieldRectSize = new GTextField(this, "" ,220, 125, 50, 20);
  okButtonRectSize = new GButton(this, "OK", 280, 125, 30, 20);
  
  //create buttons for the userInputText
  textField = new GTextField (this, "", 10, 170,260, 40, true);//multline
  okButton = new GButton (this, "OK", 280, 170, 30, 20);
  
  userInputText = "your message";
}

void draw () {
  background (bColor); //color the background
  int indent = 25;
  //draw a rect
      noStroke();
      fill (239, 193, 242);
      rectMode(CENTER);
      rect(width/2, height, rectSize, rectSize);
    
    if(optCat.isSelected()){
      image (cat, 80, 230);
    } else if (optFlower.isSelected()){
      image (flower, 80, 230);
    } else if(optHeart.isSelected()){
      image (heart, 80, 230);
    } 
      
  textFont (instructions);
  fill (0);
  text ("Choose a color for the background:", 15, 15);
  text ("Choose an image", 15, 80);
  text ("Write a value for the rectangle size", 15, 140);
  text ("Type your message in the text field", 15, 160);
  
  textFont (message);
  fill (0);
  text (userInputText, 20, 430);
}

void handleButtonEvents(GButton button){ //when it is clicked
  if(button == pinkButton){ //pink button
    bColor = color(247, 20, 247); //color changes to pink
  } else if(button == orangeButton){ //orange
    bColor = color(247, 187, 20); //color changes to orange
  } else if(button == blueButton){ //aqua
    bColor = color(107, 222, 215); //color changes to aqua
  } else if (button == okButtonRectSize) {
    rectSize = Integer.parseInt(textFieldRectSize.getText() );
  } else if (button == okButton) { //ok message button
    userInputText = textField.getText(); //writes the msg
  }
}





