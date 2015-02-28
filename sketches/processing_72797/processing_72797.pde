
//Alex Zajicek, Art Program 1, Hw #3

int myVar;
int x;
int myVar2;
int x2;
int speed;

void setup(){
  size(800, 600);
  background(255);
  colorMode(HSB, 360, 100, 100, 100);
  smooth();
  myVar = 1;
  x = 1;
  myVar2 = 100;
  x2 = 3;
}

//  ellipse(pmouseX, pmouseY, pmouseX, pmouseY); //fun effect

void draw(){
  //background(255);
  speed = abs(pmouseX-mouseX);
  if (mousePressed){
    myVar = myVar+x;
  }
  if (mousePressed){ //number goes up as mouse clicked, else resets
    myVar2 = myVar2-x2;
  } else {
    myVar2 = 100;
  }
  strokeWeight (10);
  fill(myVar, 80, 70, myVar2); //only used for ellipse, which I commented out
  stroke(myVar, 80, 70, myVar2); //use for line
  strokeWeight(20);
  //noStroke(); //use for ellpise
  if (mousePressed){
    //ellipse(mouseX, mouseY, 20, 20);
    line(pmouseX, pmouseY, mouseX, mouseY);
  }
  if (myVar >= 255) { //color starts going backwards
    x = -1;
  }
  if (myVar <= 0) { //color starts going forwards
    x = 1;
  }
  //if ((mouseX <= 10) && (mouseY <= 0)){ useful, but not what I need
 
  
  //the following section changes the BG color based on mouseX & Y
  if (mousePressed){
      if (mouseX <= 25){ //left side of screen
        background (86, 45, 97); //light green
        //strokeWeight(5);
        //line(25, 25, width-25, 25);
        //line(25, 25, height-25, 25);
        //line(width-25, 25, height-25, width-25);
       //line(25, height-25, height-25, width-25);
      }
      if (mouseX >= width-25){ //right side of screen
        background (377, 18, 83); //pinkish red color thing
      }
      if (mouseY <= 25){ //top of screen
        background (360, 0, 100); //white color
      }
      if (mouseY >= height-25){ //bottom of screen
        background (216, 41, 95); //blue color
      }
  }
  // The following code was supposed to "erase" all of your work
  //if you were drawing too slowly. It wasn't working, and I 
  //couldn't figure out how to make it work, so I've commented
  //it out for the time being.
  
  
  //if (mousePressed){
  //  if (speed < 10);{
  //    background(360, 0, 100);
  //  }
  //}
  
  // indicators for sides of screen + current color
  
  stroke(360, 0, 0);
  strokeWeight(1);
  noFill();
  rect(25, 25, width-50, height-50);
  
  fill(myVar, 80, 70); //current color
  rect(width-25, height-25, 25, 25);
  rect(0, 0, 25, 25);
  rect(width-25, 0, 25, 25);
  rect(0, height-25, 25, 25);
  
  fill(360, 0, 100); //white color
  rect(25, 0, width-50, 25);
  
  fill(216, 41, 95); //blue color
  rect(25, height-25, width-50, 25);
  
  fill(377, 18, 83); //pinkish red color thing
  rect(width-25, 25, 25, height-50);
  
  fill(86, 45, 97); //light green
  rect(0, 25, 25, height-50);
}
