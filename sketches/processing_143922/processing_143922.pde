
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

PImage bg;
 
Minim minim;
AudioPlayer song;
BeatDetect beat;
BeatListener bl;
ArrayList balls = new ArrayList();
 
float r = int(random(255));
float g = int(random(255));
float b = int(random(255));
float a = int(random(255));
float wide = 100;
float high = 100;
float myVariable;


Button[] menuButtons;
static final int NUMMENUBUTTONS = 3;
boolean drawBoxes;

 
void setup() {
  size(600, 400);
  // always start Minim before you do anything with it-Rules Taylor read
  minim = new Minim(this);
  frameRate( 30 );
  smooth();
  song = minim.loadFile("brand.mp3", 2048);
 bg = loadImage("bg.png");
 
  beat = new BeatDetect(song.bufferSize(), song.sampleRate());
 
  beat.setSensitivity(0);
  bl = new BeatListener(beat, song);
  
  song.play();
  noStroke();
  
  
  
   menuButtons = new Button[3];
  menuButtons[0] = new Button("The Time is Now", new PVector(100, 100), 32, color(46,0,0), color(100, 0, 0));
  menuButtons[1] = new Button("Attack", new PVector(100, 300), 32, color(0), color(46, 0, 0));
  menuButtons[2] = new Button("Do another thing", new PVector(100, 500), 32, color(100), color(100, 0, 0));
  drawBoxes = false;
  
  
  
  
  
  
}
 
void draw() {
  background(bg);
  displayMenu();
}
 
void displayMenu() {
  for (int i = 0; i < NUMMENUBUTTONS; i++) {
    menuButtons[i].draw(drawBoxes);
  }
  
  
  
  
  
  
  r = int(random(255));
  g = int(random(255));
  b = int(random(255));
  a = int(random(255));
  wide = int(random(50,width-100));
  high = int(random(50,height-100));
  // The Taylor says hello
   
  fill( 35, 0, 0, 45 );
  rect(0, 0, width, height);
  // Fade I say
   
  // Did domeone say waveforms?
  boolean kick = beat.isKick();
  boolean hat = beat.isHat();
  boolean snare = beat.isSnare();
   
   
  if( beat.isRange( 5, 15, 2 ) )
  {
    color col = color( random(255), random(255), random(255) );
     
    for( int j = 0; j < abs(song.mix.level() * 5); j++ )
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
 
 
 
 void mousePressed() {
  if (menuButtons[0].containsMouse()) {
    if (drawBoxes) drawBoxes = false;
    else drawBoxes = true;
  }
  if (menuButtons[1].containsMouse()) {
    fill(0, 255, 0);
    ellipse( 200, 200, 30, 40 );
  }
  if (menuButtons[2].containsMouse()) {
    fill(255, 0, 0);
    ellipse(400,400,20,70);
  }
}
 
class Button {
  PVector pos;
  color textColor, hoverColor;
  float size, tWidth;
  String text;
 
  Button(String text, PVector pos, float size, color textColor, color hoverColor) {
    this.pos = pos;
    this.textColor = textColor;
    this.hoverColor = hoverColor;
    this.size = size;
    this.text = text;
    textSize(size);
    tWidth = textWidth(text);
  }
 
  void draw(boolean on) {
    textSize(size);
    if (containsMouse()) fill(hoverColor);
    else fill(textColor);
    text(text, pos.x, pos.y + size);
    if (on)
      ellipse(pos.x, pos.y, tWidth, size);
  }
 
  boolean containsMouse() {
    if (mouseX > pos.x && mouseX < pos.x + tWidth && mouseY > pos.y && mouseY < pos.y + size )
      return true;
    else return false;
  }
}
    
 
 
 
 
 
void stop()
{
  // always close Minim audio classes when you are done with them-Rules Taylor read
  song.close();
  super.stop();
}
 
public class Ball
{
  PVector loc = new PVector();
  PVector speed = new PVector( random( 5, 10 ), random( 5, 10 ) );
  color col = color(r, g, b, a);
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
      fill(70,150,150, age );
      ellipse( loc.x, loc.y, 30, 40 );
      ellipse( loc.x, loc.y, 25, 25 );
      ellipse( loc.x, loc.y, 10, 10 );
       
      ellipse( loc.x+100, loc.y-100, 40, 50 );
      ellipse( loc.x-100, loc.y+100, 25, 25 );
      ellipse( loc.x+50, loc.y-50, 10, 10 );
       
      ellipse( wide, high, 5, 5 );
      ellipse( high, wide, 5, 5 );
 
      // Adds some user interaction
      if(mousePressed == true) {
      PVector speed = new PVector( 0, random( 0, 20 ) );
      speed.y += .25;
      loc.add( speed );
      // Taylor says make it rain
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


