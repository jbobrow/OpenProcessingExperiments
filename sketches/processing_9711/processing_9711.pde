
/* 
 Oliver J. Switzer
 Interactive Computing
 Final Project
 Keith O'Hara
 */

PFont font;

int num = 150;
int index = 0;
int[] x = new int[num];
int[] y = new int[num];

//sound
import ddf.minim.*;

Minim minim;
AudioSample noteE;
AudioSample noteF;
AudioSample noteG;
AudioSample noteA;
AudioSample noteB;
AudioSample noteC;
AudioSample noteD;

float speed = 7.5;
float lineposition = 0;
boolean composeMode = true;
float notehue;

void setup()
{
  font = loadFont("Desdemona-48.vlw"); 
  minim = new Minim(this);
  noteE = minim.loadSample("1957__Miulew__mechanic4.wav");
  noteF = minim.loadSample("5592__Jovica__Attack_Zound_180(2).wav");
  noteG = minim.loadSample("12916__sweet_trip__mm_kwik_mod_01.wav");
  noteA = minim.loadSample("12921__sweet_trip__mm_kwik_mod_06.wav");
  noteB = minim.loadSample("59473__glewlio__melody_Sound_15.wav");
  noteC = minim.loadSample("12927__sweet_trip__mm_sweep_z.wav");
  noteD = minim.loadSample("16599__phylum_sinter___two_beat_clacker.wav");
  size(800,400);
  background(0);
  smooth();
  colorMode(HSB);
}

void draw()
{
  
  textFont(font); 
  text("Play The Unknown: Press Any Key", 10, 40); 
  fill(0, 102, 153);
  textFont(font); 
  text("Reset Line: Press r", 10, 80); 
  


  frameRate(60);
  filter(BLUR,1);
  notehue = map(mouseX/7, 0, width/7, 0, 359);

  stroke(255);
  strokeWeight(2);


  if(keyPressed == true)
  { 
    if(key == 'p');
    {
      composeMode = false;
      background(0);

      line(lineposition, 0, lineposition, height);
      noStroke();
      lineposition = lineposition + speed;

      for(int i = 0; i < num; i++)
      {
        if(x[i] >= lineposition && x[i] < lineposition + speed)
        {
          if(x[i] > 0 && x[i] <= 1*width/7)
          {
            ellipse(x[i], y[i], width*2, 5);
            noteE.trigger();
          }
          if(x[i] > 1*width/7 && x[i] <= 2*width/7)
          {
            fill(notehue,77,64);
            ellipse(x[i], y[i], width, 5);
            noteF.trigger();
          }
          if(x[i] > 2*width/7 && x[i] <= 3*width/7)
          {
            fill(notehue,77,64);
            ellipse(x[i], y[i], width*2, 5);
            noteG.trigger();
          }
          if(x[i] > 3*width/7 && x[i] <= 4*width/7)
          {
            fill(notehue,77,64);
            ellipse(x[i], y[i], width*2, 5);
            noteA.trigger();
          }
          if(x[i] > 4*width/7 && x[i] <= 5*width/7)
          {
            fill(notehue,77,64);
            ellipse(x[i], y[i], width*2, 5);
            noteB.trigger();
          }
          if(x[i] > 5*width/7 && x[i] <= 6*width/7)
          {
            fill(notehue,77,64);
            ellipse(x[i], y[i], width*2, 5);
            noteC.trigger();
          }
          if(x[i] > 6*width/7 && x[i] < width)
          {
            fill(notehue,77,64);
            ellipse(x[i], y[i], width*2, 5);
            noteD.trigger();
          }
        }
      }
    }
  
    if(key == 'r')
    {
      composeMode = true;
      lineposition = 0;
      lineposition = lineposition + 0;
    }
    
   noStroke();
  }
}


void mouseReleased()
{
  x[index] = mouseX;
  y[index] = mouseY;
  index = (index + 1) % num;


  if(composeMode == true)
  {
    if(mouseX < width/7)
    {
      fill(notehue,77,64);
      ellipse(mouseX, mouseY, mouseX/5, mouseY/5); 
      noteE.trigger();
    }

    if(mouseX > width/7 && mouseX < 2*width/7)
    {
      fill(notehue,77,64);
      ellipse(mouseX, mouseY, mouseX/5, mouseY/5);
      noteF.trigger();
    }

    if(mouseX > 2*width/7 && mouseX < 3*width/7)
    {
      fill(notehue,77,64);
      ellipse(mouseX, mouseY, mouseX/5, mouseY/5);
      noteG.trigger();
    }

    if(mouseX > 3*width/7 && mouseX < 4*width/7)
    {
      fill(notehue,77,64);
      ellipse(mouseX, mouseY, mouseX/5, mouseY/5);
      noteA.trigger();
    }
    if(mouseX > 4*width/7 && mouseX < 5*width/7)
    {
      fill(notehue,77,64);
      ellipse(mouseX, mouseY, mouseX/5, mouseY/5);
      noteB.trigger();
    }

    if(mouseX > 5*width/7 && mouseX < 6*width/7)
    {
      fill(notehue,77,64);
      ellipse(mouseX, mouseY, mouseX/5, mouseY/5);
      noteC.trigger();
    }

    if(mouseX > 6*width/7 && mouseX < width)
    {
      fill(notehue,77,64);
      ellipse(mouseX, mouseY, mouseX/5, mouseY/5);
      noteD.trigger();
    }
  }
}







void stop()
{
  minim.stop();

  super.stop();
}








