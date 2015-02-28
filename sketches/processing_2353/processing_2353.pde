
import java.awt.AWTException;
import java.awt.Robot;
import java.awt.Rectangle;
import java.awt.image.BufferedImage;
import integralhistogram.*;

PImage screenShot,imgTarg,imgTarg2;
int gameX,gameY,tempX,tempY;
int bit = 1;
int gameWidth,gameHeight;
boolean enabled,waitingX,waitingY;
PFont fontA;

void setup()
{
  gameWidth=150;
  gameHeight=170;
  
  size(150,170);
  background(0);
  frameRate(15);
  enabled  = true;
  waitingX = true;
  waitingY = true;
  
  imgTarg = loadImage("monster.jpg");
  imgTarg2 = loadImage("boh.jpg");
  
  fontA = loadFont("AmericanTypewriter-24.vlw");
  textFont(fontA, 12);
  
  text("game_X = ",5,20);
}

void draw()
{
  if(enabled == false)
  {
    screenShot = getScreen();
    
    IntHistUser intHist_Test = new MyIntHistUser(screenShot,bit);
    
    TargetUser targetImg = new MyTargetUser(imgTarg,bit,1,0.17);
    targetImg.setOutputImage(screenShot);
    
    /*TargetUser targetImg2 = new MyTargetUser2(imgTarg2,bit,1,0.5);
    targetImg2.setOutputImage(screenShot);*/   
    
    intHist_Test.imageSearch(targetImg);
    //intHist_Test.imageSearch(targetImg2);
    
    image(screenShot,0,0);
  }
}

void keyReleased()
{
    if(enabled)
    {
      if(int(key) == 10 && waitingX == true)
      {
        gameX = tempX;
        waitingX = false;
        text("game_Y = ",5,52);
      }
      else if(int(key) == 10 && waitingY == true)
      {
        gameY = tempY;
        waitingY = false;
      }
      else if(waitingX == true)
      {
        tempX *= 10;
        tempX += int(key) - 48; //only numbers should be typed
        
        text("game_X = " + tempX,5,20);  
      }
      else if(waitingY == true)
      {
        tempY *= 10;
        tempY += int(key) - 48; //only numbers should be typed
        
        text("game_Y = " + tempY,5,52); 
      }
      
      if(waitingY == false && waitingX == false)
      {
        enabled = false;
      }
    }
  
}

PImage getScreen()
{
  GraphicsEnvironment ge = GraphicsEnvironment.getLocalGraphicsEnvironment();
  GraphicsDevice[] gs = ge.getScreenDevices();
  DisplayMode mode = gs[0].getDisplayMode();
  Rectangle bounds = new Rectangle(gameX, gameY,(gameX + gameWidth) ,(gameY + gameHeight));
  BufferedImage desktop = new BufferedImage(mode.getWidth(), mode.getHeight(), BufferedImage.TYPE_INT_RGB);

  try {
    desktop = new Robot(gs[0]).createScreenCapture(bounds);
  }
  catch(AWTException e) {
    System.err.println("Screen capture failed.");
  }

  return (new PImage(desktop));
  
}

