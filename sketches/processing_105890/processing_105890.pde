
//The MIT License (MIT) - See Licence.txt for details

//Copyright (c) 2013 Mick Grierson, Matthew Yee-King, Marco Gillies

Maxim maxim;
AudioFilePlayer sample1;
AudioFilePlayer sample2; 
AudioFilePlayer sample3; 
AudioFilePlayer sample4;
Synth waveform;
Synth waveform2;
int playhead;
int[] notes = {
  0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
};
int[] notes2 = {
  0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
};

int numBeats = 16;
int currentBeat = 0;

PImage bg;

boolean [] track1;
boolean [] track2;
boolean [] track3;
boolean [] track4;

boolean isPlaying;

float fc, res, attack, release, filterAttack;
float fc2, res2, attack2, release2, filterAttack2;

int transpose = 0;
int transpose2 = 0;

float[] wavetable = new float[514]; 
float[] wavetable2 = new float[514]; 

Slider dt, dg, a, r, f, q, fa, o, dt2, dg2, a2, r2, f2, q2, fa2, o2;
MultiSlider seq, seq2;

void setup()
{
  size(1024, 768);
  maxim = new Maxim(this);
  waveform = new Synth();
  waveform2 = new Synth();
  sample1 = maxim.loadFile("bd1.wav", 2048);
  sample2 = maxim.loadFile("sn1.wav", 2048);
  sample3 = maxim.loadFile("hh1.wav", 2048);
  sample4 = maxim.loadFile("sn2.wav", 2048);
  //waveform.volume(0);
  //waveform2.volume(0);
  // name, value, min, max, pos.x, pos.y, width, height
  dt = new Slider("delay time", 1, 0, 100, 110, 10, 200, 20, HORIZONTAL);
  dg = new Slider("delay amnt", 1, 0, 100, 110, 30, 200, 20, HORIZONTAL);
  a = new Slider("attack", 1, 0, 100, 110, 50, 200, 20, HORIZONTAL);
  r = new Slider("release", 20, 0, 100, 110, 70, 200, 20, HORIZONTAL);
  f = new Slider("filter", 20, 0, 100, 110, 90, 200, 20, HORIZONTAL);
  q = new Slider("res", 20, 0, 100, 110, 110, 200, 20, HORIZONTAL);
  fa = new Slider("filterAmp", 20, 0, 100, 110, 130, 200, 20, HORIZONTAL);
  o = new Slider("transpose", 0, 1, 80, 110, 150, 200, 20, HORIZONTAL);
  // name,s min, max, pos.x, pos.y, width, height
  seq = new MultiSlider(notes.length, 0, 256, 0, 300, width/18/2, 150, UPWARDS);
  // name, value, min, max, pos.x, pos.y, width, height

  dt2 = new Slider("delay time", 1, 0, 100, 620, 10, 200, 20, HORIZONTAL);
  dg2 = new Slider("delay amnt", 1, 0, 100, 620, 30, 200, 20, HORIZONTAL);
  a2 = new Slider("attack", 1, 0, 100, 620, 50, 200, 20, HORIZONTAL);
  r2 = new Slider("release", 20, 0, 100, 620, 70, 200, 20, HORIZONTAL);
  f2 = new Slider("filter", 20, 0, 100, 620, 90, 200, 20, HORIZONTAL);
  q2 = new Slider("res", 20, 0, 100, 620, 110, 200, 20, HORIZONTAL);
  fa2 = new Slider("filterAmp", 20, 0, 100, 620, 130, 200, 20, HORIZONTAL);  
  o2 = new Slider("transpose", 0, 1, 80, 620, 150, 200, 20, HORIZONTAL);
  // name,s min, max, pos.x, pos.y, width, height
  seq2 = new MultiSlider(notes2.length, 0, 256, width/2, 300, width/18/2, 150, UPWARDS);

  frameRate(30);

  for (int i = 0; i < 514 + 1 ; i++) {

    wavetable[i]=((float)i/512)-0.5;
  }

  track1 = new boolean[numBeats];
  track2 = new boolean[numBeats];
  track3 = new boolean[numBeats];
  track4 = new boolean[numBeats]; 

  for (int i = 0; i < numBeats; i++)
  {
    track1[i] = false;
    track2[i] = false;
    track3[i] = false;
    track4[i] = false;
  }

  waveform.waveTableSize(514);
  waveform.loadWaveTable(wavetable);
  waveform2.loadWaveTable(wavetable);

  bg = loadImage("brushedm.jpg");

  isPlaying=false;
}

void draw()
{
  waveform.play();
  waveform2.play();

  //image(bg, 0, 0, width, height);
  background(0);
  stroke(255);
  for (int i = 0; i < 5; i++)
    line(0, 500+(i*height/12), width, 500+(i*height/12));
  for (int i = 0; i < numBeats + 1; i++)
    line(i*width/numBeats, 500, i*width/numBeats, 500+(4*height/12));

  int buttonWidth = width/numBeats;
  int buttonHeight = height/12;

  for (int i = 0; i < numBeats; i++)
  {
    noStroke();
    fill(200, 0, 0);

    if (track1[i])
      rect(i*buttonWidth, 500+(0*buttonHeight), buttonWidth, buttonHeight);
    if (track2[i])
      rect(i*buttonWidth, 500+(1*buttonHeight), buttonWidth, buttonHeight);
    if (track3[i])
      rect(i*buttonWidth, 500+(2*buttonHeight), buttonWidth, buttonHeight);
    if (track4[i])
      rect(i*buttonWidth, 500+(3*buttonHeight), buttonWidth, buttonHeight);
  }

  if (f.get()) {
    fc=f.get()*100;
    waveform.setFilter(fc, res);
  }

  if (dt.get()) {
    waveform.setDelayTime((float) dt.get()/50);
  }

  if (dg.get()) {
    waveform.setDelayAmount((int)dg.get()/100);
  }

  if (q.get()) {
    res=q.get();
    waveform.setFilter(fc, res);
  }

  if (a.get()) {
    attack=a.get()*10;
  }

  if (r.get()) {
    release=r.get()*10;
  }

  if (fa.get()) {
    filterAttack=fa.get()*10;
  }

  if (o.get()) {
    transpose=Math.floor(o.get());
  }

  dt.display();
  dg.display();
  a.display();
  r.display();
  f.display();
  q.display();
  fa.display(); 
  o.display();
  seq.display();

  if (f2.get()) {
    fc2=f2.get()*100;
    waveform2.setFilter(fc2, res2);
  }

  if (dt2.get()) {
    waveform2.setDelayTime((float) dt2.get()/50);
  }

  if (dg2.get()) {
    waveform2.setDelayAmount((int)dg2.get()/100);
  }

  if (q2.get()) {
    res2=q2.get();
    waveform.setFilter(fc2, res2);
  }

  if (a2.get()) {
    attack2=a2.get()*10;
  }

  if (r2.get()) {
    release2=r2.get()*10;
  }

  if (fa2.get()) {
    filterAttack2=fa2.get()*10;
  }

  if (o2.get()) {
    transpose2=Math.floor(o2.get());
  }


  dt2.display();
  dg2.display();
  a2.display();
  r2.display();
  f2.display();
  q2.display();
  fa2.display();
  o2.display();
  seq2.display();

  playhead ++;
  if (playhead%4==0) {
    waveform.ramp(0.5, attack);
    waveform.setFrequency(mtof[notes[playhead/4%16]+30]);
    waveform.filterRamp((fc/100)*(filterAttack*0.2), attack+release); 

    waveform2.ramp(0.5, attack2);
    waveform2.setFrequency(mtof[notes2[playhead/4%16]+30]);
    waveform2.filterRamp((fc2/100)*(filterAttack2*0.2), attack2+release2);

    fill(0, 0, 200, 120);
    rect(currentBeat*buttonWidth, 500, buttonWidth, height);

    if (track1[currentBeat])
      sample1.cue(0);
    sample1.play();
    if (track2[currentBeat])
      sample2.cue(0);
    sample2.play();
    if (track3[currentBeat])
      sample3.cue(0);
    sample3.play();
    if (track4[currentBeat])
      sample4.cue(0);
    sample4.play();

    currentBeat++;
    if (currentBeat >= numBeats)
      currentBeat = 0;
  }

  if (playhead%4==1) {
    waveform.ramp(0., release);
    waveform2.ramp(0., release2);
  }
}


void mouseClicked()
{

  if (!isPlaying) {

    isPlaying=true; 
    sample1.cue(0);
    sample1.play();
  }

  dt.mousePressed();
  dg.mousePressed();
  a.mousePressed();
  r.mousePressed();
  f.mousePressed();
  q.mousePressed();
  o.mousePressed();
  fa.mousePressed();
  seq.mousePressed();

  dt2.mousePressed();
  dg2.mousePressed();
  a2.mousePressed();
  r2.mousePressed();
  f2.mousePressed();
  q2.mousePressed();
  fa2.mousePressed();
  o2.mousePressed();
  seq2.mousePressed();

  int index = Math.floor(mouseX*numBeats/width);   
  int track = Math.floor((mouseY-500)*(12/height));
  if (track == 0)
    track1[index] = !track1[index];
  if (track == 1)
    track2[index] = !track2[index];
  if (track == 2)
    track3[index] = !track3[index];
  if (track == 3)
    track4[index] = !track4[index];
}

void mouseDragged()
{

  if (!isPlaying) {

    isPlaying=true; 
    sample1.cue(0);
    sample1.play();
  }
  dt.mouseDragged();
  dg.mouseDragged();
  a.mouseDragged();
  r.mouseDragged();
  f.mouseDragged();
  q.mouseDragged();
  fa.mouseDragged();
  o.mouseDragged();
  seq.mouseDragged();

  dt2.mouseDragged();
  dg2.mouseDragged();
  a2.mouseDragged();
  r2.mouseDragged();
  f2.mouseDragged();
  q2.mouseDragged();
  fa2.mouseDragged();
  o2.mouseDragged();
  seq2.mouseDragged();

  int index = Math.floor(mouseX*numBeats/width);   
  int track = Math.floor((mouseY-500)*(12/height));
  if (track == 0)
    track1[index] = !track1[index];
  if (track == 1)
    track2[index] = !track2[index];
  if (track == 2)
    track3[index] = !track3[index];
  if (track == 3)
    track4[index] = !track4[index];
}

void mouseReleased()
{
  for (int i=0;i<notes.length;i++) {

    notes[i]=(Math.floor((seq.get(i)/256)*12+transpose)); 
    notes2[i]=(Math.floor((seq2.get(i)/256)*12+transpose2));
  }
}


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
      float imgWidth = (extents.y*currentImage.width)/currentImage.height;
      
      
      pushStyle();
      imageMode(CORNER);
      tint(imageTint);
      image(currentImage, pos.x, pos.y, imgWidth, extents.y);
      stroke(bgColor);
      noFill();
      rect(pos.x, pos.y, imgWidth,  extents.y);
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
      bgColor = activeColor;
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
  boolean on = false;

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
    on = val;
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
  
  RadioButtons (int numButtons, int x, int y, int w, int h, int orientation)
  {
    super("", x, y, w*numButtons, h);
    buttons = new Toggle[numButtons];
    for (int i = 0; i < buttons.length; i++)
    {
      int bx, by;
      if(orientation == HORIZONTAL)
      {
        bx = x+i*(w+5);
        by = y;
      }
      else
      {
        bx = x;
        by = y+i*(h+5);
      }
      buttons[i] = new Toggle("", bx, by, w, h);
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
  
  void setAllImages(PImage img)
  {
    setAllInactiveImages(img);
    setAllActiveImages(img);
  }
  
  void setInactiveImage(int i, PImage img)
  {
    buttons[i].setInactiveImage(img);
  }

  
  void setAllInactiveImages(PImage img)
  {
    for (int i = 0; i < buttons.length; i++)
    {
      buttons[i].setInactiveImage(img);
    }
  }
  
  void setActiveImage(int i, PImage img)
  {
    buttons[i].setActiveImage(img);
  }
  
  
  
  void setAllActiveImages(PImage img)
  {
    for (int i = 0; i < buttons.length; i++)
    {
      buttons[i].setActiveImage(img);
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
    textAlign(LEFT, TOP);
    fill(lineColor);
    text(name, pos.x, pos.y);
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



