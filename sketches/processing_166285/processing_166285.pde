
int worldClock;
int angerHeadRising;
int headSpread;
int framecount;
PImage angerimpact;
PImage beardprof;
PImage dictprof;
PImage skyline;
PImage[] butTheFuture;
PImage[] refusedToChange;
color b1, b2, c1, c2;

void setup()
{
  size(720,500);
  worldclock=0;
  angerimpact=loadImage("angerimpact.png");
  beardprof=loadImage("beardprof.png");
  dictprof=loadImage("dictprof.png");
  beardman=loadImage("beardman.png");
  skyline=loadImage("ChicagoSkyline.jpg");
  butTheFuture=new PImage[30];
  refusedToChange=new PImage[48];
  for(int i=10; i<40; i++)
  {
    butTheFuture[i-10]=loadImage("gframe_0"+i+".gif");
  }
  for(int i=0; i<48; i++)
  {
    refusedToChange[i]=loadImage("frame_0"+i+".gif");
  }
  angerHeadRising=200;
  headSpread=0;
  framecount=0;
  b1 = color(#FF6600);
  b2 = color(#FF0000);
  c1 = color(0);
  c2 = color(#FF6600);
}



void draw() {
  
  if(worldclock<=300)
  {
    background(#FFFFFF);
    fill(0);
    textSize(36);
    text("Beardman", 20, 80);
    textSize(48);
    text("A GOOD POST", 270, 140);
    image(beardprof,30,100);
    rect(215,0,10,250);
    rect(0,245,720,10);
    if(worldclock>150)
    {
      textSize(36);
      text("LiterallyHitler", 0, 330);
      textSize(48);
      text("NOT ALL MEN", 270, 390);
      image(dictprof,30,350);
      rect(215,0,10,500);
    }
  }
  if(worldclock>300&&worldclock<420)
  {
    background(#FFFFFF);
    if(worldclock>360)
    {
      setGradient(0, 0, 360, 500, b1, b2, 2);
      setGradient(360, 0, 360, 500, b2, b1, 2);
    }
    stroke(0);
    fill(#A28533);
    image(beardman,200,200);
    rect(200,380,300,500);
    fill(200);
    rect(400,360,80,20);
    rect(400,280,80,60);
    rect(430,340,20,20);
    quad(355, 380, 395, 380, 385, 370, 365, 375);
    if(worldclock>360)
    {
      
      pushMatrix();
      scale(-1.0, 1.0);
      image(angerimpact,-angerimpact.width-300,angerHeadRising+random(10));
      popMatrix();
      if(worldclock>390)
        angerHeadRising-=(worldClock*-390)^20;
    }
    
  }
  if(worldclock==420)
    angerHeadRising=200;
  if(worldclock>420&&worldclock<530)
  {
    setGradient(0, 0, 720, 500, c1, c2, 1);
    if(worldclock<=460)
    {
     
      pushMatrix();
      scale(-1.0, 1.0);
      image(angerimpact,-angerimpact.width-300,angerHeadRising+300+random(10));
      popMatrix();
      if(worldclock>420&&worldclock<445)
        angerHeadRising-=(worldClock*-420)^20;
      if((angerHeadRising+300)>0)
      {
        fill(0);
        text(worldclock,600,600);
      }
    }
    if(worldclock>460&&worldclock<=500)
    {
      pushMatrix();
      scale(-1.0, 1.0);
      image(angerimpact,-angerimpact.width-300+headSpread,angerHeadRising+300+random(10));
      image(angerimpact,-angerimpact.width-300,angerHeadRising+300+random(10));
      image(angerimpact,-angerimpact.width-300-headSpread,angerHeadRising+300+random(10));
      popMatrix();
      headSpread+=5;
    }
    if(worldclock>500)
    {
      pushMatrix();
      scale(-1.0, 1.0);
      image(angerimpact,-angerimpact.width-300+headSpread,angerHeadRising+300);
      image(angerimpact,-angerimpact.width-300,angerHeadRising+300);
      image(angerimpact,-angerimpact.width-300-headSpread,angerHeadRising+300);
      popMatrix();
      angerHeadRising+=(worldClock*-420)^20;
    }
  }
  if(worldclock==530)
    angerHeadRising=0;
  if(worldclock>530&&worldclock<680)
  {
    image(skyline,0,0);
    pushMatrix();
    scale(-1.0, 1.0);
    scale(0.2, 0.2);
    for(int i=0; i<10; i++)
    {
      image(angerimpact,-angerimpact.width-(i*350),angerHeadRising+random(5));
    }
    /*image(angerimpact,-angerimpact.width-300+headSpread,300);
    image(angerimpact,-angerimpact.width-300,300);
    image(angerimpact,-angerimpact.width-300-headSpread,300);*/
    popMatrix();
    angerHeadRising+=(worldClock*-420)^15;
  }
  if(worldclock>=680&&worldclock<854)
  {
    noStroke();
    background(0);
    pushMatrix();
    scale(2.0, 2.0);
    image(butTheFuture[framecount],0,28);
    popMatrix();
    if(worldclock-680-(6*framecount)==6&&framecount<29)
      framecount++;
    fill(0);
    rect(0,400,120,100);
  }
  if(worldclock==854)
    framecount=0;
  if(worldclock>854)
  {
    background(0);
    pushMatrix();
    scale(2.0, 2.0);
    image(refusedToChange[framecount],0,28);
    popMatrix();
    if(worldclock-854-(6*framecount)==6&&framecount<47)
      framecount++;
    fill(0);
    rect(0,400,120,100);
  }
  worldclock++;
  
}

void setGradient(int x, int y, float w, float h, color c1, color c2, int axis ) {

  noFill();

  if (axis == 1) {  // Top to bottom gradient
    for (int i = y; i <= y+h; i++) {
      float inter = map(i, y, y+h, 0, 1);
      color c = lerpColor(c1, c2, inter);
      stroke(c);
      line(x, i, x+w, i);
    }
  }  
  else if (axis == 2) {  // Left to right gradient
    for (int i = x; i <= x+w; i++) {
      float inter = map(i, x, x+w, 0, 1);
      color c = lerpColor(c1, c2, inter);
      stroke(c);
      line(i, y, i, y+h);
    }
  }
}



