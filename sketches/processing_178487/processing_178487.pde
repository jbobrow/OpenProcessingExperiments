
// required for javascript
/* @pjs preload="image00.png,image01.png,image02.png,image03.png"; */
/* @pjs preload="image04.png,image05.png,image06.png,image07.png"; */
/* @pjs preload="image08.png,image09.png,image10.png,image11.png"; */
/* @pjs preload="image12.png,image13.png,image14.png"; */


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

// IMG manipulation
PImage img;
PImage img2;  //focal part of manipulated image

PImage imgMask; //text mask

PGraphics pg; // of-screen drawing buffer

//Initialisation
void setup() {
  size(800, 600);  

  post = loadStrings("posts.txt");  //load all posts
  initText();

  loadImages(); //load all images
  imageMode(CENTER);
  img = imgArr[0];

  pg = createGraphics(800, 600);

  background(0, 0, 0);
}

// draw 'chalkboard'
void draw() {

  fill(0, 10);
  rect(0, 0, width, height); // blend fg with bg
  
  pgd();
  
  int w = abs(mouseX-pmouseX); //width of focal area window
  int h = abs(mouseY-pmouseY); //height of focal area window
  PImage tmp = pg.get();
  img.mask(tmp);
  img2 = img.get(mouseX, mouseY, w, h);
  image(img2, mouseX, mouseY);
}

// User has clicked mouse to change palette
void mouseReleased() {

  // Set the image for this interaction
  img = imgArr[int(random(imgNum))];

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
  while (str.length () < 8000) {
    str += post[int(random(0, post.length))];
  }
}

// create mask
void pgd() {
  pg.beginDraw();
  pg.background(0);
  pg.fill(255);
  pg.stroke(255);
  pg.text(str, 0, 0, width, height);
  pg.endDraw();
}



