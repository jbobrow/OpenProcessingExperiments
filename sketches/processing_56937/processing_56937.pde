
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

PFont font;
PFont font2;

PImage b;

PImage flux;
PImage flux2;

PImage saw_on;
PImage cosw_on;
PImage sin_on;
PImage pow_on;
PImage noise_on;

PImage saw_of;
PImage cosw_of;
PImage sin_of;
PImage pow_of;
PImage noise_of;


double freq = (43.06640625);  /*samplerate / buffsize*/
double freq2 = (43.06640625); /**/

int crossx=0;
int crossy=0;

Minim minim;
AudioOutput out;

boolean flgsine = true;
boolean flgpow = true;
boolean flgsaw = true;
boolean flgpink = false;
boolean flgcos = true;
boolean mblur = true;

SAAWave saw;
SAAWave saw2;

PWave poww;
PWave poww2;

SineWave sine;
SineWave sine2;

CosWave cosw;
CosWave cosw2;

PinkNoise pink;

int mul = 3;
int flg = 0;
double lat = 0;

PGraphics pg;
PGraphics img;
double nt;

void draw()
{

  double   teta;

  if (crossx > width / 2)
  {
    teta = (sine.frequency())/ (43.06640625 ) ;
  }
  else
  {
    teta = (sine2.frequency())/ (43.06640625 ) ;
  }
  
  nt = (PI *( (teta*2)/mul));
  strokeWeight(4);

  if (keyPressed && key =='h')
  {
    background(0);
    image(b, 0, 0);
  }
  else
  {
    int i = 0;
    int x = 0;
    int y = 0;
    pg.beginDraw();
    if (mblur==true)
    {      
      pg.blend(img, 0, 0, width, height, 0, 0, width, height, DARKEST ); 
      //  pg.filter(BLUR);
      // pg.background(0,0,0,12);
      //    pg.endDraw();
    }
    else
    {
      pg.background(0, 0, 0);
      pg.pushMatrix();
      pg.image(flux, -66, -194);

      pg.translate(width/2, height/2);
      pg.rotate( (((float)freq - (float)freq2) * (float)lat) );
      pg.translate(-flux.width/2, -flux.height/2);
      pg.image(flux2, -0, -0);
      pg.popMatrix();
    }
    i = 0;

    for (; i < out.bufferSize() - 1; i++)
    {
      double r1 = map(i, 0, out.bufferSize(), (float)lat, (float)(lat + nt));
      double x1 = sin((float)r1) * ((out.left.get(i) + out.right.get(i))+2) * (height /16) + width/2;
      double y1 = cos((float)r1) * ((out.left.get(i) + out.right.get(i))+2) * (height / 16) + (height) / 2;
      double r2 = map(i+1, 0, out.bufferSize(), (float)lat, (float)(lat + nt));
      double x2 = sin((float)r2) * ((out.left.get(i+1) + out.right.get(i+1))+2) * (height / 16) + width/2;
      double y2 = cos((float)r2) * ((out.left.get(i+1) + out.right.get(i+1))+2) * (height / 16) + (height) / 2;

      pg.stroke(((out.left.get(i)+out.right.get(i))/2)+1, 2, 2, 2);
      pg.line((float)x1, (float)y1, (float)x2, (float)y2);

      x1 = sin((float)r1) * (( out.left.get(i))+2) * (height /16) + width / 6;
      y1 = cos((float)r1) * (( out.left.get(i))+2) * (height / 16) + (height ) / 2;
      x2 = sin((float)r2) * (( out.left.get(i+1))+2) * (height /16) + width / 6;
      y2 = cos((float)r2) * (( out.left.get(i+1))+2) * (height / 16) + (height) / 2;

      pg.stroke(1, 2, 2, 2);
      pg.line((float)x1, (float)y1, (float)x2, (float)y2);

      x1 = sin((float)r1) * (( out.right.get(i))+2) * (height / 16) + width / 2 + (width*2)/6;
      y1 = cos((float)r1) * (( out.right.get(i))+2) * (height / 16) + (height) / 2;
      x2 = sin((float)r2) * (( out.right.get(i+1))+2) * (height / 16) + width / 2 + (width*2)/6;
      y2 = cos((float)r2) * (( out.right.get(i+1))+2) * (height / 16) + (height) / 2;

      pg.stroke(2, 2, 2, 2);
      pg.line((float)x1, (float)y1, (float)x2, (float)y2);
    }
    pg.endDraw();

    image(pg, 0, 0);

    displayInterface();
  }
}

void keyPressed() 
{
  pg.background(0);
  if (key == 'b')
  {
    mblur = !mblur;
  }
  if (key == 'e' ||(key == 'a') || (key == 'z')|| (key == 'r') ||  (key == 't'))
  {
    if (key == 'a')
    {
      flgsine = !flgsine;
    }
    if (key == 'z')
    {
      flgsaw = !flgsaw;
    }
    if (key == 'e')
    {
      flgpow = !flgpow;
    }
    if (key == 'r')
    {
      flgcos = !flgcos;
    }
    if (key == 't')
    {
      flgpink = !flgpink;
    }
    float    total = 0;
    if (flgpow)
      total +=1;
    if (flgsine)
      total +=1;
    if (flgsaw)
      total +=1;
    if (flgcos)
      total +=1;
    if (flgsaw)
    {
      saw.setAmp( (1/total) -((4.0/total) * (0.1 / 4)) * 0.2);
      saw2.setAmp((1/total) -((4.0/total) * (0.1 / 4)) * 0.2);
    }
    else
    {
      saw.setAmp( 0);
      saw2.setAmp(0);
    }
    if (flgpow)
    {
      poww.setAmp( (1/total) -((4.0/total) * (0.1 / 4)) * 0.2);
      poww2.setAmp((1/total) -((4.0/total) * (0.1 / 4)) * 0.2);
    }
    else
    {
      poww.setAmp( 0);
      poww2.setAmp(0);
    } 
    if (flgsine)
    {
      sine.setAmp( (1/total) -((4.0/total) * (0.1 / 4)) * 0.2);
      sine2.setAmp((1/total) -((4.0/total) * (0.1 / 4)) * 0.2);
    }
    else
    {
      sine.setAmp( 0);
      sine2.setAmp(0);
    }
    if (flgcos)
    {
      cosw.setAmp( (1/total) -((4.0/total) * (0.1 / 4)) * 0.2);
      cosw2.setAmp((1/total) -((4.0/total) * (0.1 / 4)) * 0.2);
    }
    else
    {
      cosw.setAmp( 0);
      cosw2.setAmp(0);
    }
    if (flgpink)
    {
      pink.setAmp( (0.4));
    }
    else
    {
      pink.setAmp( 0);
    }
  }

  if (key == 'c') 
  {
    if (mul == 2 && flg == 0)
    {
      flg = 1;
      mul = 0;
    }
    if (flg==1)
      mul += 1;
    else
      mul -= 1;
  }
  if (key == 'd') 
  {
    if (mul == 1 && flg == 1)
    {
      flg = 0;
      mul = 1;
    }

    {
      if (flg==1)
        mul -= 1;
      else
        mul += 1;
    }
  }
}

void mousePressed()
{
  crossx = mouseX;
  crossy = mouseY;
  if (mouseX > width / 2)
  {
    freq = (int)map(mouseY, height, 0, 2, 69)*  21.533203125;
    freq2 = ((freq) + (map(mouseX, 0, width, -100, 100)));
  }
  else
  {
    freq2 = (int)map(mouseY, height, 0, 2, 69)*  21.533203125;
    freq = ((freq2) + (map(mouseX, 0, width, -45, 45)));
  }
  sine.setFreq((float)freq);
  sine2.setFreq((float)freq2);
  poww.setFreq((float)freq);
  poww2.setFreq((float)freq2);
  saw.setFreq((float)freq);
  saw2.setFreq((float)freq2);
  cosw.setFreq((float)freq);
  cosw2.setFreq((float)freq2);
}

void mouseDragged()
{
  crossx = mouseX;
  crossy = mouseY;
  if (mouseX > width / 2)
  {
    freq = (int)map(mouseY, height, 0, 2, 69)*  21.533203125;
    freq2 = ((freq) + (map(mouseX, 0, width, -100, 100)));
  }
  else
  {
    freq2 = (int)map(mouseY, height, 0, 2, 69)*  21.533203125;
    freq = ((freq2) + (map(mouseX, 0, width, -45, 45)));
  }
  sine.setFreq((float)freq);
  sine2.setFreq((float)freq2);
  poww.setFreq((float)freq);
  poww2.setFreq((float)freq2);
  saw.setFreq((float)freq);
  saw2.setFreq((float)freq2);
  cosw.setFreq((float)freq);
  cosw2.setFreq((float)freq2);
}

void stop()
{
  out.close();
  minim.stop();
  super.stop();
}


