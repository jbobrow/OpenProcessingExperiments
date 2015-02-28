
/*
  with this lesson i decide to create a sorta of audio player
  I know, it's really a basic attempt, but i promise myself to improve this one in the near future.
  I created a sketch which react to the audio buffersize, and create a matrix of rectangles
  Dimensions and fills are random (you can adjust colors intervals in the for cycle in the draw())
  I mapped some keys to act on the audio.
  The song is a Creative Commons Music, downloaded here: http://freemusicarchive.org/music/Kriss/  
  
  
  
*/  


import ddf.minim.*;
Minim minim;
AudioPlayer mp3;
AudioMetaData meta;

int x;
int y;
float r=random(255);
float g=random(255);
float b=random(255);
int step=40;

color strokeColor=color(0, 10);

void setup()
{
  size(1280, 720);
  background(0);
  minim = new Minim(this);
  mp3 = minim.loadFile("jazzClub.mp3");
  mp3.play();
  meta = mp3.getMetaData();
  smooth();
  

}



void draw()
{
  background(0);
  fill(0);
  noStroke();
  rect(0, 40, 120, 680);
  fill(255);
  text("p PLAY", 5, 60);
  text("s PAUSE", 5, 75);
  text("m MUTE", 5, 90);
  text("u UNMUTE", 5, 105);
  text("r REWIND", 5, 120);
  text("Mouse Click set Head Position", 5, 150);
  fill(#FF9900);
  text("\nSong Metadata", 5, 165);
  fill(255);
  text(meta.title(), 5, 195);
  text(meta.author(), 5, 210);
  text(meta.date(), 5, 225);
  text("Under Creative Commons", 5, 255);
  
     noStroke();

    for(x=120; x<1280; x+=step)
    {
      for(y=step; y<720; y+=step)
      {
          int k = x*y;
          float a = map(k, 0, width*height, 0, 255);
          float r = random(map(mp3.bufferSize(), 0, mp3.bufferSize(), 0, 255 ));
          float g = random(map(mp3.bufferSize(), 0, mp3.bufferSize(), 0, 122 ));
          float b = random(map(mp3.bufferSize(), 0, mp3.bufferSize(), 0, 61 ));
          fill(r, g, b, a);
          rect(x, y, mp3.right.level()*step+mp3.left.get((int)random(mp3.bufferSize())), mp3.right.level()*step+mp3.right.get((int)random(mp3.bufferSize())));
        }
    }
    strokeWeight(10);
    stroke(255);
    line(0, 20, mp3.length(), 20);
    stroke(134);
    line(0, 20, map(mp3.position(), 0, mp3.length(), 0, width), 20);
    fill(255);
    text(position2time((int)mp3.position()), map(mp3.position(), 0, mp3.length(), 0, width), 10);
    
    
  
  
}



String position2time(float ms)
{
  String strmin=new String();
  String strsec=new String();
  
  int sec=(int)(ms/1000)%60;
  int min=(int)ms/60000;
  
  if(sec<10) strsec="0";
  else strsec="";
  
  if(min<10) strmin="0";
  else strmin="";
  return(strmin+min+":"+strsec+sec);
}


void mousePressed()
{
  int position = int(map(mouseX, 0, width, 0, mp3.length()));
  mp3.cue(position);
}

void keyPressed()
{
  
  
   switch(key)
   {
     case'p':
       mp3.play();
     break;
     case's':
       mp3.pause();
     break;
     case'm':
       mp3.mute();
     break;
     case'u':
       mp3.unmute();
     break;
     case'r':
       mp3.rewind();
     break;


   }
 
}



