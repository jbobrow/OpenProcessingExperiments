
//Declare an object of class Boat
Boat myBoat1;

//Declare variables
int xPos=300;
int yPos=300;
float xPos_Waves;
float yPos_Waves;
int time;

//Create array for waves
Waves[] myWaves = new Waves[5];

void setup()
{   
  
size(600,600);

//Make objects of class Waves
for (int i = 0; i < 5; i++)
{
myWaves[i] = new Waves(random(600), random(600));
}

//Make object of class Boat
myBoat1 = new Boat();

}
 
 
void draw()
{ 
  
//Sea background
fill(32,71,99,250);
rect(0,0,600,600);
smooth();

  //Call waves
  for (int i = 0; i < 5; i++){
  myWaves[i].display();
  myWaves[i].move();

}

//Call boat
myBoat1.display();
myBoat1.move();

//Draw pier
noStroke();
fill(139,69,19);
translate(0, 0);
rotate(radians(30));
rect(25, 50, 150, 50, 7);

}
 
//Draw waves
class Waves
{
  
  //Set the positions as temp
  Waves(float temp_xPos, float temp_yPos) 
  {
    xPos_Waves = temp_xPos;
    yPos_Waves = temp_yPos;
  }
  
  void display()
  {
   
   stroke(255);
   noFill();
   
   //Draw waves
   for (int movey = 0; movey<660; movey = movey+60)
   {
       for (int movex=0; movex<660; movex = movex+60)
       {
  
  arc(movex+xPos_Waves,movey+yPos_Waves,60,60,HALF_PI,PI);
  arc(movex+xPos_Waves,movey+yPos_Waves,60,60,PI+HALF_PI,TWO_PI);
  
       }
   }
   
  }
  
  void move()
  {
    
  //Alter coords of positions
   xPos_Waves = xPos_Waves + 1;
   yPos_Waves = yPos_Waves + 1;
   
  //If waves reach a point of the screen, go to left
  if (xPos_Waves > width/10) {
  xPos_Waves = 0;
  }
   
  //If snow reaches bottom, go to top
  if (yPos_Waves > height/10) 
  {
    
  yPos_Waves = 0;
   
  }
  
  }
    
    
    
}

//Draw boat
class Boat
{
  
  void display()
  {
    
//Set pen colour to black
stroke(0);
//Set pen width
strokeWeight(2);
//Set line to rounded
strokeCap(ROUND);
 
//Boat body colour
fill(255,13,13);
 
//Boat body

arc(xPos,yPos,80,80,0,PI-QUARTER_PI,CHORD);
 
//Boat mast pole

line(xPos+5,yPos+12,xPos-20,yPos-35);
 
//Boat mast
//Set boat mast colour to white
fill(255);

triangle(xPos-2,yPos-5,xPos-20,yPos-35,xPos+50,yPos-25);
 
//Number on mast
//Set boat mast number to black
fill(0);

//Set text size to 12
textSize(12);

//Set number on boat mast to 11
text("11",xPos,yPos-15);
 
    
  }
  
  //Move boat set number of pixels if arrow key is pressed
  void move()
  {
      if (keyPressed){
     
    if (keyCode == LEFT){
      xPos = xPos - 10;
    }
    if (keyCode == RIGHT){
      xPos = xPos + 10;
    }
    if (keyCode == UP){
      yPos = yPos - 10;
    }
    if (keyCode == DOWN){
      yPos = yPos + 10;
    }
      }
  }
}
  
  



 

   

 
 



