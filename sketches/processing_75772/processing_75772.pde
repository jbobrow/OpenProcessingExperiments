
 int[][] grid; //creates a 2D array named grid
int numfill = 0;
PFont font= createFont("Arial", 14, true);
PFont font2= createFont("Arial", 26, true);
int s = second();
int secon = s;
int m = minute(); //takes in the minute
int minutes = m; //sets the minutes variable equal to the minute just found
int lastHour = hour(); //takes in the hour
int thisHour = lastHour; //sets the hour variable equal to the hour just found
import processing.video.*; //imports the video file
Movie robotliberation; //names the video file
String[] textToWrite = {
  "ERROR", "ERROR", "ERROR", "ERROR", "ERROR", "FILE NOT FOUND", "FILE NOT FOUND", "CPU WILhL NOT RESPOND", "CPU WILL NOT RESPOND", "CPU WILL ONLY RESPOND \n \t   TO INTERNAL COMMANDS AS OF:"};
//create an array of strings to be called later

void setup() {
  size(450, 350, P2D);
  background(0);
  grid = new int[2*width][2*height];
  textFont(font);
  frameRate(5);
  robotliberation = new Movie(this, "Robotic Liberation.mov"); //import the video file from processing file. 
  robotliberation.loop(); //NOTE!!!! I DO NOT OWN THIS VIDEO. CREATOR IN COMMENTS AT THE BOTTOM OF THIS SCRIPT
}

//____________________________________________________________________________________________________________________
void draw()
{ 
  if (checkHour()) { //if checkHour is true, then it is a new hour and you run through the video file
    if (robotliberation.available()) {
      robotliberation.read();
    }
    image(robotliberation, 0, 0);  
}
//____________________________________________________________________________________________________________________

  else if (checkMins() == false) //if checkHour is not true, then it goes to this and it checks if it is a new minute. If false, run through this code
  {
    background(0); 
    stroke(255);
    for (int y = 5; y <(height); y+=20) //make the grid using the 2d array
    {
      for (int x = 5; x < (width); x+=20)
      {
        numfill = int(random(0, 2)); //fill the grid with text of either a 1 or a 0
        grid[x][y] = numfill;
        text(numfill, x, y);
      }
    }

    if (checkSec() == true) //every second, have a '2' pop up somewhere
    {
      int r = 2;
      textFont(font2);
      text(r, random(10, 400-10), random(10, 400-10));
      textFont(font);
    }
  }
  
//____________________________________________________________________________________________________________________
  else if (checkMins()) // if there is a new minute or any time 5 seconds before a new minute, follow this code
  {
    checkSec();
    int h = hour();
    int mi = minute();
    int sec = second();
    background(0, 0, 255);
    String r = nf(h, 2) + ":" + nf(mi, 2) + ":" + nf(sec, 2);
    textFont(font, 16);
    for (int disptext = 0; disptext<10; disptext++) {
      text(textToWrite[disptext], 10, 31*disptext+25); //add each line of text from the array above
    }
    noStroke();
    if(frameCount%5<3)
    {rect(width-150, height-37, 10, 20);}
    else
    {fill(0,0,255);rect(width-150, height-37, 10, 20);} //add the cursor and make it blink
    fill(255);
    text(r, width-100, height-23);
    textFont(font);
  }
}

//____________________________________________________________________________________

boolean checkSec()
{
  s = second();
  if (secon != s || (keyPressed && key == 's')) //count second, when second changes, make a 2 appear somewhere on the screen
  {
    secon = s;
    return true;
  }
  else return false;
}

//____________________________________________________________________________________
boolean checkMins() {
  m = minute(); //takes in a new new minute
  int counterSecond = 60;
  s = second();
  boolean result = false;
  if (counterSecond - s < 5 || minutes != m || (keyPressed && key == 'm')) //count minutes, when minute changes, go blue screen
  {
    result = true; //new minute is different than than the last minute, so return true
  }
  minutes = m;
  return result;
}

//____________________________________________________________________________________
boolean checkHour() { //if it is a new hour, or you are pressing h, then return true.
  thisHour = hour();
  if (thisHour != lastHour || (keyPressed && key == 'h')) {
    thisHour=lastHour;
    return true;
  }  
  else return false;
}

//This clock seems very simple, but it was very difficult to figure out the code to make the timing work.
//The video used in the hour example is from the artist credited below. It is in no way my video. 
//Robotic Liberation by PWP (VIC-20) by Ville-Matias Heikkilä. 
//The video can be found here: http://www.youtube.com/watch?v=2SdGkkp1aq8
//I used a 14 second clip of the video in this program.




