
//Opaque Blobs
//By Traditum

//This sketch is based on an original version from the first intensive. I have tweeked it to make smaller, nicer looking blobs randomly instead of on a mouse click.
// It demonstrates saving to an external file, using mouse and keyboard inputs, using for loops and custom processes

int numblobs = 400; // Variable that sets the number of blobs per frame

void setup(){ 
  size(600,600); // Set size of window to 600px x 600px
  background(255); // Set background color to white
  //noLoop(); // No loop,, currently commented out, used in an alternate version where you click when you would like a blob
  noStroke(); // No stroke around our blobs
  smooth(); // Turn on antialiasing
  frameRate(1); // Set the frame rate to 1 frame per second
} 

void draw(){ // The draw process is run once for each frame
  for(int i=0; i<numblobs; i++){ // Stock standard for loop, repeats the process of making blobs until it reaches the value of numblobs
    drawBlob(random(width), random(height)); // Run subprocess drawBlob at a random location within the width and height of the window
  }
}

void drawBlob(float xpos, float ypos){ // drawBlob subprocess, each blob has an xposition and yposition
  fill(random(255), random(50)); // set the fill colour to a random greyscale value with a random opacity up to 50
  for(int i=0; i<10; i++){ // Another standard for loop this time it repeats the process 10 times, this  is to make the blobs themselves out of 10 smaller ellipses
    ellipse(xpos+random(20),ypos+random(20),random(10,30), random(10,30)); // create an ellipse at a random location within 20pxls of the position provided by the value of xpos and ypos, these ellipses are between 10 and 30pxl in size
  }
}

void mousePressed(){ // when the mouse is pressed...
  redraw(); // redraw, this wipes the current drawing and starts again
  background(255);// reset the background colour to white
  //drawBlob(mouseX,mouseY); // Used in a previous version, where the blobs location is determined by a mouse click
}

void keyPressed(){ // when a key is pressed...
  save("blobs.jpg"); // save the current image as blobs.jpg
}


