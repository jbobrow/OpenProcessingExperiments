
PImage startbutton ; //variable for start button
PImage helpbutton ; //variable for help button
PImage kbutton ; //variable for k button
PImage jbutton ; //variable for j button
PImage rbutton ; //variable for r button
PImage backbutton ; //variable for back button
PImage titlep ; //variable for title image
int currentPage = 0 ; //Start page
boolean showHelpButton = false ; //shows help button
boolean clearBackground = true ; //clears background for game play
boolean highlight = false ; //highlights letter button
int highlightXpos = 0 ; //start value for highlight

void setup() {
  size(700, 700) ; //canvas size
  background(234, 102, 102) ; //set background color to salmon
  startbutton = loadImage("startbutton.png") ; //load picture for start button
  helpbutton = loadImage("helpbutton.png") ; //load picture for help button
  backbutton = loadImage("backbutton.png") ; //load picture for back button 
  kbutton = loadImage("k.jpg") ; //load picture for k button
  jbutton = loadImage("j.jpg") ; //load picture for j button
  rbutton = loadImage("r.jpg") ; //load picture for r button
  titlep = loadImage("title.png") ; //load pic for title
}

void draw() {
  
 
  if(currentPage == 0){ //if the current page is start
    background(234, 102, 102) ;
    if(highlight == true) { //if mouse is in hightlight area 
        fill(141, 143, 245) ; //...then make color periwinkle
        rect(highlightXpos, 395, 65, 65) ; //draw rectangle behind letter
  }
    showHelpButton = false ;
    drawStartButton() ; //start button 
    drawkbutton() ; //k button
    drawjbutton() ; //j button
    drawrbutton() ; //r button
    fill(143, 250, 91) ; //set background to white
    text("START BY CLICKING A SHAPE BELOW, THEN PRESS PLAY",200, 385) ; //text to select a letter 
    fill(255) ;
    drawtitlep() ; //title pic
    text("BY KAMRY ADAMS & JAYDE CHRISTOPHER", 235, 115) ; //draw authors names
    
  }

  else if (currentPage == 1){ //if current page is game play
    if(highlightXpos == 250) {
      drawR() ; //... then draw r shape
    }
    else if(highlightXpos == 323) {
      drawSquare() ; //...then draw the squares
    }
    else if(highlightXpos == 400) {
      drawCircle() ; //...then draw the circle
    }
      drawbackbutton() ; //then draw the back button
      showHelpButton = true ; //show the help button
    if(clearBackground == true) { //if clearbackground function is true
       background(100, 300) ; //...then set the background to grey
       clearBackground = false ; //clear background
     }
  }

  else if (currentPage == 2){ //if the current page is help page
    background(208, 231, 240) ; //set background to peach
    drawbackbutton() ; //then draw the back button 
    fill(255) ; //set text color to white
    text("INFINITEALPHA:", 300, 200) ; //write the app name
    fill(0) ; //set text color to black
    text("THE OBJECTIVE OF THIS APP IS TO SIMPLY EXPERIENCE SOMETHING UNIQUE", 150, 255) ; //write 
    fill(80, 175, 168) ; //set text color to teal 
    text("HERE'S HOW:", 300, 290) ; //write second line of code 
    fill(0) ; //set text color to black 
    text("1.) SELECT THE LETTER YOU WANT TO DRAW BY CLICKING WITH YOUR MOUSE", 150, 325) ; //write third line of code
    text("2.) PRESS THE PLAY BUTTON TO BEGIN", 150, 350) ; //write fourth line of code
    text("3.) DRAW AWAY!", 150, 375) ; //write fifth line of code
    text("4.) IF YOU WANT TO START OVER, SIMPLY CLICK THE BACK BUTTON", 150, 400) ; //write sixth line of code
    
  showHelpButton = false ; //show help button = false
  }
  
  if(showHelpButton == true) { //show help button
    drawHelpButton() ;
  }
}

void drawtitlep() { //draw title pic
  image(titlep, 55, 500) ;
}

void drawStartButton() { //draw start button
  image(startbutton, 225, 115) ;
}

void drawrbutton() { //draw r button
  image(rbutton, 257, 401) ;
}

void drawkbutton() { //draw k button
  image(kbutton, 330, 401) ;
}

void drawjbutton() { // draw j button 
  image(jbutton, 405, 401) ;
}

void drawbackbutton() { //drawbackbutton
  image(backbutton, 500, 0) ;
}

void drawR() { //draw R

int stroke1; //draw letter
int stroke2; //draw letter
int stroke3; //draw letter
int x; //draw letter
int y; //draw letter
int colour; //draw letter
int colour1; //draw letter
int colour2; //draw letter
 
x= 100; //draw letter
y= 100; //draw letter
colour=int(random(0,255)); //draw letter color
colour1=int(random(0,255)); //draw letter color
colour2=int(random(0,255)); //draw letter color
stroke1 = 50; //draw letter
stroke2 = 100; //draw letter
 
fill(colour, colour1, colour2, 200); //draw letter color
rect(mouseX-25, mouseY, 225, stroke1,0, 100, 0, 0); //draw letter shape
 
fill(colour, colour1, colour2, 200); //draw letter color
rect(mouseX, mouseY+100, 200, stroke1,0, 0, 100, 0); //draw letter shape
 
fill(colour, colour1, colour2, 200); //draw letter color
rect(mouseX-25, mouseY+200, 100, stroke1,0, 0, 0, 0); //draw letter shape
 
fill(colour, colour1, colour2, 200); //draw letter color
rect(mouseX+150, mouseY+200, 75, stroke1,0, 0, 0, 0); //draw letter shape
 
fill(colour, colour1, colour2, 200); //draw letter color
rect(mouseX, mouseY+50, 50, stroke1,0, 0, 0, 0); //draw letter shape
 
fill(colour, colour1, colour2, 200); //draw letter color
rect(mouseX, mouseY+150, 50, stroke1,0, 0, 0, 0); //draw letter shape
 
fill(colour, colour1, colour2, 200); //draw letter color
rect(mouseX+150, mouseY+150, 50, stroke1,0, 100, 0, 0); //draw letter shape
// last four = how rounded the corners are
// x pos, y pos, width, height, roundness, roundness, roundness, roundness
 
fill(colour, colour1, colour2, 200); //draw letter color
rect(mouseX+150, mouseY+50, 50, stroke1,0, 0, 0, 0); //draw letter shape
}

void drawSquare() { //draw square

int colour; //draw circle color
int colour1; //draw circle color
int colour2; //draw circle color

colour=int(random(0,255)); //draw color
colour1=int(random(0,255)); //draw color
colour2=int(random(0,255)); //draw color

fill(colour, colour1, colour2, 200) ; //circle color
rect(mouseX, mouseY, 150, 150, 10, 10, 10, 10) ; //circle shape
}

void drawCircle() { // draw circle

  int colour; //draw circle color
  int colour1; //draw circle color
  int colour2; //draw circle color

  colour=int(random(0,255)); //draw color
  colour1=int(random(0,255)); //draw color
  colour2=int(random(0,255)); //draw color

  fill(colour, colour1, colour2, 200) ; //circle color
  ellipse(mouseX, mouseY, 300, 300) ; //circle shape
}

void drawHelpButton() { //HelpButton
  image(helpbutton, 500, 500) ; //location of image
  fill(60) ; //set text color to grey 
  text("NEED HELP? CLICK HERE!", 525, 540) ; //write text 
  
}

void mousePressed(){ //location of start button 
  if(currentPage == 0 && mouseX > 150 && mouseX < 405 && mouseY > 150 && mouseY < 405){
      currentPage = 1 ; //go to game play page
      clearBackground = true ; 
  }
  
  else if(currentPage == 0 && mouseX > 257 && mouseX < 310 & mouseY > 401 && mouseY < 455) { //location of R button 
    highlightXpos = 250 ; //higlight letter button
    highlight = true ;
  }
  
  else if(currentPage == 0 && mouseX > 330 && mouseX < 383 & mouseY > 401 && mouseY < 455) { //location of square button 
    highlightXpos = 323 ; //higlight letter button
    highlight = true ;
  }
   
   else if(currentPage == 0 && mouseX > 405 && mouseX < 458 & mouseY > 401 && mouseY < 455) { //location of circle button 
    highlightXpos = 400 ; //higlight letter button
    highlight = true ;
  }
  
  else if(currentPage == 1 && mouseX > 500 && mouseX < 719 & mouseY > 500 && mouseY < 723) { //location of help button
    currentPage = 2 ; //go to help page
 }
 
 else if (currentPage == 2 && mouseX > 500 && mouseX < 700 & mouseY > 0 && mouseY < 57) { //location of back button 
    //xpos, xpos + 1st dimension, y pos, y pos + 2nd dimenison
    currentPage = 1 ; //go back to draw page
    clearBackground = true ; 
 }
 
 else if (currentPage == 1 && mouseX > 500 && mouseX < 700 & mouseY > 0 && mouseY < 57) { //location of back button 
    currentPage = 0 ; //go back to start 
 }

}

