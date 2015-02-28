

// I'm going to make a race track program. Haven't decided if I want to give the user interactivity or not.
int trackX;    // Outer Ellipse width
int trackY;    // Outer Ellipse height


// I'm just declaring these variables up here so I can make a Race instance variable 
int LineX;
int LineY;
int xLen;
int yLen;

// Race instance variable will be doing most of the heavy lifting
Race grandPrix;

// Font
PFont myText;

// Booleans
boolean racing;
boolean enable;
boolean go,back,stop;
// TIME 
int s;
void setup()
{
  size(600,600);
  // imperative for moving the cars in a circle
  trackX = 450;
  trackY = 600;
  
  // Font setup
  myText = createFont("Magneto-Bold.vlw",36);
  textFont(myText);
  textAlign(CENTER,CENTER);
  //start line variable values
  //we need these for pretty much every event check
  LineX = width/2 + trackX/4;
  LineY = height/2;
  xLen = 120;
  yLen = 16;
  
  // TIME
  //in seconds
  s = millis() / 1000;
  //
  racing = false;
  // set the necessary values for the constructor class within the instance variable
  grandPrix = new Race(LineX, LineY, LineX + xLen, LineY + yLen, trackX, trackY); // ;)
}

void draw()
{
  s = millis()/1000;
  MakeTrack();
  grandPrix.ready(racing);
  instruct(racing);
  CountDown();
  if(racing){
    grandPrix.Main(go,back,stop,s);
  
  }
  //println(trackX/4);
}

// Instruction
void instruct(boolean begin){
  if(begin == false)
  {
    noStroke();
    fill(0,95);
    rect(0,0,width,height);
    fill(0,95);
    rect(0,0,width,height);
    fill(255);
    text("Begin in...", width/2,height/2 - 100);
  }
}

// BACKGROUND PROCESS
//    Functions that Draw the Race track:

void MakeTrack(){            // Main Track Drawing Function: consists of Lanes, inner circle, and BG color
  background(0,255,0);
  ellipseMode(CENTER);
  stroke(0);
  fill(175);
  strokeWeight(2);
  int k;
  for(int i = 0; i < 5; i++)
  {
    k = i *50;              // these values are very important to  get the minimum and maximum
                            // radius of the track
    if(i ==4) fill(255,255,0);
    ellipse(width/2, height/2,trackX-k,trackY-k);
  }
  MakeFinishLine();
}
void MakeFinishLine()        // The finish line funciton is meant to store the location to count laps 
{                            // it is essentially a white rectangle
  LineX = width/2 + trackX/4;
  LineY = height/2;
  xLen = 120;
  yLen = 16;
  
  rectMode(CORNER);
  strokeWeight(1);
  fill(255);
  rect(LineX, LineY, xLen, yLen);
  RaceLineTexture(LineX, LineY, xLen, yLen);
}
// Pure aesthetic for finish line. Draw 8 small black rectangels in a checker fashion.
void RaceLineTexture(int startX,int startY,int W, int H)
{
  int _H = startY;
  int temp;
   noStroke();
   fill(0);
   for(int i = 0; i < 8; i++)
   {
     if(i%2 == 1)
     {
       temp = startY + 8;
       _H = startY;
       startY = temp;
     }
      rect(startX+ i*15,startY, 15,8);
      startY = _H;
   }
   stroke(0);
}

// COUNT DOWN FUNCTION BEGINS THE RACE
void CountDown(){
  int m = -s + 4;
  if(s < 4)
  {
    text(m,width/2,height/2);
    println("counting up: " + m);
  }else{
    
    racing = true;
  }
}
void keyPressed()
{
  if(racing){
    if(key == CODED){
      
      switch(keyCode)
      {
        case UP:
          go = true;
          stop = false;
          back = false;
          break;
        case DOWN:
          go = false;
          back = true;
          stop = false;
          break;
      }
      if(keyCode == UP && keyCode == DOWN){
         stop = true;
         go = false;
         back = false;
      }
    }
  }
}
void keyReleased()
{
  if(racing){
    if(key == CODED){
      switch(keyCode)
      {
        case UP:
          go = false;
          stop = true;
          back = false;
          break;
        case DOWN:
          go = false;
          back = false;
          stop = true;
          break;
      }
    }
  }
}
class Car
{
  float posX,posY,sizeModifier;
  int laps;
  boolean reverse;
  color paint;
  color rims;
  float theta;
  
  Car(float tempPosX, float tempPosY, color tempPaint, color outline)
 {
    posX = tempPosX;
    posY = tempPosY;
    sizeModifier = 20;
    paint = tempPaint;
    rims = outline;
    laps = 0;
    reverse = false;
   
    theta = radians(363);      //played around with this value
 } 
 void DrawCar()
 {
   strokeWeight(5);
   stroke(rims);
   ellipseMode(CENTER);
   fill(paint);
   ellipse(posX,posY,sizeModifier,sizeModifier);
 }
 void MoveCar(float speed, float _trackX, float _trackY)
 {
   // This is where we'll be moving each car with their individual speed
   
   if(reverse){                      // Turn the car around
     
   }
   posX = _trackX;
   posY = _trackY;
   DrawCar();
   //println("car is blue");
 }
 void Drive( float speed, float Xradius, float Yradius, int x, int y, boolean neg){
//   if(neg){
//     speed *= -1;
//     Xradius *= -1;
//     Yradius *= -1;
//   }
   reverse = neg;
   if(!reverse){
   theta += speed;
   }
   if (reverse){
     theta -= speed;
     println("turn around");
   }
   posX = x - Xradius * cos(theta);
   posY = y  - Yradius * sin(theta);
   DrawCar();
   
 } 
}
// The race class will hold all of the rules/procedures and racers

class Race {
  
  // Variables to make everythin' happen :D
  Car Blue;
  Car RacerX;
  Car Yellow;
  Car Speed;
  int minX,maxX,minY,maxY;    // positions of the start/finish line
  int tX;
  int tY;
  
  float pSpeed;
  float rSpeed1, rSpeed2, rSpeed3;
  boolean reverse;
  
  int previous;
  float pSpeedLimit;
  float pRate;
  
  // CONSTRUCTOR
  Race (int tempMinX, int tempMinY, int tempMaxX, int tempMaxY, int trackX, int trackY)
  {
    minX = tempMinX;
    minY = tempMinY;
    maxX = tempMaxX;
    maxY = tempMaxY;
    tX = trackX;
    tY = trackY;
    
    // Make the racers
    
    //Blue
    Blue = new Car(50,50,color(0,0,255),color(255,0,255));
    //RacerX  black and red
    RacerX = new Car(width - 50, 50, color(10),color(255,0,0));
    //Yello
    Yellow = new Car(50,height - 50, color(255,255,0),color(0,0,255));
    //SpeedRacer!!!! white and red
    Speed = new Car(width - 50, height - 50, color(255), color(255,0,0));
    
    // boolean
    reverse = true;
    // Player variables
    pSpeed = 0;
    pRate = .0005;
    pSpeedLimit = .02;
    previous = 10;
  }
  // Finish Line position to check for laps completed
  int isLap(Car _car, int time)
  {
    if(_car.posX > minX && _car.posX < maxX){
      if(_car.posY < maxY && _car.posY > minY){
        if(time > previous){
        _car.laps += 1;
        previous = time;
        return(_car.laps);
        }
      }
    }
    return(_car.laps);
  }
  
  // RACERS TO YOUR STARTING POSITIONS
  void ready(boolean _start)
  {
    int offset = 25;
    int laneDist = 25;
    int BlueStartX = width/2 + tX/4 + offset;
    int BlueStartY = height/2 + 12;
    if(_start == false)
    {
      Blue.MoveCar(0,float(BlueStartX),float(BlueStartY));
      RacerX.MoveCar(0,float(BlueStartX + laneDist), float(BlueStartY));
      Yellow.MoveCar(0,float(BlueStartX + laneDist*2), float(BlueStartY));
      Speed.MoveCar(0,float(BlueStartX + laneDist*3), float(BlueStartY));
    }
  }
  
  
//  // 3... 2... 1... GO!
//  boolean go(boolean DRIVE){
//    // display countdown text
//    return(false);
//  }
  // Race Begins! Cars Move according to which lane they inhabit
  void Main(boolean forward, boolean backward, boolean stop, int time)
  {
      int offset = 25;
      int laneDist = 25;
      int BlueStartX = width/2 + tX/4 + offset;
      int BlueStartY = height/2 + 12;
      // INPUT
        if(forward){
          if(pSpeed < pSpeedLimit){
            pSpeed += pRate;
          }else if (pSpeed >= .03){
            pSpeed = pSpeedLimit;
          }
          //println("going forward");
        }else if(backward){
          if(pSpeed > -pSpeedLimit){
            pSpeed -= pRate;
          }else if(pSpeed < .03){
            pSpeed = -pSpeedLimit;
          }
          //println("going backward");
        }else{
          if(pSpeed > 0.0){
            pSpeed -= pRate;
          }else if(pSpeed < 0.0){
            pSpeed += pRate;
          }
          
          //println("doing nothing");
        }
        
      
      // EVENT CHECK
      //Check for lap first
      if(isLap(Blue,time)% 2 == 0){
        reverse = true;
      }else if(isLap(RacerX, time) % 2 == 0){
        reverse = true;
      }else if(isLap(Yellow, time) % 2 == 0){
        reverse = true;
      }else if(isLap(Speed, time) % 2 == 0){
        reverse = true;
      }else{
        reverse = false;
      }
        // Reverse Mechanic 
      
      // Change it up
      if( time % 3 == 0)
      {
        rSpeed1 = random(.01,.031);
        println("changed rSpeed1 to: " + rSpeed1);
        rSpeed2 = random(.012,.028);
        println("changed rSpeed2 to: " + rSpeed2);
        rSpeed3 = random(.02,.025);
        println("changed rSpeed3 to: " + rSpeed3);
      }
      // EXECUTION
        //Move Cars individually
      Blue.Drive(rSpeed1,float(-135), float(-213), width/2, height/2, reverse );
      RacerX.Drive(rSpeed2,float(-160), float(-238), width/2, height/2, reverse);
      Yellow.Drive(rSpeed2,float(-190), float(-263), width/2, height/2, reverse);
      Speed.Drive(pSpeed,float(-213), float(-290), width/2, height/2, reverse);
      //reverse = false;
      // DRAW 
        // if need be...     
      println("Blue has done " + Blue.laps + " laps");
  }
  
  // INTERACTIVITY! Player Controls their car speed!
  
  // make cars turn around after 2 laps?
  
}


