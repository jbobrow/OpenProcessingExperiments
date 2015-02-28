
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
  size(640, 480);
  // always start Minim before you do anything with it
  minim = new Minim(this);
  frameRate( 30 );
  smooth();
  song = minim.loadFile("droost.mp3", 2048);

  beat = new BeatDetect(song.bufferSize(), song.sampleRate());

  beat.setSensitivity(0); 
  bl = new BeatListener(beat, song);  

  song.play();
  noStroke();
}

void draw()
{
  
  fill( 0, 0, 0, 45 );
  rect(0, 0, width, height);
  // use the mix buffer to draw the waveforms.
  // because these are MONO files, we could have used the left or right buffers and got the same data
  boolean kick = beat.isKick();
  boolean hat = beat.isHat();
  boolean snare = beat.isSnare();
  if( beat.isRange( 5, 15, 2 ) )
  {
    color col = color( random(255), random(255), random(255) );
    for( int j = 0; j < abs(song.mix.level() * 50); j++ )
    {
      float y = random( height );
    float x = random( width );
      for (int i = 0; i < abs(song.mix.level()*100); i++)
      {
        balls.add( new Ball( x, y, song.mix.get(0)*70, col ) );
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
    age += 3;
    speed.y += .1; 
    loc.add( speed );
    if( loc.y > height || age >= 255 )
      alive = false;
    fill( red(col), blue(col), green(col), 255 - age );
    ellipse( loc.x, loc.y, 5, 5 );
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







