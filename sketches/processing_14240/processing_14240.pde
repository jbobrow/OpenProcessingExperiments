
void setup() {
  size(500,500);
  //This has been enlarged to show that it is possible to move the monster around on the screen and enlarge its size
  background(0);
  smooth();
}  
void draw() {
  drawMonster(2,4,90,20); //These values can of course be changed but are just an example to show that everything works properly
  //This calls the function which draws the figure. The variables which can be changed
  //are s (size*[value]), c (color*[value], x (x-Axis of figure(s)+[value]), y(y-Axis of figure(s)+[value])
}
void drawMonster(int s, int c, int x, int y)
   //All variables are defined above and the function with these variables is stored in "drawMonster"
{  //A loop begins here. Everything that has changed is redrawn with each pass.
  int z=0;
  //Variable x is defined and set to 0. It will be used later. In pass 2 and up,
  //this is used to set x back to 0.
  background(0);
  //This redraws the background so that there is no "shadow" of older shapes.
  if (mousePressed) {
   z=20;
  } 
  //A conditional branch was created. If the mouse is pressed, something using x
  //as a component can change now. X is set back to 0 each pass (see above) in
  //order to only change the object while the mouse is pressed.
  stroke(200,24,7);
  fill(c*(200+mouseX),c*(78+mouseY),c*3);
  //The mouse axes added to a color mixture make the color change when the
  //mouse is moved horizontally and vertically (Y and X)
  rect((200/3+x)*s,(50/3+y)*s,100/3*s,100/3*s);
  //Here the program begins to draw the creature.
  ellipseMode(CENTER);
  //This means that the coordinates given are to be in the center of the figure
  fill(c*(200-10*z),c*(40-2*z),c*(90+5.5*z),(150+(5.25*z-1))); 
  ellipse((200/3+x)*s,(60/3+y)*s,60/3*s,80/3*s);
  ellipse((300/3+x)*s,(60/3+y)*s,60/3*s,80/3*s);
  fill(0*c,150*c);
  ellipse((235/3+x)*s,(95/3+y)*s,s*(20/3+z/5),s*(20/3+(mouseX/10)-z));
  ellipse((265/3+x)*s,(95/3+y)*s,s*(20/3+z/5),s*(20/3+(mouseX/10)-z));
  fill(200*c,24*c,(7+mouseX)*c);
  line((225/3+x)*s,s*(y+(125/3-mouseY/70)),((275/3)+x)*s,s*(y+(125/3-mouseY/70)));
  line((225/3+x)*s,s*(y+(130/3+mouseY/70)),((275/3)+x)*s,s*(y+(130/3+mouseY/70))); 
  line((225/3+x)*s,s*(y+(135/3-mouseY/70)),((275/3)+x)*s,s*(y+(135/3-mouseY/70)));
  line((225/3+x)*s,s*(y+(140/3+mouseY/70)),((275/3)+x)*s,s*(y+(140/3+mouseY/70)));
  //In all these figure drawing commands, adding the mouse position changes the
  //resulting figure
  ellipseMode(CORNERS);
  //The coordinates given are to be at the (right) corner of the figure
  ellipse((450/3+x)*s,(150/3+y)*s,(50/3+x)*s,(400/3+y)*s);
  fill(0*c,0*c,75*c);
  triangle((150/3+x)*s,(300/3+y)*s,((50/3)+x)*s,s*(y+((400/3+mouseY/5))),(200/3+x)*s,s*(y+(400/3+mouseY/5)));
  triangle((350/3+x)*s,(300/3+y)*s,((300/3)+x)*s,s*(y+((500/3-mouseY/5))),(450/3+x)*s,s*(y+(500/3-mouseY/5)));
  //The fact that the triangles end at different coordinates and that the mouse
  //axis value is subtracted from one and added to the other creates the effect
  //of figures moving opposite to one another while moving the mouse along the Y
  //axis
}

