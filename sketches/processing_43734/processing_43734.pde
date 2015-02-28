
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/43734*@* */
/* !do not delete the line above, required for linking your tweak if you upload again */
/*
 Simulating the Monty Hall Problem
 http://en.wikipedia.org/wiki/Monty_Hall_problem
 
 As exposed on http://www.ai-class.com/
 
 On this simulation the player always picks
 door number 0 and then randomly chooses to keep
 or switch doors after all but one - plus the first 
 one - of the remaining doors are opened, never
 showing the prize
 
 UPDATE: no more fixed initial selection
 
 The total wining rounds are computed taking in
 consideration the choice of keeping or switching
 doors.
 
 Mauricio Jabur
 2011/10/24 yyyy/mm/dd
 
 */

final int DOOR_COUNT = 3;

final int DIGITS = 4;
PFont font;

int prizePosition, doorClosed;
int doorSelected; // per request, no more fixed initial selection
float countKeep, countSwitch, winKeep, winSwitch;

float yS, yG, yM;
float yOldS, yOldG, yOldM;

PImage scroll;

void setup()
{
  size(500, 500);

//  font = loadFont( "AndaleMono.vlw" );
//  font = loadFont( "AnonymousPro-24.vlw" );
  font = loadFont( "AnonymousPro-12.vlw" );
  textFont( font );

  countKeep = countSwitch = winKeep = winSwitch = 0;
  yS = yG = 0;
  yOldS = yOldG = 0;
  yM = yOldM = 0.5;

  scroll = createImage(width-1, height, RGB);
}

void draw()
{
  prizePosition = int (random(DOOR_COUNT) );
  // the prize is behind a random door

  doorSelected = int (random(DOOR_COUNT) );
  // the door picked is random

  // assuming the player always picks the first door
  // the game reveals all but one door
  if (prizePosition == doorSelected ) 
  {
    doorClosed = int(random(0, DOOR_COUNT-1));
    // only one door remains closed at random
    if(doorClosed>=doorSelected)
    {
      doorClosed++;
      //avoids opening the door selected ny the player
    }
  }
  else
  {
    doorClosed = prizePosition; 
    // the door that remains closed has the prize
    // and is not opened until the choice is made
  } // finished Monty interaction

    //now let's keep or switch
  int choice = int(random(2)); 

  if (choice == 0 )
  {//keep the initial choice
    countKeep++;
    if (prizePosition == doorSelected)
    {//win
      winKeep++;
    }
  }
  else
  {//switch doors
    countSwitch++;
    if (prizePosition == doorClosed)
    {//win
      winSwitch++;
    }
  }

  float ratioS = winKeep/countKeep;
  float ratioG = winSwitch/countSwitch;
  float ratioM = (winKeep+winSwitch)/(countKeep+countSwitch);

  yS=(1-ratioS)*height;
  yG=(1-ratioG)*height;
  yM=(1-ratioM)*height;

  background(0);
  image(scroll, 0, 0);

  set(width-1, height/DOOR_COUNT, color(128, 0, 0));
  set(width-1, height*(DOOR_COUNT-1)/DOOR_COUNT, color(0, 128, 0));
  set(width-1, height/2, color(0, 0, 128));

  stroke(255, 0, 0);
  line(width-2, yOldG, width-1, yG);

  stroke(0, 255, 0);
  line(width-2, yOldS, width-1, yS);

  stroke(0, 0, 255);
  line(width-2, yOldM, width-1, yM);

  yOldG = yG;
  yOldS = yS;
  yOldM = yM;

  scroll = get(1, 0, width-1, height);

  textAlign(RIGHT, BOTTOM);
  fill(255, 100, 100);
  text( "switch: "+ nfc(countSwitch, 0) + " ratio: "+ nfc(ratioG, DIGITS), width-2, yOldG-10 );

  textAlign(RIGHT, BOTTOM);
  fill(100, 255, 100);
  text( "keep: "+ nfc(countKeep, 0) + " ratio: "+ nfc(ratioS, DIGITS), width-2, yOldS-10 );

  textAlign(RIGHT, BOTTOM);
  fill(100, 100, 255);
  text( "TOTAL: "+ nfc(countKeep+countSwitch, 0)+ " ratio: "+ nfc(ratioM, DIGITS), width-2, yOldM-10 );
}  



