
//Copyright (c) 2014 
/*
This 'help' info is intentionally not displayed - the user is 
 expected to discover the simple interface.
 
 User Interface
 1. User Instructions
 - Use mouse  to 'paint' in sketch window.
 - Mouse click to change the 'palette'
 
 2. User Inputs
 - Mouse Move – program uses mouseX and mouseY location to update
 sketch window.
 - Mouse Click – program changes image and text used to create the
 output.
 
 3. Outputs
 - variable 'windows' of illuminated text on a black background
 - foreground eventually blends into background
 
 */

// PNG image data
int imgNum = 15;
PImage[] imgArr = new PImage[imgNum] ;

// TXT forum data
String str;
String post[]; 

// Sound data
// Part 2?

// IMG manipulation
PImage img1;  //png image
PImage img2;  //img1 masked with 'text'
PImage img3;  //final image
//off-screen drawing buffers
PGraphics mask1; // text mask

//Font
PFont mfw;

//Initialisation
void setup() {
  size(800, 600);    

  loadImages(); //load all images
  img1 = imgArr[0];

  post = loadStrings("posts.txt");  //load all posts
  initText();

  mfw = loadFont("MarkerFelt-Wide-18.vlw");   //load created font

    background(0);  //initialise to a 'black chalkboard'
}

// draw 'chalkboard'
void draw() {

  fill(0, 10);
  rect(0, 0, width, height); // blend fg with bg

  int w = abs(mouseX-pmouseX); //width of focal area window
  int h = abs(mouseY-pmouseY); //height of focal area window
  createMask1(); //manipulate Image1
  img3 = mask1.get(mouseX, mouseY, w, h);
  image(img3, mouseX, mouseY);  // draw manipulated image
}

// User has clicked mouse to change palette
void mouseReleased() {

  // Set the image for this interaction
  img1 = imgArr[int(random(imgNum))];

  // Set the post text for this interaction
  initText();
}

// images are used as the fill color for the text
void loadImages() {
  for (int i=0; i<imgArr.length; i++) {
    imgArr[i] = loadImage("image" + nf(i, 2) + ".png");
    imgArr[i].resize(width, height);
  }
}

// Set the text used in Mask1
void initText() {
  // collate enough posts to fill text buffer
  str = "";
  while (str.length () < 2500) {
    str += post[int(random(0, post.length))];
  }
}

// Apply Mask1 to Image1
void createMask1() {
  mask1 = createGraphics(width, height); //off-screen drawing buffer
  mask1.beginDraw();
  mask1.background(0, 0, 0); //blue parameter is key to masking

  mask1.rectMode(CENTER);
  mask1.textAlign(CENTER, CENTER);
  mask1.textFont(mfw);
  mask1.textSize(18);
  mask1.text(str, width/2, height/2, width, height);

  img1.mask(mask1);
  mask1.image(img1, 0, 0); //text fill-ed with 'image' 
  mask1.endDraw();
  img2 = mask1.get(); // save masked image
}



