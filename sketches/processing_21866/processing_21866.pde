
//Smoother interface
//Pre-established links
//Drag bells with LMB to position, click with MMB to chime, RMB to mute
//Drag knob with LMB to position, click with MMB to enable/disable stereo mode
//Knob controls volume on vertical axis, position on horizontal axis
//
// This version establishes several different mathe-musical arrangements
//
import ddf.minim.*;
import ddf.minim.signals.*;

Minim minim;

Bell[] bells;
Edge[] edges;
Knob knob;

float mastervol = 0.1;

int seq = 0;  //Controls rearrangement into new patterns

void setup()
{
  size(500,500);
  smooth();
  background(0);
  frameRate(15);
  
  //Knob initiation
  knob = new Knob(250,50);
  
  //sound initiation
  minim = new Minim(this);
  
  bells = new Bell[16];
  float note = 131;
  for(int i = 0; i < bells.length; i++)
  {
    note *= 1.125;
    bells[i] = new Bell(i, note, 250+(i+5)*10*sin(2*sqrt(1.5*i+1)), 250+(i+5)*10*cos(2*sqrt(1.5*i+1)));
  }
  
  //edge initiation
  edges = new Edge[16];
  for(int i = 0; i < edges.length; i++)
  {
    edges[i] = new Edge(i, (i+3)%bells.length);
  }
}


void draw()
{
  background(0);
  
  for(int i = 0; i < edges.length; i++)
  {
    edges[i].update();
  }
  
  for(int i = 0; i < bells.length; i++)
  {
    bells[i].update();
  }
  
  knob.update();
}


void mousePressed()
{
  //Knobs
  if(knob.touched(mouseX,mouseY))
  {
    if(mouseButton == LEFT)
    {
      knob.pickup();
    }
    if(mouseButton == CENTER)
    {
      knob.stereoToggle();
    }
  }
  
  else
  {
    //Rearrangement
    if(mouseButton == CENTER)
    {
      rearrange();
    }
    //Bells
    for(int i = 0; i < bells.length; i++)
    {
      if(mouseButton == LEFT)
      {    if(bells[i].touched(mouseX,mouseY))
          {        bells[i].pickup();      }    }
          
      if(mouseButton == RIGHT)
      {    if(bells[i].touched(mouseX,mouseY))
          {        bells[i].setAmp(0);      }    }
    }
  }
}

void mouseReleased()
{
  //Bells
  for(int i = 0; i < bells.length; i++)
  {
    if(mouseButton == LEFT)
    {    bells[i].putdown();    }
  }
  
  //Knobs
  if(mouseButton == LEFT)
  {    knob.putdown();  }

  //Unstriker
  if(mouseButton == RIGHT)
  {
    if(knob.touched(mouseX, mouseY))
    {
      for(int i = 0; i < bells.length; i++)
      {
        bells[i].struck = false;
      }
    }
  }
}


void stop()
{
  for(int i = 0; i < bells.length; i++)
  {
    bells[i].out.close();
  }
    //out.close();
    minim.stop();
    super.stop();
}


class Bell
//A bell that can be tolled, moved around, draws itself on screen, etc.
{
  AudioOutput out;
  SineWave bell;
  float x, y;
  float vx, vy;  //Vibrational offset
  int elapse;  //Get around the fact that portamento interferes with immediate sound feedback
  int portamento = 20;  //Portamento fix
  float dampConstant = 0.97;
  boolean picked = false;  //Notes whether bell has been picked up
  int waves = 0;
  float wavestrength = 128;
  int id;
  boolean singlestrike, struck;
  
  boolean primed = false;  //Networking technique
  
  Bell(int iid, float ifreq, float ix, float iy)
  {
    id = iid;
    x = ix; y = iy;
    elapse = millis();
    out = minim.getLineOut(Minim.STEREO);
    bell = new SineWave(ifreq, 0, out.sampleRate());
    bell.portamento(portamento);
    setPan();
    out.addSignal(bell);
    singlestrike = false; struck = false;
  }
  
  void setAmp(float iamp)
  {
    if(!struck)
    {
      bell.setAmp(iamp * knob.separation(x,y));
    }
    elapse = millis();
    waves=0;
    wavestrength=128;
    if(singlestrike) struck = true;
  }
  
  void setFreq(float ifreq)
  {    bell.setFreq(ifreq);  }
  
  void setPan()
  {
    if(knob.stereo)
    {
      bell.setPan( (2*(x-knob.x+width*.5))/width -1);  //Stereo positioning!
    }
    else bell.setPan(0);
  }
  
  void update()
  //Draw the bell and perform per-frame maintenance like damping
  {
    float amp = bell.amplitude();
    //Damp signal
    if(millis() - elapse > 140)  //Minimum temporal interval to permit amp 1 for some reason
    {      bell.setAmp(amp * dampConstant);    }
    
    //Compute position
    if(picked)
    {
      x = mouseX; y = mouseY;
    }
    setPan();
    
    //Draw graphic
    vibrate();
    noStroke();
    fill(64);
    ellipse(x+1, y+1, sz()+2, sz()+2);
    fill(128+256*amp/mastervol);
    ellipse(vx, vy, sz(), sz());
    
    //Draw soundwaves
    fill(255,wavestrength); noStroke();
    ellipse(x,y,sz()+waves,sz()+waves);
    waves++; wavestrength*=0.95;
  }
  
  void vibrate()
  {
    vx = x + 2 * sin(frameCount * y) * bell.amplitude();
    vy = y + 2 * cos(frameCount * x) * bell.amplitude();
  }
  
  float sz()
  //Compute visual bell size
  {    return(15 * (7.5+log(0.5/bell.frequency())) + 10);  }
  
  boolean touched(float ix, float iy)
  //Return 'true' if the coordinates are within, usually for mouse detection
  {
    if(dist(ix,iy, x,y) <= sz()/2)
    {
      return true;
    }
    return false;
  }
  
  void pickup()
  {
    picked = true;
  }
  
  void putdown()
  {
    picked = false;
  }
}


class Edge
{
  int obj1, obj2;
  float traveled;
  float speed = 2;
  boolean forward;
  color fadeline;
  
  Edge(int i1, int i2)
  {
    obj1 = i1; obj2 = i2;
    traveled = 0;
    forward = true;
    fadeline = color(0,0,0);
  }
  
  void travel()
  {
    traveled += speed;
  }
  
  void update()
  {
    travel();
    
    //Set coords
    float x1,y1,xe,ye;
    x1 = bells[obj2].x;
    y1 = bells[obj2].y;
    xe = bells[obj1].x;
    ye = bells[obj1].y;
    if(forward)
    {
      x1 = bells[obj1].x;
      y1 = bells[obj1].y;
      xe = bells[obj2].x;
      ye = bells[obj2].y;
    }
    float portion = traveled / dist(x1, y1, xe, ye);
    float x2 = lerp(x1, xe, portion);
    float y2 = lerp(y1, ye, portion);
    
    //Draw
    strokeWeight(1);
    stroke(fadeline);
    strokeWeight(1.5);
    line(x1,y1,xe,ye);
    stroke(255);
    line(x1, y1, x2, y2);
    fadeline = color(red(fadeline)*0.97, green(fadeline)*0.97, blue(fadeline)*0.97);
    
    //Termination check
    if(portion >=1)
    {
      end();
      traveled = 0;
      forward = !forward;
      fadeline = color(255,255,255);
    }
  }
  
  
  void end()
  //What to do when the line reaches its destination
  {
    if(forward)
    {
      bells[obj2].setAmp(mastervol);
    }
    else
    {
      bells[obj1].setAmp(mastervol);
    }
  }
}


void emboss(int x1, int y1, int x2, int y2)
//Emboss area of image
//Cheat by only examining the three pixels used by the filter
{
  float sumr;
  float sumg;
  float sumb;
  
  color col;
  
  loadPixels();
  for(int x = x1; x < x2; x++)
  {
    //Elliptification code:
    float halfx = (x2 - x1)/2;
    float radius = ((x2 - x) / halfx) - 1;
    float theta = asin(radius);
    float halfy = (y2 - y1)/2;
    float yrad = cos(theta) * halfy;
    int miny = int(y1 + halfy - yrad);
    int maxy = int(y1 + halfy + yrad);
    
    for(int y = miny; y < maxy; y++)
    {
      //Conglomerate method ( (1,1), (2,2) )
      sumr = 0.5*red(pixels[pixseek(x,y)]) - 0.5*red(pixels[pixseek(x+1,y+1)]);
      sumg = 0.5*green(pixels[pixseek(x,y)]) - 0.5*green(pixels[pixseek(x+1,y+1)]);
      sumb = 0.5*blue(pixels[pixseek(x,y)]) - 0.5*blue(pixels[pixseek(x+1,y+1)]);
      
      //Finalise and draw
      col = color(128 - (sumr+sumg+sumb)/3);
      pixels[pixseek(x,y)] = col;
    }
  }
  updatePixels();
}


int pixseek(int x, int y)
{
  int pixi = y*width+x;
  if(pixi<0)
  {
    pixi = abs(pixi);
  }
  if(pixi>=width*height)
  {
    pixi = pixi%(width*height);
  }
  return(pixi);
}


class Knob
{
  float x, y;
  boolean picked;
  float sz = 20;
  float maxleng = sqrt(sq(width) + sq(height));
  float minvol=0;
  float maxvol=2;
  boolean stereo = false;
  color col, colA, colAM, colB, colBM;
  
  Knob(float ix, float iy)
  {
    x = ix; y = iy;
    setCol(255,255,255,255);
  }
  
  void setCol(float r, float g, float b, float a)
  {
    col = color(r,g,b,a);
    colAM = color(r,g,b,a/2);
    colBM = color(r,g,b,a/4);
    getCol(1);
  }
  
  void getCol(float a)
  {
    colA = color(red(colAM), green(colAM), blue(colAM), alpha(colAM) * a);
    colB = color(red(colBM), green(colBM), blue(colBM), alpha(colBM) * a);
  }
  
  void stereoToggle()
  {
    stereo = !stereo;
  }
  
  float separation(float ix, float iy)
  {
    return(constrain((maxleng-dist(ix,iy, x,y)) / maxleng, minvol, maxvol));
  }
    
  void update()
  //Draw the knob
  {
    //Compute position
    if(picked)
    {
      x = mouseX; y = mouseY;
    }
    
    //Master Volume Control
    mastervol = (height-y)/height*0.25;
    
    //Draw graphic
    getCol(0.5+0.5*sin(frameCount*0.14));
    noStroke();
    fill(col);
    triangle(x,y-1*sz, x-0.866*sz,y+0.5*sz, x+0.866*sz,y+0.5*sz);
    stroke(colA); strokeWeight(2);
    triangle(x,y-1*sz, x-0.866*sz,y+0.5*sz, x+0.866*sz,y+0.5*sz);
    stroke(colB); strokeWeight(4);
    triangle(x,y-1*sz, x-0.866*sz,y+0.5*sz, x+0.866*sz,y+0.5*sz);
    fill(32);
    if(stereo) noFill();
    stroke(64); strokeWeight(2);
    ellipse(x,y,sz-1,sz-1);
  }
  
  boolean touched(float ix, float iy)
  //Return 'true' if the coordinates are within, usually for mouse detection
  {
    if(dist(ix,iy, x,y) <= sz/2)
    {
      return true;
    }
    return false;
  }
  
  void pickup()
  {
    picked = true;
  }
  
  void putdown()
  {
    picked = false;
  }
}


void rearrange()
{
  int no = 8;  //Number of arrangements programmed
  seq = (seq+1)%no;
  
  //Fundamental resets
  for(int i = 0; i < edges.length; i++)
  {
    edges[i].traveled = 0;
    edges[i].forward = true;
  }
  for(int i = 0; i < bells.length; i++)
  {
    bells[i].dampConstant = 0.97;
    bells[i].singlestrike = false;
    bells[i].struck = false;
  }
  
  if(seq == 0)
  //Basic spiral
  {
    float note = 131;
    for(int i = 0; i < bells.length; i++)
    {
      note*=1.125;
      bells[i].x = 250+(i+5)*10*sin(2*sqrt(1.5*i+1));
      bells[i].y = 250+(i+5)*10*cos(2*sqrt(1.5*i+1));
      bells[i].setFreq(note);
    }
    for(int i = 0; i < edges.length; i++)
    {
      edges[i].obj1 = i;
      edges[i].obj2 = (i+3)%bells.length;
    }
  }
  else
  if(seq == 1)
  //Wobbly circle/gong
  {
    float note = 131;
    for(int i = 0; i < bells.length; i++)
    {
      float sine = sin(i);
      float radius = 150 + sine*10;
      bells[i].x = 250+radius*sin(TWO_PI * i / bells.length);
      bells[i].y = 250+radius*cos(TWO_PI * i / bells.length);
      bells[i].setFreq(2*note + note*sine);
      bells[i].dampConstant = 0.9;
    }
    for(int i = 0; i < edges.length; i++)
    {
      edges[i].obj1 = i;
      edges[i].obj2 = (i+3)%bells.length;
    }
  }
  else
  if(seq == 2)
  //Wobbly internal circle
  {
    float note = 131;
    for(int i = 0; i < bells.length; i++)
    {
      note *= 1.125;
      float sine = sin(i);
      float radius = 150 + sine*50;
      bells[i].x = 250+radius*sin(TWO_PI * i * 3 / bells.length);
      bells[i].y = 250+radius*cos(TWO_PI * i * 3 / bells.length);
      bells[i].setFreq(note);
    }
    for(int i = 0; i < edges.length; i++)
    {
      edges[i].obj1 = i;
      edges[i].obj2 = (i+3)%bells.length;
    }
  }
  else
  if(seq == 3)
  //Ellipse
  {
    float note = 131;
    for(int i = 0; i < bells.length; i++)
    {
      float radius = 150+50*sin(TWO_PI * i / bells.length);
      bells[i].x = 250+radius*sin(TWO_PI * i / bells.length);
      bells[i].y = 250+0.5*radius*cos(TWO_PI * i / bells.length);
      bells[i].setFreq(5*pow(1.125, 30+10*sin(TWO_PI * (i-4) / bells.length))+note);
    }
    for(int i = 0; i < edges.length; i++)
    {
      edges[i].obj1 = 0;
      edges[i].obj2 = i;
    }
    edges[0].obj2 = bells.length-1;
  }
  else
  if(seq == 4)
  //Double spiral
  {
    float note = 131;
    int halfway = int(bells.length*0.5);
    //Spiral One
    for(int i = 0; i < halfway; i++)
    {
      note*=1.125;
      bells[i].x = 250+(i+5)*15*sin(2*sqrt(i+0.5));
      bells[i].y = 250+(i+5)*15*cos(2*sqrt(i+0.5));
      bells[i].setFreq(note);
    }
    //Spiral Two
    //note = 131;
    for(int i = 0; i < halfway; i++)
    {
      note*=1.125;
      bells[i+halfway].x = 250+(i+5)*15*sin(2*sqrt(i+0.5+halfway));
      bells[i+halfway].y = 250+(i+5)*15*cos(2*sqrt(i+0.5+halfway));
      bells[i+halfway].setFreq(note);
    }
    for(int i = 0; i < edges.length; i++)
    {
      edges[i].obj1 = i;
      edges[i].obj2 = (i+3)%bells.length;
    }
  }
  else
  if(seq == 5)
  //Harmonic Ellipse
  {
    float note = 131;
    for(int i = 0; i < bells.length; i++)
    {
      note *=1.125;
      float radius = 150+50*sin(TWO_PI * i / bells.length);
      bells[i].x = 250+radius*sin(TWO_PI * i / bells.length);
      bells[i].y = 250+0.5*radius*cos(TWO_PI * i / bells.length);
      bells[i].setFreq(note);
    }
    for(int i = 0; i < edges.length; i++)
    {
      edges[i].obj1 = 0;
      edges[i].obj2 = i;
    }
    edges[0].obj2 = bells.length-1;
  }
  else
  if(seq == 6)
  //Fibonacci Spiral
  {
    float note = 131;
    float now = 1;
    float last = 1;
    for(int i = 0; i < bells.length; i++)
    {
      //Fibonacci Sequencer
      float rightnow = last+now;
      last = now;
      now = rightnow;
      //Belling
      bells[i].x = 250+(i+5)*10*sin(1.5*sqrt(1.5*i+1));
      bells[i].y = 250+(i+5)*10*cos(1.5*sqrt(1.5*i+1));
      bells[i].setFreq(note+rightnow*.5);
    }
    for(int i = 0; i < edges.length; i++)
    {
      edges[i].obj1 = i;
      edges[i].obj2 = (i+3)%bells.length;
    }
  }
  else
  if(seq == 7)
  //Written music to a perhaps recognisable tune used by New Line Cinema
  {
    //Compose 16-note tune
    float[] notes =
    { 261.6, 261.6, 311.13, 261.6,
      349.23, 261.6, 392, 349.23,
      311.13, 311.13, 392, 311.13,
      466.16, 311.13, 392, 311.13  };
    float[] noteside =
    { 1, 1, -1, 1,
      -1, 1, -1, -1,
      -1, -1, 1, -1,
      1, -1, 1, 1 };
    //Position, setup bells
    float midx = 250; float midy = 250;
    for(int i = 0; i < bells.length; i++)
    {
      float ang = PI * i / bells.length;
      bells[i].x = midx + 10*(i+1)*sin(ang)*noteside[i];
      bells[i].y = midy + 10*(i+1)*cos(ang);
      bells[i].setFreq(notes[i]);
      bells[i].singlestrike = true;
      bells[i].dampConstant = 0.8;
    }
    bells[bells.length-1].x = midx;
    bells[bells.length-1].y = midy-10;
    //Rearrange edges
    for(int i = 0; i < edges.length; i++)
    {
      edges[i].obj1 = 0;
      edges[i].obj2 = i;
    }
  }
}

