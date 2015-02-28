
//dawing a desired pattern with shapes determined by speed of moving mouse.
//I also like it as it can look like a tornado or some whole leading somewhere. 
/*
MOUSE
mousex:size of pattern
mousey:thickness of pattern
drag:draw

keys
del,backspace:erase
s:save png
q:exit 
*/

//Global variables
//declare a PImage variable type
PImage sunnyday;
color strokeColor = color(153,71,0);

//setup
void setup() {
 size(1024,640);
 loop();
 sunnyday = loadImage("sunnyday.jpg"); 
 //fill canvas with image
 background(sunnyday);
 colorMode(HSB,0,153,70);
 //style
 stroke(strokeColor);
 //set strokeWeight ranm
 strokeWeight(random(0,3)); 
 fill(250,200,200);
}
//to only start pattern when mouse is clicked
void mousePressed() {
  loop();
}

//draw
void draw() {
 //call the variableEllpse()
variableEllipse(mouseX,mouseY,100,100);
}
//begin shape
void variableEllipse(int x, int y,int py,int px) {
  float speed = abs (x-px) + abs(y-py);
  stroke(speed);
  ellipse(x,y,speed,speed);
}

//keyPressed()
void keyPressed() {
 if (key == DELETE || key == BACKSPACE) background(sunnyday);
 if (key == 's' || key == 'S') saveFrame("speed.png");
 if (key == 'q') exit();
 noLoop();
 
}




