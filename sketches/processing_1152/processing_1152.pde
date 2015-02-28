
import ddf.minim.signals.*;
import ddf.minim.*;

Minim minim;
AudioOutput out;
ColumnWithSound col[];

void setup()
{
  size(300, 250);
  colorMode(HSB);
  noStroke();
  smooth();

  minim = new Minim(this);
  out = minim.getLineOut(Minim.STEREO);

  initColumns();
}

void initColumns()
{
  col = new ColumnWithSound[10];
  int current_x = 0;
  float bass_freq = 220;
  for(int i = 0; i < col.length; i++)
  {
    col[i] = new ColumnWithSound(current_x + 2, 0, 26, height, bass_freq * (i + 1), 0.05 / pow((float)i + 1.0, 2), out);
    current_x += 30;
  }
}

void draw()
{
  background(0);
  for(int i = 0; i < col.length; i++)
  {
    col[i].toCanvas(); 
  }
}

void stop()
{
  out.close();
  minim.stop();
  super.stop(); 
}


class Column
{
  int w;
  int h;
  int xPos;
  int yPos;
  int rect_h;
  int rect_yPos;
  color rect_c;

  public Column(int _xPos, int _yPos, int _w, int _h)
  {
    this.xPos = _xPos;
    this.yPos = _yPos;
    this.w = _w;
    this.h = _h;
    this.rect_h = this.h / 25;
    this.rect_yPos = this.h / 2;
    this.rect_c = color(106, 45, 97);
  }

  public void toCanvas()
  {

    fill(updateBackgroundColor());
    rectMode(CORNER);
    rect(xPos, yPos, w, h);
    addInteractiveRectangle();

  }

  private void addInteractiveRectangle()
  {
    updateRectPosition();
    fill(rect_c);
    rectMode(CENTER);
    rect(xPos + w/2, rect_yPos, w, rect_h); 
  }

  public boolean mouseIsOn()
  {
    if(mouseX >= this.xPos && mouseX <= this.xPos + this.w
      && mouseY >= this.yPos && mouseY <= this.yPos + this.h)
    {
      return true;
    } 

    return false;
  }

  public void updateRectPosition()
  {
    if(this.mouseIsOn())
    {
      if(abs(mouseY- this.rect_yPos) > 8)
      {
        if(mouseY > this.rect_yPos)
          this.rect_yPos += 8;
        else
          this.rect_yPos -= 8; 
      }

    }
    else
    {
      if(abs(this.h / 2  - this.rect_yPos) > 2)
      {
        if(this.h / 2 > this.rect_yPos)
          this.rect_yPos += 1;
        else
          this.rect_yPos -= 1; 
      }
      else
        this.rect_yPos = this.h / 2;
    } 
  }

  private color updateBackgroundColor()
  {
    int c = (int) map(this.rect_yPos, 0, this.h, 0, 359);
    return color(c, 94, 96);
  }

  public int getRectYPosition()
  {
    return rect_yPos; 
  }  

  public int getH()
  {
    return h; 
  }
}

public class ColumnWithSound extends Column
{
  float freq;
  Oscillator osc;

  public ColumnWithSound(int _xPos, int _yPos, int _w, int _h, 
  float _startFreq, float _amp, AudioOutput _out)
  {
    super(_xPos, _yPos, _w, _h);
    this.freq = _startFreq;
    osc = new SineWave(this.freq, _amp, _out.sampleRate());
    osc.portamento(200);
    _out.addSignal(osc); 
  }

  public void toCanvas()
  {
    super.toCanvas();
    updatePitch();
  } 

  private void updatePitch()
  {
    int r_ypos = super.getRectYPosition();
    int _h = super.getH();

    float _freq = map(r_ypos - _h / 2, -h / 2, h / 2, -0.4, 0.4);
    osc.setFreq(this.freq * (1.0 + _freq)); 
  } 
  
  public void updateRectPosition()
  {
    if(this.mouseIsOn() && mousePressed)
    {
      if(abs(mouseY- this.rect_yPos) > 8)
      {
        if(mouseY > this.rect_yPos)
          this.rect_yPos += 8;
        else
          this.rect_yPos -= 8; 
      }

    }
//    else
//    {
//      if(abs(this.h / 2  - this.rect_yPos) > 2)
//      {
//        if(this.h / 2 > this.rect_yPos)
//          this.rect_yPos += 1;
//        else
//          this.rect_yPos -= 1; 
//      }
//      else
//        this.rect_yPos = this.h / 2;
//    } 
  }
}








