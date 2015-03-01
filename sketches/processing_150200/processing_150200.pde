
//muchas gracias to professor lemasters for the assists

Word myWord[];

String[] word;
String wholeText;

int xColor;

void setup() {
  size(800, 600);
  //loads text file as string
  String[] text = loadStrings("Seeker.txt");
  //joins text to create a string out of the whole document
  String wholeText=join(text, " ");
  //splits the text by punctuation
  word=splitTokens(wholeText, ",.?!:;[]—()\" ");

  xColor = color(random(0, 255), random(0, 255), random(0, 255));
  myWord = new Word [word.length];
  //counts through and assigns value to each word instance
  for (int i=0;i<word.length;i++) {
    xColor = color(40, 40, 40);
    myWord[i] = new Word(word[i], random(20, 40), xColor, width/2, height/2, random(-2, 2), random(-2, 2));//(blahWord_,wSize_,iColor_,xPos_,yPos_,xSpeed_,ySpeed)
  }
}

//function to draw the background and words based on counter counting through each instnace of myWord
void draw() {
  background(255);//needs to be before the for loop or else will get factored into the loop, making it appear as if only the last instance is working
  for (int i=0;i<myWord.length;i++) {
    myWord[i].move();
    myWord[i].display();
  }
}
//the Word class and its attributes
class Word {
  //int wordNum; //saving for later use
  String blahWord;
  float wSize;
  color iColor;
  float xPos;
  float yPos;
  float xSpeed;
  float ySpeed;

  //establishing the conditions
  Word(String blahWord_, float wSize_, color iColor_, float xPos_, float yPos_, float xSpeed_, float ySpeed_) {
    //wordNum = wordNum_; //saving for later use
    blahWord = blahWord_;
    wSize = wSize_;
    iColor = iColor_;
    xPos = xPos_;
    yPos = yPos_;
    xSpeed = xSpeed_;
    ySpeed = ySpeed_;
  }

  //one of the functions that will be performed to decide position and speed
  void move() {

    xPos=xPos+xSpeed;
    yPos=yPos+ySpeed;

    //has the movement to "bounce" back when it reaches the limits of the canvas
    //the words' boundaries are marked by the bottom left point of where the word starts, so it's not until that point hits the boundaries that the word will "bounce"
    textSize(wSize);
    if (xPos>=width-textWidth(blahWord) || xPos<=0) {
      xSpeed = xSpeed*-1;
    }
    if (yPos>=height || yPos<=textAscent()) {
      ySpeed = ySpeed*-1;
    }
  }

  //another function to display the string while determining its size, text variables, and color
  void display() {
    textSize(wSize);
    text(blahWord, xPos, yPos);
    fill(iColor);
  }
}



