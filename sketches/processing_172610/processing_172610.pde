
/* @pjs font="RockSalt.ttf" ; preload="notebook.jpg, newnotebook.jpg, pencil.jpg, eraser.jpg, scorescreen.jpg, openscreen.jpg" ; */
int myState = 0 ;
int firstnum ; 
int secondnum ;
int answer ;
String numberString = "";
int correctAnswers = 0 ;
int numQuestions = 10 ; 
PImage  myBackground ;
PImage myNewBackground ;
PImage pencilBackground ;
PImage eraserBackground ;
PImage scoreScreen ;
PImage openScreen ;
PFont Pencil ;

void setup() {
  size(466, 600) ;
  myBackground = loadImage("notebook.jpg") ;
  myNewBackground = loadImage("newnotebook.jpg") ;
  pencilBackground = loadImage("pencil.jpg") ;
  eraserBackground = loadImage("eraser.jpg") ;
  scoreScreen = loadImage("scorescreen.jpg") ;
  openScreen = loadImage("openscreen.jpg") ;
}

void draw() {
  background(100) ;

  switch(myState) {
  case 0:
    image(openScreen, 0, 0);
    break ;


  case 1:
    //calculating the numbers
    firstnum= int(random(10));
    secondnum= int(random(15));
    answer= firstnum + secondnum ;
    myState = 2 ;
    break ;

  case 2:
    //playing the game
    image(myNewBackground, 0 , 0) ;
    fill(#000000);
    Pencil = createFont("RockSalt.ttf", 30) ;
    textFont(Pencil, 20) ;
    text("Please enter a number!", 100, 100) ; 
    textFont(Pencil, 30) ;
    text("+", 130, 220) ;
    text("____________", 130, 300) ;
    textFont(Pencil, 80) ;
    fill(#FF0000) ;
    text(numberString, 180, 415) ;  
    // text("the answer is:" + answer, 100, 300) ;
    textFont(Pencil, 60) ;
    fill(#000000) ;
    text(firstnum, 200, 175) ;
    text(secondnum, 190, 275) ;
    break ;

  case 3:
    //play again
    image(eraserBackground, 0 , 0) ;
    textFont(Pencil, 80) ;
    text("oops,", 130, 200) ;
    textFont(Pencil, 50) ;
    text("try again!", 100, 270) ;
    textFont(Pencil, 15) ;
    text("hit enter", 190, 520) ;
    text("to continue", 190, 540) ;
    break ;

  case 4:
    textFont(Pencil, 80) ;
    image(pencilBackground, 0 , 0) ;
    text("good", 115, 180) ;
    text("work!", 105, 255) ;
    textFont(Pencil, 15) ;
    text("hit enter", 190, 510) ;
    text("to continue", 190, 530) ;
    break ;

  case 5:  // score screen
    image(scoreScreen, 0 , 0) ;
    textFont(Pencil, 60) ;
    fill(#FF0000) ;
    text(+correctAnswers+"", 200, 270) ;
    numQuestions = 0 ;
    break ;
  }
}

void mousePressed() {
  // myState = (myState + 1) % 3 ;

  if (myState == 0) { 
    myState = 1 ;
  }

  if ((myState == 3) || (myState == 4)) {
    myState = 1 ;
  }
  
  if (myState == 5) {
    myState = 0 ;
    numQuestions = 10;
  }
  
}

void keyPressed() {
  if (myState == 2) {

    // this builds a variable called "numberString" - only adds numbers to it
    if ((key >= '0') && (key <= '9')) { 
      numberString = numberString+key ;
    }

if ((keyCode == BACKSPACE) || (keyCode == DELETE)) {
  numberString = numberString.substring(0, numberString.length()-1) ;
}
    // if the person hits ENTER or RETURN, we can check the answer

    if ((keyCode == ENTER) || (keyCode == RETURN)) { 

      println("The nunber "+ numberString + " was entered.") ; // debugging purposes


      numQuestions-- ;  // we started with 10 questions

      // check here to see if numberString = your correct answer
      if (parseInt(numberString) == answer) {  // probably have to change "myAnswer" variable name
        println("you got it right!") ;
        correctAnswers++ ; 
        // here you might have myState = 4 ; set the state to the "winning" state
        myState = 4 ;
      } else {
        println("oops - try again") ;
        // here would be myState = 5, or the "try again" state
        myState = 3 ;
      }


      numberString = "" ; // clear the numberString
    }
  } else {
    if ((keyCode == ENTER) || (keyCode == RETURN)) { 
      if (numQuestions>0) {
        myState = 1 ;
      } else {
        myState = 5 ;
      }
    }
  }
}



