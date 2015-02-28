
//In celebration of the four seasons I wanted to create a sketch that uses them as a creative tool
//There are four picture backgrounds that can be changed using the q,w,e,r keys each of them representing a season
//I then picked 8 of the most representative colors in each picture and you can overlay transparent circles over the image using them
//If you left click it will create a transparent circle with a random color and size at the mouse cursor
//If you right click it will create a transparent circle with a random color and size at a random position
//By using the number keys 1-0 you can select how many circles are drawn if your right click from 1 to 10
//Finally by pressing the s key you can save the current image

// Variable for storing the current season
String season="spring";
// Variable for the size
int size;
// Variable for the number of randomly drawn circles
int count=1;
// The background images
PImage springBg, summerBg, fallBg, winterBg;
// The background color palettes
color[] springPalette = {#E9EDFB,#9CA5D0,#DCABD6,#A46B9E,#311D39,#18CBEC,#9AE0F8,#43669B};
color[] summerPalette = {#FFFAE4,#FEED82,#EBBE1A,#BB6D23,#EC9B87,#464502,#7F8B09,#FBBAD1};
color[] fallPalette = {#F07521,#1C0701,#BE2A0A,#F9EC63,#FEFBD1,#5C590F,#F5B849,#9FA030};
color[] winterPalette = {#F6F1ED,#93A6DD,#F7D3B5,#8E5559,#937DA3,#E1AEA0,#DA8E6C,#321422};

// Load the images and place the spring image on the background
// Also select no stroke for the circles
void setup() {
  size(800,600);
  springBg = loadImage("spring.jpg");
  summerBg = loadImage("summer.jpg");
  fallBg = loadImage("fall.jpg");
  winterBg = loadImage("winter.jpg");
  image(springBg,0,0);
  noStroke();
}

// Nothing goes here
void draw() {
}

// If a mouse button is pressed
void mousePressed() {
  // If the left mouse button is pressed draw a circle at the current mouse position
  if (mouseButton == LEFT)
  {
    if (season=="spring") fill(springPalette[int(random(8))],120);
    if (season=="summer") fill(summerPalette[int(random(8))],120);
    if (season=="fall") fill(fallPalette[int(random(8))],120);
    if (season=="winter") fill(winterPalette[int(random(8))],120);
    size=int(random(100));
    ellipse(mouseX,mouseY,size,size);
  }
  // If the right mouse button is pressed draw a number of circles at random positions
  else {
    for (int i=0;i<count;i++)
    {
      if (season=="spring") fill(springPalette[int(random(8))],120);
      if (season=="summer") fill(summerPalette[int(random(8))],120);
      if (season=="fall") fill(fallPalette[int(random(8))],120);
      if (season=="winter") fill(winterPalette[int(random(8))],120);
      size=int(random(100));
      ellipse(int(random(800)),int(random(600)),size,size);
    }
  }
}

void keyPressed() {
  // Set how many circles to draw randomly
  if (key=='1') count=1;
  if (key=='2') count=2;
  if (key=='3') count=3;
  if (key=='4') count=4;
  if (key=='5') count=5;
  if (key=='6') count=6;
  if (key=='7') count=7;
  if (key=='8') count=8;
  if (key=='9') count=9;
  if (key=='0') count=10;
  
  // Change the seasons
  if (key=='q') {
    image(springBg,0,0);
    season="spring";
  }
  if (key=='w') {
    image(summerBg,0,0);
    season="summer";
  }
  if (key=='e') {
    image(fallBg,0,0);
    season="fall";
  }
  if (key=='r') {
    image(winterBg,0,0);
    season="winter";
  }
  
  // Save the current image
  if (key=='s') {
    saveFrame();
  }
}

