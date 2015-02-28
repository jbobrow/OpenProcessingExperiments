
//variables for button One Upper Left
int b1w = 300;    //button sizes
int b1h = 200;
int b1x = 5;
int b1y = 5;

//variables for button two Upper Right
int b2w = 300;    //button sizes
int b2h = 200;
int b2x = 300;
int b2y = 5;

//variables for button 3 Lower left
int b3w=300;
int b3h = 200;
int b3x =5;
int b3y= 200;


//variables for button 4 Upper right
int b4w=300;
int b4h=200;
int b4x=300;
int b4y=200;

//variable for "next" button to appear
boolean next = false;

//variables for buttons
boolean bOver = false;
boolean locked=false;

//variables for NEXT BUTTON
int bNx = 300;
int bNy = 200;
int bNw = 150;
int bNh = 75;


//set the starting page to page 1, this controls the button response
int choice;

//images
PImage img1;
PImage img2;
PImage img3;
PImage img4;
PImage img5;
PImage img6;
PImage img7;

//Font
PFont font;
PFont fontNext;

// Initial set up runs only once
void setup(){
  size(600, 400);
 // background(225);
  choice = 1;
  img1 = loadImage("Colors_01.png");
  img2 = loadImage("Incorrect_01.png");
  img3 = loadImage("Correct_Red.png");
  img4 = loadImage("Colors_02.png");
  img5 = loadImage("Correct_Purple.png");
  img6 = loadImage("Colors_04.png");
  img7 = loadImage("Correct_Yellow.png");
  image(img1, 0, 0);
  font = loadFont("ACaslonPro-Italic-72.vlw");
  fontNext = loadFont("ACaslonPro-Italic-36.vlw");
  textFont(font);
  fill(0);
  
}

// logic for going to a page function based on value of the variable "page"
 
void draw (){
 choiceOne();
 if (next == true){
   textFont(fontNext);
   text("NEXT", 300, 200);
   textFont(font);
   nextTest();
 }
 //contine to add these "choice" as you add tests. This keeps the pages displayed once you move off of the hot spot
 if(choice == 1){
   choiceOne();
 } else if (choice == 2){
   choiceTwo();
 } else if (choice == 3){
   choiceThree();
 } 
}


  boolean overButton(int x, int y, int w, int h){
  if (mouseX > x && mouseX < x+w && mouseY > y && mouseY < y+h){
    return true;
  }
  else{
    return false;
  }
}

void mousePressed() {
 if (overButton (bNx, bNy, bNw, bNh) == true){
   choice =2;
 }
  }
  
  void mouseReleased(){
  locked = false;
}

void nextTest(){
  if (overButton(bNx, bNy, bNw, bNh) && (mousePressed)==true){
    choiceTwo();
   }
  if (overButton(bNx, bNy, bNw, bNh) && (mousePressed)==true){
    choiceThree();
  }
}
 
//all the code for choice 1: 
 
void choiceOne () {
   image(img1, 0, 0);
   text("Rouge", 207, 220);
   if(overButton(b1x, b1y, b1w, b1h) && (mousePressed) == true){
image(img2, 0, 0);
//you could also add "sorry, try again text here" - just load globally at top of program
   }
   if(overButton(b2x, b2y, b2w, b2h) && (mousePressed) == true){
     image(img2, 0, 0);
   }
   if(overButton(b3x, b3y, b3w, b3h) && (mousePressed) == true){
     image(img2, 0, 0);
   }
   if(overButton(b4x, b4y, b4w, b4h) && (mousePressed) == true){
     image(img3, 0, 0);
     text("Rouge", 207, 220);
     next = true;
   }
}

   
   
 
//Here you can put another button to get to next text, then just copy syntax from "choiceOne"
 
void choiceTwo () {
   image(img4, 0, 0);
   text("Violet", 207, 220);
   if(overButton(b1x, b1y, b1w, b1h) && (mousePressed) == true){
    image(img2, 0, 0);
   }
   if(overButton(b2x, b2y, b2w, b2h) && (mousePressed) == true){
     image(img2, 0, 0);
   }
   if(overButton(b3x, b3y, b3w, b3h) && (mousePressed) == true){
     image(img5, 0, 0);
   }
   if(overButton(b4x, b4y, b4w, b4h) && (mousePressed) == true){
     image(img2, 0, 0);
     text("Violet", 207, 220);
     next = true;
   }
}

//Next choice 3

void choiceThree () {
   image(img6, 0, 0);
   text("Jaune", 207, 220);
   if(overButton(b1x, b1y, b1w, b1h) && (mousePressed) == true){
      image(img2, 0, 0);
   }
   if(overButton(b2x, b2y, b2w, b2h) && (mousePressed) == true){
     image(img2, 0, 0);
   }
   if(overButton(b3x, b3y, b3w, b3h) && (mousePressed) == true){
     image(img2, 0, 0);
   }
   if(overButton(b4x, b4y, b4w, b4h) && (mousePressed) == true){
     image(img7, 0, 0);
     text("Jaune", 207, 220);
     next = true;
   }
}



