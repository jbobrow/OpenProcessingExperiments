
//Code Modified from Brian Pollock
//http://www.openprocessing.org/visuals/?visualID=36571
//Code modified from Michaela Kim
//http://www.openprocessing.org/visuals/?visualID=19353
 //"Honk" sound clip from soundjay.com
 // slurping sound from http://soundbible.com

import ddf.minim.*;
import ddf.minim.signals.*;
Minim minim;
AudioPlayer aSound;
PFont font;
 PImage img; 
  PImage img0;

int gw;
int gh;
int s = 2;
int nc = 3;
float speed = .01;
int frame=0;
int a1=20,a2=255;
int a = a1;
 


 
 void setup(){
  size(700,509, P2D);
  int i,j,k;
    
 
  seed();
  img = loadImage("back.jpg");
   img0 = loadImage("finale3.png");


minim = new Minim(this);
 aSound = minim.loadFile("madworld.mp3");
 aSound.play();
 aSound.loop();

 font = createFont("Helvetica", 60);
textFont (font);
 }

 
 void draw(){
background(img);

int j;
   
  if( frame<30 )
  {
    ++frame;
  }
  else
  {
    img.loadPixels();
    for(j=0; j<gw*gh*speed; j++)
      persuade( );
    img.updatePixels();
  }
  image( img,0,0,img.width*s,img.height*s );
  image (img0,0,0);
}



void seed()
{
  int i,j,k;
 
  gw = width;
  gh = height;
  img = createImage( gw,gh, ARGB );
 
  img.loadPixels();
 
  for( k=i=0; i<gw; i++ )
  {
    for( j=0; j<gh; j++)
    {
      color c;
      switch( floor(random(nc)) )
      {
        default:
        case 0: c=color(0,0,0,a);break;
        case 1: c=color(255,255,255,a);break;
        case 2: c=color(200,0,0,a);break;
        case 3: c=color(0,100,160,a);break;
        case 4: c=color(64,192,0,a);break;
      }
      img.pixels[k++] = c;
    }
  }
  img.updatePixels();
  background(0);
  image( img,0,0,img.width*s,img.height*s );
  frame = 0; 
}
 
void persuade(  )
{
  int i1,j1;
  int i2,j2;
  int d;
   
  i2 = i1 = floor(random(gw));
  j2 = j1 = floor(random(gh));
   
  if( random(1)>0.5 )
    d= 1;
  else
    d= -1;
  if( random(1)>0.5 )
    i2 = (i2+gw+d)%gw;
  else
    j2 = (j2+gh+d)%gh;
   
   
  img.pixels[j1*gw+i1] = img.pixels[j2*gw+i2];
   
}
 
void drawCell( int i, int j, int a )
{
 
  rect( i*s,j*s,s,s);
}
 
void drawAll( int a )
{
  int i,j;
  noStroke();
  for( i=0; i<gw; i++ )
  {
    for( j=0; j<gh; j++)
    {
      drawCell( i,j,a );
    }
  }
  

}
 
void mouseMoved(){
textSize (random(5,50));
fill (random(255,100), random (50,100));
text ("The END",pmouseX, pmouseY);
//change when mouse pressed
 }

void stop(){

 minim.stop();
  super.stop();
}



