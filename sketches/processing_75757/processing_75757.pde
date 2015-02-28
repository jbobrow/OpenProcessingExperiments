
//---LOAD THINGS
PFont font;
//images
PImage lhand;
PImage rhand;
PImage drop;

//top hourglass array + co
PImage[] topArray = new PImage[12];
PImage top0;
PImage top1;
PImage top2;
PImage top3;
PImage top4;
PImage top5;
PImage top6;
PImage top7;
PImage top8;
PImage top9;
PImage top10;
PImage top11;

//bottom hourglass array and friends
PImage[] bottomArray = new PImage[12];
PImage bottom0;
PImage bottom1;
PImage bottom2;
PImage bottom3;
PImage bottom4;
PImage bottom5;
PImage bottom6;
PImage bottom7;
PImage bottom8;
PImage bottom9;
PImage bottom10;
PImage bottom11;

//for the dropping blob
float yDropPos;
float xDropPos;
float ySpeed = 6;
float yDirection = 1;


//----SETUP
void setup () {
  size(500, 800);
  frameRate(30);
  font = loadFont("MovieLetters-48.vlw");

  //load hands for water
  lhand = loadImage("leftHand.png");
  rhand = loadImage("rightHand.png");

  //load droplet of water + things to do with it
  drop = loadImage("drop.png");
  xDropPos = 255;
  yDropPos = 295;


  //----TOP HOURGLASS SETUP
  //Top hourglass image load
  top0 = loadImage("top0.png");
  top1 = loadImage("top1.png");
  top2 = loadImage("top2.png");
  top3 = loadImage("top4.png");
  top4 = loadImage("top5.png");
  top5 = loadImage("top5.png");
  top6 = loadImage("top5.png");
  top7 = loadImage("top8.png");
  top8 = loadImage("top9.png");
  top9 = loadImage("top10.png");
  top10 = loadImage("top11.png");
  top11 = loadImage("top12.png");

  //TOP HOURGLASS ARRAY
  topArray[0] = top0;
  topArray[1] = top1;
  topArray[2] = top2;
  topArray[3] = top3;
  topArray[4] = top4;
  topArray[5] = top5;
  topArray[6] = top6;
  topArray[7] = top7;
  topArray[8] = top8;
  topArray[9] = top9;
  topArray[10] = top10;
  topArray[11] = top11;

  //TOP hourglass forloop
  for (int i = 0; i<topArray.length; i=i+5) {
    topArray[i] = loadImage("top"+i+".png");
  }

  //----BOTTOM HOURGLASS SETUP
  //image load
  bottom0 = loadImage("bottom0.png");
  bottom1 = loadImage("bottom1.png");
  bottom2 = loadImage("bottom2.png");
  bottom3 = loadImage("bottom3.png");
  bottom4 = loadImage("bottom4.png"); 
  bottom5 = loadImage("bottom5.png");
  bottom6 = loadImage("bottom6.png");
  bottom7 = loadImage("bottom7.png");
  bottom8 = loadImage("bottom8.png");
  bottom9 = loadImage("bottom9.png");
  bottom10 = loadImage("bottom10.png");
  bottom11 = loadImage("bottom11.png");

  bottomArray[0] = bottom0;
  bottomArray[1] = bottom1;
  bottomArray[2] = bottom2;
  bottomArray[3] = bottom3;
  bottomArray[4] = bottom4;
  bottomArray[5] = bottom5;
  bottomArray[6] = bottom6;
  bottomArray[7] = bottom7;
  bottomArray[8] = bottom8;
  bottomArray[9] = bottom9;
  bottomArray[10] = bottom10;
  bottomArray[11] = bottom11;

  for (int i = 0; i<bottomArray.length; i=i+5) {
    bottomArray[i] = loadImage("bottom"+i+".png");
  }
}

//----DRAW LOOP
void draw() {
  noStroke();
  background(230);
  smooth();
  rectMode(CENTER);


  //TIME ints that have to be IN THE DRAW LOOP
  int mil = millis();
  int s = second();
  int m = minute();
  int h = hour();

  //background setup
  fill(255);
  rect(width/2, height/2, 300, 800);


  //----------ACTUAL HOURGLASS THINGS TO DO WITH TIME
  //droplet
  yDropPos = yDropPos + (ySpeed + yDirection);

  if (yDropPos < 500 || yDropPos < 252) {
    yDirection*= -1;
    image (drop, xDropPos, yDropPos);
  }
  //---------------------------- H E L P ;A;  

  //top hourglass
  image(topArray[m/5], 0, 0);

  //bottom hourglass
  image(bottomArray[m/5], 0, 0);

  //----other pretty things
  //load hands NOTE THIS SHOULD BE AFTER THE HOURGLASS
  image(lhand, 0, 0);
  image(rhand, 0, 0);

  // FLOW text
  fill (48);
  textFont(font, 150);
  text("FLOW", 190, 650);

  fill (255, 255, 255, map(mil, 3599500, 3599900, 0, 255));
  rect(width/2, height/2, 500, 800);
}


//----END OH MY GOD


