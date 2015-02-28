
int thetaInDeg=0;
int framePerSec=15;
int frameNum=1;
int in1=8, inTrans=2, in2=3, in3=3; 
// colour indexes
short r=245;
short g=215;
short b=013;

//Flags for 3 slides
boolean inCat=false;

//for scrolling text
int xOfText;
PFont scrollTextFont;
String[] wish = {
  "Happy birthday to our beloved Raja!", 
  "Wishing a very prosperous married life",
};
short wishIndex=1;

// for sorry message
PFont sorryMessageFont;

//Image for background
PImage catSorryImg, catHappyImg, dogHappyImg;
int imgTransparency=0;// 0 is totally transparent

void setup() {
  size(450, 309);
  smooth();
  background(0);
  fill(r, g, b);
  frameRate(framePerSec);

  //Create back ground
  catSorryImg = loadImage("catFeelingSad.bmp");//Cat feeling sorry image                
  catHappyImg = loadImage("HAPPY CAT.JPG");//Cat feeling happy image              
  dogHappyImg = loadImage("happy_dog.jpg");//dog feeling happy image

    //Create message font
    
  //  sorryMessageFont = loadFont("Comic Sans MS");
    sorryMessageFont = createFont("ComicSansMS-Bold-48.vlw",1);
  textFont (sorryMessageFont, 24);
  textAlign(LEFT);

  //Create scroll font
  xOfText=width;
  //  scrollTextFont = loadFont("ComicSansMS-Bold-48.vlw"); 
    scrollTextFont = createFont("ComicSansMS-Bold-48.vlw",1);
  textFont (scrollTextFont, 24);
}

void draw() {
  // Display sad cat andsorry message
  image(catSorryImg, 0, 0);
  fill(255);
  text("Sorry I missed your \n birthday :(", width/2.2, height/3);

  //Scroll  text
  text("Happy birthday", xOfText, 20);
  xOfText=xOfText-4;

  //Start transforming
  if (frameCount>(framePerSec*in1) && frameCount<(framePerSec*(inTrans+in1))) {
    tint(255, imgTransparency);  
    image(catHappyImg, 0, 0);
    imgTransparency=imgTransparency+15;
  }

  if (frameCount>=(framePerSec*(inTrans+in1)) && frameCount<(framePerSec*(inTrans+in1+in2))) {
    image(catHappyImg, 0, 0);
    text("but now we can wish you,", 20, height/1.1);
  }
  if (frameCount>=(framePerSec*(inTrans+in1+in2)) && frameCount<(framePerSec*(inTrans+in1+in2+in3))) {
    image(dogHappyImg, 0, 0);
    fill(245,20,20);
    text("Happy birthday \n and,\n a happy \n married \n life!", 250, 30);
    noLoop();
  }
  //saveFrame(frameNum+".tiff");
  frameNum++;
  //  
  //  if (frameCount>(inCatFrame +(framePerSec*6))  ) {
  //    image(dogHappyImg, 0, 0);
  //  }
  //  
  //  if (frameCount>(inCatFrame +(framePerSec*6))  ) {
  //       noLoop();
  //  }
}

void keyPress() {
}
void mousePress() {
}



