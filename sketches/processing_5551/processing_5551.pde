
PImage backgroundOne,moireOne;         //loads image


int savedTime;
int totalTime = 6000;


float testX = 0;                      // variables for spinning discs 1-4
float testX2 = 0;
float testX3 = 0;
float testX4 = 0;
float testX5 = 0;
float testY = 0.0;
float testY2 = 0.0;
float testY3 = 0.0;
float testY4 = 0.0;
float testY5 = 0.0;
float speed = 1.0;
int testS = 400;
int testS5 = 600;
boolean mouseOverCircle = false;      
boolean mouseOnCircle = false;

float moveX = 0.0;
float moveY = 0.0;




void setup(){
  size(800,800);
  savedTime = millis();
  smooth();
  
  
  testX = width/2;  
  testX2 = width/2;
  testX3 = width/2;
  testX4 = width/2;
  testY = height/2.0;
  testY2 = height/2.0;
  testY3 = height/2.0;
  testY4 = height/2.0;
 
 
  
  backgroundOne = loadImage("backgroundOne.png");          //loading images
  moireOne = loadImage("moireOne.gif");
}

void draw (){
  
  int passedTime = millis() -savedTime;              //counting time of running sketch
  if (passedTime > totalTime)                       // testing if the amount of time passed is greater than our predetermined 6000milliseconds 
                                                   // If the time passed is greater than 6000 milliseconds, then print a line saying, "zoooom"
                                                  // and allow the discs to move more quickly
  {
    println( "zoooom");
    
    savedTime = millis();
    testX = testX + speed;                        
  testX2 = testX2 - speed;
  testY3 = testY3 + speed;
  testY4 = testY4 - speed;
  
  if ((testX > width-400) || (testX < 0))      
  {
    speed = speed * -3;
  }
  if ((testX2 > width-5) || (testX2 < 0))
  {
    speed = speed / -3;
  }
  if ((testX3 > height-5) || (testX3 < 0))
  {
    speed = speed * -3;
  }
  if ((testX4 > height-5) || (testX4 < 0))
  {
    speed = speed / -3;
  }
  }
  
  
 
image (backgroundOne, 0, 0);
 
image(moireOne, testX5+101, testY5+101, testS5, testS5); 
image(moireOne, testX, testY, testS, testS);                       //places the discs in four opposing corners
image(moireOne, testX2-400, testY2-400, testS, testS);
image(moireOne, testX3-400, testY3, testS, testS);
image(moireOne, testX4, testY4-400, testS, testS);

    
    
  testX = testX + speed;                        //prevents spinning discs from "disappearing" off-screen
  testX2 = testX2 - speed;
  testY3 = testY3 + speed;
  testY4 = testY4 - speed;
  
  if ((testX > width-400) || (testX < 0))      //if the 'x' position is greater than the width of the sketch or less than zero, then reset the value 
  {
    speed = speed * -1;
  }
  if ((testX2 > width-5) || (testX2 < 0))
  {
    speed = speed / -1;
  }
  if ((testX3 > height-5) || (testX3 < 0))
  {
    speed = speed * -1;
  }
  if ((testX4 > height-5) || (testX4 < 0))
  {
    speed = speed / -1;
  }
 
  
      
  
  if (mouseX > testX5-testS5 && mouseX < testX5+testS5 &&                    //tests if the mouse is hovering over the disc
      mouseY > testY5-testS5 && mouseY < testY5+testS5){
        mouseOverCircle = true;
        if (!mouseOnCircle){ 
                          
        }
      }else{
                    
        mouseOverCircle = false;
      }
      

       
       
 
}  
      
      
      

void mousePressed(){                                                // if the mouse is clicked while hovering over the circle, the discimage will appear
        if(mouseOverCircle){
          mouseOnCircle = true;
        }
        else{
          mouseOnCircle = false;
        }
       
        moveX = mouseX-testX5;
        moveY = mouseY-testY5;
        
   if (mouseOverCircle){
        mouseOnCircle = true;

      } else{
        mouseOnCircle = false;  
      }
      
      }


void mouseDragged(){                                             //If the mouse is pressed while over the disc and the mouse is dragged, the disc's location will follow the mouse location
  if (mouseOnCircle)
  {
    testX5 = mouseX-moveX;
    testY5 = mouseY-moveY;
    }
  
 }
 

void mouseReleased ()
{                                          //when the mouse is no longer clicked, the disc will stop following the mouse
  mouseOnCircle = false;
} 


