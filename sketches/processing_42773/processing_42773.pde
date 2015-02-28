
PFont f;
PImage layout;
PImage greenlines;
PImage redlines;
PImage audioS;
PImage subtitle;

PImage esteem;
PImage love;
PImage physiologic;
PImage self;
PImage logo;
PImage cover;
PImage safty;
PImage title;

String[] searchWords;

float posX=0;
float greenline1=0;
float greenline2=0;
float greenline3=0;
float transGreen=0;
float transRed=0;
float redCircle=0;

float picSizeS = 1;
float picSizeT = 1;
float transS=255;
float transT=0;//text transparency

// The radius of a circle ESTEEM
//float r = 210;
float r = 100;

// INNER ELLIPSE position ESTEEM
float xpos;
float ypos;



// timer doubleclick
float lastClick = millis(); 

//int innerEllipseW ESTEEM
int innerEllipseW = 100;



void setup() {
  size(1024, 768);
  layout = loadImage("layout-01.jpg");
  greenlines = loadImage("greenlines.png");
  redlines = loadImage("redlines.png");
  audioS=loadImage("audio1.png");
  subtitle=loadImage("subtitle.png");

  esteem = loadImage("esteem.png");
  love = loadImage("love.png");
  physiologic = loadImage("physiologic.png");
  self = loadImage("self-actualization.png");
  safty = loadImage("safety_title.png");
  title = loadImage("title.jpg");

  logo = loadImage("logo.png");
  cover = loadImage("mask.png");

  f = createFont("Georgia", 30, true);
  textFont(f);
  smooth();
  //---------------------------------------------------------------------------------------------ESTEEM    
  searchWords = loadStrings("safety.txt");

  // Startposition
  xpos = 460;
  ypos = 382;
}

void draw() {
  background(255);
  noTint();


  imageMode(CENTER);
  tint(255, transS);
  image(audioS, 500+posX, 673, audioS.width/picSizeS, audioS.height);



  strokeWeight(2.5); 
  stroke(28, 130, 125, greenline1);
  line(306, 580, 306, 740);
  stroke(28, 130, 125, greenline2); 
  line(701, 580, 701, 740);
  stroke(28, 130, 125, greenline3);
  line(799, 580, 799, 740);




  tint(255, transGreen);
  image(greenlines, 500+posX, 650, greenlines.width/picSizeS, greenlines.height-20);
  tint(255, transRed);
  image(redlines, 500+posX, 650, greenlines.width/picSizeS, greenlines.height-20);

  tint(255, transT);
  image(subtitle, 500+posX, 645, subtitle.width/picSizeT, subtitle.height);

  imageMode(CORNER);
  noTint();
  image(cover, 0, 10);

  imageMode(CORNER);
  image(esteem, 80, 350);
  image(love, 750, 320);
  image(physiologic, 600, 130);
  image(self, 120, 140);
  image(safty, 435, 545);
  image(logo, 45, 30);
  image(title, 400, 730);

  stroke(77);
  strokeWeight(1);
  line(0, 110, 1024, 110);
  line(0, 723, 1024, 723);

  stroke(180);
  line(75, 590, 968, 590);

  //---------------------------------line logic
  if (mouseX>=358&&mouseX<=426&&mouseY>=358&&mouseY<=442&& mousePressed) {
    greenline1=255; 
    greenline2=0;
    greenline3=0;
    transGreen=0;
    transRed=0;
  }
  else if (mouseX>=397&&mouseX<=509&&mouseY>=292&&mouseY<=357&& mousePressed) {
    greenline1=0; 
    greenline2=255;
    greenline3=0;
    transGreen=0;
    transRed=0;
  }
  else if (mouseX>=510&&mouseX<=583&&mouseY>=324&&mouseY<=457&& mousePressed) {
    greenline1=0;
    greenline2=0;
    greenline3=255;
    transGreen=0;
    transRed=0;
  }
  else
  {
    greenline1=greenline2=greenline3=0;
  }



  noStroke();
  fill(183, 11, 11, redCircle);
  ellipse(838, 412, 94, 94);



  if (transGreen>=255&&transRed<=0&&mouseX>=750&&mouseX<=914&&mouseY>=320&&mouseY<=536) {
    transGreen=255;
    transRed=255;
    redCircle=255;
  }
  else if (mouseX<=750&&innerEllipseW==180) {
    transRed=0;
    redCircle=0;
  }  

  //----------------------------------------------zoom
  if (transS>=255&&transT<=0&&picSizeS<=0.5) {
    picSizeS=0.5;
    transS = 0;
    transT = 255;
    transGreen = 0;
  }
  if (transS>=255&&transT<=0&&picSizeS>=3) {
    picSizeS=3;
    transS = 255;
    transT = 0;
    transGreen=255;
  }//limit the audio wave size and colors


  if (transS<=0&&transT>=255&&picSizeT<=0.5) {
    picSizeT=0.5;
    transS = 0;
    transT = 255;
    transGreen = 0;
  }
  if (transS<=0&&transT>=255&&picSizeT>=1.1) {
    picSizeT=1.1;
    transS = 255;
    transT = 0;
    transGreen=255;
  }//limit the text size and colors




  //---------------------------------------------------------------------------------------------ESTEEM  
  int tmpEllipseDist = int(dist(460, 382, mouseX, mouseY));

  // move INNER ELLIPSE
  if (tmpEllipseDist < 40 && mousePressed) {
    xpos = mouseX;
    ypos = mouseY;
  }

  if (tmpEllipseDist < 135 && mousePressed) {
    cursor(HAND);
  }
  else {
    cursor(ARROW);
  }

  // OUTER ELLIPSE
  noFill();
  stroke(28, 130, 125);
  strokeWeight(6);
  ellipse(460, 382, r*2 - 20, r*2 - 20);


  // INNER ELLIPSE
  fill(28, 130, 125);
  ellipse (xpos, ypos, innerEllipseW, innerEllipseW);



  // We must keep track of our position along the curve
  float arclength = 0;

  translate(460, 382);

  // For every box
  for (int i = 0; i < searchWords.length; i++) {

    // The character and its width
    // char currentChar = message.charAt(i);
    // Instead of a constant width, we check the width of each character.
    float w = 11.6;
    // float w = textWidth(currentChar); 
    // Each box is centered so we move half the width
    arclength += w/2;

    // Angle in radians is the arclength divided by the radius
    // Starting on the left side of the circle by adding PI
    float theta = PI + arclength / r;

    pushMatrix();

    // Polar to Cartesian conversion allows us to find the point along the curve. 
    // See Chapter 13 for a review of this concept.
    translate(r*cos(theta), r*sin(theta)); 

    // Rotate the box (rotation is offset by 90 degrees)
    rotate(theta + 2*PI); 

    // TEXTSIZE
    // make the distance and set a bigger fontSize
    int tmpDist = int(dist(xpos - 460, ypos - 382, r*cos(theta), r*sin(theta)));

    // FIXME
    // select less words
    if (tmpDist < 460) {
      fill(28, 130, 125);
      textSize( map(tmpDist, 0, 150, 25, 1));
    }
    else {
      fill(40);
      textSize(6);
    }
    // TEXTSIZE END

    // Display the character
    text(searchWords[i], 0, 0);

    popMatrix();

    // Move halfway again
    arclength += w/2;
  }

  if (keyCode == LEFT) {
    posX -= 5;
  } //move pic to left

  if (keyCode == RIGHT) {
    posX += 5;
  } //move pic to right
}

boolean doubleClick() {
  //the moment in millisecond() of the current click
  float currentClick = millis();

  //the difference between the two clicks
  float clickDifference = currentClick - lastClick;

  //set lastClick equal to currentClick
  lastClick = currentClick;

  //maximum amount of time in milliseconds to be counted as a double-click
  float doubleClickSpeed = 200;

  if (clickDifference < doubleClickSpeed) {
    return true;
  }
  else {
    return false;
  }
}

// normal or doubleclick 
void mousePressed () {
  if (doubleClick()) {
    xpos = 460;
    ypos = 382;
    greenline1=greenline2=greenline3=0;
    transGreen=255;
    innerEllipseW = 180;

    /*if(transGreen>=255&&transRed<=0&&mouseX>=785&&mouseX<=833&&mouseY>=360&&mouseY<=460){
     greenline1=greenline2=greenline3=0;transGreen=255;transRed=255;
     innerEllipseW = 180;
     redCircle=255;
     } */
  }

  else {
    innerEllipseW = 100;
    transGreen=0;
    transRed=0;
  }
}



void keyPressed() {
  if (keyCode == UP) {
    if (transS >= 255 && transT <= 0) {
      picSizeS -= 0.1;
    }
    if (transS <= 0 && transT >= 255) {
      picSizeT -= 0.1;
    }
  }
  if (keyCode == DOWN) {
    if (transS >= 255 && transT <= 0) {
      picSizeS += 0.1;
    }
    if (transS <= 0 && transT >= 255) {
      picSizeT += 0.1;
    }
  }//yeah!!zoom zoom
}


