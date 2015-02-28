
//  Tiago Brizolara, 2013
//
//  Uses Maxim, GUI - read the LICENCE at the end of these comments
//  (GUI slightly modified. Marked alteration with [Brizo])
//
//  NOTE: OpenProcessing has problems running scripts with javascript
//libraries by now. Run this sketch in Processing and it will run fine.
//You can see it running on the browser too in
//  https://googledrive.com/host/0B88jP6SPjM6sQkx3Um5meUFqc00/index.html
//and you have all the resources here:
//  https://drive.google.com/folderview?id=0B88jP6SPjM6sQkx3Um5meUFqc00&usp=sharing
//

//  The artistic part:
//
//  A simple synthesizer.
//  Control morprhing between different waveforms with mousey. The 
//waveforms available are sine, satooth, square and triangle
//  Control pitch with mousex
//  
//  The pedagogical part (musicians/physicists/engineers...):
//
//  * Drag mouse from top to bottom to see/hear the morphing
//  * Hear how the perceived loudness increases, for example, as 
//a sine becomes a sawtooth
//  This is because the sawtooth can be tought as equal to the 
//correspondent sine plus infinite harmonics, weighted as 1/n 
//(Fourier decomposition). So, if its the sine + more harmonics, 
//it carries more power.
//  * Look how the wavelength decreases (frequency increases) as 
//we click to the right, raising the pitch
//  * The frequency grows linearly in the right direction (we can 
//notice the wavelength changes linearly as we click to the right 
//direction). Observe how the pitch goes up nonlinearly (the 
//consecutive vertical lines are more and more far apart as we go 
//to the right). So, our perception of pitch is not linear in relation 
//to the frequency. No surprise, as we know that doubling a frequency 
//means hearing an octave up...
//  * The green lines are the harmonic series. The fundamental is 
//at the lef, first harmonic (octave) and 2n harmonic (octave + 
//fifth) are inside the window and 4th harmonic (2 octaves) is at the 
//right corner. Note that just the octaves fit perfectly with the equally 
//tempered scale (the gray lines). Look at the 3rd harmonic line - a 
//natural fifth has a higher frequency than the equally-tempered one
//

//--------
//  Below is the LICENCE for MAXIM and GUI (GUI is coded at the end of this file):
//--------
//  The MIT License (MIT)
//
//Copyright (c) 2013 Mick Grierson, Matthew Yee-King, Marco Gillies
//
//Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
//The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
//
//THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
//--------
//

//--------
//  My code you are free to use, but please, give credit to Tiago Brizolara da Rosa
//  Drop me a line at: tiago at timewavegames dot com
//--------

Slider volumeSlider;
RadioButtons waveTopRdButtons;   // upper buttons, to select "upper" waveshape
RadioButtons waveBottomRdButtons;// lower buttons, to select "lower" waveshape

//  Y coordinates of top and bottom of the region where the waveshape is
//going to be drawn:
int waveshapePanelYTop, waveshapePanelYBottom;

final int SINEWAVE       = 0;
final int SAWTOOTHWAVE   = 1;
final int SQUAREWAVE     = 2;
final int TRIANGULARWAVE = 3;
final int CUSTOMWAVE     = 4; // not being used

//  the waveshape of the first and second AudioPlayers 
//(audioPlayers[0 and 1], below). We start with sine and sawtooth selected
int [] waveType = {SINEWAVE, SAWTOOTHWAVE};

Maxim maxim; 

AudioPlayer audioPlayers[];

float speed = 1;  //  speed of wavetable looping. Controls frequency (pitch)
float morph = 0;  //  controls the morphing between the waveshapes of 
  //the upper and lower wave  

float generalVolume = 0.2;
boolean noteJustTurnedOn = false;
boolean playing = false;

int lastMouseX, lastMouseY;
boolean justStarted = true;

//--------------------------------------------------------------
void setup() {  
  
  size(540, 380);
  
  maxim = new Maxim(this);
  
  audioPlayers = new AudioPlayer[8];
  
  waveshapePanelYTop    = (int)(0.15*height);
  waveshapePanelYBottom = (int)(0.85*height);
  volumeSlider = new Slider("vol.",
    0.2, 0.0, 0.9, // value, minim, maximum
    width - 20, 2, 16, (int)(0.15*height)-4, UPWARDS // x, y, w, h, ori
  );
  volumeSlider.setInactiveColor(color(255, 0, 0));
  
  String [] waveTopRdButtonsNames = {"0", "1", "2", "3"};
  int numberOfButtonsInRow = 4;
  int border = 0;
  int buttonsSpace = width-24;
  int buttonsWidth = buttonsSpace/numberOfButtonsInRow;
  int buttonsHeight = waveshapePanelYTop - 2;
  waveTopRdButtons = new RadioButtons(waveTopRdButtonsNames, numberOfButtonsInRow,
    border, border, 
    buttonsWidth, buttonsHeight, HORIZONTAL);
  waveBottomRdButtons = new RadioButtons(waveTopRdButtonsNames, numberOfButtonsInRow,
    border, waveshapePanelYBottom, 
    buttonsWidth, buttonsHeight, HORIZONTAL);
     
  PImage [] imgsTopButtons = {
    loadImage("sine.png"),
    loadImage("sawtooth.png"),
    loadImage("square.png"),
    loadImage("triangle.png")
  };
  PImage [] imgsTopButtons_inactive = {
    loadImage("sine_bw.png"),
    loadImage("sawtooth_bw.png"),
    loadImage("square_bw.png"),
    loadImage("triangle_bw.png")
  };
  PImage [] imgsBottomButtons = {
    loadImage("sine.png"),
    loadImage("sawtooth.png"),
    loadImage("square.png"),
    loadImage("triangle.png")
  };
  PImage [] imgsBottomButtons_inactive = {
    loadImage("sine_bw.png"),
    loadImage("sawtooth_bw.png"),
    loadImage("square_bw.png"),
    loadImage("triangle_bw.png")
  };  
  
  waveTopRdButtons.setAllActiveImages(imgsTopButtons);
  waveTopRdButtons.setAllInactiveImages(imgsTopButtons_inactive);
  waveTopRdButtons.set("0");
  waveBottomRdButtons.setAllActiveImages(imgsBottomButtons);
  waveBottomRdButtons.setAllInactiveImages(imgsBottomButtons_inactive);
  waveBottomRdButtons.set("1");
  
  audioPlayers[0] = maxim.loadFile("sine_86_1328125Hz_512mais2samples.wav");
  audioPlayers[1] = maxim.loadFile("sawtooth_86_1328125Hz_512mais2samples.wav");
  audioPlayers[2] = maxim.loadFile("square_86_1328125Hz_512mais2samples.wav");
  audioPlayers[3] = maxim.loadFile("triangular_86_1328125Hz_512mais2samples.wav");
  audioPlayers[4] = maxim.loadFile("sine_86_1328125Hz_512mais2samples.wav");
  audioPlayers[5] = maxim.loadFile("sawtooth_86_1328125Hz_512mais2samples.wav");
  audioPlayers[6] = maxim.loadFile("square_86_1328125Hz_512mais2samples.wav");
  audioPlayers[7] = maxim.loadFile("triangular_86_1328125Hz_512mais2samples.wav");
  for(int plyr=0; plyr<8; plyr++)
  {
    audioPlayers[plyr].setLooping(true);
  }
  
  audioPlayers[waveType[0]].play();
  
  lastMouseX = 0;
  lastMouseY = height/2;
  
  //mouseReleased();
}

//-------------------------------------------------------------
void draw() {
  
  //  black background
  fill(0);
  stroke(0);
  rect(0, 0, width, height);
  
  //  gray lines: equally-tempered tones
  stroke(40, 40, 40, 255);
  strokeWeight(2);
  for(int i=0; i<25; i++)
  {
     line( width/3f * (pow(2,i/12f) - 1), 0,
           width/3f * (pow(2,i/12f) - 1), height-1);
  }
  //  green: first 4 harmonics (fundamental, octave, octave+5th, 2 octaves)
  stroke(40, 80, 40, 255);
  strokeWeight(1);
  for(int i=1; i<=4; i++)
  {
    line( width/3f * (i - 1), 0,
          width/3f * (i - 1), height-1);
  }
  
  //  waveshape
  //  Note that what is been drawn is not being read from the audio buffer data.
  //  This is because visualization gets better if we already know the
  //waveshape and don't need to adjust the audio buffer data to the window
  
  stroke(200, 0, 150, 255);
  strokeWeight(4);
  
  float [] firstPoint = {0., height/2 };// (x,y) for start line point
  float [] nextPoint = {0., 0. };       // (x,y) for end line point
  
  int fullAmplitude = (waveshapePanelYBottom - waveshapePanelYTop + 1);
  float half_amplitude = fullAmplitude/2.;
  int currentPeriod = 1;
  float wavelength = width/speed;
  float half_wavelength = wavelength/2.;
  float i_in_lambda = -1; // iterates inside a wavelength
  float saw_sum = 0;
  float square_sum = 0;
  float triang_sum = 0;
  float sine_sum = 0;
  float sumUPPER = 0;
  float sumBOTTOM = 0;
  
  int jump = 3;  //  para dispositivos rapidos, pode diminuir bastante o jump, ateh mesmo para 1

  for(int i = 1; i<width; i+=jump)
  {
    nextPoint[0] = i;
    
    i_in_lambda += jump;
    if(i_in_lambda > wavelength)
      i_in_lambda -= i_in_lambda;
    
    switch(waveType[0])
    {
      case SINEWAVE:
        sumUPPER = half_amplitude*sin(TWO_PI*i/wavelength);
      break;
      
      case SAWTOOTHWAVE:
        //  calculating sawtooth contribution
        //  The math here is: a sawtooth is a diagonal line
        sumUPPER = half_amplitude/half_wavelength * i_in_lambda;  //  a sawtooth is just a diagonal line
        if(i_in_lambda > half_wavelength) 
          sumUPPER -= fullAmplitude;
      break;
      
      case SQUAREWAVE:
        //  calculating square contribution
        sumUPPER = half_amplitude;
        if(i_in_lambda > half_wavelength) 
          sumUPPER = -half_amplitude;
      break;
      
      case TRIANGULARWAVE:
        //  calculating triangular contribution
        sumUPPER = half_amplitude/half_wavelength * i_in_lambda;
        if(i_in_lambda > wavelength/2f) 
          sumUPPER = half_amplitude * (1 - (i_in_lambda-half_wavelength)/half_wavelength);      
      break;      
    }
    
    switch(waveType[1])
    {
      case SINEWAVE:
        sumBOTTOM = half_amplitude*sin(TWO_PI*i/wavelength);
      break;
      
      case SAWTOOTHWAVE:
        //  calculating sawtooth contribution
        //  The math here is: a sawtooth is a diagonal line
        sumBOTTOM = half_amplitude/half_wavelength * i_in_lambda;  //  a sawtooth is just a diagonal line
        if(i_in_lambda > half_wavelength) 
          sumBOTTOM -= fullAmplitude;
      break;
      
      case SQUAREWAVE:
        //  calculating square contribution
        sumBOTTOM = half_amplitude;
        if(i_in_lambda > half_wavelength) 
          sumBOTTOM = -half_amplitude;
      break;
      
      case TRIANGULARWAVE:
        //  calculating triangular contribution
        sumBOTTOM = half_amplitude/half_wavelength * i_in_lambda;
        if(i_in_lambda > half_wavelength) 
          sumBOTTOM = half_amplitude * (1 - (i_in_lambda-half_wavelength)/half_wavelength);      
      break;      
    }
    
    nextPoint[1] = height/2 +  // 0 at the vertical center of the screen
      (1-morph)*sumUPPER
        + 
      morph*sumBOTTOM;
    
    //  drawing the line and updating for next draw
    line( firstPoint[0], firstPoint[1], nextPoint[0], nextPoint[1]);
    firstPoint[0] = nextPoint[0];
    firstPoint[1] = nextPoint[1];
  }
  
  lastMouseX = mouseX;
  lastMouseY = mouseY;
  
  volumeSlider.display();

  waveTopRdButtons.display();
  waveBottomRdButtons.display();

}

//---------------------------------------------------------
void update()
{
  
  if(justStarted)
  {
    audioPlayers[waveType[0]].volume(1);
    audioPlayers[waveType[1]+4].volume(0);
    audioPlayers[waveType[1]+4].play();
    justStarted = false; 
    return;
  }
  
  generalVolume = volumeSlider.val;  
  
  //  speed: from 1 (left side of the screen) to 4 (right side)
  //  Remember that 2 means octave and 4, two octaves
  speed = (1 + mouseX/(float)width * 3);
  if(speed < 0)
    speed = abs(speed);

  audioPlayers[waveType[0]].speed  (speed * 440/86.1328125);
  audioPlayers[waveType[1]+4].speed(speed * 440/86.1328125);
  
  //  morphing:
  //  To the top of the screen, strenghtens sine and weakens sawtooth.
  //  To the bottom, the inverse
  if(mouseY > waveshapePanelYTop && mouseY < waveshapePanelYBottom)
  {
    morph = (mouseY-waveshapePanelYTop)/(float)(waveshapePanelYBottom-waveshapePanelYTop);
  }
  
  audioPlayers[waveType[0]].volume(generalVolume*(1-morph));
  audioPlayers[waveType[1]+4].volume(generalVolume*morph);

}

//---------------------------------------------------------------
void mouseDragged() {
  volumeSlider.mouseDragged();
  update();   
}

void mousePressed() {
  volumeSlider.mousePressed();
  update(); 
}

//---------------------------------------------------------------
void mouseReleased()
{
  
  //  Update state of GUI
  //volumeSlider.mouseReleased();
  waveTopRdButtons.mouseReleased();
  waveBottomRdButtons.mouseReleased();
  
  //
  //  - Updates waveform according to the button clicked
  //  - Or just turn sound off if no button clicked
  //
  if(mouseY < waveshapePanelYTop)  //  upper waveform
  {
    //  - player representing the upper waveform
    int newTopWaveType = int(waveTopRdButtons.get());
    if(newTopWaveType != waveType[0])  //  selected a different waveshape
    {
      if(newTopWaveType == -1) // no button got selected (how??)
      {
        newTopWaveType = waveType[0];
        waveTopRdButtons.set(String(newTopWaveType));
      }
      else  //   a button got selected
      {
        waveType[0] = newTopWaveType;
        for(int i=0; i<4; i++)
        {
          if(i != newTopWaveType)
          {
            audioPlayers[i].stop();  //  stop all others...
          }
          else
          {
            audioPlayers[i].play();  //  ... and play just the selected one
          }
        }
      }
    }
  }
  else if(mouseY > waveshapePanelYBottom)  //  lower waveform
  {
    //  - player representing the lower waveform
    int newBottomWaveType = int(waveBottomRdButtons.get());
    if(newBottomWaveType != waveType[1])  //  selected a different waveshape
    {
      if(newBottomWaveType == -1) // no button got selected (how??)
      {
        newBottomWaveType = waveType[1];
        waveBottomRdButtons.set(String(newBottomWaveType));
      }
      else
      {
        waveType[1] = newBottomWaveType;
        for(int i=0; i<4; i++)
        {
          if(i != newBottomWaveType)
          {
            audioPlayers[i+4].stop();  //  stop all others...
          }
          else
          {
            audioPlayers[i+4].play();  //  ... and play just the selected one
          }
        }
      }
    }
  }
  
  //  note off
  for(int i=0; i<8; i++){
     audioPlayers[i].volume(0);
  }
  
}
//-----------------------------------------------------------------

//
//  This GUI class below is not mine. You are free to use, but please, 
//respect the LICENCE wich you can red in the comments at the beginning
//of this file
//


int HORIZONTAL = 0;
int VERTICAL   = 1;
int UPWARDS    = 2;
int DOWNWARDS  = 3;

class Widget
{

  
  PVector pos;
  PVector extents;
  String name;

  color inactiveColor = color(60, 60, 100);
  color activeColor = color(100, 100, 160);
  color bgColor = inactiveColor;
  color lineColor = color(255);
  
  
  
  void setInactiveColor(color c)
  {
    inactiveColor = c;
    bgColor = inactiveColor;
  }
  
  color getInactiveColor()
  {
    return inactiveColor;
  }
  
  void setActiveColor(color c)
  {
    activeColor = c;
  }
  
  color getActiveColor()
  {
    return activeColor;
  }
  
  void setLineColor(color c)
  {
    lineColor = c;
  }
  
  color getLineColor()
  {
    return lineColor;
  }
  
  String getName()
  {
    return name;
  }
  
  void setName(String nm)
  {
    name = nm;
  }


  Widget(String t, int x, int y, int w, int h)
  {
    pos = new PVector(x, y);
    extents = new PVector (w, h);
    name = t;
    //registerMethod("mouseEvent", this);
  }

  void display()
  {
  }

  boolean isClicked()
  {
    
    if (mouseX > pos.x && mouseX < pos.x+extents.x 
      && mouseY > pos.y && mouseY < pos.y+extents.y)
    {
      return true;
    }
    else
    {
      return false;
    }
  }
  
  public void mouseEvent(MouseEvent event)
  {
    //if (event.getFlavor() == MouseEvent.PRESS)
    //{
    //  mousePressed();
    //}
  }
  
  
  boolean mousePressed()
  {
    return isClicked();
  }
  
  boolean mouseDragged()
  {
    return isClicked();
  }
  
  
  boolean mouseReleased()
  {
    return isClicked();
  }
}

class Button extends Widget
{
  PImage activeImage = null;
  PImage inactiveImage = null;
  PImage currentImage = null;
  color imageTint = color(255);
  
  Button(String nm, int x, int y, int w, int h)
  {
    super(nm, x, y, w, h);
  }
  
  void setImage(PImage img)
  {
    setInactiveImage(img);
    setActiveImage(img);
  }
  
  void setInactiveImage(PImage img)
  {
    if(currentImage == inactiveImage || currentImage == null)
    {
      inactiveImage = img;
      currentImage = inactiveImage;
    }
    else
    {
      inactiveImage = img;
    }
  }
  
  void setActiveImage(PImage img)
  {
    if(currentImage == activeImage || currentImage == null)
    {
      activeImage = img;
      currentImage = activeImage;
    }
    else
    {
      activeImage = img;
    }
  }
  
  void setImageTint(float r, float g, float b)
  {
    imageTint = color(r,g,b);
  }

  void display()
  {
    if(currentImage != null)
    {
      
      //float imgHeight = (extents.x*currentImage.height)/currentImage.width;
      
      //  [Brizo] Why this?
      //float imgWidth = (extents.y*currentImage.width)/currentImage.height;
      
      pushStyle();
      imageMode(CORNER);
      tint(imageTint);
      //image(currentImage, pos.x, pos.y, imgWidth, extents.y);
      image(currentImage, pos.x, pos.y, extents.x, extents.y);  //  [Brizo]
      stroke(bgColor);
      noFill();
      //rect(pos.x, pos.y, imgWidth,  extents.y);
      rect(pos.x, pos.y, extents.x,  extents.y);  //  [Brizo]
      noTint();
      popStyle();
    }
    else
    {
      pushStyle();
      stroke(lineColor);
      fill(bgColor);
      rect(pos.x, pos.y, extents.x, extents.y);
  
      fill(lineColor);
      textAlign(CENTER, CENTER);
      text(name, pos.x + 0.5*extents.x, pos.y + 0.5* extents.y);
      popStyle();
    }
  }
  
  boolean mousePressed()
  {
    if (super.mousePressed())
    {
      if (bgColor == activeColor)
      {
        bgColor = inactiveColor;
      } else
      {
        bgColor = activeColor;
      }
      
      if(activeImage != null)
        currentImage = activeImage;
      return true;
    }
    return false;
  }
  
  boolean mouseReleased()
  {
    if (super.mouseReleased())
    {
      bgColor = inactiveColor;
      if(inactiveImage != null)
        currentImage = inactiveImage;
      return true;
    }
    return false;
  }
}

class Toggle extends Button
{
  boolean 

  Toggle(String nm, int x, int y, int w, int h)
  {
    super(nm, x, y, w, h);
  }


  boolean get()
  {
    return on;
  }

  void set(boolean val)
  {
    
    if (on)
    {
      bgColor = activeColor;
      if(activeImage != null)
        currentImage = activeImage;
    }
    else
    {
      bgColor = inactiveColor;
      if(inactiveImage != null)
        currentImage = inactiveImage;
    }
  }

  void toggle()
  {
    set(!on);
  }

  
  boolean mousePressed()
  {
    return super.isClicked();
  }

  boolean mouseReleased()
  {
    if (super.mouseReleased())
    {
      toggle();
      return true;
    }
    return false;
  }
}

class RadioButtons extends Widget
{
  public Toggle [] buttons;
  
  RadioButtons (String [] names,int numButtons, int x, int y, int w, int h, int orientation)
  {
    super("", x, y, w*numButtons, h);
    buttons = new Toggle[numButtons];
    for (int i = 0; i < buttons.length; i++)
    {
      int bx, by;
      if(orientation == HORIZONTAL)
      {
        //bx = x+i*(w+5);
        bx = x+i*w;  //  [Brizo] no borders for now
        println(w);
        println(bx);
        by = y;
      }
      else
      {
        bx = x;
        by = y+i*(h+5);
      }
      buttons[i] = new Toggle(names[i], bx, by, w, h);
    }
  }
  
  void setNames(String [] names)
  {
    for (int i = 0; i < buttons.length; i++)
    {
      if(i >= names.length)
        break;
      buttons[i].setName(names[i]);
    }
  }
  
  void setImage(int i, PImage img)
  {
    setInactiveImage(i, img);
    setActiveImage(i, img);
  }
  
  void setAllImages(PImage [] img)
  {
    setAllInactiveImages(img);
    setAllActiveImages(img);
  }
  
  void setInactiveImage(int i, PImage img)
  {
    buttons[i].setInactiveImage(img);
  }

  
  void setAllInactiveImages(PImage [] img)
  {
    for (int i = 0; i < buttons.length; i++)
    {
      buttons[i].setInactiveImage(img[i]);
    }
  }
  
  void setActiveImage(int i, PImage img)
  {
    
    buttons[i].setActiveImage(img);
  }
  
  
  
  void setAllActiveImages(PImage [] img)
  {
    for (int i = 0; i < buttons.length; i++)
    {
      buttons[i].setActiveImage(img[i]);
    }
  }

  void set(String buttonName)
  {
    for (int i = 0; i < buttons.length; i++)
    {
      if(buttons[i].getName().equals(buttonName))
      {
        buttons[i].set(true);
      }
      else
      {
        buttons[i].set(false);
      }
    }
  }
  
  int get()
  {
    for (int i = 0; i < buttons.length; i++)
    {
      if(buttons[i].get())
      {
        return i;
      }
    }
    return -1;
  }
  
  String getString()
  {
    for (int i = 0; i < buttons.length; i++)
    {
      if(buttons[i].get())
      {
        return buttons[i].getName();
      }
    }
    return "";
  }

  void display()
  {
    for (int i = 0; i < buttons.length; i++)
    {
      strokeWeight(2);  //  [Brizo]
      buttons[i].display();
    }
  }

  boolean mousePressed()
  {
    for (int i = 0; i < buttons.length; i++)
    {
      if(buttons[i].mousePressed())
      {
        return true;
      }
    }
    return false;
  }
  
  boolean mouseDragged()
  {
    for (int i = 0; i < buttons.length; i++)
    {
      if(buttons[i].mouseDragged())
      {
        return true;
      }
    }
    return false;
  }

  boolean mouseReleased()
  {
    for (int i = 0; i < buttons.length; i++)
    {
      if(buttons[i].mouseReleased())
      {
        for(int j = 0; j < buttons.length; j++)
        {
          if(i != j)
            buttons[j].set(false);
        }
        //buttons[i].set(true);
        return true;
      }
    }
    return false;
  }
}

class Slider extends Widget
{
  float minimum;
  float maximum;
  float val;
  int textWidth = 60;
  int orientation = HORIZONTAL;

  Slider(String nm, float v, float min, float max, int x, int y, int w, int h, int ori)
  {
    super(nm, x, y, w, h);
    val = v;
    minimum = min;
    maximum = max;
    orientation = ori;
    if(orientation == HORIZONTAL)
      textWidth = 60;
    else
      textWidth = 20;
    
  }

  float get()
  {
    return val;
  }

  void set(float v)
  {
    val = v;
    val = constrain(val, minimum, maximum);
  }

  void display()
  {
    
    float textW = textWidth;
    if(name == "")
      textW = 0;
    pushStyle();
    //textAlign(LEFT, TOP);
    textAlign(LEFT, TOP);
    fill(lineColor);
    text(name, pos.x, pos.y);
    strokeWeight(2);  //  [Brizo]
    stroke(lineColor);
    noFill();
    if(orientation ==  HORIZONTAL){
      rect(pos.x+textW, pos.y, extents.x-textWidth, extents.y);
    } else {
      rect(pos.x, pos.y+textW, extents.x, extents.y-textW);
    }
    noStroke();
    fill(bgColor);
    float sliderPos; 
    if(orientation ==  HORIZONTAL){
        sliderPos = map(val, minimum, maximum, 0, extents.x-textW-4); 
        rect(pos.x+textW+2, pos.y+2, sliderPos, extents.y-4);
    } else if(orientation ==  VERTICAL || orientation == DOWNWARDS){
        sliderPos = map(val, minimum, maximum, 0, extents.y-textW-4); 
        rect(pos.x+2, pos.y+textW+2, extents.x-4, sliderPos);
    } else if(orientation == UPWARDS){
        sliderPos = map(val, minimum, maximum, 0, extents.y-textW-4); 
        rect(pos.x+2, pos.y+textW+2 + (extents.y-textW-4-sliderPos), extents.x-4, sliderPos);
    };
    popStyle();
  }

  
  boolean mouseDragged()
  {
    if (super.mouseDragged())
    {
      float textW = textWidth;
      if(name == "")
        textW = 0;
      if(orientation ==  HORIZONTAL){
        set(map(mouseX, pos.x+textW, pos.x+extents.x-4, minimum, maximum));
      } else if(orientation ==  VERTICAL || orientation == DOWNWARDS){
        set(map(mouseY, pos.y+textW, pos.y+extents.y-4, minimum, maximum));
      } else if(orientation == UPWARDS){
        set(map(mouseY, pos.y+textW, pos.y+extents.y-4, maximum, minimum));
      };
      return true;
    }
    return false;
  }

  boolean mouseReleased()
  {
    if (super.mouseReleased())
    {
      float textW = textWidth;
      if(name == "")
        textW = 0;
      if(orientation ==  HORIZONTAL){
        set(map(mouseX, pos.x+textW, pos.x+extents.x-10, minimum, maximum));
      } else if(orientation ==  VERTICAL || orientation == DOWNWARDS){
        set(map(mouseY, pos.y+textW, pos.y+extents.y-10, minimum, maximum));
      } else if(orientation == UPWARDS){
        set(map(mouseY, pos.y+textW, pos.y+extents.y-10, maximum, minimum));
      };
      return true;
    }
    return false;
  }
}

class MultiSlider extends Widget
{
  Slider [] sliders;
  /*
  MultiSlider(String [] nm, float min, float max, int x, int y, int w, int h, int orientation)
  {
    super(nm[0], x, y, w, h*nm.length);
    sliders = new Slider[nm.length];
    for (int i = 0; i < sliders.length; i++)
    {
      int bx, by;
      if(orientation == HORIZONTAL)
      {
        bx = x;
        by = y+i*h;
      }
      else
      {
        bx = x+i*w;
        by = y;
      }
      sliders[i] = new Slider(nm[i], 0, min, max, bx, by, w, h, orientation);
    }
  }
  */
  MultiSlider(int numSliders, float min, float max, int x, int y, int w, int h, int orientation)
  {
    super("", x, y, w, h*numSliders);
    sliders = new Slider[numSliders];
    for (int i = 0; i < sliders.length; i++)
    {
      int bx, by;
      if(orientation == HORIZONTAL)
      {
        bx = x;
        by = y+i*h;
      }
      else
      {
        bx = x+i*w;
        by = y;
      }
      sliders[i] = new Slider("", 0, min, max, bx, by, w, h, orientation);
    }
  }
  
  void setNames(String [] names)
  {
    for (int i = 0; i < sliders.length; i++)
    {
      if(i >= names.length)
        break;
      sliders[i].setName(names[i]);
    }
  }

  void set(int i, float v)
  {
    if(i >= 0 && i < sliders.length)
    {
      sliders[i].set(v);
    }
  }
  
  float get(int i)
  {
    if(i >= 0 && i < sliders.length)
    {
      return sliders[i].get();
    }
    else
    {
      return -1;
    }
    
  }

  void display()
  {
    for (int i = 0; i < sliders.length; i++)
    {
      sliders[i].display();
    }
  }

  
  boolean mouseDragged()
  {
    for (int i = 0; i < sliders.length; i++)
    {
      if(sliders[i].mouseDragged())
      {
        return true;
      }
    }
    return false;
  }

  boolean mouseReleased()
  {
    for (int i = 0; i < sliders.length; i++)
    {
      if(sliders[i].mouseReleased())
      {
        return true;
      }
    }
    return false;
  }
}


