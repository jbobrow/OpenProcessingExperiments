
//for this exercise, I split the grid into the four quadrants.  
//moving the mouse into each of these quadrants will produce a different composition
//pressing the mouse will also create different compositions
//in all, there are 8 different compositions

void setup() {
  smooth();
  size(300, 300);
}

void draw() {

  background(0, 0, 255); //blue background

  //design one
  strokeWeight(4);
  stroke(255, 255, 0);//yellow
  fill(255, 0, 0);//red

  ellipse(75, 150, width/2, height/4);
  ellipse(225, 150, width/2, height/4);
  ellipse(150, 75, width/4, height/2);
  ellipse(150, 225, width/4, height/2);
  //large overlapping ellipses

  strokeWeight(1);
  stroke(0, 100, 10);
  fill(0, 150, 0); //dark green

  ellipse(50, 50, 50, 50);
  ellipse(250, 50, 50, 50);
  ellipse(50, 250, 50, 50);
  ellipse(250, 250, 50, 50);
  //small circles in each quadrant

  if (mouseX>=150) { //then

    stroke(255);
    fill(255);
    rect(150, 0, width/2, height/2);
    rect(0, 150, width/2, height/2);
    //this will effectively remove the top right and bottom left quadrants of the design
  }
  else {
    stroke(255);
    fill(255);
    rect(0, 0, width/2, height/2);
    rect(150, 150, width/2, height/2); 
    //this will effectively remove the top left and bottom right quadrants of the design
  }

  if (mouseY<=150) {//then

    //design one repeated
    strokeWeight(4);
    stroke(255, 255, 0);//yellow
    fill(255, 0, 0);//red

    ellipse(75, 150, width/2, height/4);
    ellipse(225, 150, width/2, height/4);
    ellipse(150, 75, width/4, height/2);
    ellipse(150, 225, width/4, height/2);
    //large overlapping ellipses

    strokeWeight(1);
    stroke(0, 100, 10);
    fill(0, 150, 0); //dark green

    ellipse(50, 50, 50, 50);
    ellipse(250, 50, 50, 50);
    ellipse(50, 250, 50, 50);
    ellipse(250, 250, 50, 50);
    //small circles in the corners

    //now when the mouse is at the top two quadrants, only the background changes
  }

  if (mousePressed) {//then

    //design two
    strokeWeight(4);
    stroke(255, 0, 0);//red
    fill(255, 255, 0);//yellow
    ellipse(150, 75, width/2, height/2);
    ellipse(150, 225, width/2, height/2);
    ellipse(75, 150, width/2, height/2);
    ellipse(225, 150, width/2, height/2);
    //this produces giant overlapping circles that cover the first composition.
  }
}


