
import ddf.minim.*;
import ddf.minim.ugens.*;

import java.io.*; //for loading all images
import java.util.*;

//There is a big section bellow with contants.
//this is in fact something good for the 
//project, because I only need to make changes 
//in these contants to alter the behaviour of
//the program.
//you can play with the "NOTE_COUNT" and the "OCTAVE_COUNT" 
//constants as a starting point


//these are the contant values to define a margin
//around the display area so as all action of the 
//circles is visible
int SIDE_MARGIN    = 10;
int LEVEL_MARGIN   = 25;

int DOUBLE_SIDE_MARGIN = SIDE_MARGIN * 2;
int DOUBLE_LEVEL_MARGIN = LEVEL_MARGIN * 2;

int USER_INFO_AREA = 130;

//these are the constant values that define the NOTE_RADIUS
//and NOTE_DIAMETER (for faster process) of the trajectories (orbits)
//of the note circles
int NOTE_RADIUS        = 55;
int NOTE_DIAMETER      = 110; 

//This is a smaller NOTE_RADIUS, used when defining the 
//trajectories (orbits) of the playing notes, so as the 
//trajectories (orbits) overlap
int TOUCH_NOTE_RADIUS   = 30;

//name the rows and colums with better names
//12 notes accross, and 5 octaves down
int NOTE_COUNT   = 12;
int OCTAVE_COUNT = 5;

//zero based of the above, for modulo
int NOTE_COUNT_1   = NOTE_COUNT - 1;
int OCTAVE_COUNT_1 = OCTAVE_COUNT - 1;

//this is the difference of the notes in the trajectories (orbits)
float NOTE_STEP_ANGLE = 360.0 / (NOTE_COUNT * OCTAVE_COUNT);

//this contant defines the period of the notes 
//on theri trajectories (orbits)
float NOTE_ANGLE_DIVISOR = 60;


String [][] NOTE_NAMES  = new String[][] {
                          {"A2", "A#2", "B2", "C2", "C#2", "D2", "D#2", "E2", "F2", "F#2", "G2", "G#2", "A3"},
                          {"A3", "A#3", "B3", "C3", "C#3", "D3", "D#3", "E3", "F3", "F#3", "G3", "G#3", "A4"},
                          {"A4", "A#4", "B4", "C4", "C#4", "D4", "D#4", "E4", "F4", "F#4", "G4", "G#4", "A5"},
                          {"A5", "A#5", "B5", "C5", "C#5", "D5", "D#5", "E5", "F5", "F#5", "G5", "G#5", "A6"},
                          {"A6", "A#6", "B6", "C6", "C#6", "D6", "D#6", "E6", "F6", "F#6", "G6", "G#6", "A7"},
                          {"A7", "A#7", "B7", "C7", "C#7", "D7", "D#7", "E7", "F7", "F#7", "G7", "G#7", "A8"}
                        };



//from now on, the gloabal variables are defined.
//not the contants

//this array is going to hold the initial angles 
//of the notes
float [][] noteAngles  = new float[OCTAVE_COUNT][NOTE_COUNT];


//variables used to track volume, pitch, visibility and other option
//which are presented to or are affected by the user

//if the user is in options mode in menu, this variable 
//holds the last request of the user
//the available options are

// 'T' -> tarjectory vivibility
// 'N' -> notes vivibility
// 'V' -> Volume
// 'M' -> Tempo
// 'A' -> Show mouse Axis 
// 'B' -> Background
char currentMenuOption = ' ';

//the volume of the sound. initially at a well defined level
//use gain intead of volume
//values 0.0 ... 1.0;
float userVolume = 0.8; 

//the visibility level of the trajectories (orbits)
//initialy invisible
//0.0 ... 1.0
float userTrajectoryVisibility = 0.6;
float userNotesVisibility = 1.0;

//how fast or slow rotate the notes on their trajectories (orbits)
// 0.1 (slow) ... 1.0 (fast)
//initial value default speed
float userTempo = 0.4;

//show or hide the axis of the mouse where the notes hit
boolean userShowMouseAxis = true;


//in menu mode, increase or decrase the level of the user selection
float userOptionIncrease = 0.0;


//backGround image files 
PImage    userCurrentBackground = null;
String [] userBackgroundFiles   = null;
int       userCurrentBackgroundIndex = -1;

//trying to make buffered music
float audioCurrentTime = 0.0;


//the minim file to process sound
Minim minim  = null;
AudioOutput currentChord = null;
AudioOutput directOut = null;
Queue<AudioOutput> chords = new LinkedList<AudioOutput>();

//Setup the initial data of the program
void setup()
{
  size((NOTE_DIAMETER * NOTE_COUNT)   - (TOUCH_NOTE_RADIUS * NOTE_COUNT_1)   + DOUBLE_SIDE_MARGIN, 
       (NOTE_DIAMETER * OCTAVE_COUNT) - (TOUCH_NOTE_RADIUS * OCTAVE_COUNT_1) + DOUBLE_LEVEL_MARGIN + USER_INFO_AREA);
  
  minim = new Minim(this);
  // use the getLineOut method of the Minim object to get an AudioOutput object
  directOut = minim.getLineOut();
  
  //prepare the Note Orbits
  initializeAngles();
  
  //define a color mode based on the degrees of the circle, 
  //and a value 0.0 ... 100.0 for saturation and brightness, 
  //and 0.0 ... 1.0 for alfa (visibility)
  colorMode(HSB, 360.0, 100.0, 100.0, 1.0);
  
  //no intensity, full brightness on HSB is white
  background( 0.0, 0.0, 100.0, 1.0 );
  
  smooth();
  frameRate(60);
  
  loadBackgroundFiles();
  println(width);
  println(height);
  
}

//this method loads all images present in the data folder to use as backgrounds
void loadBackgroundFiles()
{
  File data = new File(dataPath(""));
  // let's set a filter (which returns true if file's extension is .jpg)
  FilenameFilter jpgFilter = new FilenameFilter() 
  {
    public boolean accept(File dir, String name) 
    {
      return name.toLowerCase().endsWith(".jpg");
    }
  };
  
  // list the files in the data folder, passing the filter as parameter
  userBackgroundFiles = data.list(jpgFilter);
  
  if( null != userBackgroundFiles)
  {
    for ( int i = 0; i < userBackgroundFiles.length; i++)
    {
      if( userBackgroundFiles[i].indexOf("blank") > -1 )
      {
        userCurrentBackground = loadImage(userBackgroundFiles[i]);
        userCurrentBackgroundIndex = i;
        break;
      }
    }
  }
  
}


//make the first angles of the notes. called from the Setup method once
void initializeAngles()
{
  float rowAngle = 360.0 / NOTE_COUNT;
  
  for( int octave = 0; octave < OCTAVE_COUNT; octave ++)
  {
    float currentAngle = 0.0; 
    for( int note = 0; note < NOTE_COUNT; note++ )
    {
      noteAngles[octave][note] = note * rowAngle + NOTE_ANGLE_DIVISOR * octave;
    }
  }
  
  
}


//Display a slider for a specific user option, and return the current value
float updateUserOptionSlider(String userOptionInfo, 
                             float currentUserOption, float userOptionIncrease, 
                             float optionStart,       float optionEnd)
{
  int x =  SIDE_MARGIN;                             //x position
  int y = height - USER_INFO_AREA + LEVEL_MARGIN;   //y position
  int w = width - DOUBLE_SIDE_MARGIN;               //draw width
  int h = USER_INFO_AREA - DOUBLE_LEVEL_MARGIN;     //draw height
  float range = 0; 

  //draw the text for the user option
  text(userOptionInfo, x + 10, y+2 );
  
  //draw the base slider rectangle
  strokeWeight(2);
  stroke(140.0, 100.0, 50.0, 1.0);  //Blue based on color weel degrees
  fill(140.0, 100.0, 100.0, 1.0);   //bright blue
  rect(w - 200, y+10, 200 , 30, 3, 3, 3, 3);
  
  //calculate the current range, for the user option
  range = map(currentUserOption, optionStart, optionEnd, 0.0, 200.0);
  range = int(range);

  if( userOptionIncrease != 0.0 )
  {
    //println(currentUserOption, range, userOptionIncrease);
    range += userOptionIncrease;
    if (range < 0.0) 
    { 
      range = 0.0;
    }
    else if (range > 200.0)
    {
      range = 200.0;
    }
    
    currentUserOption = map(range, 0.0, 200.0, optionStart, optionEnd);
    if (currentUserOption > 0.999 && currentUserOption < 1.001)
    {
      currentUserOption = 1.0;
    }
    //println(userTrajectoryVisibility, range, userOptionIncrease);
  }
  
  //Display the slider rectangle
  noStroke();
  fill(30.0, 100.0, 100.0, 1.0);        //bright orange
  rect(w - 200, y+13, range , 25);

  //display the textual represantation of the slider
  fill(0,0,0,1);
  textSize(12);
  text("[" + str(currentUserOption) + "]", w - 110, y+17 );
  
  return currentUserOption;
}




//display some information based on the latest user action
//it is kind of the menu
void displayUserInformation()
{
  int x =  SIDE_MARGIN;                          //x position
  int y = height - USER_INFO_AREA + LEVEL_MARGIN;  //y position
  int w = width - DOUBLE_SIDE_MARGIN;             //draw width
  int h = USER_INFO_AREA - DOUBLE_LEVEL_MARGIN;     //draw height
  float range = 0; 
  
  //draw the background of the menu area 
  strokeWeight(5);
  stroke(80.0, 100.0, 50.0, 1.0);  //green based on color weel degrees
  fill(80.0, 100.0, 100.0, 1.0);   //bright green
  rect(x, y, w , h, 1, 10, 10, 10);
  
  //prepare the text options
  textSize(16);
  fill(0.0, 100.0, 0.0, 1.0);  //black
  textAlign(LEFT, TOP);
  
  if (currentMenuOption == ' ') 
  {
    text("Press and release mouse button to play notes.\npress One of [T, N, V, M, A, B] for options.", x + 20, y);
  }
  else
  {
    switch(currentMenuOption)
    {
      case 'A':
        userShowMouseAxis = !userShowMouseAxis;  //change axis vivibility mode
        //delibertly fall to the next case
        
      case 'a':
        text("[A] - Show Mouse Axis: ", x + 10, y );
        if( userShowMouseAxis )
        {
          fill(140.0, 100.0, 50.0, 1.0);  //Blue
          text("[On]", width - 100, y );
        }
        else
        {
          fill(0.0, 100.0, 100.0, 1.0);  //Red
          text("[Off]", width - 100, y );
        }
        currentMenuOption = 'a'; //dummy option to prevent infinite change
        break;
    
      //change background
      case 'B':
        if( null != userBackgroundFiles)
        {
          userCurrentBackgroundIndex++; 
          if (userCurrentBackgroundIndex >= userBackgroundFiles.length)
          {
            userCurrentBackgroundIndex = 0;
          }
          
          userCurrentBackground = loadImage(userBackgroundFiles[userCurrentBackgroundIndex]);
          currentMenuOption = 'b'; //dummy option to prevent infinite change
        }
        //delibertly fall to the next case

      case 'b':
        text("[B] - Change background Image:                                  ", x + 10, y );
        if(userCurrentBackgroundIndex > -1 )
        {
          fill(140.0, 100.0, 50.0, 1.0);  //blue
          text("[" + userBackgroundFiles[userCurrentBackgroundIndex] + "]", 300, y );
        }
        else
        {
          fill(0.0, 100.0, 100.0, 1.0);  //Red
          text("[Not available]", 300, y );
          currentMenuOption = ' ';
        }
        break;

      //change trajectories (orbits) Visibility
      case 'T':
        currentMenuOption = 't';
        //delibertly fall to the next case
        
      case 't':
        userTrajectoryVisibility = updateUserOptionSlider("[T] - Trajectories Visibility:\nUse Arrow Keys.", 
                                                          userTrajectoryVisibility,
                                                          userOptionIncrease,
                                                          0.0, 1.0);
        userOptionIncrease = 0.0;
      break;

      //change notes Visibility  
      case 'N':
        currentMenuOption = 'n';
        //delibertly fall to the next case
        
      case 'n':
        userNotesVisibility = updateUserOptionSlider("[N] - Notes Visibility:\nUse Arrow Keys.", 
                                                     userNotesVisibility,
                                                     userOptionIncrease,
                                                     0.0, 1.0);
        userOptionIncrease = 0.0;
      break;
  
      //change Volume  
      case 'V':
        currentMenuOption = 'v';
        //delibertly fall to the next case
        
      case 'v':
        userVolume = updateUserOptionSlider("[V] - Volume:\nUse Arrow Keys.", 
                                            userVolume,
                                            userOptionIncrease,
                                            0.0, 1.0);
        //changing volume is affected imidiatelly
        if( null != currentChord )
        {
          currentChord.setGain(map(userVolume, 0.0, 1.0, -50.0, 00.0));
        }
        directOut.setGain(map(userVolume, 0.0, 1.0, -50.0, 00.0));
        
        userOptionIncrease = 0.0;
      break;
      
      //change tempo
      case 'M':
        currentMenuOption = 'm';
        //delibertly fall to the next case
        
      case 'm':
        userTempo = updateUserOptionSlider("[M] - Tempo:\nUse Arrow Keys.", 
                                           userTempo,
                                           userOptionIncrease,
                                           0.1, 1.0);
        userOptionIncrease = 0.0;
      break;
    }
  }
  
  userOptionIncrease = 0;
}

//processing method for drawing
void draw()
{
  if (null == userCurrentBackground)
  { 
    //no saturation, full brightness is white on any color
    background( 0.0, 0.0, 100.0, 1.0 );
  }
  else
  {
    image(userCurrentBackground, 0, 0, width, height);
  }
  
  if (null != currentChord )
  {
    if ( 0 == currentChord.mix.level() )
    {
      currentChord.close();
      currentChord = null;
      //println("currentChord closed");
    }
  }
  
  if (null == currentChord )
  {
    currentChord = chords.poll();
    if( null != currentChord )
    {
      currentChord.setGain(map(userVolume, 0.0, 1.0, -50.0, 00.0));
      currentChord.resumeNotes();
      //println("currentChord started");
    }
    
  }
  
  drawTrajectories();
  drawNotes();
  displayUserInformation();
  
}

//find the coordinate of a note on the canvas
//based on its place in the grid with notes and octaves
int translateNote(int note, int margin)
{
  return note * NOTE_DIAMETER + NOTE_RADIUS  + margin - (note * TOUCH_NOTE_RADIUS);
}


//find the actual point of a note 
//with the position x, y on the canvas
//based on the current angle
PVector translateAngle(int x, int y, float angle)
{
  float fx = cos(radians(angle)) * NOTE_RADIUS + x;
  float fy = sin(radians(angle)) * NOTE_RADIUS + y;
    
  PVector v = new PVector(fx, fy);  
  return v;
}

//draw the orbits of the notes
void drawTrajectories()
{
  noFill();      
  strokeWeight(0.1);
  strokeCap(ROUND);  
  ellipseMode(RADIUS);
  
  //do not care for color(HUE), 
  //no brightness, full intensity
  //user selected visibility
  stroke(0.0, 100.0, 0.0, userTrajectoryVisibility);
  pushMatrix();
  
  for( int octave = 0; octave < OCTAVE_COUNT; octave ++)
  { 
    for( int note = 0; note < NOTE_COUNT; note++ )
    {
      ellipse(translateNote(note, SIDE_MARGIN),
              translateNote(octave, LEVEL_MARGIN),
              NOTE_RADIUS, NOTE_RADIUS);
    }
  }
  
  if (userShowMouseAxis)
  {
    if (mousePressed)
    {
      strokeWeight(1.5);
      stroke(0.0, 100.0, 50.0, 1.0);
    }
    else
    {
      strokeWeight(0.5);
      stroke(280.0, 100.0, 50.0, 1.0);
    }
    
    line( SIDE_MARGIN, mouseY, width - SIDE_MARGIN, mouseY);
    line( mouseX, LEVEL_MARGIN , mouseX, height - LEVEL_MARGIN - USER_INFO_AREA);
  }
  
  popMatrix();  
}


//This method does the actual drawing of the notes on the grid
void drawNotes()
{
  float chordTiming = 0.0;
  float maxNotesTempo = floor(map(userTempo, 0.1, 1.0, 1.01, 8.01));
  float noteDuration = 1.0;
  float theWeight = 1.0;
  ArrayList<String> selectedNotes = new ArrayList<String>();
  noteDuration = 1.0 / maxNotesTempo; 
    
  
  //Queue <String> notesQueue = new LinkedList <String>(); 
  //out.setNoteOffset( 0.5 );
  //out.pauseNotes();
  AudioOutput out = minim.getLineOut();
  out.pauseNotes();
  
  for( int octave = 0; octave < OCTAVE_COUNT; octave ++)
  { 
    for( int note = 0; note < NOTE_COUNT; note++ )
    {

       PVector v1 =  translateAngle(translateNote(note, SIDE_MARGIN),
                                    translateNote(octave, LEVEL_MARGIN),
                                    noteAngles[octave][note]);
      
      //move around the circle based on the user selected tempo
      noteAngles[octave][note] += (NOTE_STEP_ANGLE * userTempo);
      
      PVector v2 =  translateAngle(translateNote(note, SIDE_MARGIN),
                                   translateNote(octave, LEVEL_MARGIN),
                                   noteAngles[octave][note]);

      float yAbs = abs(mouseY - v2.y);
      float xAbs = abs(mouseX - v2.x);
      
      //deside for teh size of the point of the note, 
      //based on how close it is to the "string"
      if( yAbs > 6 )
      {
          //strokeWeight(3);
        if( xAbs > 6 )
        {
          //strokeWeight(height/60);
          theWeight = height / 60;
        }
        else if( xAbs > 3 )
        {
          //strokeWeight(height/50);
          theWeight = height / 50;
        }
        else
        {
          //strokeWeight(height/30);
          theWeight = height / 30;
        }
      }
      else if( yAbs > 3 )
      {
        //strokeWeight(height/50);
        theWeight = height / 50;
      }
      else
      {
        //strokeWeight(height/30);
        theWeight = height / 30;
      }
      
      
      
      if( mousePressed)
      {
        if( lineRectangleIntersect(v1.x, v1.y, v2.x, v2.y, 0, mouseY-1, width, 2) ||
            lineRectangleIntersect(v1.x, v1.y, v2.x, v2.y, mouseX-1, 0, 2, height)   )
            {
              //out.playNote(NOTE_NAMES[octave][note]);
              //noteDuration = random(0.2, 1.0) * userTempo;
              //out.playNote(chordTiming, noteDuration, NOTE_NAMES[octave][note]);  
              //chordTiming += ((noteDuration - 0.05) * random(0.2, 1.0));
              selectedNotes.add(NOTE_NAMES[octave][note]);
              
              strokeWeight(3);
              line(v2.x + (theWeight / 2), v2.y, v2.x + (theWeight / 2), v2.y - 30);
              strokeWeight(2);
              for(int lines = 0; lines < int(floor(random(0.0, 3.1))); lines++)
              {
                line(v2.x + (theWeight / 2), v2.y - (30 - lines * 5), v2.x + (theWeight / 2) + 10, v2.y - (30 - lines * 5));
              } 
                
            }
      }
      
      //draw the note on the current degree color
      //with full intensity and saturation, and selected vivibility
      stroke(noteAngles[octave][note] % 360.0, 100.0, 100.0, userNotesVisibility);
      
      strokeWeight(theWeight);
      point(v2.x, v2.y);

    }
  }

  if (selectedNotes.size() > 0)
  {
    //println(selectedNotes.size(), userTempo);
    for( int i = 0; i < selectedNotes.size(); i++ )
    {
      //out.playNote(chordTiming, noteDuration, selectedNotes.get(i));
      directOut.playNote(chordTiming, noteDuration, selectedNotes.get(i));
      chordTiming += noteDuration + map(random(0.0, 1.0), 0.0, 1.0, -0.09, 0.19);
      if( i >= maxNotesTempo )
      {
        break;
      }
    }
  }
  
  selectedNotes.clear();
  if ( 0.1 < chordTiming )
  {
    chords.offer(out);
    //println("new chord added");
  }
  else
  {
    out.close();
    out = null;
  }
}


//check for the user actions here. not in the draw method
void keyReleased()
{
  switch(key)
  { 
    //first check if the user pressed the arrows to change the behaviour of some option
    case CODED:
      if (currentMenuOption != ' ')
      {
        switch (keyCode)
        {
          case RIGHT: case UP:
            userOptionIncrease = 2.0;
            break;
          
          case LEFT: case DOWN:
            userOptionIncrease = -2.0;
            break;
        }
      }
      break;
    
    //change note axis visibility
    case 'a': case 'A':
      currentMenuOption = 'A';
      break;
    
    //change background
    case 'b': case 'B':
      currentMenuOption = 'B';
      break;

    //change trajectories Visibility
    case 't': case 'T':
      currentMenuOption = 'T';
      break;

    //change notes Visibility  
    case 'n':  case 'N':
      currentMenuOption = 'N';
      break;
  
    //change Volume  
    case 'v': case 'V':
      currentMenuOption = 'V';
      break;
      
    //change tempo
    case 'm': case 'M':
      currentMenuOption = 'M';
      break;
     
    default:
      currentMenuOption = ' ';
      break;
  }
}

//check for mouse press.
//if it is pressed during menu state 
//and is in the slider area, set the 
//appropriate value of the selected user option 
void mousePressed()
{
  boolean ok = false;
  int x =  SIDE_MARGIN;                             //x position
  int y = height - USER_INFO_AREA + LEVEL_MARGIN;   //y position
  int w = width - DOUBLE_SIDE_MARGIN;               //draw width
  int h = USER_INFO_AREA - DOUBLE_LEVEL_MARGIN;     //draw height
  
  if (mouseX >= w - 200 && mouseX <= w)
  {
    if (mouseY >= y + 13 && mouseY <= y + 13 + 25)
    {
      switch (currentMenuOption)
      {
        case 't': case 'T':
        userTrajectoryVisibility = map(mouseX - (w - 200), 0.0, 200.0, 0.0, 1.0);
        break;
        
        case 'v': case 'V':
        userVolume = map(mouseX - (w - 200), 0.0, 200.0, 0.0, 1.0);
        if (null != currentChord )
        {
          currentChord.setGain(map(userVolume, 0.0, 1.0, -50.0, 00.0));
        }
        directOut.setGain(map(userVolume, 0.0, 1.0, -50.0, 00.0));
        break;
        
        case 'm': case 'M':
        userTempo = map(mouseX - (w - 200), 0.0, 200.0, 0.1, 1.0);
        break;
        
        case 'n': case 'N':
        userNotesVisibility = map(mouseX - (w - 200), 0.0, 200.0, 0.0, 1.0);
        break;
      }

      ok = true;
    }
  }
      
  if (!ok)
  {
    currentMenuOption = ' ';
  }
}

// Code from Seb Lee-Delisle:
// http://sebleedelisle.com/2009/05/super-fast-trianglerectangle-intersection-test/
 boolean lineRectangleIntersect(float x1, float y1, float x2, float y2,
                                float rx, float ry, float rw, float rh) {
                                  
  float topIntersection;
  float bottomIntersection;
  float topPoint;
  float bottomPoint;
 
  // Calculate m and c for the equation for the line (y = mx+c)
  float m = (y2-y1) / (x2-x1);
  float c = y1 -(m*x1);
 
  // If the line is going up from right to left then the top intersect point is on the left
  if(m > 0) {
    topIntersection = (m*rx  + c);
    bottomIntersection = (m*(rx+rw)  + c);
  }
  // Otherwise it's on the right
  else {
    topIntersection = (m*(rx+rw)  + c);
    bottomIntersection = (m*rx  + c);
  }
 
  // Work out the top and bottom extents for the triangle
  if(y1 < y2) {
    topPoint = y1;
    bottomPoint = y2;
  } else {
    topPoint = y2;
    bottomPoint = y1;
  }
 
  float topOverlap;
  float botOverlap;
 
  // Calculate the overlap between those two bounds
  topOverlap = topIntersection > topPoint ? topIntersection : topPoint;
  botOverlap = bottomIntersection < bottomPoint ? bottomIntersection : bottomPoint;
 
  return (topOverlap<botOverlap) && (!((botOverlap<ry) || (topOverlap>ry+rh)));
 }





