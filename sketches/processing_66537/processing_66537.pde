
PFont fontErase;
PFont fontCant;
boolean mouseOnTop;
PImage eraser;
int colorCounter;
int counter;


void setup() {

  size(600, 600);
  background(255);
  frameRate(40);
  fontErase= loadFont("Futura-Medium-48.vlw");
  fontCant= loadFont("OratorStd-80.vlw");
  fill(0);
  textFont(fontErase);
  text("erase me", width/3, height/4);
  
  fill(0);
  rect(0, height/2, width, height/2);
}


void draw() {


  PImage eraser= loadImage("eraser.gif");
  image(eraser, counter, 15);
  counter++;

  if (counter>width) {
    counter=counter+(-counter);
  }


  //when the mouse is in the top half, the black rec should fade
  if (mouseY <= height/2) {
    fill(0+colorCounter);
    rect(0, height/2, width, height/2);
    fill(0);
    textFont(fontCant);
    text("YOU CAN'T", width/6, 3*height/4);
    colorCounter=+5;
    println(colorCounter);
  }

  //when the mouse is in the bottom half, the black rec should stop fading
  if (mouseY>height/2) {
    colorCounter=0;
    println("Stop");    
    println(colorCounter);
  }
}


