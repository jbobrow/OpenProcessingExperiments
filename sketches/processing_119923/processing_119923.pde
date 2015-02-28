
//25/10/2013 Ross Mckechnie boxman
int x = 215;
int y = 45;
int ballx = 300; //ball current loction x
int bally = 300; //ball current loction y
int score = 0; // Its the score
int ballspawn = 1; // spawn loction number
int spawnloctionx = 80; //spawn loction of ball x 
int spawnloctiony = 80; //spawn loction of ball y
int rfootx = +5; // right foot spawn loction in relation to int x
int lfootx = -15; // left foot spawn 
int rfooty = +50;
int lfooty = +50;

void setup() {
  size (600,800);
}



void draw()

{   background(100,200,100);
  if (keyPressed && (key == CODED))
  {
  if (keyCode == LEFT) {
    x--; x--; rfootx--; lfootx++; lfooty = +50; rfooty = +46;
  }else if (keyCode == RIGHT) {
    // If it's the right arrow
    x++; x++; rfootx++; lfootx--; lfooty = +50; rfooty = +46;
  }else if (keyCode == UP) {
    y--; y--; rfooty--; lfooty++; lfootx = -15; rfootx = +5;
  }else if (keyCode == DOWN) {
    y++; y++; rfooty--; lfooty++; lfootx = -15; rfootx = +5;
    }
  }
    if (rfooty > +61) // when foots y axis reaches 61 from boxman int y it will be set back to 45
  {rfooty=+45;}
  
  if (rfooty < +44)
  {rfooty=+60;}
  
    if (lfooty < +44)
  {lfooty=+60;}
  
      if (lfooty > +61)
  {lfooty=+45;}
  
  
  if (rfootx > +6)
  {rfootx=-15;}
  
  if (rfootx < -16)
  {rfootx=+5;}
  
    if (lfootx < -16)
  {lfootx=+5;}
  
      if (lfootx > +6)
  {lfootx=-15;}
  
   if (y > 802)
   {y=-1;} // when boxman goes over off the bottem of the window he will teleport to -1
   
   if (bally > 802)
   {bally=-1;}
   
   if (x > 602)
   {x=-1;}
   
   if (ballx > 602)
   {ballx=-1;}
   
      if (y < -2) // if boxman walks off to the top of the window he will be reset on bottom
   {y=801;}
   
   if (bally < -2) // same goes for the ball
   {bally=801;}
   
   if (x < -2) 
   {x=601;}
   
   if (ballx < -2)
   {ballx=601;}
  
  // if ball is near ball loccation will be tyed to dude loction
 if ((y > bally-20) && (y < bally+20) && (x > ballx-20) && (x < ballx+20)) {
   bally=y+10; ballx=x;}

   // if the ball is in centrebox the ball will spawn in ball spawn 1
  if ((ballx > 250) && (bally > 350) && (ballx < 350) && (bally < 450)) {
  bally=spawnloctiony; ballx=spawnloctionx; score += 100; ballspawn += 1;}

 if (ballspawn == 2)
 {spawnloctionx = 400; } // changes ball spawn loction
 
  if (ballspawn == 3)
 {spawnloctiony = 700; }
 
   if (ballspawn == 4)
 {spawnloctionx = 80; }
 
   if (ballspawn == 5)
 {spawnloctiony = 80; ballspawn = 1;  } // resets to first loction
 
 
  
fill(50);
textSize(40);
   text("score :" +score, 10, 50); // scoreboard
   
fill(204, 102, 0);
rect(250,350,100,100); //drop point for ball centrebox

fill(200,100,40);        // head and body
rect(x-25,y+20,10,10);   // arms
rect(x+15,y+20,10,10);   // arms
rect(x+lfootx,y+lfooty,10,10);   // left foot
rect(x+rfootx,y+rfooty,10,10);    // right foot
rect(x-10,y+5,20,40);    // body
rect(x-13,y-15,26,30,5); // head
fill(255);               
ellipse(x-5,y-8,6,6);    // left eye
ellipse(x+5,y-8,6,6);    // right eye
rect(x-15,y+2,30,20);    //beard
ellipse(x,y,6,6);        // nose
rect(x-10,y+5,20,5);     // mouth

fill(255);
ellipse(ballx,bally,40,40); // this is the ball
}



