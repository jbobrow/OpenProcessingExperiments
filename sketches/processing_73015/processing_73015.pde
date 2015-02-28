
//load an image and then pixellate it when my mouse is over certain sections of it

//take a base image, break it into chunks. Get function can get COLOR of a pixel at an x, y position and show that in a square
//do something like 300xfind a random x, y position and draw a rectangle at that positoin. Do this with a for loop that goes through 300 times
//set the pixels first, then add the mouse interaction. So I am using GET to grab the color underneath from the actual image, then making that color square at that spot at a specified size
//Then use mapping to make rectangles smaller when the mouse is closer to them (which gives effect of clearer image)

PImage oskar;
int x;
int y;
//int pix;
int myDist;
int h; //height
int w; //width for the squares to change size

void setup(){
  size(600, 450);
  imageMode(CENTER);
  
   oskar = loadImage("oskarbabyhill.jpg");
  image(oskar, width/2, height/2);
  
  w=20;
  h=20;

 // x+=i+10;
}

void draw(){
    //this is how we see the pixels
  loadPixels();
  //creating all of the squares for the pixels
  for (int i=0; i<width; i+=10){
    for (int j=0;j<height;j+=10){
   // x=i;
  color pixels = oskar.get(i, j);
  noStroke();
  fill(pixels);
  //rect(i, j, w, h);
 myDist = int(dist(mouseX, mouseY, i, j));
  w = int(map(myDist, 0, width, 1, 10));
  h = int(map(myDist, 0, width, 1, 10));
  //rect(mouseX, mouseY, w, h);
  rect(i, j, w, h);
    }
  }
}
  



