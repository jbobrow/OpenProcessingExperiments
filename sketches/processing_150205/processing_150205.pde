
/*
 * Creative Coding
 * Week 1, 02 - Draw your name! (part 2)
 * by Indae Hwang and Jon McCormack
 * Copyright (c) 2014 Monash University
 
 * This program allows you to draw using the mouse.
 * Press 's' to save your drawing as an image.
 * Press 'r' to erase your drawing and start with a blank screen
 * 
 */

// variables for the angle (in radians) and increment 
float angle;
float inc;
int red, blue, green;
boolean pressed, invert=false;
boolean destroyed=true;
PGraphics pg, pf;

void setup() {
  size(500, 500);
  background(0);
  smooth();
  strokeWeight(.05);
  pg=createGraphics(width, height);
  pg.beginDraw();
  pg.endDraw();
  pf=createGraphics(width, height);
  pf.beginDraw();
  pf.endDraw();
  frameRate(200);
  rectMode(CENTER);  // rectangles drawn from the centre

  // initialise angle and inc to 0
  angle = 0;
  inc = 0;
}


void draw() {
  background(0);
  /* draw a rectangle at your mouse point while you are pressing 
   the left mouse button */
  // map the mouse x position to the range (0.01, 0.08)
  inc = map(mouseX, 0, width, 0.01, .08);

  red=105+mouseY%150;//255-int(map(mouseY%50,0,50,0,150));
  blue=155+mouseX%100;//255-int(map(mouseX%30,0,30,0,50));
  green=200+mouseY%50;  

  if (mousePressed) {

    // incremment the current angle
    angle = angle + inc;
    pg.beginDraw();
    pg.smooth();
    pg.noStroke();
    pg.fill(lerpColor(color(255, 0, 0), color(255, 100, 0), abs(sin((float) frameCount/80))), 5+abs(155*cos((float) frameCount/60)));
    //fill(0xFFFF8800);
    pg.ellipse(mouseX, mouseY, 5+15*abs(cos((float) frameCount/60)), 5+15*abs(cos((float) frameCount/60)));
    //line(mouseX, mouseY, pmouseX, pmouseY); // pmouse is the mouse position at the previous frame
    pg.endDraw();



    // oscillate the radius over time
    float radius = 50 * abs( sin(frameCount) );

    float first_tempX  = mouseX + radius * cos( angle);
    float first_tempY  = mouseY + radius * sin( angle);
    float second_tempX = mouseX + radius * cos(-angle);
    float second_tempY = mouseY + radius * sin(-angle);

    // draw some lines and circles using transparency

    pf.beginDraw();
    pf.smooth();
    pf.noStroke();
    pf.fill(red, green, blue, 20);
    pf.line(mouseX, mouseY, first_tempX, first_tempY);
    pf.line(mouseX, mouseY, second_tempX, second_tempY);

    //noFill();
    float temp_w = random(3);

    pf.ellipse(first_tempX, first_tempY, radius * sin( angle), radius * sin( angle));//temp_w, temp_w);
    pf.ellipse(second_tempX, second_tempY, radius * cos( angle), radius * cos( angle));//temp_w, temp_w);
    pf.endDraw();
  }
  if (invert) {
    image(pg, 0, 0);
    image(pf, 0, 0);
  } else {
    image(pf, 0, 0);
    image(pg, 0, 0);
  }


  // save your drawing when you press keyboard 's'
  if (keyPressed == true && key == 's') {
    saveFrame("yourName.jpg");
  }

  // erase your drawing when you press keyboard 'r'
  if (keyPressed == true && key == 'r') {
    setup();
  }
  if (keyPressed == true && key == 'i') {
    invert=!invert;
  }
}



