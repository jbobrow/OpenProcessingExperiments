
//thanks to sara levine for the inspiration
//muchas gracias to garrison lemasters for the assists
//code written by daniel shiffman, for dragging boxes, and dx0ne, for timestamping saved image files, also used in this project
//e e cummings and the preamble to the constitution of the united states of america led to the development of this project

Word myWord[];
PFont myFont;
String[] word;
String wholeText;
color textColor;
boolean pressed=false;

void setup() {
  size(800, 600);
  smooth();
  myFont=loadFont("Helvetica-48.vlw");
  textFont(myFont, 24);
  //loads text file as string
  String[] text = loadStrings("Text.txt");
  //joins text to create a string out of the whole document
  String wholeText=join(text, " ");
  //splits the text by punctuation
  word=splitTokens(wholeText, ",.?!:;[]—()\" ");

  textColor = color(35, 55, 84);//text color: bleu
  myWord = new Word [word.length];

  //assigns x and y position for first object
  float currentXPos, currentYPos;
  currentXPos=100;
  currentYPos=200;

  //counts through and assigns value to each word instance
  for (int i=0;i<word.length;i++) {
    //values passed for object
    myWord[i] = new Word(word[i], 24, textColor, currentXPos, currentYPos);//(blahWord_,wordSize_,iColor_,xPos_,yPos_)
    currentXPos=currentXPos+textWidth(word[i])*1.05;
    if (currentXPos>width-textWidth(word[i])-80) {
      currentXPos=80;
      currentYPos=currentYPos+40;
    }
  }
}

//function to draw the background and objects(words) based on counter counting through each instnace of myWord
void draw() {
  background(189, 89, 76);//needs to be before the for loop or else will get factored into the loop, making it appear as if only the last instance is working


  if (millis()<6500) {
    fill(255, 255, 255, 200);
    text("Press Spacebar for Screenshot", 230, 500);
  }
  for (int i=0;i<myWord.length;i++) {
    myWord[i].rollover(mouseX, mouseY);
    myWord[i].drag(mouseX, mouseY);
    myWord[i].boundaryCheck();
    myWord[i].shadowBox();
    myWord[i].display();
  }
  if (pressed) {
    fill(255, 255, 255, 185);
    rect(0, 0, width, height);
  }
}

//actions involved when mouse button is pressed
void mousePressed() {
  for (int i=0;i<myWord.length;i++) {
    myWord[i].clicked(mouseX, mouseY);
  }
}

//actions involved when mouse button is released
void mouseReleased() {
  for (int i=0;i<myWord.length;i++) {
    myWord[i].stopDragging();
  }
}

//actions involved when key is released
void keyReleased() {
  if (key==' ') {
    pressed=false;
  }
}

//actions involved when key is pressed
void keyPressed() {
  if (key==' ') {
    save(file_name("Screenshot/MyPreamble_"));
    pressed=true;
  }
}

//criteria for file name of screenshot
String file_name(String begin) {
  String name = begin;
  name+=String.valueOf(year());
  name+="_";
  if (month()<10) name+="0";
  name+=String.valueOf(month());
  name+="_";
  if (day()<10) name+="0";
  name+=String.valueOf(day());
  name+="_";
  if (hour()<10) name+="0";
  name+=String.valueOf(hour());
  name+=".";
  if (minute()<10) name+="0";
  name+=String.valueOf(minute());
  name+=".";
  if (second()<10) name+="0";
  name+=String.valueOf(second());
  name+=".tif";
  return name;
}
//the Word class and its attributes
class Word {
  String blahWord;
  float wordSize, xPos, yPos, wSize, hSize, wMargin;
  color iColor;
  int i;

  boolean dragging = false; //is the object being dragged?
  boolean rollover = false; //is the mouse over the area?

  float offsetX, offsetY;   //mousclick offset


  //establishing the conditions
  Word(String blahWord_, float wordSize_, color iColor_, float xPos_, float yPos_) {
    blahWord = blahWord_;
    wordSize = wordSize_;
    iColor = iColor_;
    xPos = xPos_;
    yPos = yPos_;
    offsetX = 0;
    offsetY = 0;
    wMargin = 3;
  }

  //function to display the string while determining its size, text variables, and color
  void display() {
    noStroke();
    if (dragging) fill (219, 255, 223);
    else if (rollover) fill (145, 186, 154);
    else fill (145, 186, 154);
    rect(xPos-wMargin, yPos-textAscent()-wMargin, textWidth(blahWord)+6, textAscent()*1.4);
    fill(iColor);
    textSize(wordSize);
    text(blahWord, xPos, yPos);
  }

  //checks for conditions of object placement; limits placement on canvas to designated space
  void boundaryCheck() {
    if (xPos<wMargin) {
      xPos=wMargin;
    }
    if (yPos<textAscent()+wMargin) {
      yPos=textAscent()+wMargin;
    }
    if (xPos+textWidth(blahWord)+wMargin>=width-1) {
      xPos=width-textWidth(blahWord)-wMargin;
    }
    if (yPos+6>height) {
      yPos=height-5;
    }
  }

  //is a point inside the rectangle (for click)?
  void clicked(int mx, int my) {
    if (mx > xPos-3 && mx < xPos + textWidth(blahWord)+4 && my > yPos - textAscent()-2 && my < yPos+textAscent()/2.7) {
      dragging = true;
      // If so, keep track of relative location of click to corner of rectangle
      offsetX = xPos-mx;
      offsetY = yPos-my;
    }
  }

  //point inside the rectangle (for rollover)
  void rollover (int mx, int my) {
    if (mx > xPos-3 && mx < xPos + textWidth(blahWord)+4 && my > yPos - textAscent()-2 && my < yPos+textAscent()/2.7) {
      rollover = true;
    }
    else {
      rollover = false;
    }
  }

  //stop dragging
  void stopDragging() {
    dragging = false;
  }

  //drag the rectangle
  void drag(int mx, int my) {
    if (dragging) {
      xPos = mx + offsetX;
      yPos = my + offsetY;
    }
  }

  //create a shadow if dragging
  void shadowBox() {
    if (dragging) {
      noStroke();
      fill(0, 0, 0, 60);
      rect(xPos-wMargin+3, yPos-textAscent()-wMargin+4, textWidth(blahWord)+6, textAscent()*1.4);
    }
  }
}



