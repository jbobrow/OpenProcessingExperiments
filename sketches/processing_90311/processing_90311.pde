
/**
 * This sketch demonstrates how to use the <code>removeSignal(AudioSignal)</code> method of a <code>Polyphonic</code> class. 
 * Currently the only <code>Polyphonic</code> class in Minim is <code>AudioOutput</code>. 
 * This sketch adds a sine wave and a saw wave to the output and you can remove the saw wave by pressing any key.
 * Removing a signal means that it is no longer part of the <code>Polyphonic</code>'s signal chain. 
 */

import ddf.minim.*;
import ddf.minim.signals.*;

Minim minim;
AudioOutput out;
SineWave sine;
WaveformRenderer waveform;


int ngRows = 4;
int ngCols = 4;
float[][] noteGrid = {
  {220, 246.94, 261.63, 293.67 },
  {329.63, 349.23, 392, 440 },
  {440, 493.88, 523.2, 587.33  },
  {659.26, 698.46, 783.99, 880 }
};
int pCount = 8;

Particle[] particles = new Particle[pCount];
float topspeed = 4;
 
color[][] rectGrid = new color[ngRows][ngCols];


color base = color(70);
color select = color(90);
color grid = color(100);

void setup()
{
  size(800, 800);
  smooth();
  minim = new Minim(this);
  // this gets a stereo output - MONO/STEREO, bufferSize, sampleRate, bitDepth
  out = minim.getLineOut(Minim.STEREO, 1028, 44100, 16);

  waveform = new WaveformRenderer();
  // see the example Recordable >> addListener for more about this
  out.addListener(waveform);
  
  sine =  new SineWave(300, 0.2, out.sampleRate());
  
  for( int i=0; i < pCount; i++ )
  {
    particles[i] = new Particle(i);
    out.addSignal(particles[i].sine);
  }
  
    
  for( int i=0; i < ngRows; i++ ) 
    for( int j=0; j < ngCols; j++ )
        rectGrid[i][j] = color(base);
  
}

void draw()
{
  background(100);
  //draw grid
  stroke(grid);
  for( int r =0; r<=ngRows; r++ )
    line(0, r*(height/ngRows), width,r*(height/ngRows));
  for( int c =0; c<=ngCols; c++ )
    line(c*(width/ngRows), 0, c*(width/ngRows), height );


  boolean colorRect = false;
  
  for( int i=0; i < ngRows; i++ ) 
    for( int j=0; j < ngCols; j++ )
    {
         for( int p=0; p < pCount; p++ )
          {
            PVector coordinates = particles[p].checkGrid();
            if( coordinates.x == i && coordinates.y == j )
            {
                 colorRect = true;break;
            }
          } 
          if( colorRect )
            rectGrid[i][j] = select;
          else
            rectGrid[i][j] = base;
            
          fill( rectGrid[i][j] );
          rect( j*(width/ngCols), i* (height/ngRows), width/ngCols-1, height/ngRows-1 );
          
          colorRect = false;
    }
       
      
    
  for( int i=0; i < pCount; i++ )
  {
    particles[i].update();
    particles[i].checkEdges();
    particles[i].display();
    
    PVector coordinates = particles[i].checkGrid();
    float frequency = noteGrid[(int)coordinates.x][(int)coordinates.y];
    
    particles[i].setFreq(frequency);

    stroke(255, 0, 155);
    //line( particles[i].location.x, particles[i].location.y, mouseX, mouseY);
    
    noStroke();
  }
  

    
}

void keyPressed()
{
 if( key == 'x')
    topspeed++;
 if( key == 'z' && topspeed > 0 )
    topspeed-- ;
 
}

void stop()
{
  // always close Minim audio classes when you are done with them
  out.close();
  // always stop Minim before exiting.
  minim.stop();

  super.stop();
}



class Particle{
  
  int ID;
  
  PVector location;
  PVector velocity;
  PVector acceleration;
 
  
  float freq;
  float amp;
  SineWave sine;
  
  Particle(int pID)
  {
      ID = pID;
    
      location = new PVector(random(width-500,width), random(height-500,height));      
      velocity = new PVector( 0, 0 );
      acceleration = new PVector( 0.0, 0.0);
      
     
      
      int r1 = (int)random(4);
      int r2 = (int)random(4);
      freq = noteGrid[r1][r2];
      amp = 1/(float)pCount;
      
      sine = new SineWave(freq, amp, out.sampleRate());

  }
  
  void update()
  {
    PVector mouse = new PVector(mouseX, mouseY);
    PVector dir = PVector.sub(mouse, location);
    dir.normalize();
    dir.mult( map(noise(ID), 0, 1, .05, .08 ) );
    acceleration = PVector.div(dir,1);
    
    velocity.add(acceleration);
    velocity.limit(topspeed);
    location.add(velocity);

  }
  
  void display()
  {
    
    PVector mouse = new PVector(mouseX, mouseY);
    PVector dir = PVector.sub(mouse, location);
    
    float size = 10;

    float locNorm = map(location.x, 0, width, 0, 1);
   
    noStroke();
    fill(120, 200, 255);
    ellipse(location.x, location.y, size, size);
    
    
  }
  
  void checkEdges()
  {
      if (location.x > width) {
        location.x = 0;
      } 
      else if (location.x < 0) {
        location.x = width;
      }
      if (location.y > height) {
        location.y = 0;
      } 
      else if (location.y < 0) {
        location.y = height;
      }
  }
  
  PVector checkGrid()
  {

    int r =0;
    int c =0;
    //get row
    for( r=0; r<ngRows; r++ )
    {
      if( location.x < r*(height/ngRows) )
        break;
      
    }
    //get col
    for( c=0; c<ngCols; c++ )
    {
      if( location.y < c*(height/ngRows) )
        break;
      
    }
    
    return new PVector( (int)c-1, (int)r-1); 
  }
  
  void setFreq(float freq)
  {
    sine.setFreq(freq);
  }
  
}


