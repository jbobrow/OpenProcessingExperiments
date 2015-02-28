
boolean vector = false;

PImage mochi;
PImage button1;
PImage button2;
PImage button3;
PImage button4;
PShape mochi2;



void setup () {
  size (320, 480);
  mochi = loadImage("processingmochi.png");
  button1 = loadImage("greenbutton1.png");
  button2 = loadImage("redbutton.png");
  button3 = loadImage("yellowbutton.png");
  button4 = loadImage("maroonbutton.png");
  mochi2 = loadShape("mochishape.svg");
}

void draw() {
  smooth();
  if (vector == true) {
   
  image(mochi, 0, 0);
  image(button1, -27, -25);
  image(button4, -86, 45);
  image(button2, -45, 53);
  image(button3, -78, -15);
  
  
  } else {
    background(255);
    noFill();

//leg #2
 ellipse(175, 310, 37, 8);
 ellipse(175, 315, 37, 8);
 ellipse(175, 320, 37, 8);
 ellipse(175, 325, 37, 8);
 ellipse(175, 330, 37, 8);
 ellipse(175, 335, 37, 8);
 ellipse(175, 340, 37, 8);
    
    //leg #1
 ellipse(130, 295, 30, 8);
 ellipse(130, 300, 30, 8);
 ellipse(130, 305, 30, 8);
 ellipse(130, 310, 30, 8);
 ellipse(130, 315, 30, 8);
  shape(mochi2, 100, 150, 550, 700);
  }
}
  void keyPressed() {
  if (key == ' ') {
    if (vector == true) {
      vector = false; 
    } else {
      vector = true; 
    }
  }
}
  

