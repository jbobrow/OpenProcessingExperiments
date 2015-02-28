
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;


int play_pause=1, x=-100, h=20, y=0, i=0, gap=4, dir=1, p, q, r, mx=width/2, my=height/2, s=21, b=1, size_max=100, size_min=1, size_type=1;
int change_color=1, ecliptic_total, stroke_on=1, transparency=100, transparency_max=255, transparency_min=0, units=10;
PFont font;
float k, l, m;
Minim minim; 
AudioPlayer player;
AudioInput input;

void setup()
{
  size(1000, 1000,JAVA2D);
  minim = new Minim(this);
  player = minim.loadFile("Rock Mix.wav", 2048);
 
  player.loop();
  player.play();
  randomSeed(12);
  frameRate(10000);
 
 font = loadFont("OstrichSans-Bold-48.vlw");
}

void draw()
  {
    audioPlayer();
  transparency();
  drawEllipse();
  drawRect();
  reset();
    
  frameRate(500);
    delete();
    sizeText();

}

void audioPlayer()
{
  if(play_pause == 1)
    {
      player.play();
    }
  if(play_pause == -1)
  {
    player.pause();
  }
 
}


void stop()
{
  // always close Minim audio classes when you are done with them
  player.close();
  // always stop Minim before exiting
  minim.stop();
  
  super.stop();
}
void sizeText()
{
     fill(0,0,0);
     textFont(font, 36); 
   text("Maximum Circle Size:", 670, 38);
   text(size_max, 950, 38);
   text("Minimum Circle Size:", 25, 38);
   text(size_min, 305, 38);
     fill(50,150,30);
     if(size_type==1)
     {
   text("Hit 'Enter' to Set: Max", 350, 38);
     }
     if(size_type==-1)
     {
   text("Hit 'Enter' to Set: Min", 350, 38);
     }
   text("UP +", 940, 95);
   text("DOWN -", 900, 130);
   text("'DELETE' Toggles Swipe", 20, 95);
   text("'SHIFT' Toggles Outlines", 20, 130);
     fill(1,1,1);
   text("Your Ecliptic Total:", 199, 800);
   text("Your Ecliptic Total:", 201, 800);
   text("Your Ecliptic Total:", 200, 799);
   text("Your Ecliptic Total:", 200, 801);
     fill(50,150,30); 
   text("Your Ecliptic Total:", 200, 800);
     fill(254, 254, 254);
     fill(50,150,30);
     rect(488, 766, 203, 43);
     fill(1,1,1);
     rect(490, 768, 200, 40);
     fill(50,150,30);
     textFont(font, 36);
   text(ecliptic_total, 501, 801);
     fill(50,150,30);
     rect(5, 648, 54, 54);
     fill(1,1,1);
     rect(7, 650, 50, 50);
     fill(50,150,30);
   text(transparency, 15, 690);
   fill(50,150,30);
   text("Adjust Transparency : ' t '", 6, 740);
   text("Adjust Transparency : ' t '", 8, 740);
   text("Adjust Transparency : ' t '", 7, 739);
   text("Adjust Transparency : ' t '", 7, 741);
     fill(1,1,1);
   text("Adjust Transparency : ' t '", 7, 740);
     int g=blendColor(q, r, SUBTRACT);
   
}

void reset()
{
    y=0;
    x=-100;
}

void delete()
{   
  frameRate(10000);
  gap=gap+dir;
    if(gap<0)
      {
        dir=1;
      }
}
  
void transparency()
{
     
}


void keyPressed()
{
       //Play/Pause Music
       if(key == 'p' || key == 'P')
       {
         play_pause=-play_pause;
       }
       //Color Selection from Library of Standard Colors
       if(key == '1') //Red
       { 
        p=255;
        q=1;
        r=1;
       }
         if(key == '2') //Green
       { 
        p=1;
        q=255;
        r=1;
       }
         if(key == '3') //Blue
       { 
        p=1;
        q=1;
        r=255;
       }
         if(key == '4') //Yellow
       { 
        p=255;
        q=255;
        r=1;
       }
         if(key == '5') //Purple
       { 
        p=255;
        q=1;
        r=255;
       }
       if(key == '6') //Orange
       { 
        p=255;
        q=122;
        r=1;
       }  
       if(key == '7') //Teal
       { 
        p=1;
        q=255;
        r=255;
       } 
       if(key == '8') //Pink
       { 
        p=255;
        q=0;
        r=150;
       }
       if(key == '9') //Brown
       { 
        p=130;
        q=65;
        r=1;
       }
        if(key == '0') //White
       { 
        p=255;
        q=255;
        r=255;
       }
         
       //Toggle Between a having the colors change or stay constant.
       if(keyCode == TAB)
       {
         change_color=-change_color;
       }
       if ((key == 't' || key == 'T') && transparency < transparency_max-4 && transparency > transparency_min-1)
       {
         if(transparency>transparency_max-6 ^ transparency<transparency_min+5)
          {
           units=-units;
          }
          transparency+=units;
       }
       
       //Clear the Drawing Field
       if(keyCode == BACKSPACE)
        {
        dir=-1;
        gap=height-240;
        }
        
      //Toggles Stroke on and off.
      if(keyCode == SHIFT)
        {
          stroke_on=-stroke_on;
        }
      if(stroke_on==1)
        {
          stroke(5);
        }
      if(stroke_on==-1)
        {
          noStroke();
        }
      
      //Toggle Between Being Able to adjust Maximum and Minimum Circle Size 
      if(keyCode == ENTER)
        {
        size_type=-size_type;
        }
      if(size_type==-1)
      {
        if(keyCode == UP && size_max>size_min+5)  //While minimum is selected, increases minimum circle size.
        {
         size_min=size_min+5;
          fill(220, 0, 0);
          text("+", 975, 95);
           if(size_min>s ^ size_max<s)
            {
              s=size_min+2;
            }
        }
        if(keyCode == DOWN && size_min>1) //While minimum is selected, decreases minimum circle size.
        {
         size_min=size_min-5;
          fill(220, 0, 0);
          text("-", 977, 130);
         
        }
      }
      if(size_type==1)
      {
        if(keyCode == UP && size_max<1000) //While maximum is selected, increases maximum circle size.
        {
         size_max=size_max+5;
         fill(220, 0, 0);
          text("+", 975, 95);
          
        }
        if(keyCode == DOWN && size_min+5<size_max) //While maximum is selected, decreases maximum circle size.
        {
         size_max=size_max-5;
           fill(220, 0, 0);
          text("-", 977, 130);
         if(size_min>s ^ size_max<s)
            {
              s=size_max-2;
            }
          }
      }
     
    
}

void drawRect()
{
  for(i=0; y+240<height;i++)
     { 
      if(x-300>width)
       {
        y=y+10+gap;
        x=width-x-100; 
       }
      fill(100);
      rect(x,y, 300,h);
      x=x+100;
      rect(x,y+h,300,h);
      x=x-250; 
      rect(x, y + h*2, 300, h);
      x=x+250; 
      rect(x,y+h,300,h);
      x=x+200;
     }
}

void drawEllipse()
{
  if (mousePressed == true)
         {
          
          if(s>size_min && s<size_max)
          {
             if(s<size_min+2 ^ s>size_max-2)
             {
              b=-b;
             }
            
           s=s+b;
          }
         }
          
          mx=mouseX;
          my=mouseY;
          if(change_color==1)
          {
          k = random(255);
          l = random(255);
          m = random(255);
          p= int(k); 
          q= int(l);
          r= int(m);
          }
        
          fill(p,q,r, transparency);
      ellipse(mx, my, s, s);
      ecliptic_total+=1;
       
          
         
   
     
}



