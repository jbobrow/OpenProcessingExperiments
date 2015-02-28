
color ink = color (0,0,0); // ink variable
PImage startButton; //calls start button image
int currentpage = 0; // 0 represents the start of page
boolean showstartButton = true; //represents starttbutton function
boolean clear = true; // represents clear function
float re; // represents float function
int pensize = 25; //pensize changer variable

//allows the page variables to be set
void setup (){
  size(900,600); // Set canvas side
  background (237,227,232);// sett color to pink
  frameRate (1200); // aproximates the frame rate of the software
  startButton = loadImage ("startdrawing.png"); // load startdrawing image
}
  
 
  
 //allows 2 pages to be drawn
void draw (){
     if (currentpage ==0){ // Set current page to 0
   
    drawstartButton (); // draw startbutton
     fill(0); // Set color to black
    
     textSize(30);// Set text size
     text("By: Makedis & Tre'Von", 0, 30); // draw names
     noStroke (); // diables
     fill(255); // Set color to white
     re= random(50); // makes circles appear random 50 size
     ellipse(random(900), random(600), re, re);//insures that the circles appear in randdom places

     fill(245, 146, 146); // Set color to pinkish
     re= random(50); // sets the random pink circles at a size of 50
     ellipse(random(900), random(600), re, re); // Sets random circles
     


  }
    if (currentpage == 1) { // Set current page to 1
     drawpage2 (); // draw 2nd page
  }
    
}

//allows startbutton to be drawn
void drawstartButton () {
    image (startButton, 185,40); // Set start button location

}

//allows page 2 to be drawn
void drawpage2 (){
    
  if (clear == true ){ // allows the first page to clear
  background (255);// set color to white
  clear = false; // its a boolean function that determines when i need to clear the page
 
  }
  

  fill(0); // Set color to black
  rect(0,0,50,30); // Draw black color box
  fill(232,15,7);// Set color to Red
  rect (0,30,50,30); // Draw Red color box
  fill (237,255,0); // Set color to yellow
  rect (0, 60, 50,30);// Draw yellow box
  fill (103, 72,3); //Set color ro brown
  rect (0,90,50,30);// draw brown color box
  fill(237,99,7); // Set color to Orange
  rect(0,120,50,30); // Draw orange color box
  fill(7,12,237); // Set color to Blue
  rect(0,150,50,30);// Draw blue color box
  fill(30,164,245); // Set color to light blue
  rect(0,180,50,30);//Draw light blue color box
  fill(45,118,8); // Set color to Green
  rect(0,210,50,30); // Draw green color box
  fill(77,206,58); // Set colot to light green
  rect(0,240,50,30);// Draw light green color box
  fill(88,8,160);//Set color to Purple
  rect(0,270,50,30);// Draw purple color box
  fill(176,119,227); // Set color to light purple
  rect(0,300,50,30); // Draw light purple color box
  fill(255,49,111); // Set color to pink
  rect(0,330,50,30); // Draw pink color box
  fill(183,181,182); // Set color to gray
  rect(0,360,50,30); //Draw gray color 
  fill(255,255,255);// Set color to yellow
  rect(0,390,50,30);// Draw Eraser
  
  
  
  
  
  
  stroke (0); // set stroke to black
  fill (255); //set color to white
  rect (0,420,50,150); // draw box 

  fill(ink); // set colort o black
  ellipse(25, 430, 10, 10); // draw smallest pen size
  ellipse(25, 460, 20, 20); // draw medium pen size
  ellipse(25, 510, 50, 50); // Draw biggest pen size
 
}



//allows start button to be clicked


void mousePressed () {
  if (currentpage == 0 && mouseX > 170  && mouseX < 723 && mouseY > 200&& mouseY <389) {
   currentpage = 1; // sets curernt page to 1
  }
   
   if (mouseX > 25 && mouseX < 35 && mouseY > 430 && mouseY <440) {      //allows pen size to be small
     
     pensize = 10; // set pen size to 10
     
   }
   
   else if (mouseX > 25 && mouseX < 45 && mouseY > 460 && mouseY < 480){    //allows pen size to be medium
     
     pensize = 20; // set pensize to 20
     
   }
   
   
   else if (mouseX > 25 && mouseX <75 && mouseY >  510 && mouseY < 560){ //allows pensize to be big
     
     pensize = 50; // set pensize to 50
   }
   
 
   
       
}

//allows player to drag mouse
void mouseDragged(){
   
  fill (ink); // allows ink to work
  stroke(ink); // keeps brush color from having a black border
  if (mouseX > 30) { // if statement for smallest size
  ellipse(mouseX + 10,mouseY,pensize,pensize); // draws brush
  }
}

//allows player to click colors 
void mouseClicked(){
  
  if(mouseX <30){ // if statemnt for clicking color
    ink = get(mouseX,mouseY);// Allows color to be selected when clicked
  }
  if(mouseButton == RIGHT && mouseX < 30){ // allows the color and size to be selected
     
  }
}








