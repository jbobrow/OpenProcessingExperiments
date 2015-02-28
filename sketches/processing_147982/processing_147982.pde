
/* supposed to create music player for your ear-holes 
import ddf.minim.*;
Minim minim;
AudioPlayer player;
*/
float timer = 10;
int gameState = 0;
int clickCount = 0;


// this creates our lord and savior, michael cera
PImage cera;
 
 
int PLAY_STATE = 0;
int GAMEOVER_STATE = 1;
int WIN_STATE = 2;
 
int WIN_CLICK_COUNT = 100;
 
void setup()
{
  size(500, 500);
  
  /* how does one get the sound player working
  minim = new Minim(this);
  player = minim.loadFile("song.ogg");
  player.play();
   */
  textSize(25);
  cera = requestImage("cera.jpg");
}
 
void draw()
{
  background(0);
   
  if (cera.width > 0)
  {
    float alphaColor = ((float)clickCount / (float)WIN_CLICK_COUNT);
     
    alphaColor =  alphaColor * 255;
     
    tint(255, alphaColor);
    image(cera,0,0,width,height);
  }
   
  if (gameState == PLAY_STATE)
  {
    timer -= 0.0167;
   
    if (timer < 0)
    {
      timer = 0;
       
      if (clickCount < WIN_CLICK_COUNT)
      {
        gameState = GAMEOVER_STATE;
      }
      else
      {
        gameState = WIN_STATE;
      }
    }
     
    fill(255);
    text("TIME: " + (int)timer, 0, 30);
  }
   
  if (gameState == GAMEOVER_STATE)
  {
    fill(255, 0, 0);
    textSize(50);
    text("FAILURE!", 140, 150);
  }
   
  if (gameState == WIN_STATE)
  {
    fill(0, 255, 0);
    textSize(50);
    text("CERA HAS BEEN", 50, 100);
    text("SUMMONED!", 100, 150);
  }
 
  textSize(25);
  text("CLICK COUNT: " + clickCount, 280, 480);
}
 
void keyReleased( )
{
  if (gameState == PLAY_STATE)
  clickCount += 1;
   
  }


