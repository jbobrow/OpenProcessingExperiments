
PFont font; //this creates a font variable we can use to plug in a font
int score=0; //this is the score variable
int timer=20; //this is the countdown timer
float ballX=0; //this is the horizontal position of the ball
float ballY=0; //this is the vertical position of the ball
int give = 100; //this is how allows the player to be 100 pixels away from the point
int timeLast = 0; //this is the variable where we store the last known second
 
void setup() {
  size(1000, 600); //this sets the size of the sketch
  smooth(); //this makes the sketch more smooth looking
  timeLast=second(); //this syncronizes the time with the crrent second
  ballX=random(1000); //this randomly creates the horizontal position of the enemy
  ballY=random(540); //this randomly creates the vertical position of the enemy
}
 
void draw() { 
  if (timer>0) { //this runs the game as long as the timer hasn't run out
    game(); //this runs a method we created called "game()"
  }
}
 
void game() {
  if (second()!=timeLast) { //this sees if a second has passed
    timeLast=second(); //if a second has passed then we update the timeLast variable
    timer-=1; //this makes the timer countdown by one
  }
  background(0); //this redraws the background
  fill(25,119,193);
  rect(0,0,1000,60);//creates  rectangle at these coordinates 
  fill(0);
  text("Score: "+score, 320, 50); //this draws the score text and the score variable
  text("Timer: "+timer, 520, 50); //this draws the timer text and the timer variable
  fill(random(255), random(255), random(255)); //this creates a random fill 
  ellipse(ballX, ballY, give, give); //this draws the ball
}
 
void mouseClicked() {
  if (mouseX<ballX+give && mouseX>ballX-give) { //this sees if the mouse is close to the enemy horizontally
    if (mouseY<ballY+give && mouseY>ballY-give) { //this sees if the mouse is close to the enemy vertically
      score+=1; //this increases the score by 1
      ballX=random(1000); //this places the ball in a new position horizontally
      ballY=random(600); //this places the ball in a new position vertically
    }
  }
}


