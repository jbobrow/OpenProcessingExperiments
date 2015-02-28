
float[] xPos = new float [0];
float[] yPos = new float [0];
float[] xVel = new float [0];
float[] yVel = new float [0];
float[] partsize = new float[0];
float rectX = 675;
float rectY = 35;
float rectWidth = 60;
float rectHeight = 65;

float rX =586;
float rY = 256;
float rWidth = 125;
float rHeight = 85;

PImage Snowman;
PImage bg;
PImage star;
PImage startwo;
PImage house;
PImage housetwo;

void setup() {

  size(800, 600);
  
  Snowman = loadImage("MerryUpdate.png");
  bg = loadImage("Merrybg.png");
  star = loadImage("Starone.png");
  startwo = loadImage("Startwo.png");
  house = loadImage("House.png");
  housetwo = loadImage("Houselightsoff.png");
  
}

void draw() {
  
  background(25, 40, 95);
   println("X " + mouseX + " Y " + mouseY);
  
     if((mouseX>rX) && (mouseX<rX + rWidth) && (mouseY>rY) && (mouseY<rY+rHeight)) {
   noFill();
     image(house,200,50);
  } else {
    noFill();
    image(housetwo,200,50);
    
  }
   if((mouseX>rectX) && (mouseX<rectX + rectWidth) && (mouseY>rectY) && (mouseY<rectY+rectHeight)) {
   noFill();
     image(star, 650, 20);
  } else {
    noFill();
    image(startwo,650,20);
    
  }
  
  rect(rX,rY,rWidth,rHeight);   
  rect(rectX, rectY, rectWidth, rectHeight); 
  
  image(bg, 0, 100);
  image(Snowman, 150, 100);
  

  noStroke();

// Makes a new particle
  xPos = append(xPos, random(0, 800));
  yPos = append(yPos, 0);
  xVel = append(xVel, random(-1, 1));
  yVel = append(yVel, random(1, 3));
  partsize = append(partsize, random(1, 7));
  
  fill(0);
  fill(255);

  for (int i = 0; i<xPos.length; i++ ) {

    ellipse(xPos[i], yPos[i], partsize[i], partsize[i]);
    xPos[i] += xVel[i];       /// Adding them together
    yPos[i] += yVel[i];      /// to make them move    
  }

  if (xPos.length>600) {
    
    xPos = subset(xPos, 1);
    yPos = subset(yPos, 1);
    xVel = subset(xVel, 1);
    yVel = subset(yVel, 1); 
    partsize = subset(partsize, 1);
    
  }
  

  
 
  
  // PUPILS
  
  // Set colour and size
  
  
  fill(0);
  float pupilRadius = 4;
  

  // LEFT
  //
  // Position
  
  // DEFAULT
  // The below two lines set the pupil to sit in the center of the eyeball by default. The width and the height
  // of the canvas is divded by two to get the center value of your canvas, then we nudge the pupils in to place by
  // adding (+) or subtracting (-) to the pupils value to position it.
  float defaultLeftPupilPosX = (width / 2) - 27;
  float defaultLeftPupilPosY = (height / 2) - 15;
  
 
   // MAPPING

  // I am  using it here to map a big value (canvas) to a smaller value (eyeball), that's how the pupil becomes constrained to the
  // eyeball. So I am saying that if mouseX is 0, it's at the far left side of your eyeball, and
  // if mouseX is at the far right of your canvas (800), then the pupil is at the far right side
  // of your eyeball. The same methodology is used for the vertical axis (Y) as well.
  // do not be scared to use a calculator or graph paper to help you, as seb suggested in class.
 
  // map(change this, |from this, and this|, |to this, and this|);
  // 
  // defaultLeftPupilPosX - 5, gets the far left side of the eyeball
  // defaultLeftPupilPox + 5, gets the far right side of the eyeball
  // etc.
  float mappedLeftPupilPosX = map(mouseX, 0, width, defaultLeftPupilPosX - 5, defaultLeftPupilPosX + 5);
  float mappedLeftPupilPosY = map(mouseY, 0, width, defaultLeftPupilPosY - 5, defaultLeftPupilPosY + 8);
  
  // Now lets draw the pupil using our mapped position values
  ellipse(mappedLeftPupilPosX, mappedLeftPupilPosY, pupilRadius, pupilRadius);
  // RIGHT (All the comments above relate to the right pupil as well)
  // Position
  // Default
  float defaultRightPupilPosX = (width / 2) + 10;
  float defaultRightPupilPosY = (height / 2) - 14;
  // Mapping
  float mappedRightPupilPosX = map(mouseX, 0, width, defaultRightPupilPosX - 5, defaultRightPupilPosX + 5);
  float mappedRightPupilPosY = map(mouseY, 0, width, defaultRightPupilPosY - 5, defaultRightPupilPosY + 8);
   // Draws the pupil using our mapped position values
  ellipse(mappedRightPupilPosX, mappedRightPupilPosY, pupilRadius, pupilRadius);
 
  
}



