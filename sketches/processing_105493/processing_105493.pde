
//image
PImage myImg;
//font
PFont myFont;
//declare the color variables
color c1 = color(255, 0, 0);
color c2 = color(255, 255, 0);
color c3 = color(0, 0, 225);
color c4 = color(0);
color myPaint = (c2);


//This will be the width of the buttons
int buttonW = 100;
int buttonH = 50;

void setup(){
  size(500,500);
  myImg = loadImage("myImg.jpg"); //load the image in the setup section
  image (myImg, 0, 0);
  frameRate (200);
 myFont = loadFont("AngsanaUPC-48.vlw");
  textAlign(CENTER);
  fill(0);
  textFont(myFont, 40);
  text("Color the owl.", 250, 475);
  text("Click a color to select your paint.", 250, 100);
  text("Erase", 450, 40);
}
 
void draw(){
 
  //drawing the buttons
  stroke(0);
  fill(c1);
  rect(0,0,buttonW,buttonH);
  fill(c2);
  rect(buttonW,0,buttonW,buttonH);
  fill(c3);
  rect(buttonW*2,0,buttonW,buttonH);
  fill(c4);
  rect(buttonW*3,0,buttonW,buttonH);
  noFill();
  rect(buttonW*4,0,buttonW,buttonH);


if(mousePressed == true) {
  noStroke();
  fill(myPaint);
  ellipse(mouseX,mouseY,5,5);  
  }
else{
  noFill();
  noStroke();
  }

//paint red
if((mouseX > 0 && mouseX < buttonW) && (mouseY > 0 && mouseY < buttonH)){
  myPaint=c1;
  }

//paint yellow
if((mouseX > buttonW && mouseX < buttonW*2) && (mouseY > 0 && mouseY < buttonH)){
  myPaint=c2;
  }
//paint blue
if((mouseX > buttonW*2 && mouseX < buttonW*3) && (mouseY > 0 && mouseY < buttonH)){
  myPaint=c3;
  }
//paint black
if((mouseX > buttonW*3 && mouseX < buttonW*4) && (mouseY > 0 && mouseY < buttonH)){
  myPaint=c4;
  }

//errase
//the background image, buttons, and text must be restored

//provides the condition to reset
if((mouseX > buttonW*4 && mouseX < buttonW*5) && (mouseY > 0 && mouseY < buttonH)){

  //reloads the image
  myImg = loadImage("myImg.jpg"); //load the image in the setup section
  image (myImg, 0, 0);
  
  //reload the text
  textAlign(CENTER);
  fill(0);
  textFont(myFont, 40);
  text("Color the owl.", 250, 475);
  text("Click a color to select your paint.", 250, 100);
  text("Erase", 450, 40);
  
  //reload the buttons
  stroke(0);
  fill(c1);
  rect(0,0,buttonW,buttonH);
  fill(c2);
  rect(buttonW,0,buttonW,buttonH);
  fill(c3);
  rect(buttonW*2,0,buttonW,buttonH);
  fill(c4);
  rect(buttonW*3,0,buttonW,buttonH);
  noFill();
  rect(buttonW*4,0,buttonW,buttonH);
  }
}




