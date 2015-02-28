
PImage imgAbe, imgCorner;
PShape s[];
int pixelSz;
boolean bUpdateNeeded, bUpdating;

//================================================================

void setup() {
  size(600,800);
  smooth();
  noStroke();
  colorMode(RGB, 99);
  
  //load our b&w pic of Abe
  imgAbe = loadImage("abe.jpg");
  imgAbe.loadPixels();
  
  //load our vector graphics for each number
  //These svg are freely available from fatfonts.org under the Creative Commons Attribution-ShareAlike 3.0 Unported License.
  s = new PShape[10];
  for (int i=0; i<10; i++)
    s[i] = loadShape("miguta_" + i + ".svg");
  
  imgCorner = createImage(1, 1, RGB); //temporary image so it's not null
}

//================================================================

void draw() {
  int newSz = int((float)mouseX/width*25.0 + 5.0); //grab a new size by our mouse position
  
  image(imgCorner, 0, 0); //redraw corner to cover up our last size indicator
  rect(0,0, newSz, newSz); //just a white rectagle
  shape(s[8], 0, 0, newSz*2, newSz); //and our size indicator
  
  if (bUpdating) { //let's draw the man...
    background(99);
    drawAbe();
    imgCorner = get(0, 0, 60, 60); //capture upper-left corner after drawing for our size indicator
    bUpdating = false;
  }
  if (bUpdateNeeded) { //all this just to put one word on the screen...
    background(99);
    fill(0, 0, 25);
    text("Redrawing...", 150, 300);
    fill(99);
    bUpdateNeeded = false;
    bUpdating = true;
  }
  if ((newSz != pixelSz & mousePressed) | pixelSz == 0) { //new size picked!  Set things up to redraw...
    pixelSz = newSz;
    bUpdateNeeded = true;
    bUpdating = false;
  }
}

//================================================================

void drawAbe() {
  int cntX = int((float)width/pixelSz); //get number of horizontal elemtents
  int cntY = int((float)height/pixelSz); //get number of vertical elements
  int posX = 30 + pixelSz * 2; //adjust horizontal position
  int posY = 20 + pixelSz * 2; //adjust vertical position
  boolean bShowLittle = (pixelSz*0.25 > 2); //decide whether little numbers are big enough to show
  
  
  for (int y=0; y<cntY; y++)
    for (int x=0; x<cntX; x++) {
      int id = (posY + y)*imgAbe.width + posX + x; //get pixel id
      int brt = 99 - int(brightness(imgAbe.pixels[id])); //get brightness (0 = brightest, 99 = darkest)
      int bigVal = brt/10; //get the big number (10s)
      int ltlVal = brt - bigVal*10; //get the little number (1s)
      if (bShowLittle) //make sure little number is big enough to be shown
        shape(s[ltlVal], x*pixelSz + pixelSz*0.41, y*pixelSz + pixelSz*0.37, pixelSz*0.5, pixelSz*0.25); //draw the little num (pos needed a bit of adjustment)
      shape(s[bigVal], x*pixelSz, y*pixelSz, pixelSz*2, pixelSz); //draw the big number
    }
}



