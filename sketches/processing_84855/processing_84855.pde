
boolean gameOver = true; //Set gameover boolean to true 
void setup ()
{
size(600,400); // Set sketch window size to 600 x 400
}
float ballX = 0; // Set float value of ballX to 0
float ballY = 0; //  Set float value of ballY to 0
float speedX = 1; //  Set float value of speedX to 1 so that it moves across the screen at a steady pace
float speedY = 2; //  Set float value of speedY to 2 so that it is reasonbly fast as going up and down the screen.
int score = 0;    // Set score to 0
int life = 5;     // Set life to 5



void draw()
{ rect(50,50,50,50);
if(score ==40){ // If score is 40 then the gameover boolean is true and it restarts the game with the life set back to 5 and the score 0.
                // The screen also goes white for a very brief moment.
life = 5; score = 0;
gameOver = true;
 fill(255,0,0);
} 

float paddle = 1000/(score+10);
if (ballX < 0 || ballX > width) speedX = - speedX; // If ball is less than 0 or ballX is greater than the width the speedX value decreases making the ball go back across the screen again.
if (ballY > height){ // If ballY is greater than the height then the speed of ballY decreases causing it to go back the screen again. 
speedY = - speedY;
float distance = abs(mouseX - ballX);
if (distance < paddle) score += 1; // If the distance is less than the paddle the score goes up by 1 aka if the paddle if the ball hits the paddle the score goes up by 1
else life += -1; //If the ball misses the paddle you loose a life
}else speedY += 1; // Also if you miss or score the speedY value goes up causing the the ball to move back up the screen

ballX += speedX; // The position of ballX is moving across the screen at the same rate as speedX
ballY += speedY; // The position of ballY is moving up and down the sceen at the same rate as speedY

background (255); //Background set to white
noStroke(); // No stoke colour

fill(255,0,0); // Ball colour set to red
ellipse(ballX,ballY, 50, 50); //ball position in accordance to ballX and ballY values. Ball dimensions 50x50.
fill(50,100,200); // Colour of paddle set to blue
rect (mouseX-paddle, height-10, 2*paddle, 10); // Mouse position is at the centre of paddle at all times. The paddle is up 10 from the bottom of the screen. Paddle distance across screen is set to 200.

fill(0); // Colour of writing set to black
text("score: " + score, 500, 20); // Everytime you score the score value goes up by 1. 500 x 20 is the position of the score board on the sketch window.
text("life: " + life, 515, 40); // Everytime you lose a life the value goes down by 1. 515 x 40 is the position of the number of lives on the sketch window.
}



