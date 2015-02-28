
//Created by Irine Prastio
//ipa5@sfu.ca
//Student ID : 301083131
//Instructor : Phillipe Pasquire
//Teaching Assistant: Miles Thorogood

//Write a program that communicates the passing of time.

//This is a rendering of time that is inspired by how we can tell what season 
//we are in by the color of the leaves on the tree.  My aim is to have the leaves fall one by
//one every second. Their color gradually turns more reddish yellow as
//the time approaches to one hour count (3600 seconds). Once the count reaches
//one hour limit the canvas will be erased and the count starts again from the beginning.


// Declare x, y, sec as variables
float x;
float y;
int sec = 0;


//Initialize the program
void setup () {
  size (500, 500);
  background(255);
  frameRate (1); // set frame rate to one frame per second
}    

// calling the draw function
void draw () { 

  if ( (sec >= 0) && (sec < 3600)) { // condition if the count is between 0 and 3600 then run the function
    pushMatrix();
    translate (random (450), random(450));  //randomly translate the location of each leaves within 450 x 450 area
    scale (random (0.35, 2)); // randomly scale the size of the leaves
    noStroke();
    fill (random (30, 80+sec), random (150, 255-sec), random (30, 50), random (50, 90)); // random colors of the leaves, more yellow leaves as the count gets higher
    rotate (radians (random(45, 360))); // randomly rotate the position of each leaves
    //the shape of the leaves
    ellipse (x+50, y+50, x+70, y+30);
    triangle (0+x, y+50, x+20, y+41, x+20, y+60);
    //the veins
    stroke (0.5);
    line (x+0, y+50, x+70, y+50);
    line (x+20, y+50, x+30, y+45);
    line (x+25, y+50, x+35, y+55);
    line (x+40, y+50, x+50, y+55);
    line (x+50, y+50, x+60, y+45);
    popMatrix();
    sec = sec + 1; // increase the count by one everytime the function is called
  }

  else if (sec >= 3600) { // condition if the count is larger or equal 3600 then 
    sec = sec * 0; // set the count back to zero
    background (255); // draw the background in white
  }
}

//PS:  I am trying to implement the array and the object but I think I won't be able to finish it before midnight tonight
//I am submitting the version I currently have so far.  I will submit an updated version if I manage to incorporate
//array and object into the code.






