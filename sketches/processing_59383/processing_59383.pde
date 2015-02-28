
/*Clea Stone
 CMSC 117
 Keith O'hara
 For the first octave, place your left fingers on Q W E R and your right fingers on U I O P.
 Use the numbers above these keys for the sharps. For the second octave, place your left fingers on
 the keys Z X C V and your right fingers on M , . ?
 Use the keys above these keys for the sharps.
 Press more than one key at a time to create chords.
 Enjoy!*/

ColorPicker cp;
import ddf.minim.*;
import ddf.minim.signals.*;

Minim minim;
AudioOutput out;
SineWave sine;
SineWave nullSine;

int keysPressed = 0;
float MAXAMP = .5; 
float amp  = MAXAMP;

//c5-c7 in hertz
float[] tones = {
  16.35, 17.32, 18.35, 19.45, 20.60, 21.83, 23.12, 24.50, 25.96, 27.50, 29.14, 30.87,
  32.70,32.70, 34.65, 36.71, 38.89, 41.20, 43.25, 46.25, 49.00, 51.91, 55.00, 58.27, 61.74, 65.41
};

//correlating keys on computer keyboard
char keys[] = {
  'q','2','w','3','e','r','5','u','8','i','9','o','p','z','s','x','d','c','v','g','m','k',',','l','.','/'
};

//note names
String notes[] = {
  "C","#"," D","#"," E","     F","    #","     G","    #","     A","    #","     B","        C","    C",
  "    #","     D","    #","     E","         F", "        #","         G","        #","         A","        #",
  "         B","            C"
};

//fill array with boolean values
boolean keyStates[];

PFont font;

void setup()
{
  size(800, 600, P2D);
  frameRate( 100 );
  cp = new ColorPicker( 200, 10, 400, 400, 255 );

  smooth();

  keyStates = new boolean[keys.length];
  minim = new Minim(this);

  out = minim.getLineOut(Minim.STEREO);
  nullSine= new SineWave(0, 0, out.sampleRate());
  sine = new SineWave(0, amp, out.sampleRate());
  sine.portamento(40);

  font = loadFont("Serif-12.vlw");
  textFont(font);
}

//determine which keys have been pressed
void keyPressed()
{
  keysPressed=0;
  out.clearSignals();
  for(int i=0;i<keys.length;i++)
  {
    if(key == keys[i])
    {
      keyStates[i] = true;
    }
    if(keyStates[i])
    {
      keysPressed++;
    }
  }

  if(keysPressed == 0)
  {
    amp = MAXAMP;
  }
  else
  {
    amp=MAXAMP/keysPressed;
  }

  addWaves();
}

//determine which keys have been released
void keyReleased()
{
  keysPressed = 0;
  out.clearSignals();
  for(int i=0;i<keys.length;i++)
  {
    if(key == keys[i])
    {
      keyStates[i] = false;
    }
    if(keyStates[i])
    {
      keysPressed++;
    }
  }
  addWaves();
}

void draw()
{  
  background( 80 );
  cp.render();
  stroke(0);
  frameRate(10);

  //white keys
  strokeWeight(1);
  fill(255);
  for (int i = 100; i < 700; i = i + 40)
  {
    rect(i, 400, 40, 200);
  }
  //  fill(255,0,0);
  //  rect(100, 250, 40, 200);
  //  fill(238,243,12);
  //  rect(140, 250, 40, 200);
//  fill(191,239,255);
//  rect(180, 250, 40, 200);
//  fill(178,34,34);
//  rect(220, 250, 40, 200);
//  fill(255,160,122);
//  rect(260, 250, 40, 200);


  // black keys
  fill(0);
  noStroke();

  rect(130, 400, 20, 140);

  rect(170, 400, 20, 140);
  rect(250, 400, 20, 140);
  rect(290, 400, 20, 140);
  rect(330, 400, 20, 140);
  rect(410, 400, 20, 140);
  rect(450, 400, 20, 140);
  rect(530, 400, 20, 140);
  rect(570, 400, 20, 140);
  rect(610, 400, 20, 140);
  rect(690, 400, 10, 140);


  //draw wave
  //  stroke(0);
  //  for(int i = 0; i < out.bufferSize() - 1; i++)
  //  {
  //    float x1 = map(i, 0, out.bufferSize(), 100, 700);
  //    float x2 = map(i+1, 0, out.bufferSize(), 100, 700);
  //    line(x1, 150 + out.left.get(i)*50, x2, 150 + out.left.get(i+1)*50);
  // 
  //  }

  //draw note letters
  int x= 115;
  int y = 110;
  textSize (18);

  for(int i=0;i<keys.length;i++)
  {
    if (notes[i]=="#") 
    {
      if(keyStates[i])
      {
        fill(19,154,160);
        text(notes[i], x+(i*20), 450);
      }
    }

    else if (notes[i]=="    #")
    {
      if(keyStates[i])
      {
        fill(19,154,160);
        text(notes[i], x+(i*20), 380);
      }
    }

    else if (notes[i]=="        #")
    {
      if(keyStates[i])
      {
        fill(19,154,160);
        text(notes[i], x+(i*20), 380);
      }
    }

    else
    {
      if(keyStates[i])
      {
        fill(19,154,160);
        text(notes[i], y+(i*20), 420);
      }
    }
  }
}


void addWaves()
{
  for(int i=0;i<keys.length;i++)
  {
    if(keyStates[i])
    {
      sine = new SineWave(32*tones[i], amp, out.sampleRate());
      sine.portamento(40);
      out.addSignal(sine);
    }
  }
}

public class ColorPicker 
{
  int x, y, w, h, c;
  PImage cpImage;

  public ColorPicker ( int x, int y, int w, int h, int c )
  {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.c = c;

    cpImage = new PImage( w, h );

    init();
  }

  private void init ()
  {
    // draw color.
    int cw = w - 60;
    for( int i=0; i<cw; i++ ) 
    {
      float nColorPercent = i / (float)cw;
      float rad = (-360 * nColorPercent) * (PI / 180);
      int nR = (int)(cos(rad) * 127 + 128) << 16;
      int nG = (int)(cos(rad + 2 * PI / 3) * 127 + 128) << 8;
      int nB = (int)(Math.cos(rad + 4 * PI / 3) * 127 + 128);
      int nColor = nR | nG | nB;

      setGradient( i, 0, 1, h/2, 0xFFFFFF, nColor );
      setGradient( i, (h/2), 1, h/2, nColor, 0x000000 );
    }

    // draw black/white.
    drawRect( cw, 0,   30, h/2, 0xFFFFFF );
    drawRect( cw, h/2, 30, h/2, 0 );

    // draw grey scale.
    for( int j=0; j<h; j++ )
    {
      int g = 255 - (int)(j/(float)(h-1) * 255 );
      drawRect( w-30, j, 30, 1, color( g, g, g ) );
    }
  }

  private void setGradient(int x, int y, float w, float h, int c1, int c2 )
  {
    float deltaR = red(c2) - red(c1);
    float deltaG = green(c2) - green(c1);
    float deltaB = blue(c2) - blue(c1);

    for (int j = y; j<(y+h); j++)
    {
      int c = color( red(c1)+(j-y)*(deltaR/h), green(c1)+(j-y)*(deltaG/h), blue(c1)+(j-y)*(deltaB/h) );
      cpImage.set( x, j, c );
    }
  }

  private void drawRect( int rx, int ry, int rw, int rh, int rc )
  {
    for(int i=rx; i<rx+rw; i++) 
    {
      for(int j=ry; j<ry+rh; j++) 
      {
        cpImage.set( i, j, rc );
      }
    }
  }

  public void render ()
  {
    image( cpImage, x, y );
    if( 
      mousePressed &&
      mouseX >= x && 
      mouseX < x + w &&
      mouseY >= y &&
      mouseY < y + h )
    {
      c = get( mouseX, mouseY );
    }


    fill( c );
    rect( 0, 0, 200, 400 );
    rect( 0,400,100,200);
    rect(0,0,800,10);
    rect(600,0,200,400);
    rect(700,400,100,200);
    
  }

//    else if (keyPressed == true && key != 'q') {
//      fill(255);
//      rect(100, 250, 40, 200);
//    }
}


    

  void stop()
  {
    out.close();
    minim.stop();

    super.stop();
  }


