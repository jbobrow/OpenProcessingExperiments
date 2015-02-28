
//Creators: (Group 14) Alexander, Tristan, Ryan and Rachael
//27.09.13
//AC21010.2 submission
 
//Set background size and colour

boolean Sun = true; //false - night, true - day
int SunCycle; //SunCycle - Number of cycles passed

//Set up sound
import ddf.minim.*;

Minim minim;
AudioPlayer player;

void setup()
{
  noStroke();
  smooth();
  size(600, 600);
  background(78, 195, 245);
  
  setupClouds(); 
  
  fill(255, 255, 255, 180); //Set to white for continual cloud updates
  
  //Play Kirby's voice
  minim = new Minim(this);
  player = minim.loadFile("16.wav");
  player.play();
  
  //Play Kirby theme music
  minim = new Minim(this);
  player = minim.loadFile("Kirby 64--Pop Star Theme.mp3");
  player.play();
}
  
int[] time = new int[2]; //time[0] - Current time, time[1] - Elapsed time

void draw()
{
  if(Sun) 
  {
    background(78, 195, 245);
  }
  else
  {
    background(62, 56, 56);
  }
  
  //Call the functions required to draw Kirby and the environment
  updateClouds();
  drawFeet();
  drawArms();
  drawBody();
  drawFace();
  drawGrass();
  
  if(time[0] != second()) //If the time (in seconds) has changed, update the time
  {
    time[0] = second();
    time[1]++; //Keep track of the elapsed time
  }
  
  //Keep track of the day and night cycles
  int NumberOfCycles = time[1] / 5; //Transition every 5 seconds
  
  if(SunCycle != NumberOfCycles) //If a transition is taking place
  {
    SunCycle = NumberOfCycles;
    
    Sun = !Sun; //Change from day to night and visa versa
  }
}
  
int[][] CloudLocation = new int[5][2]; //Stores the x and y coordinates of all 5 clouds
int[][] CloudSize = new int[5][2]; //Stores the width and height of all 5 clouds
int[] CloudSpeed = new int[5]; //The speed at which each cloud will travel
boolean CloudDirection = true; //true - Right, false - Left
  
void setupClouds() //Set the location, size and speed of all five clouds when the program runs.
{
  //When setting the clouds up, there is a 50% chance that the clouds will change direction
  if(random(100) > 50) CloudDirection = !CloudDirection;
  
  fill(255, 255, 255, 180);
   
  for(int i = 0; i < 5; i++) //Loop through each cloud
  {
    for(int x = 0; x < 2; x++) //Loop through the x and y coordinates of each cloud setting them to a random value
    {
       CloudLocation[i][x] = int(random(500));
    }
    
    //Set a random width, height and speed
    CloudSize[i][0] = 200 - int(random(50));
    CloudSize[i][1] = 100 - int(random(50));
      
    CloudSpeed[i] = int(random(6)) + 1;
      
    //If the clouds are supposed to go left, invert the speed.
    if(!CloudDirection) CloudSpeed[i] = -CloudSpeed[i];
      
    //Draw the cloud in it's initial position
    ellipse(CloudLocation[i][0], CloudLocation[i][1], CloudSize[i][0], CloudSize[i][1]); 
  }
}

void updateClouds() //Move the clouds
{
   fill(255, 255, 255, 180);
  
   for(int i = 0; i < 5; i++)
   {
     CloudLocation[i][0] += CloudSpeed[i];
     
     //If the cloud dissapears off the right side of the screen, move it to the left
     if(CloudLocation[i][0] > width + CloudSize[i][0]) CloudLocation[i][0] = 0 - CloudSize[i][0];
 
     //Draw the cloud in it's new position using the same width and heigh as before
     ellipse(CloudLocation[i][0], CloudLocation[i][1], CloudSize[i][0], CloudSize[i][1]);
   }
}
  
void drawFeet()
{
  fill(217, 15, 82);
   
  //Left foot
  rotate(radians(60));
  ellipse(460, 80, 120, 180);
  rotate(radians(300));
   
  //Right foot
  rotate(radians(130));
  ellipse(50, -600, 120, 180);
  rotate(radians(230));
}
 
void drawArms()
{
  //Left Arm
  fill(235, 157, 200);
  rotate(radians(140));
  ellipse(0, -265, 120, 180);
  rotate(radians(220));
   
  //Right arm
  rotate(radians(60));
  ellipse(430,  -270, 120, 180);
  rotate(radians(300));
}
 
void drawBody()
{
  //Code for Kirby's body
  strokeWeight(0);
  ellipse(300,300,300,300);
}
 
void drawFace()
{
  //Returns pen to black
  fill(0);
  ellipse(265, 250, 35, 100); //Left eye
  ellipse(330, 250, 35, 100); //Right eye
   
  fill(255); //Turns pen to white
   
  //White of the eyes
  ellipse(265, 220, 20, 32);
  ellipse(330, 220, 20, 32);
   
  //Cheeks
  fill(219, 77, 155, 150);
  strokeWeight(0); //Removes outline
  ellipse(210, 320, 50, 25); //Left Cheek
  ellipse(385, 320, 50, 25); //Right Cheek
   
  //Mouth
  fill(117, 1, 36);
  arc(300, 335, 60, 60, -0.75, PI+QUARTER_PI, CHORD);
   
  //Tongue
  fill(217, 15, 82);
  arc(300, 340, 45, 45, -0.75, PI+QUARTER_PI, CHORD);
}
 
void drawGrass()
{
  //Grass
  fill(35, 232, 61);
  ellipse(300, 1000, 1000, 1000);
}


