
int score=0; //this is the score variable
int timer=50; //this is the countdown timer
float enemyX=0; //this is the horizontal position of the enemy
float enemyY=0; //this is the vertical position of the enemy
int give = 100; //this is how forgiving the game is with the player's mouse position
int timeLast = 0; //this is the variable where we store the last known second
 
void setup() {
  size(600, 600); //this sets the size of the sketch
  timeLast=second(); //this syncronizes the timeLast with the current second
  enemyX=random(600); //this randomly creates the horizontal position of the enemy
  enemyY=random(600); //this randomly creates the vertical position of the enemy
  font = loadFont("Serif-48.vlw"); //this plugs a serif font into our font variable
  textFont(font, 28); //this designates our font as the font any text will use
}
 
void draw() { //this runs once per frame (30 frames a second)
  if (timer>0) { //this runs the game as long as the timer hasn't run out
    game(); //this runs a method we created called "game()"
  }
}
 
void game() { //this is a method that holds much of the game
  if (second()!=timeLast) { //this sees if a second has passed
    timeLast=second(); //if a second has passed then we update the timeLast variable
    timer-=1; //this makes the timer countdown by one
  }
  background(246,48,98); //this redraws the background
  fill(16,196,14);
  rect(440,0,250,80);
  fill(255);
  text("Record: "+score, 450, 40); //this draws the score text and the score variable
  text("Tiempo: "+timer, 450, 70); //this draws the timer text and the timer variable
  fill(80,20,244); //this sets the fill randomly
  ellipse(enemyX, enemyY, give, give); //this draws the enemy.
  fill(255);
  text("Vamos!, encuentralo",10,40);
}
 
void mouseClicked() { //this is called any time the mouse is clicked
  if (mouseX<enemyX+give && mouseX>enemyX-give) { //this sees if the mouse is close to the enemy horizontally
    if (mouseY<enemyY+give && mouseY>enemyY-give) { //this sees if the mouse is close to the enemy vertically
      score+=1; //this increases the score by 1
      enemyX=random(600); //this places the enemy in a new position horizontally
      enemyY=random(600); //this places the enemy in a new position vertically
    }
  }
}
