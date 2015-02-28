
// 'An Amazing and Awesome Adventure' -Press the mouse to control the compass and press the r key to roll the dice. 
// This program was created by Kyle Martin.
// The Dice script used, was taken from http://www.openprocessing.org/visuals/?visualID=8226
PImage boardgame;
PImage dice1; 
PImage dice2;
PImage dice3;
PImage dice4;
PImage dice5;
PImage dice6;
PImage piece1;
float piece1x; //the xposition of piece1
float piece1y; //the yposition of piece1
int value = 10000;



void setup ()
{
  size(1000,700);
  boardgame = loadImage("boardgame.jpg");
  dice1 = loadImage("dice1.png");
  dice2 = loadImage("dice2.png");
  dice3 = loadImage("dice3.png");
  dice4 = loadImage("dice4.png");
  dice5 = loadImage("dice5.png");
  dice6 = loadImage("dice6.png");
  piece1= loadImage("piece1.png");
  
  piece1x= 335;
  piece1y= 310;
 imageMode (CENTER);
  }

 void draw ()
{
 
  image(boardgame, width/2, height/2); 
 
  
 
  fill(0);
  text("press 'r' to roll", width/1.4,height/1.052);
  fill(0,0,0,0);
  image(piece1, piece1x, piece1y);
  image(dice1, width/2, height/2);
  
  

   if (keyPressed && key== 'r') // dice will only roll when the r button is pressed

     {
    
      value= (int)random(0,7);
      if (value<2 )

  image(dice1,width/2,height/2);
  fill(255);

}

      if (value<3 && value>1)
    {
  image(dice2,width/2,height/2);
  fill(255);
    
    }
    if (value<4 && value>2)
    {
  image(dice3,width/2,height/2);
fill(255);
    
    }
    if (value<5 && value>3)
    {
  image(dice4,width/2,height/2);
 fill(255);
    
    }
    if (value<6 && value>4)
    {
  image(dice5,width/2,height/2);
  fill(255);
  
    }
    
    if (value<7 && value>5)
    {
  image(dice6,width/2,height/2);
  fill(255);
    }
}
   
   
void mousePressed()
{
  piece1x=mouseX -155;
  piece1y=mouseY -150;
}
void mouseDragged()
{
  piece1x=mouseX -155;
  piece1y=mouseY -150;
}

// sources for images:

// bridge - http://www.clker.com/clipart-wooden-bridge1.html

// mountain - http://us.123rf.com/400wm/400/400/michaelsvoboda/michaelsvoboda0904/michaelsvoboda090400025/4738459-the-beautiful-sierra-mountain-range-with-sage-brush-in-the-foreground.jpg

// start sign - http://www.shutterstock.com/cat.mhtml?safesearch=1&search_type=similar&similar_photo_id=79393810#id=79833028

// finish sign - http://www.shutterstock.com/cat.mhtml?safesearch=1&search_type=similar&similar_photo_id=79393810#id=79833103

// turtle - http://www.clker.com/clipart-15327.html

// palm tree - http://thumbs.dreamstime.com/thumblarge_248/1205609538ZJoqxm.jpg

// water - http://www.portwallpaper.com/imgwal/ocean-view.jpg

// shark - http://www.arthursclipart.org/justforkids/animals/shark.gif

// crab - http://www.drawinghowtodraw.com/stepbystepdrawinglessons/wp-content/uploads/2011/04/finished-cartoon-color-crab.png





