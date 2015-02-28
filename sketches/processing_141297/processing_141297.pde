
//Jenny McCarthy Hw 8: Uploading Images 3/24/14

PImage img; 
PImage omg; 
PImage omfg; //declare
int x = 0; //variable used to create movement

void setup(){
  size(500,400);
  noStroke();
  img = loadImage("Boat.jpg"); //initialize (picture taken by me in Chattanooga, TN)
  img.resize(500,400); //resize image to size of display window
  
  omg = loadImage("Water.jpg"); //initialize (picture taken by me in Chattanooga, TN)
  omg.resize(500,400); //resize image to size of display window
  
  omfg = loadImage("Mountains.jpg"); //initialize (picture taken by me in Salida, CO)
  omfg.resize(500,400); //resize image to size of display window
}

void draw(){
  image(omg,0,0); //water
  copy(omfg,0,0,width,290,0,0,width,290); //mountains
  copy(img,345,180,95,30,x,300,95,30); //displays just the boat
  x = x - 1; //boat rows to the left
  if (x < -100){ //boat is reset back to the right side of the window
    x = 510;
  } 
  
  color c = omfg.get(mouseX,mouseY); //mouse position changes the color of the frame
  fill(c); //fills the frame w/ color c
  rect(0,0,width,25); //top side of the frame
  rect(0,375,width,25); //bottom side of the frame
  rect(0,0,25,height); //left side of the frame
  rect(475,0,25,height); //right side of the frame
}
  

  


