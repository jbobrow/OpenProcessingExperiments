
//Final Project Happy Holidays!

/*
Description
  For the 3rd assignment I decided to make the process watermarbling on screan.
  It seems that the shadow follows your mouse movements.
  Everytime the mouse is pressed the circles of color appear on the surface.
  Using 1, 2, 3 keys you can switch colors.
  Using backspace or delete you can remove your current coloring.
  And key "s" will save the work.

HowTo
  MOUSE
   position x and y : location of the circle
   press : draw mupltiple circles
  KEYS
   1-3 : stroke color
   del or backspace : erase
   s or S : save
*/

// declaring a PImage variable
PImage background;

//global variable
color strokeColor = color(20, 90, 90, 70);
color strokeFill = color(20, 90, 90, 10);

// loading the image
void setup() {
 size(1050,697);
 background = loadImage("background.jpg");
 colorMode(HSB, 100, 100, 100, 100);
 image(background, 0, 0); 
}

void draw() {
 
 stroke(strokeColor);
 fill(strokeFill);
 strokeWeight(2);
 if (mousePressed){
  for(int z = mouseX/20+mouseY/20; z<300; z+=50){
   ellipse(mouseX, mouseY, z, z);
  }
 } 
}

//key used
void keyPressed() {
 if(key==DELETE || key == BACKSPACE) image(background, 0, 0);
 if(key=='s' || key=='S') saveFrame("happyholidays.png"); 
 
 switch(key){
   case '1':
   strokeColor = color(40, 60, 90, 70);
   strokeFill = color(40, 60, 90, 10);
   break;
   case '2':
   strokeColor = color(50, 70, 90, 70);
   strokeFill = color(50, 70, 90, 10);
   break;
   case '3':
   strokeColor = color(30, 60, 90, 70);
   strokeFill = color(30, 60, 90, 10);
   break;
  }
 }

