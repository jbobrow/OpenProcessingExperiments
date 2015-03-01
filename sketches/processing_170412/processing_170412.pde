
/////////////////////////////////////////////////////////////////////////
///////////////////Anthony Maxwell Individual Research///////////////////
/////////////////////////////////Sprites/////////////////////////////////
/////////////////////////////////////////////////////////////////////////

//Global Variables

//Kept class in main window to see everything, can be changed later
//Declase Sprite class name
Sprite s;
//Declare Pimage to store sprites
PImage img;
PImage bgImg;
//Number of sprite sheets to be loaded
int maxImg = 2;

//Was once used for an PImage array of sprites to be loaded
//now used as a true false indicator for if mouse button is pressed
int imgIndex = 0;

void setup()
{
  size(800, 400);
  background(255);
  smooth();
  //kept at 5 frames a second to clearly see motion of runing sprite
  //any more and sprite animation movees to quickly
  frameRate(5);
  //loads character sprite and background sprite
  img = loadImage("FistmanSpritesMasterSheet.png");
  bgImg = loadImage("Other Systems - Scott Pilgrim vs the World The Game Xbox 360 - Level 1 - Frozen Suburbs.png");
  //to call upon sprite class in draw
  s = new Sprite();
}

void draw()
{
  background(255);
  //updates sprite movements
  s.update();
  //initial spite declared
  s.display();
}

class Sprite
{
  //global variables for sprite class
  int x, y, w, h;
  int bgx, bgy, bgw, bgh;
  int frames, currentFrame;
  int sx, sy;
  int bgsx, bgsy;

  Sprite()
  {
    //character sprite position/dimensions on screen and final coordinates when read from file
    x = 100;
    y = 100;
    w = 128;
    h = 128;
     //background sprite position/dimensions on screen and final coordinates when read from file
    bgx = 0;
    bgy = 0;
    bgw = 600;
    bgh = 400;
    //frames for animation
    frames = 6;
    //starting fram for animation
    currentFrame = 0;
    //sprites starting coordinates when read from file
    sx = 768;
    sy = 0;
    bgsx = 8;
    bgsy = 28;
  }

  void update()
  {
 //could of had eveything in display() but felt cleaner seprate
 
if (keyPressed)
    { //actions when left key is pressed
      if (keyCode == LEFT)
      {
        //move character sprite to the left by 20
        x-=20;
        //read different line of character sprite sheet
        sy=256;
        //formula to get next animation coordinate in sprite sheet
        sx = currentFrame * w;
     
        if(imgIndex == 1)
        {
          //when imgIndex equals 1 it changes sy coordinites in sprite sheet to change sprite colors and direction
          sy=384;
        }else
        {
          //when imgIndex equals 0 it changes sy coordinites in sprite sheet back to normal
          sy=256;
        }
        

        if (x < 100)
        {
          //when character sprite on screen reaches 100 along the x axis the sprite wont be able to walk off screen to the left
         // and must stay within bounding box but character animation will still play
          x=100;

          if (bgsx > 8)
        {
          //when scrolling bachground reachs 8 along the x axis it stops scrolling to the left
          bgsx-=20;
         
        }
          
        } //actions when left key is pressed
      } else if (keyCode == RIGHT)
      {
        //move character right by 20
        x+=20;
        //read different line of character sprite sheet
        sy=0;
        //formula to get next animation coordinate in sprite sheet
        sx = currentFrame * w;
        
if(imgIndex == 1)
        {
          //when imgIndex equals 1 it changes sy coordinites in sprite sheet to change sprite colors and direction
          sy=128;
        }else
        { //when imgIndex equals 0 it changes sy coordinites in sprite sheet back to normal
          sy=0;
        }
        //sy=128;
        if (x > 400)
        {
          //when character sprite on screen reaches 400 along the x axis the sprite wont be able to walk off screen to the right
         // and must stay within bounding box but character animation will still play
          x=400;
          if(bgsx <500)
          {
            //when scrolling bachground reachs 500 along the x axis it stops scrolling to the right
            bgsx+=20;
          }
        }
      }
    }
 
  }

  void display()
  {
    //read coordinates on sprite sheet to be loaded on screen
    copy(bgImg, bgsx, bgsy, bgw, bgh, bgx, bgy, bgw, bgh);
    copy(img, sx, sy, w, h, x, y, w, h);
    
    //will return character to idle position when no keys are pressed
    sx=768;
    
    if(imgIndex == 1)
        {
           //when imgIndex equals 1 it changes sy coordinites in sprite sheet to change sprite colors
          sy=128;
        }else
        {
          //when imgIndex equals 0 it changes sy coordinites in sprite sheet back to normal
          sy=0;
        }
        //formula will only read first 6 sprites in sprite sheet to animte the character
        //the 7th sprite in the sheet is used for the idle pose
    currentFrame = (currentFrame+1)%frames;
  }
}
void mousePressed()
{
  //imgIndex currently being used as true/false statements for color swapping
  //originally for loading multilpe sprite sheets for character
  if (imgIndex == 0)
  {
    //when mouse is click character will change to alternate color
    imgIndex = imgIndex + 1;
    
  } else
  {
    //when mouse is clicked again character will change back to original character
    imgIndex = imgIndex - 1;
  }
}



