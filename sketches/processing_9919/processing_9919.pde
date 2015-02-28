

import ddf.minim.*;

Minim minim;
AudioSample soundbub;
AudioSample evillaugh;
AudioSample bubblepop;
AudioPlayer fishy;

//fish1
int f1xpos=200;
int f1ypos=150;
int f1height=40;
int f1width=80;
//fish2
int f2xpos=400;
int f2ypos=50;
int f2height=25;
int f2width=80;
//shark
int f3xpos=350;
int f3ypos=350;
int f3height=80;
int f3width=240;
//bubbles
int bubble1w=250;
int bubble1h=500;
int bubble2w=235;
int bubble2h=530;
int bubble3w=265;
int bubble3h=510;
boolean bubbles = false;
//skull
int skullxpos=250;
int skullypos=460;
boolean eyelight = false;
int rectxpos=225;
int rectypos=430;
int rectwidth=50;
int rectheight=65;
PImage backdrop;
//cursorfish
int cwidth=95;
int cheight=35;

void setup ()
{
  size (500,500);
  backdrop = loadImage ("backdrop.jpg");
  smooth();
  noCursor();
  minim = new Minim(this);
  soundbub = minim.loadSample("soundbub.wav");
  evillaugh=minim.loadSample("evillaugh.wav");
  bubblepop=minim.loadSample("bubblepop.wav");
  fishy = minim.loadFile("fishy.wav");
  fishy.play();
}

void draw ()
{
  //background (106,143,219);
  image (backdrop,0,0);
  noStroke();
  fill (240,193,24);
  rectMode (NORMAL);
  rect (0,height-20,width,height);
  
  //goldfish
  noStroke();
  fill(245,150,54);
  ellipseMode (CENTER);
  ellipse (f1xpos,f1ypos,f1width,f1height);
  triangle (f1xpos-50,f1ypos-30,f1xpos-50,f1ypos+30,f1xpos-20,f1ypos);
  fill (0);
  ellipse (f1xpos+20,f1ypos-10,5,5);
  fill(245,150,54);
  ellipse (f1xpos+40,f1ypos,10,20);

  //pinkfish
  noStroke();
  fill(250,106,231);
  ellipseMode (CENTER);
  ellipse (f2xpos,f2ypos,f2width,f2height);
  triangle (f2xpos+50,f2ypos+30,f2xpos+50,f2ypos-30,f2xpos+20,f2ypos);
  fill (0);
  ellipse (f2xpos-20,f2ypos-6,5,5);
  fill(250,106,231);
  ellipse (f2xpos-40,f2ypos,10,20);
  
  //shark
  noStroke();
  fill(189,192,203);
  ellipseMode (CENTER);
  ellipse (f3xpos,f3ypos,f3width,f3height);
  triangle (f3xpos+125,f3ypos+90,f3xpos+125,f3ypos-90,f3xpos+70,f3ypos);
  triangle (f3xpos,f3ypos-80,f3xpos-50,f3ypos,f3xpos+50,f3ypos);
  fill (0);
  ellipse (f3xpos-80,f3ypos-7,15,10);
  fill (255,255,255);
  ellipse (f3xpos-(random (80,82)),f3ypos-6,5,5);
  stroke(0);
  strokeWeight(5);
  line (f3xpos-100,f3ypos+20,f3xpos-70,f3ypos+15);
  line (f3xpos,f3ypos+10,f3xpos+20, f3ypos-7);
  line (f3xpos,f3ypos-10,f3xpos+20, f3ypos-7);
  noFill();
  strokeWeight(3);
  arc(f3xpos-20,f3ypos-5, 30, 30, PI/2, PI);
  arc(f3xpos-30,f3ypos, 30, 30, PI/2, PI);
  arc(f3xpos-40,f3ypos+5, 30, 30, PI/2, PI);
  
  //cursorfish
  
  if (pmouseX<mouseX||pmouseX==mouseX)
  {
    fill (mouseX,mouseY,mouseY-mouseY);
    noStroke();
    ellipse (mouseX,mouseY,cwidth,cheight);
    triangle (mouseX-30,mouseY,mouseX-60,mouseY-50,mouseX-60,mouseY+50);
    fill (0);
    ellipse(mouseX+20,mouseY-5,5,5);
    arc(mouseX+28,mouseY+8, 15, 15, PI/2, PI);
  }
  else if (mouseX<pmouseX||pmouseX==mouseX)
  {
    fill (mouseX,mouseY,mouseY-mouseY);
    noStroke();
    ellipse (mouseX,mouseY,cwidth,cheight);
    triangle (mouseX+30,mouseY,mouseX+60,mouseY-50,mouseX+60,mouseY+50);
    fill (0);
    ellipse(mouseX-20,mouseY-5,5,5);
    arc(mouseX-28,mouseY+8, 15, 15, PI/2, PI);
  }
 
  
  //fish movement
   f1xpos+=2;
   f2xpos-=3;
   f3xpos-=1;
   
   // fish loop
   if(f1xpos-50>width)
   {
     int f1newpos = f1xpos+50;
     f1xpos=0-200; 
     f1ypos =(int) random(100,400);

   }
   
   if(f2xpos+50<0)
   {
     int f2newpos = f2xpos+50;
     f2xpos=width+200; 
     f2ypos =(int) random(100,400);
   }
   
      if(f3xpos+125<0)
   {
     int f3newpos = f3xpos+100;
     f3xpos=width+200; 
     f3ypos =(int) random(100,400);
   }
      //bubbles
    if (bubbles)
   {
     stroke (59,209,207);
     noFill();
     ellipse (bubble1w,bubble1h,20,20);
     ellipse (bubble2w,bubble2h,10,10);
     ellipse (bubble3w,bubble3h,5,5);
     bubble1h = bubble1h -1;
     bubble2h = bubble2h -1;
     bubble3h = bubble3h -1;
     if (bubble1h <0|| bubbles==false)
     {
     bubble1h =550;
     bubble2h =530;
     bubble3h =570;
     bubblepop.trigger();
     soundbub.trigger(); 
     
     }
   }
   
   //skull
   noStroke();
   fill (255,255,255);
   ellipseMode (CENTER);
   ellipse (skullxpos,skullypos,50,50);
   ellipse (skullxpos,skullypos+25,35,30);
   fill (0);
   ellipse (skullxpos-10,skullypos-5,15,7);
   ellipse (skullxpos+10,skullypos-5,15,7);
   ellipse (skullxpos,skullypos+10,10,15);
   rectMode (CENTER);
   rect (skullxpos,skullypos+25,15,5);
   noFill();
   stroke(0,0,0,0);
   rectMode (CORNER);
   rect (rectxpos,rectypos,rectwidth,rectheight);
   
   if (eyelight)
   {
       stroke(0);
       fill (255,0,0);
       ellipse (skullxpos-10,skullypos-5,15,7);
       ellipse (skullxpos+10,skullypos-5,15,7);
   }
    
}
  // input
     
void keyPressed( )
{
   if (keyPressed)
      if(key==' ')
   {
     bubbles = !bubbles;
     bubble1h =550;
     bubble2h =530;
     bubble3h =570;
   
     if (bubbles)
     {
       soundbub.trigger(); 
     }
     if (!bubbles)
     {
       bubblepop.trigger();
     }
     
   }

}

void mousePressed()
{
   if (mouseX> rectxpos && mouseX <rectxpos+rectwidth && mouseY >rectypos && mouseY <rectypos+rectheight && mousePressed)
   {
     eyelight = !eyelight;
     if (eyelight)
     {
       evillaugh.trigger();
     }
   }
}

void stop()
{
  evillaugh.close();
  soundbub.close();
  bubblepop.close();
  minim.stop();
  super.stop();
}
     


