
float lines[]=new float [250]; //new array with 250 values



void setup () {
  size(250,250);
  background (0);
}

void draw() {
  //draw a rectangle of alpha 1 every cycle, in order to create ghosting
  noStroke();
  fill(0,0,0,1);
  rect(0,0,width,height);
  //declare temp integer i, increment it by 10 until it reaches 250
  for (int i=0;i<250;i+=10) {
    lines[i]=i;
    //using the integer for the stroke gives a nice gradient
    stroke(lines[i]);
    strokeWeight(1);
    //drawing a line at each i produces a series of vertical lines
    line(lines[i],250,lines[i],0);
    //if the X value for the mouse is the same as a line's x value,
    //generate a point where the mouse is
    if (mouseX==lines[i]) {
      strokeWeight(7);
      //using the i for the alpha matches the dot's intensity to the grid's
      //gradient
      stroke(255,0,0,lines[i]);
      point(mouseX,mouseY);
    }
  }
  
  //declare i again, generate the same values (1-250 in increments of 10)
  for (int i=0;i<250;i+=10) {
    lines[i]=i;
    //using the integer for the stroke gives a nice gradient
    stroke(lines[i]);
    strokeWeight(1);
    //reverse the x and y from before draws a series of horizontal lines
    //combined with the verticals, we now have a grid!
    line(0,lines[i],250,lines[i]);
   //if the Y value for the mouse is the same as a line's y value,
   //generate a point where the mouse is
    if (mouseY==lines[i]) {
      strokeWeight(7);
      //using the i for the alpha matches the dot's intensity to the grid's
      //gradient
      stroke(255,0,0,lines[i]);
      point(mouseX,mouseY);
    }
  }
}


