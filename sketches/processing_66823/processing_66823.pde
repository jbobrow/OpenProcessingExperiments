
// Time-based Lab Assessment 1a
// 08-08-2012
// WANG Jing

// Declare the images
PImage img1,img2,img3,img4;
// Decalre the Font
PFont myFont;
// Declare and set the title
String title = "Victory Ceremony" ;
// Declare the counter
int count = 0;
// Declare and set the position of images
float x1 = 313;
float x2 = 462;
float x3 = 317;
float x4 = 476;
float y1 = 300;
float y2 = 280;
float y3 = 480;
float y4 = 460;
float xt = 400;
float yt = 150;

void setup()
{
  // Create a display window of 800x600 pixels
  size(800, 600);
  // Clear the background to white
  background(255);
  // Draw withour stroke
  noStroke();
  // Use pink to draw the text
  fill(255,51,153);
  // Smooth the edges
  smooth();
  // Load the Font
  myFont = loadFont("myFont.vlw");
  // Set the size of Font
  textFont(myFont,80);
  // Set the alignment of text
  textAlign(CENTER, BOTTOM);
  // Load the images
  img1 = loadImage("London1.gif");
  img2 = loadImage("London2.gif");
  img3 = loadImage("London3.gif");
  img4 = loadImage("London4.gif");
  // Set the mode of image
  imageMode(CENTER);
}

void draw()
{
  // Make the images come together from different directions, which means athletes coming from different countries to attend Olympic Games
  if(count<=100)
  {
  background(255);
  // Image 1 start moving from top-left coner
  image(img1,x1*count/100,y1*count/100,165,187);
  // Image 2 start moving from top-right coner
  image(img2,800-(800-x2)*count/100,y2*count/100,216,210);
  // Image 3 start moving from bottom-left coner
  image(img3,x3*count/100,600-(600-y3)*count/100,125,159);
  // Image 4 start moving from bottom-right coner
  image(img4,800-(800-y4)*count/100,600-(600-y4)*count/100,183,189);
  // Use pink to draw the text
  fill(255,51,153);
  // Make title start moving from top
  text(title,xt,yt*count/100);
  // Count the time
  count++;
  }
  // Make a pause, make everything keep still for a while
  if(count>100&&count<=200)
  {
  background(255);
  image(img1,x1,y1,165,187);
  image(img2,x2,y2,216,210);
  image(img3,x3,y3,125,159);
  image(img4,x4,y4,183,189);
  fill(255,51,153);
  text(title,xt,yt);
  count++;
  }
  // Clear the screen
  if(count>200&&count<=300)
  {
    fill(255);
    ellipseMode(CENTER);
    ellipse(width/2,height/2,width*(count-200)/100,width*(count-200)/100);
    count++;
  }
  // Reset the animation
  if(count>300)
  {
    count=0;
  }
}

