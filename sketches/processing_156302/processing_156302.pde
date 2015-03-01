
int xPos;
int yPos;
char you = 'X';

PFont myFont;
boolean onoff = false;



void setup() 
{
  size (400,400);
  smooth();
  background(255);
  myFont = loadFont("Courier-14.vlw");
  xPos = width/2;
  yPos = height/2;

  
}

void draw() 
{

    //TEXT DISPLAY
  
    if(frameCount>200)
    {
      fill(0);
      text("FIND ME", 25, 50);
    }
    
    if(frameCount> 400)
    {
      fill(0);
      text("USE ARROW KEYS TO NAVIGATE", 25, 75);
    }
    
    if(frameCount> 600)
    {
      background(255);
    }


  
// X and movement
    
  fill(0);
  textFont(myFont, 14);
  text(you,xPos,yPos);
    
    //x
    if(xPos > width) 
    {
    text(you,(xPos-width),yPos);
    }
    
    if(xPos < width)
    {
    text(you,(xPos+width),yPos);
    }   
    
    //y
    
    if(yPos > height) 
    {
    text(you,xPos,(yPos-height));
    }
    
    if(yPos < height)
    {
    text(you,xPos,(yPos+height));
    }   
    
    
  //HOT/COLD
  if(xPos > 350 || yPos < 50)
    {
    background(5,0,255);
    }
  if(xPos > 250 || yPos < 150)
    {
    background(0,180,255);
    }
  if(xPos > 200 || yPos < 200)
    {
    background(0,255,244);
    }
  if(xPos < 200 || yPos > 200)
    {
    background(255,230,0);
    }
  if(xPos < 150 || yPos > 250)
    {
    background(255,130,0);
    }
  if(xPos < 100 || yPos > 300)
    {
    background(255,60,0 );
    }
if(xPos < 50 || yPos > 350)
     {
    background(255,0,0);
     }
    
  if((xPos < 10) && (yPos > 475))
    {
    fill(0);
    text("YOU FOUND ME!", width/2, height/2);
    }

}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
     
      text(you,xPos,yPos--);
    }  
    if (keyCode == DOWN) {
      
      text(you,xPos,yPos++);
    }
     if (keyCode == LEFT) {
      
      text(you,xPos--,yPos);
    }  
    if (keyCode == RIGHT) {
      
      text(you,xPos++,yPos);
    }
    
    
  
  }
 
}
