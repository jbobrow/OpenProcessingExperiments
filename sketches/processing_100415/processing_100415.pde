
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/2271*@* */
/* !do not delete the line above, required for linking your tweak if you re-upload */

import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

Minim minim;
AudioPlayer song;
BeatDetect beat;
BeatListener bl;
ArrayList balls = new ArrayList();

float r = 100;
float g = 150;
float b = 200;
float a = 200;
float wide = 100;
float high = 100;
float myVariable;

void setup() {
  size(600, 400);
  // always start Minim before you do anything with it
  minim = new Minim(this);
  frameRate( 30 );
  smooth();
  song = minim.loadFile("rain.mp3");

  beat = new BeatDetect(song.bufferSize(), song.sampleRate());

  beat.setSensitivity(0); 
  bl = new BeatListener(beat, song); 
 
  song.play(); 
}

void draw() {
  r = int(random(255));
  g = int(random(255));
  b = int(random(255));
  a = int(random(255));
  wide = int(random(50,width-100));
  high = int(random(50,height-100));
  // Random values make sketch more spontaneous ;D
  
  fill( 0, 20 );
  rect(0, 0, width, height);
  // Makes visuals fade over time.
  
  // use the mix buffer to draw the waveforms.
  // because these are MONO files, we could have used the left or right buffers and got the same data
  boolean kick = beat.isKick();
  boolean hat = beat.isHat();
  boolean snare = beat.isSnare();
  
  // Visuals are created using beats of either song1 or song2
  // The stronger the beat, the more visuals are created & their colours more vivid.
  
  if( beat.isRange( 5, 15, 2 ) )
  {
    color col = color(r, g, b, a);
    
    for( int j = 0; j < abs(song.mix.level() * 10); j++ )
    {
      float y = random( height );
      float x = random( width );
      for (int i = 0; i < abs(song.mix.level()*100); i++)
      {
        balls.add( new Ball( x, y, song.mix.get(0)*100, col ) );
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
}

void stop()
{
  // always close Minim audio classes when you are done with them
  song.close();
  super.stop();
}

public class Ball
{
  PVector loc = new PVector();
  PVector speed = new PVector( random( 5, 10 ), random( 5, 10 ) );
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
    age += 3;
    if( loc.y > height || age >= 75 )
      alive = false;    
      
      noStroke();
      fill( random(150), age );
      ellipse( loc.x, loc.y, 40, 40 );
      ellipse( loc.x, loc.y, 25, 25 );
      ellipse( loc.x, loc.y, 10, 10 );
      
      ellipse( loc.x+100, loc.y-100, 40, 40 );
      ellipse( loc.x-100, loc.y+100, 25, 25 );
      ellipse( loc.x+50, loc.y-50, 10, 10 );
      
      ellipse( wide, high, 5, 5 );
      ellipse( high, wide, 5, 5 );

      // Adds some user interaction
      if(mousePressed == true) {
      PVector speed = new PVector( 0, random( 0, 20 ) ); 
      speed.y += .25;
      loc.add( speed );
      // Makes ellipses move from top to bottom, mimicking raindrops.
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

