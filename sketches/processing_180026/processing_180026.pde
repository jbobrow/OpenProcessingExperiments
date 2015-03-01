
import processing.video.*;
PImage img;
PImage only;
Capture cam;
Screen mainScreen;
Click firstClick;
Camera myCamera;
Take camTake;
Exit myExit;

Start myStart;

void setup() 

{
  size(1350,720);
  smooth();
  frameRate(30);
  myStart = new Start();
  
  camTake = new Take(355,100,640,480);
  mainScreen = new Screen("background");
  firstClick = new Click(110,620,250,80);
  myCamera = new Camera(625,608,100,100);
  cam = new Capture(this);
  cam.start();
  myExit = new Exit(1300,0,50,50);
  
}


void draw() 

{ 
  
   
  mainScreen.display();
  mainScreen.sequence();
  myCamera.yes();
  firstClick.yes(); 
  camTake.area();
  myExit.area();
  myStart.keyPressed();
  myStart.show();
  
  
}

void mousePressed()

{
firstClick.mousePressed();
myCamera.mousePressed();
camTake.indicate();
camTake.mousePressed();
myExit.mousePressed();
}


class Camera

{ // begining of class
  
boolean camButton = false;
int mX;
int mY;
int w;
int h;


Camera(int CX, int CY, int CW, int CH)
     
{
mX = CX;
mY = CY;
w = CW;
h = CH;
}
  
void yes()

{
  if (camButton) 
  
   {
        
    if (cam.available() )
      
      {
      cam.read();
      image(cam, 355, 100);
      
      strokeWeight(10);
      stroke(#FF6FCF);
      noFill();
      rect(355, 100, 640, 480);
      
      fill(#FF6FCF);
      textSize(30);
      text("Press the SCREEN to save your picture!",width/2,height/2-200);
      } 

   }
     ellipseMode(CORNER);
     noStroke();
     noFill();
     ellipse(mX,mY,w,h);
     
} // end of void yes

void mousePressed ()

{
   
  if (mouseX > mX && mouseX < mX+w && mouseY > mY && mouseY < mY+h) 
      
      {
      camButton = !camButton;
      }
    
} // end of void display

void no()

{
   
  if (mouseX > mX && mouseX < mX+w && mouseY > mY && mouseY < mY+h) 
      
      {
      camButton = camButton;
      }
    
} // end of void display


} // end of class
class Click

{ // begining of class

boolean button = false;
Screen prevScreen;
int mX;
int mY;
int w;
int h;

     Click(int CX, int CY, int CW, int CH)
     
{
mX = CX;
mY = CY;
w = CW;
h = CH;
}

  
void yes()

{
  if (button) 
  
      {
      prevScreen = new Screen("previous_week");
      prevScreen.display();      
      //prevScreen.logo();
      }
      
  
  noStroke();
  noFill();
  rect(mX,mY,w,h);
     
} // end of void yes

void mousePressed ()

{
   
  if (mouseX > mX && mouseX < mX+w && mouseY > mY && mouseY < mY+h) 
      
      {
      button = !button;
      }
        
} // end of void display

} // end of class
class Exit

{ // begining of class
 

int mX;
int mY;
int w;
int h;

Exit(int CX, int CY, int CW, int CH)
     
{
mX = CX;
mY = CY;
w = CW;
h = CH;
}
  
void area()

{    
  
     noStroke();
     noFill();
     rect(mX,mY,w,h);
     img = loadImage("bama_gobo.png"); // backgrounnd guide image
     img.resize(50,50);
     image(img,1300,0);  // location of the guide image 
     
     
} // end of void yes

void mousePressed ()

{
   
  if (mouseX > mX && mouseX < mX+w && mouseY > mY && mouseY < mY+h) 
      
      {
      exit();
      }
    
} // end of void display

} // end of class
class Screen 

{ // begining of class
    
    String name;
    PImage[] images = new PImage[8];
    
Screen(String Callname) 

    {
    name = Callname;
    }

void display() //display the background layer

    {
    img = loadImage(name+".png"); // backgrounnd guide image
    image(img,0,0);  // location of the guide image  
    }
    
void sequence() //display the picture layer
 
{ 
     int x = 98;
     int y = 140;
     
     for (int i = 0; i < images.length; i++) 
         {
         
         images[i] = loadImage("SELFIE"+i+".png"); 
         
         }
     
     for (int l = 0; l < 8; l++)
{
         
         image(images[l],x,y,270,200);
         img = loadImage("heart.png");
         tint(255,50);  // opacity 
         image(img,0,0);  // location of the small images
         noTint();

         x = x + 295;
         
  if (x > 1180) 
      {
        x = 98;
        y = y + 240;
      }
  
  if (y > 720)
     {
       y = 140;
     }
      
}
         
} // end of void sequence

void logo()

{
   img = loadImage("bama_gobo.png"); // backgrounnd guide image
   img.resize(100,100);
   image(img,110,130);  // location of the guide image 
}

} // end of class
class Start

{

boolean showTitleScreen = true;  
float opacity = 0;

  
Start()
{

}
  
void keyPressed() 

{
  if (showTitleScreen) 
  {
    if (key == ENTER) 
     {
      showTitleScreen = false;
     }
  }

} // end of void

void show() 

{ 
  
  if (showTitleScreen) {
    background(0);

    textSize(36);
    textAlign(CENTER);
    text("PhotoMosaic 2.1", width/2, 100);
    textAlign(CENTER);
    textSize(30);
    text("Press  ENTER  to start.", width/2, 660);
   
    only = loadImage("bama_gobo.png"); // backgrounnd guide image
    only.resize(500,500);
    image(only, width/2-250,height/2-250);  // location of the guide image
  }
  
  
  

}

}  //end of class

  
  
  
  
  
  

class Take

{ // begining of class
 

int mX;
int mY;
int w;
int h;
int number = 0;

Take(int CX, int CY, int CW, int CH)
     
{
mX = CX;
mY = CY;
w = CW;
h = CH;
}
  
void area()

{
     noStroke();
     noFill();
     rect(mX,mY,w,h);
     
} // end of void area

void mousePressed ()

{
   
  if (mouseX > mX && mouseX < mX+w && mouseY > mY && mouseY < mY+h) 
      
      {
      
      cam.save("SELFIE" + number + ".png");
      number = number + 1;
      
     if (number > 7)
       {
         number = 0;
       }
       
      myCamera = new Camera(625,608,100,100);
      myCamera.mousePressed();
      }
    
} // end of void display

void indicate()

{
  if (mouseX > mX && mouseX < mX+w && mouseY > mY && mouseY < mY+h) 
      
      {
      fill(#FF6FCF,100);
      rect(355,100,640,480);
      textSize(50);
      fill(#FF6FCF);
      text("Saving...",width/2,height/2);
      }
}

} // end of class


