
/*
 * Creative Coding
 * Week 2, Foldout 04: Basic Keyboard Interaction
 * by Indae Hwang and Jon McCormack
 * Copyright (c) 2014 Monash University
 *
 * Modified by Jason Prine on June 5, 2014 to add colour mixing functionality using key press:
 * q / w for + / - of R value
 * a / s for + / - of G value
 * z / x for + / - of B value
 *
 *
 * This sketch shows how to do interaction with the keyboard.
 * Try pressing, releasing, clicking and dragging the mouse and observe the results.
 * When each event happens the sketch also prints a message in the console.
 *
 */
 
float circleWidth;
float backgroundValueR;
float backgroundValueG;
float backgroundValueB;
 
void setup() {
  size(300, 300);
  circleWidth =   50;
  backgroundValueR = 0;
  backgroundValueG = 0;
  backgroundValueB = 0;
}
 
 
void draw() {
  background(backgroundValueR,backgroundValueG,backgroundValueB);
  noStroke();
  ellipse(150, 150, circleWidth, circleWidth);
   
  if (keyPressed) { ///colour mixer added by JP
    if (key == 'q') {
      backgroundValueR = backgroundValueR + 1;
    } else if (key == 'w') {
      backgroundValueR = backgroundValueR - 1;
    } else if (key == 'a') {
      backgroundValueG = backgroundValueG + 1;
    } else if (key == 's') {
      backgroundValueG = backgroundValueG - 1;
    } else if (key == 'z') {
      backgroundValueB = backgroundValueB + 1;
    } else if (key == 'x') {
      backgroundValueB = backgroundValueB - 1;
    }
     
    // ensure backgroundValue is constrianed between 0 and 255
    backgroundValueR = constrain(backgroundValueR,0,255);
    backgroundValueG = constrain(backgroundValueG,0,255);
    backgroundValueB = constrain(backgroundValueB,0,255);
    println (backgroundValueR,backgroundValueG,backgroundValueB); //debug print RGB value
  }
   
}
 
 
void keyPressed() {
  if (key == 'c') {
    circleWidth = 150;
  }
   
  println("pressed " + int(key) + " " + keyCode);
}  
 
void keyReleased() {
  if (key == 'c') {
    circleWidth = 50;
  }
   
  println("Released " + int(key) + " " + keyCode);
}

