
//these are called global variables, they apply to the whole program
//integers (whole number)
int radius = 20;
int radius2 = 10;
//use variables to determine size
int xwidth = 500;
int ylength = 500;
int x = xwidth/2;
int y= ylength/2;
void setup () {
size (xwidth, ylength);//call global variables to determine size
background (0);
smooth();
}
void draw () {
noStroke();
fill (0);
rectMode(CENTER);
}
//when w is pressed, this will run
void keyPressed () {
  if (key =='w') {
fill (random(190,255),random(30,60),random(20,180),90);//use random values to change the color
ellipse (mouseX, mouseY, radius, radius); //use variables to determine circle size
fill (0); //creates a white circle
ellipse (mouseX, mouseY, radius/2, radius/2); //use variables to determine circle size
  }

//when e is pressed, this will run
  if (key =='e') {
fill (random(60,130),random(10,90),random(80,255),90);//use random values to change the color
ellipse (mouseX, mouseY, radius2, radius2); //use variables to determine circle size
fill (0); //creates a white circle
ellipse (mouseX, mouseY, 5, 5); //use variables to determine circle size
  }

//if s is pressed, save a frame
if (key =='s') {
saveFrame();


}
}

