
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
  int r = int(random(10, 50)); //set a random size value that continually refreshes
// is w is pressed, draw this
  if (key == 'w') {
  stroke (255, 10);
  fill (random(250,255), random(10, 100), random(10, 150), 20); //set a random color
  rect (mouseX, mouseY, r, r); //use the mouse to draw with and use r variable to determine random size
  line (mouseX, mouseY, mouseX + random (50, 100), mouseY + random (10));
  fill (random(255), random(255), random(255));
  }

//when e is pressed, this will run
  if (key =='e') {
  fill (random(60,130),random(10,255),random(80,200),60);//use random values to change the color
  ellipse (mouseX, mouseY, radius2, radius2); //use variables to determine circle size
  fill (0,70); //creates a white circle
  ellipse (mouseX, mouseY, 5, 5); //use variables to determine circle size
  }
  
  //when e is pressed, this will run
  if (key =='r') {
fill (random(60,130),random(10,90),random(10,30),60);//use random values to change the color
ellipse (mouseX, mouseY, radius2, radius2); //use variables to determine circle size
fill (0,70); //creates a white circle
ellipse (mouseX, mouseY, 5, 5); //use variables to determine circle size
  }
  
//when c is pressed, you will erase everything
  if (key =='c') {
  noStroke();
  fill (0);
  rectMode(CENTER);
  rect (xwidth/2,ylength/2,xwidth,ylength);
  }

//if s is pressed, Save a frame
  if (key =='s') {
  saveFrame();

}
}


