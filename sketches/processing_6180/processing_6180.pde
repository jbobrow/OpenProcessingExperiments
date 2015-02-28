
// From John Whitney's "Hundred Point Radius" idea.
// - Jim Bumgardner

// import processing.opengl.*;

int   nbrPoints = 100;
int   cx,cy;
float crad;
float cycleLength = 2*PI*nbrPoints; // 628 seconds
int   counter =0 ;
float   speed = 1;
int   frameCtr = 0;
boolean isSilent = true;

public class Dot {
    public float x;
    public float y;
    public int sIdx;
    float  tine;
    long  lastSound;
};

Dot[] dots = new Dot[nbrPoints];

void setup()
{
  size(500, 500);
  cx = width/2;
  cy = height/2;
  crad = (min(width,height)/2) * 0.95;
  noStroke();
  smooth();
  colorMode(HSB, 1);
  background(0);
  
  cycleLength = 60*3*10;
  speed = (2*PI*nbrPoints) / cycleLength;
 
  for (int i = 0; i < nbrPoints; ++i)
  {
    dots[i] = new Dot();
    dots[i].tine = -1;
    dots[i].lastSound = millis();
  }
}



void draw()
{
  filter(BLUR);
  filter(ERODE);
  // background(0);
  // fill(0,0,.5);

  // nbrPoints = 48;
  float mx = mouseX/(float)width;
  float my = mouseY/(float)height;
  speed = (2*PI*nbrPoints) / cycleLength;

  long cMillis = millis();
  float timer = cMillis*.001*speed;

  counter = int(timer / cycleLength);

  float pi2 = 2*PI;
  float strikeOffset = 0; // -PI/2;
  

  for (int i = 0; i < nbrPoints; ++i)
  {
      Dot  dt = dots[i];
      float r = i/(float)nbrPoints;
      if ((counter & 1) != 0)
        r = 1-r;

      float a = timer * r;
      float len = i*crad/(float)nbrPoints;
      
      if ((int) (a/pi2) != (int) (dt.tine/pi2))
      {
        // Sound Note Here...
        if (!isSilent) {
            // midiOutput.sendNoteOn(0, 32+i, 100);
        }
        dt.lastSound = millis();
      }
      
      // len *= sin(a*timer*my*.25);
      int x = (int) (cx - sin(a)*len);
      int y = (int) (cy + cos(a)*len);
      float huev = r+timer*.01; //  + mouseY/(float)height;
      huev -= int(huev);
      float satv = cMillis-dt.lastSound < 500? (cMillis-dt.lastSound)/1000 : .5;
      float minRad = 2+i/6.0;
      float radv = cMillis-dt.lastSound < 500? (minRad+6)-6*(cMillis-dt.lastSound)/500 : minRad;
     //  fill(color(huev,satv,1));
     // ellipse(x,y,radv,radv);
      dt.x = x;
      dt.y = y;
      dt.sIdx = -1;
      dt.tine = a;
  }
  strokeWeight(4);
  // stroke((millis() % 1000) / 1000.0);
  stroke(1);
  for (int i = 0; i < nbrPoints; ++i)
  {
     Dot dt = dots[i];
     // if (dt.sIdx == -1) {
         // Find closest line
         int cIdx = 0, cIdx2 = 0;
         float mDst = pow(dots[cIdx].x - dt.x,2) + pow(dots[cIdx].y-dt.y,2);
         for (int j = 0; j < nbrPoints; ++j) {
           if (j == i)
             continue;
           float tDst = pow(dots[j].x - dt.x,2) + pow(dots[j].y-dt.y,2);
           if (tDst < mDst) {
               mDst = tDst;
               cIdx2 = cIdx;
               cIdx = j;
           }
         }
         // connect cIdx and I
         dots[i].sIdx = cIdx;
         dots[cIdx].sIdx = i;
         float r1 = i/(float)nbrPoints;
         float r2 = cIdx/(float)nbrPoints;
         float r3 = (r1+r2)/2;
         float huev = r3+timer*.01; //  + mouseY/(float)height;
         huev -= int(huev);
         stroke( color(huev,.5,1));
         line(dots[i].x,dots[i].y,dots[cIdx].x,dots[cIdx].y);
         line(dots[i].x,dots[i].y,dots[cIdx2].x,dots[cIdx2].y);
     // }
  }

  timer -= speed;

  frameCtr++;
}

void allNotesOff()
{
  // for (int i = 0; i < 128; ++i)
  //  midiOutput.sendNoteOff(0, i, 0);
}

void keyPressed() {
  if (key == ' ') 
  {
    isSilent = !isSilent;
    if (isSilent) {
      allNotesOff();
    }
  }
}


