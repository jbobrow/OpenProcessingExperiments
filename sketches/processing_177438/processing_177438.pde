
//////////////////////////////////////////////////////////////////////
// Course name: Introduction to Computational Arts
// Assignment : Bringing it All Together (Project 3 (Processing, Sound and Image) - FF)
// Objective  : The final project is a culmination of all the work you’ve completed in this course.  
//              Your objective is to create an original work which demonstrates competency in the core areas of this course. 
//              This will be achieved through the design of an interactive processing sketch, which integrates external visuals and optionally, sound.
//
// Student name : Cheongun Lee
// Date         : 14 Dec 2014
// Theme        : I want to shoe people that a text can dancing with song.
//                Used processing library to get each point's of font.
//                Transform agent will move every points related in volume level of current music playing.
//                User can interact by mouse click some where on the screen then points will follow the position.
//                
////////////////////////////////////////////////////////////////////////




import geomerative.*;
import org.apache.batik.svggen.font.table.*;
import org.apache.batik.svggen.font.*;
import ddf.minim.*;
 
Minim minim;
AudioPlayer player;

RFont font;
RGroup myGroup;
RPoint[] OrgPoints;

TransformAgent transformAgent;

float Index;
float time;
float lastTick;
float targetTick;
float diffTick;
float mousePosX;
float mousePosY;
float fillColorAlpha;
int NumOfPoints;

color strokeColor;

boolean DoDance;

String myText = "Quizás, Quizás, Quizás";

void setup()
{
  size(1100, 400);

  smooth();
  
  strokeColor = color(255);
  
  PrepareFontGeometry();

  PrepareObjects();
  
  PrepareSong();
  
  Index = 0;
  
  targetTick = 30;
  
  fillColorAlpha = 255;
  
  DoDance = true;
  
  mousePosX = width/2;
  mousePosY = height/2;
}

void PrepareFontGeometry()
{
  RG.init(this);

  font = new RFont("FreeSans.ttf", 100, CENTER);

  RCommand.setSegmentLength(1);
  RCommand.setSegmentator(RCommand.UNIFORMLENGTH);

  myGroup = font.toGroup(myText);

  OrgPoints = myGroup.getPoints();

  NumOfPoints = OrgPoints.length;

  println("Total number of points "+NumOfPoints);
}
  
void PrepareObjects()
{
  transformAgent = new TransformAgent();
}

void PrepareSong()
{
  minim = new Minim(this);
 
  player = minim.loadFile("song.mp3");
  
  player.play();
}

void mouseDragged()
{
  DoDance = false;
  
  transformAgent.MousePressed(mouseX,mouseY);
}

void mousePressed()
{
  time = 0;
  
  DoDance = false;
  
  transformAgent.MousePressed(mouseX,mouseY);
}

void mouseReleased()
{
  time = 0;
  
  DoDance = true;
  
  transformAgent.MouseReleased();
}

void Dance()
{
  diffTick = (millis() - lastTick);
    
  if (player.left.level()+player.right.level() >= 0.30)
  {
    transformAgent.MousePressed(mousePosX,mousePosY);
  }
  else
  if (diffTick >= targetTick)
  {
    lastTick = millis();
    
    transformAgent.MouseReleased();
  }
  
  if (time >= 1.0)
  {
    time = 0.0;
    
    mousePosX = random(0,width);
    mousePosY = random(0,height);
    
    fillColorAlpha = random(1,200);
    
    strokeColor = color(random(200,255),random(0,255),random(0,255),255);
  }
  
  time += 0.006;
}
  
void draw()
{
  fill(0, fillColorAlpha);
  
  noStroke();
  
  rect(0, 0, width, height);
   
  translate(width/2, height/2);
  
  stroke(strokeColor);
  
  if (player.isPlaying() == true && DoDance == true)
  {
    Dance();
  }
    
  transformAgent.Refresh();
}

