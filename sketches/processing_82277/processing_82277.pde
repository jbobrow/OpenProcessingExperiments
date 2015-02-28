
import oscP5.*; //import libraries 
import netP5.*;

//paddle variables 
int paddlerightX, paddlerightY;
int paddleleftX, paddleleftY;
int widthpaddle = 10, heightpaddle = 150;

// ellipse (ball) variables 
float ellipseX, ellipseY;//
float speedX = 1, speedY = 1;

float ellipseSize = 10;
float directionX = 1, directionY = 1;

//declaring global variable to start pong
boolean startPong=false;
int gridNum;// declaring gridnumber for later, this will store the value of the gridnumber 

//objects
OscP5 oscP5Connect; 
NetAddress sendingLocation;//declaring the objects for later 
OscMessage messageToSendToMax;

//________________________________________________________________________________________________________
void setup() //background/game interface, runs and stays 
//also declares variables that won't change later

{
  size (600, 600);  
  // variable values needed here  for the declared variables above  
  paddlerightX = width - 10;
  //paddlerightY;
  paddleleftX = 0;
  // paddleleftY;
  ellipseX = width/2;
  ellipseY = 0;
  oscP5Connect = new OscP5(this, 9000); // incoming from ipad
  sendingLocation = new NetAddress ("127.0.0.1", 8000); //  processing to max
}
//________________________________________________________________________________________________________
void draw()
{
  background(30,200,229);
  
  
  if (startPong ==true)//boolean to start pong so if this is true, 
  {
    ellipseBounce(); // the ball starts moving
  }

  gridNum = gridLayout((int)ellipseX, (int)ellipseY);
  fill (229, 28, 216); //colours ball and rects
  ellipse(ellipseX, ellipseY, ellipseSize, ellipseSize);//draws the ball 
  //functions defined later are called here
  drawInterface(); 
  paddlePosition();
  drawPaddles();
  EvenOrNot();
}
 
//________________________________________________________________________________________________________
 
void ellipseBounce () //function for the ball moving
{
  //y radius
  ellipseY = ellipseY + (directionY*speedY); //flips the ball back if it goes outside the 400 x 400 frame 
  if (ellipseY > height || ellipseY < 0)
    directionY = directionY * -1;

  // x radius
  ellipseX = ellipseX + (directionX*speedX);//flips the ball back if it goes outside the 400 x 400 frame 
  if (ellipseX > width || ellipseX < 0)
    directionX = directionX * -1;
} 


//________________________________________________________________________________________________________

void oscEvent(OscMessage receivedMessage) //messages in from OSC Ipad
{
 if (receivedMessage.checkAddrPattern("/1/ballspeed"))
   {
     float receivedSpeed = receivedMessage.get(0).floatValue();
     tellSpeed(receivedSpeed);// don't now that's what 
     ballSpeed(receivedSpeed);
     println("the current ballspeed is:" + receivedSpeed);
   }
   
   if (receivedMessage.checkAddrPattern("/1/pongtoggle"))
   {
     float begin = receivedMessage.get(0).floatValue();
     tellMaxToStart (begin);
     if (begin == 1.0)
     startPong = true;
     else
     startPong = false;
     println("StartPong is set to:" + startPong);
   }
}
//________________________________________________________________________________________________________
void ballSpeed(float s) //function for the ballspeed
{
  speedY = s*3 + 1;
  speedX = s*3 + 1;
}

void drawInterface()//draws the screen,
{
  strokeWeight(3); //makes the line more visible cos it has an outline
  for (int i = 0; i < 595 ; i+=5) // for loop for the line
  {
    rect (300, i , 0,5); // 
  }
  ellipse (width/2,height/2,30,30);
}

//________________________________________________________________________________________________________
void  drawPaddles() //draws the paddles  
{
  fill (229,28,186);
  rect (paddleleftX, ellipseY - heightpaddle/2, widthpaddle, heightpaddle);
  rect (paddlerightX, ellipseY - heightpaddle/2, widthpaddle, heightpaddle);
  
}

void paddlePosition()
{
  //included in code above. 
   
}


// _____________________________________________________________________ //
//This bit figures out where the ball is, and returns a number depending on the location and then sends this number and message to max to do things over there. 

int gridLayout (int px, int py)//function for the grid  
{
  
  //first line of grid boxes 1-4 
  if (px < width/4 && py > height/4){// it's in the Q1 then it will return the number 1(Q = quadrant)  
   return 1;
     }
  else if (px < width/2 && px < width/ 4 && py < height/4){  //it's in Q2
 
   return 2; 
    }
  else if (px > width/2 && px < width/4*3 && py < height/4){//it's in q3 
    return 3;
  }
  else if (px > width && px > width/4*3 && py < height/4){ //it's in Q4
    
     return 4;
  }
  //second line of grid boxes 5-8

  else if (px < width/4 && py > height/2){ //Q5 
    return 5;
  }
  else if (px > width/4 && px > width/ 4 &&  py > height/2){//correct q6
    return 6;
  }
  else if (px > width/2 && px < width/4*3 && py < height/2){
    //it's in q7
    return 7;
  }
  else if (px > width/4*3 && px < width/4 && py < height/4){  //it's in q8
    return 8;
  }

  //third line of grid boxes 9-12
  else if (px < width/4 && py > height/4){ //Q9 
    return 9;
  }
  else if (px < width/2 && px > width/4 && py > height/4){
    //Q10 
    return 10;
  }
  else if (px > width/2 && px < width/4*3 && py > height/4){//q11
    return 11;
  }
  else if ( px > width/4*3 && px < width && py > height/4){//q12
    return 12;
  }

  //last line of grid boxes 13 -16
  else if (px < width/4 && px < height){// q13
    return 13;
  }
  else if (px < width/2 && px > width/4 && px < height){// Q14
    return 14;
  }
  else if (px < width/4*3 && px > width/2 && px < height){//Q15
    return 15;
  }
  //else  (px < width/4*3 && px > width && px < height)//Q15
    return 16;
  }

//________________________________________________________________________________________________________
void EvenOrNot ()
{
  int r = gridLayout ((int)ellipseX, (int)ellipseY);
  if ( r % 2  == 1) //?/ ie it's uneven random note to nord stage called /1/unevennote in max
    //i'll call this uneven note 1 and send the 1 to max with the identifier unevennote  
  {
    messageToSendToMax = new OscMessage("/unevennote/"); 
    messageToSendToMax.add(2);
    oscP5Connect.send(messageToSendToMax,sendingLocation);
  } 
  else if ( r% 2 == 0 && r != 6)//ie it's EVEN send random note to xp 80  (send a message to max to) /1/evennote
  {
    messageToSendToMax = new OscMessage("/evennote");
    messageToSendToMax.add(1);
    oscP5Connect.send(messageToSendToMax, sendingLocation);
  }

  else if (r == 6)
  {
    //message to max send message to midi to "noteon"  24 channel 8 (this is all in one box in max)
    messageToSendToMax = new OscMessage("/ingrid");
    messageToSendToMax.add(6);
    oscP5Connect.send(messageToSendToMax, sendingLocation);
  }
}

//________________________________________________________________________________________________________
// this sends the recieved messages to max to tell it to start

void tellMaxToStart(float a) 
{
  messageToSendToMax = new OscMessage("/1/pongtoggle"); //sending Go! pongtoggle message to Max
  messageToSendToMax.add(a); 
  oscP5Connect.send(messageToSendToMax, sendingLocation);
}

void tellSpeed(float receivedspeed)
{
  messageToSendToMax = new OscMessage("/1/ballspeed"); //sending ballspeed sign to Max
    messageToSendToMax.add(receivedspeed);
  oscP5Connect.send(messageToSendToMax, sendingLocation);
}

















