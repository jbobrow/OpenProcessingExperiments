
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
 
import ddf.minim.*;
 
Minim minim;
AudioPlayer song;
BeatDetect beat;
BeatListener bl;
ArrayList balls = new ArrayList();
 
void setup()
{
  size(768, 1024);
  // always start Minim before you do anything with it
  minim = new Minim(this);
  frameRate( 15 );
  smooth();
  song = minim.loadFile("tripoli.mp3", 2048);
 
  beat = new BeatDetect(song.bufferSize(), song.sampleRate());
 
  beat.setSensitivity(0);
  bl = new BeatListener(beat, song); 
 
  song.play();
  noStroke();
}
 
void draw()
{
   
  fill( random(0,63),random(0, 40), random(0, 1), 145 );
  rect(0, 0, width, height);
  // use the mix buffer to draw the waveforms.
  // because these are MONO files, we could have used the left or right buffers and got the same data
  boolean kick = beat.isKick();
  boolean hat = beat.isHat();
  boolean snare = beat.isSnare();
  if( beat.isRange( 5, 15, 2 ) )
  {
    color col = color(random(10,255),random(0, 75), random(0, 25));
    for( int j = 0; j < abs(song.mix.level() * 20); j++ )
    {
      float y = random( height );
    float x = random( width );
      for (int i = 0; i < abs(song.mix.level()*100); i++)
      {
        balls.add( new Ball( x, y, song.mix.get(0)*40, col ) );
      }
    }
  }
  for( int i = 0; i < balls.size(); i++ )
  {
    Ball b = (Ball)balls.get(i);
    b.update();
    if( !b.alive )
    {
      balls.remove( b );
      i--;
    }
  }
  //add beat primitive
  for( int i = 0; i<balls.size(); i++)
  {
    Ball c = (Ball)balls.get(i);
    c.update();
  }
}
 
void stop()
{
  // always close Minim audio classes when you are done with them
  song.close();
  minim.stop();
 
  super.stop();
}
 
public class Ball
{
  PVector loc = new PVector();
  PVector speed = new PVector( random( -2, 2 ), random( -2, 2 ) );
  color col;
  boolean alive = true;
  int age = 0;
  
 
  public Ball( float x, float y, float mag, color col )
  {
    loc.x = x;
    loc.y = y;
    speed.normalize();
    speed.mult( mag );
    this.col = col;
  }
 
  public void update()
  {
    age += 5;
    speed.y += .1;
    loc.add( speed );
    if( loc.y > height || age >= 255 )
      alive = false;
    fill( red(col), blue(col), green(col), 100 - age );{
   // changes the primitive shapes based on time 
     if (millis() > 28000){
    rect( loc.x, loc.y, age*1.2, 1);
     }else if(millis() > 50000){
    ellipse(loc.x, loc.y, 1, 1);
    }else{
    ellipse( loc.x, 250, age*1, age*0.005);
    }
    }
 //vertical line   
 rect( loc.x, height/2, age*1, age*0.005);
 if(millis()>50000){
   rect (width/2, loc.y, 1, age*1.2, 1);
   //vertical lines moving
 }
 if( loc.y > height || age >= 255 )
      alive = false;
    fill( red(col), blue(col), green(col), 100 - age );{
   // changes the primitive shapes based on time 
     if (millis() > 60000){
    ellipse( loc.x, loc.y, 1, age*1.6);
     }else if(millis() > 50000){
    ellipse(loc.x, loc.y, 1, 1);
    }else{
    ellipse( loc.x-100, loc.y-100, 1, age*0.005);
    }
    //third variable
    }
     if( loc.y > height || age >= 255 )
      alive = false;
    fill( red(col), blue(col), green(col), 100 - age );{
   // changes the primitive shapes based on time 
     if (millis() > 260000){
    ellipse( loc.x+random(-50,50), loc.y+random(-50,50), age*0.1, age*0.1);
     }else if(millis() > 50000){
    ellipse(loc.x+random(-150,550), loc.y+random(-150,550), 1, 1);
    }else{
    ellipse( loc.x, 250, age*1, age*0.005);
    }
    }
    
  } 
}



 
class BeatListener implements AudioListener
{
  private BeatDetect beat;
  private AudioPlayer source;
 
  BeatListener(BeatDetect beat, AudioPlayer source)
  {
    this.source = source;
    this.source.addListener(this);
    this.beat = beat;
  }
 
  void samples(float[] samps)
  {
    beat.detect(source.mix);
  }
 
  void samples(float[] sampsL, float[] sampsR)
  {
    beat.detect(source.mix);
  }
}


