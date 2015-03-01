
Boolean showData = true;
int averageSetSize = 4;

qtrBar qbar;

class beat
{
  float framesOffset;
  public beat(float offs)
  {
    framesOffset = offs;
  }
}

ArrayList<beat> beats = new ArrayList<beat>();

float fullbeatFrameCounter = 0;
float qtrbeatFrameCounter = 0;
float bpm;
float bps;
float avgMilli = 0;

void setup()
{
  //size(screen.width, screen.height-30);
  size(400, 300);
  background(255);
  frameRate(60);
  qbar = new qtrBar();
}

void draw()
{
  float frate = frameRate;
  
  background(0);
  //frames p beat
  float fpb = frate / bps;
  if(showData)
  {
    text("bpm : " + bpm, 20,20);
    text("fps : " + frate, 20, 40);
    text("fpb : " + fpb,20,60);
  
    for(int i=0; i < beats.size(); i++)
    {
        text(beats.get(i).framesOffset, 20, 80 + (i*20));
    }
  }
  
  fill(255);
  
  if(isFinite(fpb) && fpb != 0)
  {
    if(fullbeatFrameCounter >= fpb) // *4
    {
       float overlapfp = abs(fullbeatFrameCounter - fpb);
       fullbeatFrameCounter = overlapfp;
       fill(0,255,0);
    }
    
    if(qtrbeatFrameCounter >= fpb/4)
    {
      float overlap = abs(qtrbeatFrameCounter - (fpb/4));
      qtrbeatFrameCounter = overlap;
      qbar.shove();
    }
    
    ellipse(
      width / 2, 
      height / 2, 
      fullbeatFrameCounter, 
      fullbeatFrameCounter
    );
    
     qbar.draw();
  }
  
  fullbeatFrameCounter+= 1;
  qtrbeatFrameCounter += 1;
}

float avgMillisecs()
{
  if(beats.size() == 0) return 0;
  float tot = 0;
  for(int i = 0; i < beats.size(); i++)
  {
    tot += beats.get(i).framesOffset;
  }
  return tot / beats.size();
}

void handleBeat()
{
  if(beats.size() > averageSetSize-1)
  {
    //pop one off the stack
    beats.remove(0);
  }
  if(beats.size() > 0)
  {
    float timeoff = new Date().getTime();
    float diff = timeoff - lastoffset;

    beats.add(new beat(diff));
    lastoffset = new Date().getTime();
  }
  else
  {
    background(255,0,0);
    beats.add(new beat(new Date().getTime()));
    lastoffset = new Date().getTime();
  }
  avgMilli = avgMillisecs();
  bpm = 60 / (avgMilli / 1000);
  bps = bpm / 60;
  //synchronise with tap
  fullbeatFrameCounter = 0;
  qtrbeatFrameCounter = 0;
}

float lastoffset = 0;
void touchStart(TouchEvent te)
{
  handleBeat();
}

void mousePressed()
{
  handleBeat();
}



class qtrBar
{
  float x, y, r;
  
  public qtrBar()
  {
    shove();
  }
  
  void draw()
  {
      pushMatrix();
        translate(x, y);
        rotate(r);
        fill(0,0,255);
        rect(0,0,100,10);
        fill(255);
      popMatrix();
  }
  
  void shove()
  {
    x = random(width);
    y = random(height);
    r = random(PI * 2);
  }
  
}
