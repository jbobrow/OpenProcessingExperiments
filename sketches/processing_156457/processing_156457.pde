
/*
 * LilGuitar
 * A sort of synthesizer class
 * takes some set of sounds, apply some effects...  
*/

Maxim maxim; 
public static final int RED=0, GREEN=1, BLUE=2 ;

interface Listener
{
  public void listen(Object b);
}

/*-----------------------------------------------------------------------*
**   Stat of buttons                                                     *
**-----------------------------------------------------------------------*/

class Button
{
  int x,y,w,h;
  int r,g,b;
  int id;
  String name, value;
  boolean pressed;
  Listener listener=null;
  public Button(String name, String value, int id, int x, int y, int w, int h, int r, int g, int b)
  {
    this.name=name;
    this.value=value;
    this.id=id;
    this.x=x;
    this.y=y;
    this.w=w;
    this.h=h;
    this.r=r;
    this.g=g;
    this.b=b;
    pressed=false;
  }
  public void draw()
  {
    if (pressed)
    {
      fill (255-r,255-g,255-b);
      rect(x,y,w,h);
      fill(r,g,b);
    }
    else
    {
      fill(r,g,b);
      rect(x,y,w,h);
      fill (255-r,255-g,255-b);
    }
    textAlign(CENTER, CENTER);
    textSize(12);
    text(name,x,y,w,h);
  }
  boolean isPressed()
  {
    return pressed;
  }
  void toggle()
  {
    pressed= !pressed;
  }
  void press(boolean p)
  {
    pressed= p;
  }
  
  String getName() {return name;}
  String getValue() {return value;}
  int getId() {return id;}
  
  void setListener(Listener l)
  {
    listener=l;
  }
  void onClick()
  {
    if (x<mouseX && mouseX<x+w && y<mouseY && mouseY<y+h)
    {
      toggle();
      if (listener!=null) listener.listen(this);
    }
  }
}

class ButtonArray implements Listener
{
  Button []bs;
  int active=-1;
  Listener listener;

  public ButtonArray(String []names,String []ids,int x, int y, int w, int h, int rowEls,int r,int g,int b)
  {
    bs = new Button[names.length];
    for (int i=0;i<names.length;i++)
     {
        bs[i]=new Button(names[i],ids[i],i,x+((i%rowEls)*(w+1)),y+(i/rowEls)*(h+1),w,h,r,g,b);
        bs[i].setListener(this);
     }
  }
  void activate(String id)
  {
     for (int i=0;i<bs.length;i++)
     {
        if (bs[i].getValue().equals(id))
        {
          if (active!=-1) bs[active].press(false);
          active=i;
          bs[active].press(true);
          return;
        }
     }
  }
  void activate(int id)
  {
    if (active != id)
    {
       if (active!=-1) bs[active].press(false);
       active=id;
       bs[active].press(true);
    }
  }

  void listen(Object o)
  {
    Button b=(Button)o;
    if (b.getId()!=active)
    {
       if (active!=-1) bs[active].press(false);
       active = b.getId();
       bs[active].press(true);
       if (listener!=null) listener.listen(this);
    }
  }
  void setListener(Listener l)
  {
    listener=l;
  }
  Button getActive()
  {
    return active==-1?null:bs[active];
  }
  
  void draw()
  {
   for (Button b : bs) b.draw();
  }
  
  void  onClick()
  {
   for (Button b : bs) b.onClick();
  }

}

/*-----------------------------------------------------------------------*
**   End of buttons                                                      *
**-----------------------------------------------------------------------*/

public class Corda
{
  private static final int STATUS_PLAYING=1,STATUS_STOPPING=2,STATUS_STOPPED=3,STATUS_STARTING=4;
  WavetableSynth waveform;
  int x,y,w,h,r,g,b;
  int status=STATUS_STOPPED;
  int cycle;
  String file;
  public Corda (String file,int x,int y,int w,int h, int r, int g, int b)
  {
  waveform = maxim.createWavetableSynth(128);
  try {
    this.x=x;
    this.y=y;
    this.w=w;
    this.h=h;
    this.r=r;
    this.g=g;
    this.b=b;
    this.file=file;
    WavFile wf=null;
    wf= WavFile.openWavFile(new File(file));

  float [] wavetable;
  wavetable = new float[(int)wf.getNumFrames()];
  wf.readFrames(wavetable,wavetable.length);
  waveform = maxim.createWavetableSynth(128);
  waveform.loadWaveForm(wavetable);
 
  } catch (Exception e ) {e.printStackTrace();}
  }

  void setup()
  {
    fill(r,g,b);
    rect(x,y,w,h);
  }
  
  void onClick()
  {
    if (x<mouseX && mouseX<x+w && y<mouseY && mouseY<y+h)
    {
      if (status!=STATUS_PLAYING)
      {
       waveform.setFrequency(mtof[((mouseY-y)*(mtof.length-30)/h)+30]);
        status=STATUS_STARTING;
        tick();
        status=STATUS_STOPPING;
        cycle=0;
      }
    }
  }
  
  void onMouseDrag()
  {
    if (x<mouseX && mouseX<x+w && y<mouseY && mouseY<y+h)
    {
       waveform.setFrequency(mtof[((mouseY-y)*(mtof.length-30)/h)+15]);
      if (status!=STATUS_PLAYING)
      {
        status=STATUS_STARTING;
      }
    }
    else
    {
      if (status==STATUS_PLAYING || status==STATUS_STARTING)
      {
        status=STATUS_STOPPING;
        cycle=0;
      }
    }
  }

  void onMouseRelease()
  {
    if (waveform.isPlaying())
    {
      if (status==STATUS_PLAYING || status==STATUS_STARTING)
      {
        status=STATUS_STOPPING;
        cycle=0;
      }
    }

  }
  
  void draw()
  {
    tick();
  }
  
  void tick()
  {
    if(STATUS_STOPPING==status)
    {
      if (cycle==0) waveform.ramp(0., 2000);
      else if (cycle==100) 
      {
        waveform.stop();
        waveform.ramp(1.,1);
        status=STATUS_STOPPED;
      }
      cycle++;
    }
    
    if (STATUS_STARTING==status)
    {
        waveform.play();
        waveform.ramp(1.,1);
        status=STATUS_PLAYING;
    }
  }
  
}

class Instru
{
   Corda []strings;


   public Instru(String baseInstr,int from, int to, int x, int y, int w, int h, int c)
   {
      strings = new Corda[to-from];
      int ws=w/strings.length;
      int bs=256/strings.length;
      int i,r=0,g=0,b=0;
      for (i=0 ;i<strings.length;i++)
      {
        if (c==RED)   { r=255 ; g=bs*i; b=bs*i;}
        if (c==GREEN) { r=bs*i; g=255 ; b=bs*i;}
        if (c==BLUE)  { r=bs*i; g=bs*i; b=255 ;}
        strings[i]=new Corda(baseInstr+((i+from)<10?"0":"")+(i+from)+".wav",i*(ws+1)+x,y,ws,h,r,g,b);
      }
   }
   void setup()
   {
       for (Corda string : strings) string.setup();
   }
   void draw()
   {
     for (Corda string : strings) string.draw();
   }
void  onMouseDrag()
{
  for (Corda string : strings) string.onMouseDrag();
}

void  onClick()
{
  for (Corda string : strings) string.onClick();
}

void  onMouseRelease()
{
  for (Corda string : strings) string.onMouseRelease();
}
   
}


class Synthesizer implements Listener
{
  Instru ment;
  ButtonArray ba;
  int x,y,w,h,c,osh;
  public Synthesizer(String []names, String []ids,int x,int y,int w,int h,int c)
  {
    int r=0,g=0,b=0;
    this.x=x;
    this.y=y;
    this.w=w;
    this.h=h;
    this.c=c;
    switch (c)
    {
       case RED:   r=127 ; g=250; b=250; break;
       case GREEN: r=250; g=127 ; b=250; break;
       case BLUE:  r=250; g=250;  b=127; break;
       default:    r=10 ; g=10; b=10; break;
    }
    ba = new ButtonArray(names,ids,x, y, 80, 20, w/80,r,g,b);
    ba.activate(0);
    osh=2+(names.length/(w/80))*(21);
    ment =new Instru(getPatternFor(ba.getActive().getValue()),5,15, x,y+osh,w,h-osh,c);
    ba.setListener(this);
  }
  public void listen(Object o)
  {
      ment=null;
      ment=new Instru(getPatternFor(ba.getActive().getValue()),5,15, x,y+osh,w,h-osh,c);
  }
  String getPatternFor(String item)
  {
    return "/home/marco/coursera/creative_programming/esperimenti/risorse/AKWF_"+item+"/AKWF_"+item+"_00";
  }
  
  public void setup()
  {
    ment.setup();
  }
  
  public void draw()
  {
    ment.draw();
    ba.draw();
  }
  public void onMouseDrag()
  {
    ment.onMouseDrag();
  }
  public void onClick()
  {
     ment.onClick();
     ba.onClick();
  }
  public void onMouseRelease()
  {
     ment.onMouseRelease();
  }

}

Synthesizer[] synths;


void setup()
{
  maxim = new Maxim(this);
  size(640,480);
  
   String [] instNames = {"el. guitar", "ac. guitar", "birds", "cello", "clarinett", "clavinet", "dbass","el. organ","flute","oboe","piano","violin"};
   String [] instIds = {"eguitar", "aguitar", "birds", "cello", "clarinett", "clavinet", "dbass","eorgan","flute","oboe","piano","violin"};
  synths = new Synthesizer[2];
  synths[0]=new Synthesizer(instNames,instIds,2  ,2,316,430,RED);
  synths[1]=new Synthesizer(instNames,instIds,322,2,316,430,GREEN);
  
  for (Synthesizer s : synths) s.setup();
}

void draw()
{
   for (Synthesizer s : synths) s.draw();
}

void  mouseDragged()
{
   for (Synthesizer s : synths) s.onMouseDrag();
}

void  mouseClicked()
{
   for (Synthesizer s : synths) s.onClick();
}


void  mouseReleased()
{
   for (Synthesizer s : synths) s.onMouseRelease();
}

