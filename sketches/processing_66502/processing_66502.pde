
/*
Home Work Week 5
Create an animation and control it using if/else statements and mouse interaction. 
Use at least two fonts 
*/



PFont Font01;
PFont Font02;
int counter;

void setup() {

size(300,500);
noStroke();
frameRate(200);
smooth();



//create 2 fonts


Font01 = loadFont("NewPeninimMT-30.vlw");
Font02 = loadFont("SansSerif-16.vlw");

}


void draw() {
  
// If the mouse moves up more than half of Y position 
if(mouseY<height/2){
  
  // Background
  fill(255);
  rect(0, 0, width, height);
  
  
  
  
   //The ball (state 1) moving down
  fill(255,243,0);
  ellipse(150, counter, 50, 50);
  counter++;

  
  //Font 01 (tracking with mouse)
  fill(129,299,232);
  textFont(Font01);
  text(" DOWN",mouseX, mouseY);
  
  fill(129,299,232);  

  //Font 02 (How to use)
  textFont(Font02);
  fill(131,131,131);
  text ("YOU CAN MOVE YOUR MOUSE", 20, 50);
  text ("UP AND DOWN",20, 70);
  text ("TO CONTROL",20, 90);
  fill(255,243,0);
  text("THE YELLOW BALL",20,110);


  }

// If the mouse moves to the rest of Y position except top half. 

else{
  
  //The ball (state 2) moving up
  
  fill(255);
  rect(0, 0, width, height);
  
  //The ball (state 2) moving up
  fill(255,243,0);
  ellipse(150, counter, 50, 50);
  counter--;
  

  //Font 02 (tracking with mouse)
  fill(129,299,232);
  textFont(Font01);
  text("UP",mouseX, mouseY);
  
  textFont(Font02);
  fill(131,131,131);
  text ("YOU CAN MOVE YOUR MOUSE", 20, 50);
  text ("UP AND DOWN",20, 70);
  text ("TO CONTROL",20, 90);
  fill(255,243,0);
  text("THE YELLOW BALL",20,110);

  
  }
  
}


