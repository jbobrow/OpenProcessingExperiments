
Word myWord[];

String[] word = {"hello","world","moo"};

int wordCount = word.length;

void setup() {
  size(800, 600);
  myWord = new Word [wordCount];
  for (int i=0;i<word.length;i++){
  myWord[i] = new Word(word[i], 20, 20, random(0, width), random(0, height), random(-3, 3), random(-3,3));//(blahWord_,wSize_,iColor_,xPos_,yPos_,wSpeed_)
  }
}

void draw() {
  background(255);//needs to be before the for loop or else will get factored into the loop, making it appear as if only the last instance is working
  for (int i=0;i<myWord.length;i++){
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

//one of the functions that will be performed
  void move() {
    xPos=xPos+xSpeed;
    yPos=yPos+ySpeed;
    
//has the movement to "bounce" back when it reaches the limits of the canvas
//the words' boundaries are marked by the bottom left point of where the word starts, so it's not until that point hits the boundaries that the word will "bounce"
    if (xPos>=width || xPos<=0) {
      xSpeed = xSpeed*-1;
    }
    if (yPos>=height || yPos<=0) {
      ySpeed = ySpeed*-1;
    }
  }
  
//another function to display the string
  void display() {
   // pushMatrix(); //saving for later use
    textSize(wSize);
    text(blahWord, xPos, yPos);
    fill(iColor);
   // popMatrix(); //saving for later use
  }
}



