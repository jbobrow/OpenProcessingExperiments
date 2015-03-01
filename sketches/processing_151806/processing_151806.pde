
/*
 * Creative Coding
 * Week 3, 02 - array with sin()
 * by Indae Hwang and Jon McCormack
 * Copyright (c) 2014 Monash University
 *
 * This program demonstrates the use of arrays.
 * It creates three arrays that store the y-position, speed and phase of some oscillating circles.
 * You can change the number of circles by changing the value of num in setup()
 * You can change the background colour by holding the left mouse button and dragging.
 * 
 */

int     num;    // the number of items in the array (# of circles)

float[] y;      // y-position of each circle (fixed)
float[] speed;  // speed of each circle
float[] phase;  // phase of each circle
int ballSize = 40;
boolean clicked = false;

float red = 120;
float green = 120;
float blue = 120;

PFont f;                      // Declare PFont for text

void setup() {
  size(500, 500);

  num = 5;

  // allocate space for each array
  y = new float[num];
  speed = new float[num];
  phase = new float[num]; 

  // calculate the gap in y based on the number of circles
  float gap = height / (num + 1);

  //setup an initial value for each item in the array
  for (int i=0; i<num; i++) {
    y[i] = gap * (i + 1);      // y is constant for each so can be calculated once
    speed[i] = random(10);
    phase[i] = random(TWO_PI);
  }     // end of 'for' loop
}       // end of setup

/* 
Can you modify this sketch so that if you click on a circle that circle stops and if you 
click on it again, it restarts with a new random speed and phase? 
Some hints: you’ll need to use the void mouseClicked() function. 
Use dist() to check if your mouse position is within each circle’s radius and if so, 
set that circle’s speed to 0.
*/

void mouseClicked(){
    // check every circle
    clicked = true;
    for (int i=0; i<num; i++) {
        if(mouseY <= y[i] + ballSize/2 && mouseY >= y[i] - ballSize/2 && speed[i] == 0){
            speed[i]= random(10);
            phase[i] = random(TWO_PI);  // if phase is not changed, ball stops in same position
                                        // every time
            clicked = false;
        }   // end of 'speed[i] == 0' if  
      
        if(mouseY <= y[i] + ballSize/2 && mouseY >= y[i] - ballSize/2 && speed[i] > 0 && clicked == true){
            speed[i] = 0;
            clicked = false;
        }   // end of 'speed[i] > 0' if  
    }       // end of 'for' loop
}           // end of mouseClicked

void draw() {
    background(red, green, blue);
  
    f = createFont("Arial",16,true); // Create Font
    textFont(f,12);                  // font size
    text("Bouncing Ball Array W3.02 Creative Coding with FUTURE LEARN by Monash University",5,20);   // Display Text
    

    for (int i=0; i<num; i++) {
        // calculate the x-position of each ball based on the speed, phase and current frame
        float x = width/2 + sin(radians(frameCount*speed[i] ) + phase[i])* 200; // original code 
        ellipse(x, y[i], ballSize, ballSize);                                 
        text("i = " + i + "   y[i] = " + y[i] + "   Speed = " + speed[i] + "   Phase = " + phase[i],5,y[i] - 25);
        if(speed[i]<2){
            text("i = " + i + " sin(radians(frameCount*speed[i])+phase[i])*200 = " + int(sin(radians(frameCount*speed[i] ) + phase[i])* 200),5,y[i] + 30);
            text(" Phase = " + phase[i],350,y[i] + 30);
        }  //end of speed[i] if
    }   // end of 'for' loop
    text("mouseX = " + mouseX + "    mouseY = " + mouseY + "     frameCount = " + frameCount,25,y[4] + 50);   // Display Text
}       // end of draw

// change the background colour if the mouse is dragged
void mouseDragged() {
  red = map(mouseX, 0, width, 0, 255);
  green = map(mouseY, 0, height, 0, 255);
  blue = map(mouseX+mouseY, 0, width+height, 255, 0);
}



