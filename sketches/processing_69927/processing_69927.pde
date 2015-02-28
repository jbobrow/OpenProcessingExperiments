
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;


int playX, playY;
int pauseX, pauseY;
int rewX, rewY;

Button subLoPass,addLoPass,subHiPass,addHiPass,LoPassOn,HiPassOn ;
Button[] buttons ;
int baseX,baseY,panWidth;

int LPF = 22000;   // frequenza filtro low pass
int HPF = 50;      // frequenza filtro hi pass

boolean LPOn;
boolean HPOn;

Minim minim;
AudioPlayer song;
BeatDetect beat;
BeatListener bl;

ArrayList<Sqr> sqrs = new ArrayList<Sqr>();

void setup() 
{
  size(600,400);
  setupFilterPanel();
  playY = pauseY = rewY = 350;
  playX = 250;
  pauseX = 300;
  rewX = 350;
  
  // startup Minim
  minim = new Minim(this);
  song = minim.loadFile("righthere.mp3");
  song.play();
  beat = new BeatDetect(song.bufferSize(), song.sampleRate());
  beat.setSensitivity(150);
  bl = new BeatListener(beat, song);

}

void stop()
{
  song.close();
  minim.stop();
  super.stop();
}

void draw() 
{
  fill(255,30);
  rect(0,0,width,height);
  
  stroke(0);
  float rms = 0;
  
  float[] mix = song.mix.toArray();
  for ( int i = 0; i < mix.length ; i++ )  {
    //float x1 = map(i, 0, song.bufferSize(), 0, width);
    //float x2 = map(i+1, 0, song.bufferSize(), 0, width);
    //line(x1, height/2 - mix[i]*100, x2, height/2 - mix[i+1]*100); 
    rms = rms + sqrt(abs(mix[i]));    
  }
  rms = (1.0/mix.length) * rms;
  rms = rms * rms;
  rms = rms * 8;
  //println(""+rms);
  
  int sl = 0;
  color c = color(0,0,0) ;
  
  if (beat.isKick()) {
    sl = 15;
    c = color(153,50,204);
  }
  
  if (beat.isSnare()) {
    sl = 7;
    c = color(253,107,0);    
  }
  
  if (beat.isHat()) {
    sl = 10;
    c = color(255,020,147);
  }
  
  //println(""+sqrs.size());
  
  if (sl != 0 && sqrs.size() < 100) {
    if (!LPOn && !HPOn) {
      float y1 = random(baseY*(1.0/8),baseY*(3.0/8));
      float y2 = random(baseY*(5.0/8),baseY*(7.0/8));
      
      float y3 = (random(2) > 1) ? y1 : y2 ;
      
      Sqr s = new Sqr(sl,c,-sl,y3);
      sqrs.add(s);
    } 
    else if (!LPOn && HPOn) {
      Sqr s = new Sqr(sl,c,random(0,width),baseY+sl);
      sqrs.add(s);
    }
    else if (LPOn && !HPOn) {
      Sqr s = new Sqr(sl,c,random(0,width),-sl);
      sqrs.add(s);
    }
    else if (LPOn && HPOn) {
      float y4 = random(baseY*(3.0/8),baseY*(5.0/8));
      Sqr s = new Sqr(sl,c,-sl,y4);
      sqrs.add(s);
    } 
  }
  
  
  for(int i=0; i<sqrs.size(); i++){
    if ((!LPOn && !HPOn) || (LPOn && HPOn)) {
      sqrs.get(i).vx = rms;
      sqrs.get(i).vy = 0;
    } 
    else if (!LPOn && HPOn) {
      sqrs.get(i).vx = 0;
      sqrs.get(i).vy = -rms;
    }
    else if (LPOn && !HPOn) {
      sqrs.get(i).vx = 0;
      sqrs.get(i).vy = rms;
    }
    sqrs.get(i).moveSqr();
    sqrs.get(i).draw();
    if(sqrs.get(i).y > baseY + sqrs.get(i).l || 
      sqrs.get(i).x > width + sqrs.get(i).l ||
      sqrs.get(i).y < -1 * sqrs.get(i).l ) {
      sqrs.remove(i);
      i = i-1;      
    }
  }
  
  drawFilterPanel();
}

void update() 
{
  
  
}

boolean overRect(int x, int y, int width, int height) 
{
  if (mouseX >= x && mouseX <= x+width && 
      mouseY >= y && mouseY <= y+height) {
    return true;
  } else {
    return false;
  }
}

void setupFilterPanel() {
  baseX = 10;
  baseY = height-70;
  panWidth = width - 20;
  
  int butBaseY = baseY + 5;
  int butBaseX = baseX + 5;
  int bSize = 16;
  subHiPass = new MinusButton(butBaseX,butBaseY,bSize);
  butBaseX+=bSize+5;
  addHiPass = new PlusButton(butBaseX,butBaseY,bSize);
  butBaseX+=bSize+5;
  HiPassOn = new ColorButton(butBaseX,butBaseY,bSize,color(255,0,0));
  butBaseX = panWidth/2 + baseX;
  subLoPass = new MinusButton(butBaseX,butBaseY,bSize);
  butBaseX+=bSize+5;
  addLoPass = new PlusButton(butBaseX,butBaseY,bSize);
  butBaseX+=bSize+5;
  LoPassOn = new ColorButton(butBaseX,butBaseY,bSize,color(255,0,0));
  
  Button[] _buttons = {subLoPass,addLoPass,subHiPass,addHiPass,LoPassOn,HiPassOn};
  buttons = _buttons;
  
}

void drawFilterPanel() {
  stroke(0);
  fill(255);
  rect(baseX,baseY,panWidth,60); 
  for (int i = 0; i < buttons.length ; i++) {
    buttons[i].draw();
  }
  textSize(16);
  fill(0);
  text("HiPass : " + HPF,baseX+5,baseY+50);
  text("LoPass : " + LPF,baseX+panWidth/2,baseY+50);
  
  
}


void mousePressed()
{
  if (subLoPass.mouseOver()) {
    if (LPF <= 50) {
      LPF = 50;
    }if (LPF > 50 && LPF <= 500) {
      LPF-=50;
    } else if (LPF <= 4000) {
      LPF-= 500;
    } else if (LPF <= 22000) {
      LPF-= 1000;
    }
  }
  if (addLoPass.mouseOver()) {
    if (LPF >= 50 && LPF < 500) {
      LPF+=50;
    } else if (LPF < 4000) {
      LPF+= 500;
    } else if (LPF < 22000) {
      LPF+= 1000;
    }
  }
  if (LoPassOn.mouseOver()) {
    LPOn = !LPOn;
  }
  if (subHiPass.mouseOver()) {
    if (HPF <= 50) {
      HPF = 50;
    } else if (HPF > 50 && HPF <= 500) {
      HPF-=50;
    } else if (HPF <= 4000) {
      HPF-= 500;
    } else if (HPF <= 22000) {
      HPF-= 1000;
    }
  }
  if (addHiPass.mouseOver()) {
    if (HPF >= 50 && HPF < 500) {
      HPF+=50;
    } else if (HPF < 4000) {
      HPF+= 500;
    } else if (HPF < 22000) {
      HPF+= 1000;
    }
  }
  if (HiPassOn.mouseOver()) {
    HPOn = !HPOn;
  }
  
  if (LPOn && HPOn) {
    if (LPF <= HPF) {
      LPOn = false;
      LPOn = false;
    }
  }
  
  song.noEffects();
  if (HPOn && LPOn) {
    song.addEffect(new BandPass((HPF+LPF)/2,LPF-HPF,song.sampleRate()));
    ((ColorButton)LoPassOn).c = color(0,255,0);
    ((ColorButton)HiPassOn).c = color (0,255,0);
  } else if (HPOn) {
    song.addEffect(new HighPassSP(HPF,song.sampleRate()));
    ((ColorButton)LoPassOn).c = color (255,0,0);
    ((ColorButton)HiPassOn).c = color (0,255,0);
  } else if (LPOn) {
    song.addEffect(new LowPassSP(LPF,song.sampleRate()));
    ((ColorButton)LoPassOn).c = color (0,255,0);
    ((ColorButton)HiPassOn).c = color (255,0,0);    
  } else {
    ((ColorButton)LoPassOn).c = color (255,0,0);
    ((ColorButton)HiPassOn).c = color (255,0,0);    
  }
 
  
}

