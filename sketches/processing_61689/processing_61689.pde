
//Rules:
//click the screen to trigger a bullet
//try to hit all the stars around the sun to win
//If the bullet hit the sun, then you lose the game
//Game was designed based on Prof. Garrison's Galaxy app.

float solarR=45;
float MercurystarR=20;
float MercuryOrbitRadius=130;
float MarsRadius = 180;
float MercuryAngle=0;
float earthDia=15;
float earthOrbitRadius=220;
float earthAngle=0;
float MarsDia=19;
float MarsOrbitRadius=230;
float MarsAngle=0;
float bulletLen = 10;
 
color solYellow = #FFCC33;
color MercuryBlue = #313CE0;
color MarsRed = #E04030;
color SaturnGreen=#04C93A;
color Cometpink=#F25ACD;


//int value = #313CE0;
//int MercuryValue = #313ce0;

int cometappear = 0;//bullet doesn't appear 
//when the game stars
int yPos = 10000;//The default y coordinate of the bullet

boolean MercuryAlive = true;//the planet's value is true
//means the star hasn't been hit.
boolean earthAlive = true;
boolean MarsAlive = true;
boolean game = true;//when the game value is true,
//you are still playing
 
void setup() {
  size (800, 600);
  smooth();
  noStroke();
}
 
void draw() {
  background(0, 0, 0);
  translate(width/2, height/2);
  //move the origin to the center of the screen
  fill(solYellow);
  if (game)//when game is lasting,sun is drawn
  {
      ellipse(0, 0, solarR*2, solarR*2);
  }
 
  if (MercuryAlive)//when the Mercury is alive,the planet is drawn
  {
      pushMatrix(); //store the origin in the center
      rotate(MercuryAngle);//make the Mercury revolving
      translate(MercuryOrbitRadius, 0);//moving the origin to the Mercuty's orbit
      fill(SaturnGreen);
       
      ellipse(0, 0, MercurystarR*2, MercurystarR*2);
      popMatrix();//release the origin to the center of the screen
  }
    
  if (MarsAlive)//it works the same as the Mercury
  {
      pushMatrix();  
      rotate(MarsAngle);
      translate(MarsRadius, 0);
      fill(MarsRed);
    
      ellipse(0, 0, MarsDia*2, MarsDia*2);
      popMatrix();
  }
  
  if (earthAlive)
  {
      pushMatrix(); 
      rotate(earthAngle);
      translate(earthOrbitRadius, 0);
      fill(MercuryBlue);
       
      ellipse(0, 0, earthDia*2, earthDia*2);
      popMatrix();
  }

  if (cometappear == 1 && yPos > 0)
  // when the bullet is triggered but before it hits any targe
  {
    fill(Cometpink);
    //draw the bullet
    ellipse(0, yPos , bulletLen*2, bulletLen*2);
  }
  else
  //or in other cases, it disappears
  {
    cometappear = 0;
  }
  
    if (abs(MercuryAngle - PI / 2) < 0.001 && MercuryAlive)
  {//see whether the bullet hits the Mercury
    if ((MercuryOrbitRadius + MercurystarR <= yPos + bulletLen && MercuryOrbitRadius + MercurystarR >= yPos - bulletLen) ||
    (MercuryOrbitRadius - MercurystarR <= yPos + bulletLen && MercuryOrbitRadius - MercurystarR >= yPos - bulletLen) ||
    (MercuryOrbitRadius - MercurystarR <= yPos - bulletLen && MercuryOrbitRadius + MercurystarR >= yPos + bulletLen))//
    {
      cometappear = 0;
      yPos = -1;
      MercuryAlive = false;
    } 
  }
  //Tricky Collision Function
  if (abs(MarsAngle - PI / 2) < 0.001 && MarsAlive)
  {//to see if the Mercury goes to the position that can be hit by the bullet
    if ((MarsRadius + MarsDia <= yPos + bulletLen && MarsRadius + MarsDia >= yPos - bulletLen) ||
    (MarsRadius - MarsDia <= yPos + bulletLen && MarsRadius - MarsDia >= yPos - bulletLen) ||
    (MarsRadius - MarsDia <= yPos - bulletLen && MarsRadius + MarsDia >= yPos + bulletLen))
    {//if at the moment, the bullet is also on that position, the Mercury is hit by the bullet
      cometappear = 0;
      yPos = -1;
      MarsAlive = false;
    } 
  }
   //earth works the same as the Mercury
   if (abs(earthAngle - PI / 2) < 0.001 && earthAlive)
  {
    if ((earthOrbitRadius + earthDia <= yPos + bulletLen && earthOrbitRadius + earthDia >= yPos - bulletLen) ||
    (earthOrbitRadius - earthDia <= yPos + bulletLen && earthOrbitRadius - earthDia >= yPos - bulletLen) ||
    (earthOrbitRadius - earthDia <= yPos - bulletLen && earthOrbitRadius + earthDia >= yPos + bulletLen))//ç¢°æ’žå‘ç”Ÿäº†
    {
      cometappear = 0;
      yPos = -1;
      earthAlive = false;
    } 
  }
  

     //setting the revolusion angle
 MercuryAngle += PI / 128;
  if (MercuryAngle >= TWO_PI)
  {
    MercuryAngle = 0;
  }
  MarsAngle += PI / 256;
  if (MarsAngle >= TWO_PI)
  {
    MarsAngle = 0;
  }
  earthAngle += PI / 64;
  if (earthAngle >= TWO_PI)
  {
    earthAngle = 0;
  }
  //to set the speed of the bullet
  yPos -= 2;
  
  if (yPos > 0 && yPos - bulletLen < solarR)//æ’žä¸Šå¤ªé˜³äº†ï¼Œgame over
  {// if the bullet hit the sun, game is over
  // everything disappears
    game = false;
    earthAlive = false;
    MarsAlive = false;
    MercuryAlive = false;
    cometappear = 0;
    yPos = 3;
    // "game over" is presented on the screen
   text("GAME OVER", -100, 0, 100, 100); 
  }
  
  if (!earthAlive && !MarsAlive && !MercuryAlive && game)
  {//if all the planets are hit by the bullet
  //you win the game
    game = false;
    text("YOU WIN", -100, 0, 100, 100); 
  }
  
}
// the function of trigger the bullet
void mouseClicked() 
{
  if (cometappear == 0 && game)
  {
    cometappear = 1;
    yPos = height / 2;
  }
}
