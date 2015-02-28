
float yPos = 75;
float xPos = 15;
boolean ydirection = true;
boolean xdirection = true;
PFont ComicSans;
PFont Papyrus;
PFont Impact;
int font = 0;
int score = 0;

void setup(){
  size(600, 600);
  background(250);
  smooth();
  strokeWeight(5);
  ComicSans = loadFont("ComicSansMS-24.vlw");
  Papyrus = loadFont ("Papyrus-Regular-24.vlw");
  Impact = loadFont ("Impact-24.vlw");
}

//___________________________________________________//

void draw(){
  fill(0);
  background(250);
  
  textFont(Impact); // state the score
  text("Score: ", 15, 585);
  text(score, 85, 585);
  
  if (font == 0){ // give the instructions
   fill(255,0,0);
   textFont(ComicSans);
   text("Let's play inverse-Pong!\nScore some points!", width/4, height/2);
  }
  
  if (font <=3 && font != 0){ // comment on the programming
   fill(0,0,255);
   textFont(Papyrus);
   text("Aw, snap! That is not\nhow inverse-Pong is played!\nThe game is broken. :(", width/4, height/2.5);
  }
  
  if (font >= 4 && font <= 9){ // more humor
   fill(0,255,0);
   textFont(ComicSans);
   text("Yeah, this is not working.\nBlame the programmer.", width/4, height/3);
  }
  
  if (font >=10){ // yet more
   fill(255,0,255);
   textFont(Papyrus);
   text("This is it, diehard.\nThere is no more.", width/4, height/2);
  }
  
  fill(0); // draw the ball
  ellipseMode(CENTER);
  ellipse(xPos, yPos, 15, 15);
 
  line(width-50, yPos-600, width-50, mouseY-50); // draw the upper boundary
  line(width-50, yPos+600, width-50, mouseY+50); // draw the lower boundary
  
  //___________________________________________________//
  
  if (yPos == height-15){ // set a negative motion variable
    ydirection = false;
  }
  
  if (yPos == 15){ // set a positive motion variable
    ydirection = true;
  }
  
  if (yPos >= 15 && yPos != height-15 && ydirection == true) {
    yPos+=3; //make the ball move positively
  }
  else if (yPos <= height-15 && yPos != 15 && ydirection == false) {
    yPos-=3; //make the ball move negatively
  }
  
  //___________________________________________________//
  
  if (xPos == 15){ // set a positive motion variable
    xdirection = true;
  }
  
  if (xPos == width-15){ // set a negative motion variable
    xdirection = false;
    font++;
    score--;
  }
  
  if (xPos == width-50 && yPos >= mouseY+50){
    xdirection = false; // attempt to make the ball deflect off the boundary...and fail
  }
  
  else if (xPos == width-50 && yPos <= mouseY-50){
    xdirection = false; // attempt to make the ball deflect off the boundary...and fail
  }
  
  else if (xPos <= width-15 && xdirection == false){
    xPos-=2; //make the ball move negatively
  }
  
  else if (xPos >= 15 && xdirection == true){
    xPos+=2; //make the ball move positively
  }
}
  
  

