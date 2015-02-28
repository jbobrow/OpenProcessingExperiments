
//this file includes - function with 'else' (argument), mouse interaction

void setup() {//setting up the canvas 
  //(); - submitting information
  // (//) - permits easy ways of turning code on/off
  // /* */ - areas enslosed are turned off via commenting
  size(640,320);//size(width,height)in pixels
  background(170);//background color fill 0-black,255-white,(R,B,G) 
  //colorMode(HSB); //changes the existing RGB setup to HSB
  //smooth(); //ups the refresh rate or performs something simliar
}

void draw() {

  //(){} creating functions
  background(200,50);//redrawing background
  if (mousePressed) {//command to be actioned when mouse is pressed
    stroke(0,225);//color of the stroke
    float weight = dist(mouseX, mouseY, pmouseX, pmouseY); //this float uses the distance (dist) command to generate the line width in accordance to movement of XY co-ordinates
    strokeWeight(weight);//stroke weight defines how many pixels are displayed to represent a line
    line(mouseX,mouseY, pmouseX, pmouseY);
  }
  else {
    stroke(255,225);
    float weight = dist(mouseX, mouseY, pmouseX, pmouseY);
    strokeWeight(weight);
    line(mouseX, mouseY, pmouseX, pmouseY);
    smooth();
  }
}


