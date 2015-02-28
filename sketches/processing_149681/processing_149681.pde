
/* Pong Game Desinged By Sheriff Adegoke #BDBreeze */ 
//Password = play 

int x, y, speedX, speedY;
int LPx, LPy, SpeedLPx, SpeedLPy;
int RPx, RPy, SpeedRPx, SpeedRPy; 
String userInput = "", pass = "";
int passLength = 0;
boolean matched = false; // Password Screen
boolean matchedPS1 = false; // Player 1 Name Screen
boolean matchedPS2 = false; // Player 2  Name Screen
boolean matchedGS = false; // Game Screen
boolean matchedIS = false; // Intro Screen
PFont ChosenFont;
String P1Input = "", StoredName1 = "";
int Length1 = 0;
String P2Input = "", StoredName2 = "";
int Length2 = 0;
int P1Score = 0; int P2Score = 0; // Player Scores to be displayed
String PasswordV;
/*
char p;
p = '112';
char l;
l = '108';
char a;
a = '97';
char 121;
121 = 'y'; 
*/

void setup()
{ 
  size(800,600);
  x = 400; y = 300; speedX = 2; speedY = -2;
  LPx = 10; LPy = height/2; RPx = 790; RPy = height/2;
  ChosenFont = loadFont("CenturyGothic-Italic-48.vlw");
  textFont(ChosenFont, 15);
   if(matched == false)
 {
  PasswordV = " NO";
 } 
}

void draw()
{
  background(0);
  text("Welcome to B'D'Pong", 310, 20);
  text("Does the input match code: " + PasswordV, 0, height/2 - 20);
  text("Enter code here:" + userInput, 0, height/2 - 70);
  
   if(matched == true) 
  {
    fill(255,255,0); //if password is correct make font yellow.
    rect(380, 500, 60,30); // display next box.
    text("To Continue", 370,495); // text to go into box.
    text("Click On Box", 365,550);
    PasswordV = " YES";
    
  
  if(mousePressed)
  {if(mouseX >= 380 && mouseX <= 440)
   { if(mouseY >= 500 && mouseY <= 530)
    { 
      matchedPS1 = true;// what to run if mouse is clicked in box. 
    }
   }
  }
  
  if(matchedPS1 == true)
  {
  background(0);
  fill(255,0,0);
  text("Saved Player Name", 350, 20);
  text("Player 1 Name: " + P1Input, 0, height/2 - 70);
  text("Type Name & Press Enter To Save: " + StoredName1, 0, height/2 - 20);
  }
 
 if(StoredName1 != "") // if player name 1 is set
 {
   matchedPS2 = true;
 } // allow Player Screen 2 to run.
  
  if(matchedPS2 == true) 
  {
  fill(0,0,255);
  background(0);
  text("Saved Player Name", 350, 20);
  text("Player 2 Name: " + P2Input, 0, height/2 - 70);
  text("Type Name & Press Enter To Save " + StoredName2, 0, height/2 - 20);
  }  // display Player Detail Screen for player 2.
  
  if(StoredName2 != "") //if player name 2 is set
  {
    matchedIS = true; 
  } //allow Intro Screen to run 
}
  if(matchedIS == true)
   {
    IntroScreen();
   } // if Player 2's name has been entered display introduction screen.
   if(matchedGS = true && matchedGS == true)
   {
     GameInterface();
     drawPaddles();
     ballBounce();
   }
   
    if(P1Score >= 50 || P2Score >= 50)
  {
      EndScreen();
  } //if player reaches score of 50 display winner screen



}



////////////////////////////////////////////////////////////////////////////

void keyPressed()
{
  String pass = "11210897121"; // the password is play.
  if(key != CODED)
  { 
    userInput += key; 
  }
  if(keyCode == BACKSPACE)
  { 
    userInput = ""; //clear field if backspace is pressed.
  }
  
  if(userInput.equals(pass))
  {
    matched = true;
  } // if password entered is correct turn matched to true.
  
  if(matchedPS1 == true && matchedPS2 != true)
  {
     if(key != CODED)
     P1Input += key;
     if(keyCode == ENTER)
  {
    Length1 = P1Input.length();
    StoredName1 = P1Input.substring(0, Length1);
    P1Input = ""; 
  }
  
    if(keyCode == BACKSPACE)
    P1Input = "";
  }
  
   if(matchedPS2 == true)
  {
     if(key != CODED)
     P2Input += key;
     if(keyCode == ENTER)
  {
    Length2 = P2Input.length();
    StoredName2 = P2Input.substring(0, Length2);
    P2Input = ""; 
  }
  
    if(keyCode == BACKSPACE)
    P2Input = "";
  }
 
  if(matchedIS == true)
  {
    IntroScreen();
  }
  
  if(matchedGS == true)
  {
    GameInterface();
  }
 
}

////////////////////////////////////////////////////////////////////////////

void ballBounce()
{   
  fill(255);
  ellipse(x,y,20,20);
  
   x = x + speedX;
   y = y + speedY;
  
  
  
  if(x + 10 == RPx - 10)
  {
    if(y <= RPy + 40 && y >= RPy - 40)
    { speedX = speedX * -1;}
  } // to reflect paddle on right paddle
  
  if(x - 10 == LPx + 10)
  {
    if(y <= LPy + 40 && y >= LPy - 40)
    { speedX = speedX * -1;}
  } // to reflect ball on left paddle
  
  if(x <= -10)
  {
    x = width/2;
    y = height/2;
    speedX = speedX * -1;
  } // to reset ball to center if out of bounds on the left
  
  if(x - 10 >= width)
  {
    x = width/2;
    y = height/2;
    speedX = speedX * -1;
  } // to reset ball to center if out of bounds on the right
  
  if(y - 10 <= 0)
  {
    speedY = speedY * -1;
  } // to bounce ball off top wall
  
  if(y + 10 >= height)
  {
    speedY = speedY * -1;
  } // to to bounce ball off bottom wall 
  
  if(x <= 0)
  { 
    P2Score = P2Score + 1;
  } // to increment score for player 2
  
  if(x >= width)
  {
    P1Score = P1Score + 1;
    
  } // to increment score for player 1
}

//////////////////////////////////////////////////////////////////////////////////////////////

void GameInterface()
{
 background(0);
 for(int i = 0; i < 500; i = i + 10)
 {
   fill(255,250,0);
   rect(width/2, i*2, 3,8);
 } // to draw center dotted line
 
 text("" + StoredName1, 180, height/2 + 40);
 text("" + StoredName2, 580, height/2 + 40);
 fill(255,255,255,100);
 text("" + P1Score, width/4, height/2);
 fill(255,255,255,100);
 text("" + P2Score, width/4*3, height/2);

}


///////////////////////////////////////////////////////////////////////////////////////////////
void drawPaddles()
{
  rectMode(CENTER);
 
  LPx = 10; LPy = height/2;
  


if(mouseX < width && mouseY < height)
{
  LPy = mouseY;
} //to make left paddle co ordinates the same as mouse position
if(LPy + 240  >= width)
 {
   LPy = 560;
 } // to keep left paddle on screen
 else if(LPy - 40 <= 0)
 {
   LPy = 40;
 } // to keep left paddle on screen

if(keyPressed)
{if(keyCode == UP)
 {
   RPx = 790;
   RPy = RPy -10;
   SpeedRPx = 0;
   SpeedRPy = 0;
 } // to move right paddle up when up is pressed 
 else if(keyCode == DOWN)
 {
   RPx = 790;
   RPy = RPy + 10;
   SpeedRPy = 0;
   SpeedRPx = 0;
 } // to move right paddle down when down is pressed 
 if(RPy + 240  >= width)
 {
   RPy = 560;
 } // to keep right paddle in screen
 else if(RPy - 40 <= 0)
 {
   RPy = 40;
 }
}


 RPx = RPx + SpeedRPx;
 RPy = RPy + SpeedRPy;

stroke(100);
fill(0,0,255);
rect(RPx,RPy,20,80); // right paddle  
fill(255,0,0); 
rect(LPx,LPy,20,80); // left paddle


}
/////////////////////////////////////////////////////////////////////////////////////////

void EndScreen() // ** This is an extra feature ** I have created this function to display a screen that displays the name of the winner when a score of 50 has been reached
 {
  if(P1Score >= 50)
  {
   fill(10,250,0);
   text(StoredName1 + " Wins!", width/2-30, height/2);
  } // displays "Player 1 Wins!" if Player 1 Reaches 50. 
  
  else if(P2Score >= 50)
  {
    fill(10,250,0);
    text(StoredName2 + " Wins!", width/2-30, height/2);
  }
}
//////////////////////////////////////////////////////////////////////////////////////////////

void IntroScreen() // ** This is an extra feature ** I have created which includes a diagram of the game along with instructions on how to operate the game. 
{
  background(0);
  textFont(ChosenFont, 30);
  fill(255,255,0);
  text("How To Play Pong", width/4 + 80, 50);
  textFont(ChosenFont, 15);
  fill(255,0,0);
  text("The LEFT paddle is controlled by moving mouse up and down.", 10, 350);
  fill(0,0,255);
  text("The RIGHT paddle is controlled by using UP & DOOWN arrow key.", 300, 150);
  fill(255,255,0);
  text("The aim is to knock the ball beyond the opposing players paddle.", width/4 - 50, height - 130);
  text("The ball must hit the front of the paddle.", width/4 + 30, height - 100); 
  text("The first player to reach a score of 50 WINS!", width/4 + 17, height - 70);
  noStroke();
  fill(255,0,0);
  rect(350,200,10,30);
  fill(0,0,255);
  rect(440,270,10,30);
  for(int i = 100; i < 150; i++)
    {
     fill(255,250,0);
     rect(400, i*2, 2,2);
    }
  fill(255);
  ellipse(410,290,10,10);
  fill(255);
  stroke(100);
  line(350,200,450,200);
  line(350,300,450,300);
  noStroke();
  if(mousePressed)
   {
     matchedGS = true;
   }
}
