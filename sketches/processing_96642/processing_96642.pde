
//To begin with I've set the condition to make the game start, which is simply when the mouse is clicked.
boolean start = false;
void mousePressed() {
  start = true;
}
//Then here there are all the variables used throuought.A font is loaded for keeping track of the score too.
float x = 200;
float y = 200;
float xspeed = random(2,6);
float yspeed = random(2,6);
int bar = 150;
int score = 0;
PFont T;

//Pretty standard setup plus the font
void setup () {
  size (500,500);
  smooth ();
  noStroke ();
  T = createFont("Times New Roman",15,true);
}

void draw () {
 background (255);
 fill(0);

 //Here's the ball, which will always follow a different pattern of movement since the "speed" variables hold random numbers.
 ellipse (x,y,30,30);
//The rectangle on the left
fill(0);
rect(0,0,10,height);
//The moving bar, which when set like this makes the mouse cursor move the bar from its center making it more friendly to use.
fill(0);
rect(width-20,mouseY-bar/2,10,bar);
textFont(T,20);
text(score,10,20);

//If start is true then the balls starts moving; the two lines below ensure the "movement".
if (start) {
  x += xspeed;
  y += yspeed;
  // This if here makes the moving bar " real ", by detecting the ball's position
  if (  x > width-20 && x < width -10 && y > mouseY-bar/2 && y < mouseY+bar/2 ) {
  //This line here tells the ball to "bounce", simply by telling it to go in the opposite direction  
  xspeed = xspeed*-1; }
    //This line applies the same logic to the bar on the left, while adding the score
    else if (x < 10) {
      xspeed= xspeed*-1;
      score = score + 1;
    }
    //Same here for the bounduaries 
    if ( y > height || y < 0 ){
    yspeed= yspeed*-1; }
    
    
    //This is the losing/reset condition
    if (x > width) {
      start = false;
      x = 150;
      y = 150;
      xspeed = random(2,6);
      yspeed = random(2,6);
      score = 0;
    }
  
  
   }
 }








