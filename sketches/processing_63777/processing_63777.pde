
PImage bg;
PImage WatermelonCursor; 
PImage monsterRegular; 
//PImage monsterTongue;
PImage monsterSmile;
PImage sweat;
PImage heart;
PImage miniHeart; 

int currentEmotion;

float xpos; 
float ypos; 


// How fast the monster chases the watermelon. 
float drag = 25; 

void setup () { 
  size (1200, 400);
  frameRate(30); 
  noCursor(); 
  bg = loadImage ("bg.png"); 
  WatermelonCursor = loadImage ("WatermelonCursor.png");
  monsterRegular = loadImage ("monsterRegular.png");
  //monsterTongue = loadImage ("monsterTongue.png"); 
  monsterSmile = loadImage ("monsterSmile.png"); 
  sweat = loadImage ("sweat.png"); 
  heart = loadImage ("heart.png"); 
  miniHeart = loadImage ("miniHeart.png");   
  smooth (); 
  xpos = width/2;
  ypos = width/2;
} 

void draw () { 
  image (bg, 0, 0);
  image (WatermelonCursor, mouseX, mouseY); 

  float difx = mouseX - xpos-monsterSmile.width/2;
  if (abs(difx) > 1) { // how close the monster goes to the watermelon
    xpos = xpos + difx/drag;
    xpos = constrain(xpos, 0, width-monsterSmile.width);
  }  

  float dify = mouseY - ypos-monsterSmile.height/2;
  if (abs(dify) > 1) { // how close the monster goes to the watermelon
    ypos = ypos + dify/drag;
    ypos = constrain(ypos, 0, height-monsterSmile.height);
  }  
  image (monsterSmile, xpos, ypos);

  // If the monster is close to the watermelon it is happy.
  if (dist(mouseX, mouseY, xpos, ypos) < 75) {
    image (monsterSmile, xpos, ypos);
       
    
  }
  // The monster is chasing after the watermelon normal face.
  else { 
    image (monsterRegular, xpos, ypos); 
  }
// The monster shows expressive icons when mouse is clicked.
  if (dist(mouseX, mouseY, xpos, ypos) < 75 && mousePressed == true) {
    image (monsterSmile, xpos, ypos);
    image (heart, xpos-45+random(-2, 2), ypos-55+random(-2, 2)); 
    image (miniHeart, xpos-50+random(-2, 2), ypos-10+random(-2, 2));
  } 
  if (dist(mouseX, mouseY, xpos, ypos) > 75 && mousePressed == true) {
    image (monsterSmile, xpos, ypos);
    image (monsterRegular, xpos, ypos); 
    image (sweat, xpos+65, ypos-35+random(-1.5, 1.5));
  }
}

