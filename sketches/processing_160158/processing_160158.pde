
ArrayList<Proton> protons;
int npX = 10;
int npY = 10;
int spacing = 20;
int dx = 275;
int dy = 275;
float pLen = 9;
boolean magnetOn = false;
boolean RFOn = false;
float returnRate = .1;

void setup(){
  size(750,750);
  protons = scramble();
}

ArrayList<Proton> scramble(){
  ArrayList<Proton> newProtons = new ArrayList<Proton>();
  boolean ptbd;
  for(int x=0;x<npX;x++){
    for(int y=0;y<npY;y++){
      if(x>1 && x<5 && y>4 && y<8){
        ptbd = true;
      }else{
        ptbd = false;
      }
      newProtons.add(new Proton(random(2*PI),dx+x*spacing,dy+y*spacing,pLen,ptbd));
    }
  }
  return newProtons;
}

void draw(){
  background(200);
  for(int i=0;i<protons.size();i++){
    protons.get(i).update();
    protons.get(i).drawMe();
  }
  drawMagnet();
  drawRF();
  drawScramble();
}

void drawMagnet(){
  noFill();
  if(magnetOn){
    fill(color(200,100,100));
  }
  stroke(0);
  strokeWeight(3);
  rect(590,325,100,100);
  fill(50);
  textSize(20);
  text("Magnet",600,375);
}

void drawRF(){
  noFill();
  if(RFOn){
    fill(color(200,200,100));
  }
  stroke(0);
  strokeWeight(3);
  rect(265,100,200,70);
  fill(50);
  textSize(20);
  text("RF Source",300,145);
}

void drawScramble(){
  noFill();
  stroke(0);
  strokeWeight(3);
  rect(300,690,100,30);
  fill(50);
  textSize(20);
  text("Scramble",305,710);
}

class Proton{
  float angle;
  float x;
  float y;
  float len;
  float modulator;
  Proton(float angle1,float x1,float y1, float len1, boolean ptbd){
    angle = angle1;
    x = x1;
    y=y1;
    len=len1;
    if(ptbd){
      modulator = .4+(random(1)/4);
    }else{
      modulator = 1.0;
    }
  }
  void drawMe(){
    strokeWeight(1);
    stroke(0);
    float dx = cos(angle)*len;
    float dy = sin(angle)*len;
    line(x-dx/2,y-dy/2,x+dx/2,y+dy/2);
  }
  void update(){
    if(magnetOn){
      if(angle<PI){
        angle = angle-returnRate*angle*modulator;
      }else{
        angle = angle+returnRate*(2*PI-angle)*modulator;
      }
    }
    if(RFOn){
      angle = PI/2;
    }
  }
}

void mousePressed(){
  if(mouseX>590 && mouseX<690 && mouseY>325 && mouseY<425){
   magnetOn = !magnetOn;
  }
  if(mouseX>265 && mouseX<465 && mouseY>100 && mouseY<170){
    RFOn = !RFOn;
  }
  if(mouseX>300 && mouseX<400 && mouseY>690 && mouseY<720){
    protons = scramble();
  }
} 


