
PFont fontErase;
PFont fontCant;
PImage eraser;
int counter;
float alphaState=1;




void setup() {

  size(600, 600);
  background(255);
  frameRate(10);
  fontErase= loadFont("Futura-Medium-48.vlw");
  fontCant= loadFont("OratorStd-80.vlw");
  fill(0);
  rect(0, height/2, width, height/2);
}


void draw() {

  //  background(255);

  //top half font and image
  fill(0);
  textFont(fontErase);
  text("erase me", width/3, height/4);
  PImage eraser= loadImage("eraser.gif");
  image(eraser, counter, 15);
  counter++;
  if (counter>width) {
    counter=counter+(-counter);
  }



  //when the mouse is in the top half, the black rec should fade

  if (mouseY<=height/2 && mouseX>0 && mouseX<width) {
    fill(255, 255, 255, alphaState=alphaState+.3);
    noStroke();
    rect(0, height/2, width, height/2);
    fill (255, 0, 0,alphaState=alphaState+.5);
    textFont(fontCant);
    text("YOU CAN'T", width/6, 3*height/4);
    println(alphaState);
  }

  //when the mouse is in the bottom half, the black rec should stop fading
  if (mouseY>height/2) {
    alphaState--;
  }
}


