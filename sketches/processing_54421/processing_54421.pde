
//PVectors stores 2 or 3 variables for position, velocity and/or acceleration
//ArraysLists = buckets and are more flexible than an array[]

import processing.video.*; //you are going to create a processing video
MovieMaker SD; //The video will be called as SD  

int maxdist = 50; //an integer named maxdist which is equal to 50 pixels 
ArrayList drawing = new ArrayList(); //creating a new Arraylist named drawing

void setup() { //i want you to set this up
  size (1280, 960); //cavas size will be 1280,960 pixels
  background(0); //the background will be black
  stroke(255, 50); //the stroke (line colour) will be white with 50% transparency
  smooth(); //make the grahpic quality smooth
  SD = new MovieMaker(this, 1280, 960, "SpiderDrawing.mov", 
  15, MovieMaker.VIDEO, MovieMaker.HIGH); //Create a video that is 1280,960 called SpiderDrawing at 30FPS in a video format at high res
}

void draw() { //i want you to draw this
  SD.addFrame(); //record everything that happens while the draw loop is active
}

void mouseDragged() { // when the mouse is dragged do this
  PVector pos = new PVector(mouseX, mouseY); //creating a new PVector named pos (position) at the mouse X and Y coordiantes
  drawing.add(pos); //i want you to add this PVector to the ArrayList

  //check to see if there are any other close points

    for (int i=0; i<drawing.size(); i++) { //a for loop for interation. i starts at 0 - if i is less than the pos PVector added to the ArrayList continue - update by adding 1 to i
    PVector p = (PVector) drawing.get(i); //create a new PVector called p which has the value of the PVector pos information at Mouse X and Y and get it from the ArrayList(i)
    float distance = p.dist(pos); // create a new float (for decimal numbers) called distance which is equal too PVector p
    if (distance <random(maxdist)) { //if the distance is randomly less than the maximum distance set by the maxdist integer
      if (random(1)<0.5)line(p.x, p.y, pos.x, pos.y); // if a random number between 0 and 1 (random(1))is called and if it is less than 0.5 draw a line to the PVector 'p' x,y position (lines already drawn) and the pos x,y position (mouseX and mouseY)
    }
  }
}

void keyPressed() { //when any key is pressed do this
  if (key ==' ') {
    drawing.clear(); //empty the list
    background(0); //make the background black again
  }
  if (key == 's') { //if the s key is pressed
    SD.finish();  // Finish the movie 
  }
if(key=='b'){ //if the b key is pressed
stroke(0,0,255,30); //make the stoke blue with 30% transparency
}

if (key=='r'){ //if the r key is pressed 
stroke(255,0,0,10); //make the stroke red with 10% transparency
}
if (key=='g'){ //if the g key is pressed
stroke(0,255,0,20); //make the stroke green with 20% transparency
}
if (key == 'w'){ //if the w key is pressed
stroke(255,40); //make the stroke white again with 40% transparency
}
}


