
import ddf.minim.*;

Minim minim;
AudioSample po;
AudioSample myy;
AudioSample jyykaa;
AudioSample go;
AudioSample giff;

AudioSample ennze;
AudioSample wo;
AudioSample zee;
AudioSample fymms;
AudioSample rakete;

AudioSample ziiu;
AudioSample rinnzekete;
AudioSample kwii;
AudioSample ro;
AudioSample uu3;

AudioSample tee;
AudioSample rrr;
AudioSample dll;
AudioSample fo;
AudioSample bee;

AudioSample bo;
AudioSample ee;


void setup()
{
  size(1500, 800);
  
  minim = new Minim(this);
  po = minim.loadSample("po.mp3");
  minim = new Minim(this);
  myy = minim.loadSample("myy.mp3");
minim = new Minim(this);
  jyykaa = minim.loadSample("jyykaa.mp3");
  minim = new Minim(this);
  go = minim.loadSample("go.mp3");
 minim = new Minim(this);
  giff = minim.loadSample("giff.mp3");
 minim = new Minim(this);
  ennze = minim.loadSample("ennze.mp3");
   minim = new Minim(this);
  wo = minim.loadSample("wo.mp3");
 minim = new Minim(this);
  zee = minim.loadSample("zee.mp3");
minim = new Minim(this);
  fymms = minim.loadSample("fymms.mp3");
  minim = new Minim(this);
  rakete = minim.loadSample("rakete.mp3");
  minim = new Minim(this);
  ziiu = minim.loadSample("ziiu.mp3");
  minim = new Minim(this);
  rinnzekete = minim.loadSample("rinnzekete.mp3");
  
   minim = new Minim(this);
  kwii = minim.loadSample("kwii.mp3");
  
 minim = new Minim(this);
  ro = minim.loadSample("ro.mp3");
  
   minim = new Minim(this);
  uu3 = minim.loadSample("uu3.mp3");
  
 minim = new Minim(this);
  tee = minim.loadSample("tee.mp3");
  
minim = new Minim(this);
  rrr = minim.loadSample("rrr.mp3");
  
  minim = new Minim(this);
  dll = minim.loadSample("dll.mp3");
  
  minim = new Minim(this);
  fo = minim.loadSample("fo.mp3");
  
  minim = new Minim(this);
  bee = minim.loadSample("bee.mp3");
  
  minim = new Minim(this);
  bo = minim.loadSample("bo.mp3");
  
  minim = new Minim(this);
  ee = minim.loadSample("ee.mp3");
  
}

void draw()
{
  background(0);
  
}

void keyPressed()
{
  if ( key =='a' ) wo.trigger();
  if ( key =='b' ) zee.trigger();
  if ( key =='c' ) fymms.trigger();
  if ( key =='d' ) uu3.trigger();
  if ( key =='e' ) tee.trigger();
  if ( key =='f' ) rrr.trigger();
  
  if ( key =='g' ) ee.trigger();
  if ( key =='h' ) fo.trigger();
  if ( key =='i' ) bee.trigger();
  if ( key =='j' ) rakete.trigger();
  if ( key =='k' ) ziiu.trigger();
  if ( key =='l' ) rinnzekete.trigger();
  
   if ( key =='m' ) po.trigger();
  if ( key =='n' ) myy.trigger();
  
  if ( key =='o' ) jyykaa.trigger();
  if ( key =='p' ) go.trigger();
  if ( key =='q' ) giff.trigger();
  if ( key =='r' ) ennze.trigger();
  if ( key =='s' ) ro.trigger();
  if ( key =='t' ) kwii.trigger();
  
    if ( key =='u' ) dll.trigger();
  if ( key =='v' ) bo.trigger();
}

void stop()
{
  wo.close();
  zee.close();
  fymms.close();
  uu3.close();
  tee.close();
  rrr.close();
  
  ee.close();
  fo.close();
  bee.close();
  rakete.close();
  ziiu.close();
  rinnzekete.close();
  
    po.close();
  myy.close();
  
  jyykaa.close();
  go.close();
  giff.close();
  ennze.close();
  ro.close();
  kwii.close();
  
   dll.close();
  bo.close();
  
  minim.stop();
  super.stop();
  
  
  
}




