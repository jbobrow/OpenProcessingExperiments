
// Monopolise
// Patrick Stein

// Variables (on The Wall)

PImage img; // declare a variable to store an image
PImage img2; // declare another variable to store an image
PImage img3; // declare another variable to store an image

// Setup

void setup(){
  background(255); // set background colour to white
  size(800,600); // set window size too 800x600 pixels
  img = loadImage("hotel.png"); // load image 'hotel' (saved in data folder) and set as value for variable img
  img2 = loadImage("house.png"); // load image 'house' (saved in data folder) and set as value for variable img2
  img3 = loadImage("mortgagedhouse2.png"); // load image 'mortgaged house' (saved in data folder) and set as value for variable img3
}

// Draw

void draw(){
  noStroke(); // turn off stroke (on rectangle below)

  image(img,10+50*int(random(0,16)),10+50*int(random(0,12))); // draw image variable img (hotel) at a random location on a 50 pixel square grid
  image(img2,10+50*int(random(0,16)),10+50*int(random(0,12))); // draw image variable img2 (house) at a random location on a 50 pixel square grid
  image(img3,10+50*int(random(0,16)),10+50*int(random(0,12))); // draw image variable img3 (mortgaged house) at a random location on a 50 pixel square grid
  rect(10+50*int(random(0,16)),10+50*int(random(0,12)),50,50); // draw blank rectangle (fill set to white as defult) at a random location on a 50 pixel square grid

  // draw loops infitely as defult, redrawing over previous draw to give illusion of a changing streetscape (at a defult frame rate of 10fps) 
}


