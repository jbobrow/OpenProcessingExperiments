
//Impressionism - NeoImpressionist Paris
//Utilizing blocks or blotches of color to simulate blurred reality...
//Brings out colors and light rather than intricate detail...
//Because the squares overlap unlike points they never appear to stop drawing because they can overlap and retake color from various underlying pixels to blend details.
//Homework 7.1 Fall 2011 Computational Methods
//Miles Thomas
//Code modified from barDemo example & code from Melissa Krakowski

int shade = 400;
PImage paris;

Blocks[] blocks = new Blocks [shade];

void setup(){
  size(400,300); //setting sketch size based on image size
  paris = loadImage("2009.jpg"); //load underlay image to get pixels from
  noStroke(); //no outline for rectangles so they can overlay
  rectMode(CENTER);
  
  for(int i=0; i<blocks.length; i++){
    blocks[i] = new Blocks();
  }
}

void draw() {
  //Nested loop for rectangle construction
  for (int i=0; i<blocks.length; i++){
    blocks[i].update();
    blocks[i].display();
  }
}

class Blocks{
  //setup class to draw x & y between the sketch width and height at random intervals
  int x = int(random(width));
  int y = int(random (height));
 
  Blocks() {
  }
 
  void update() {
    //draw x or y again when within range.
    x = x += int(random (-20, 20));
    y = y += int(random (-20, 20));
  }
 
 
  void display() {
    color c = paris.get(x, y);
    fill(c);
    //I had to play around a lot with size to get botha degree of reality
    //while continuing to blur the image and overlap the pixel grabs.
    rect (x,y,4,4);
  }
}
  

