
// Turing machine busy beaver applet
// Copyright 2011 Strawdog
//
float arrowSize=5.0;
class Arrow {
  Arrow(float xstart, float ystart, float xend, float yend)
  {
    _xstart=xstart;
    _ystart=ystart;
    _xend=xend;
    _yend=yend;
    _dx=xend-xstart;
    _dy=yend-ystart;
    _xslope=_dx/sqrt(_dx*_dx+_dy*_dy);
    _yslope=_dy/sqrt(_dx*_dx+_dy*_dy);
  }
  
  void Draw() {
    fill(0);
    stroke(0);
    line(_xstart,_ystart,_xend,_yend);
    float xc=_xstart+_dx/1.95;
    float yc=_ystart+_dy/1.95;
    beginShape();
    vertex(xc +arrowSize*_xslope, yc + arrowSize*_yslope);
    vertex(xc +arrowSize*_yslope/2, yc - arrowSize*_xslope/2);
    vertex(xc -arrowSize*_yslope/2, yc + arrowSize*_xslope/2);
    endShape(CLOSE);
  }
  float _xstart, _ystart, _yend,_xend,_dx,_dy,_xslope, _yslope;
}

class TuringTape {
  TuringTape(int iTapesize,float xpos,float ypos) {
    data=new int[iTapesize];
    tapesize=iTapesize;
    Clear();
    position=tapesize/2;
    _xpos=xpos;
    _ypos=ypos;
  }
  int Value() {return data[position]; }
  void Mark(int value) {
    data[position]=(value>0)?1:0;
  }
  void Clear() {
    for(int i=0;i<tapesize;++i) {
      data[i]=0;
    }
  }
  void Right() {
    position--;
    if (position<0) position=tapesize-1;
  }
  void Left() {
    position++;
    if (position==tapesize) position=0;
  }
  void Draw() {
    for(int i=0;i<tapesize;++i) {
      float xpos=_xpos+(i-position)*blocksize;
      float ypos=_ypos;
      stroke(0);
      if(i==position) fill(255,128,128);
      else fill(255);
      rect(xpos-blocksize/2, ypos-blocksize/2,blocksize,blocksize);
      fill(0);
     textAlign(CENTER,CENTER);
     if(data[i]==0) text("0",xpos,ypos);
      if(data[i]==1) text("1",xpos,ypos);
    }
  }
  float _xpos;
  float _ypos;
  int position;
  int tapesize;
  int data[];
  float blocksize=2*max(textAscent(),textDescent());
};

class TextCircle {
  float x;
  float y;
  String t;
  boolean on;
  TextCircle(float x_in, float y_in, String t_in) {
    x=x_in;
    y=y_in;
    t=t_in;
    on=false;
  }
  void On() {on=true;}
  void Off() {on=false;}
  void draw() {
    float factor=1.3;
    float tw=textWidth(t);
    float th=2*max(textAscent(),textDescent());
    if(tw<th) { tw=th; }
    stroke(0);
    if(on) {
      fill(255,128,128);
    } else {
      fill(200);
    }
    ellipseMode(CENTER);
    ellipse(x,y,tw*factor,th*factor);
    textAlign(CENTER,CENTER);
    fill(0);
    text(t,x,y);
  }
};

TuringTape T;
TextCircle A;
TextCircle B;
TextCircle C;
TextCircle H;
Arrow AB;
Arrow AC;
Arrow BA;
Arrow CB;
Arrow CH;

int counter=0;
int step=1;
char state='A';


void setup() {
  size(750,250);
  smooth();
   PFont font;
   font = loadFont("AndaleMono-10.vlw");
   textFont(font, 10);
   fill(250);
   stroke(0);



   A=new TextCircle(width/3,100,"A");
   B=new TextCircle(width/2,50,"B");
   C=new TextCircle(2*width/3,100,"C");
   H=new TextCircle(2*width/3,150,"HALT");
   
   AB=new Arrow(A.x,A.y+3,B.x,B.y+3);
   AC=new Arrow(A.x,A.y,C.x,C.y);
   BA=new Arrow(B.x,B.y-3,A.x,A.y-3);
   CB=new Arrow(C.x,C.y,B.x,B.y);
   CH=new Arrow(C.x,C.y,H.x,H.y);
   reset();
}


void reset() {
  state='A';
  A.On();
  B.Off();
  C.Off();
  H.Off();
  T=new TuringTape(30,width/2,200);
}

void step() {
    if(state != 'H') {

    if(T.Value()>0) {
      switch (state) {
        case 'A':
          T.Mark(1);
          T.Left();
          A.Off();
          C.On();
          state='C';
          break;
        case 'B':
          T.Mark(1);
          T.Right();
          // stay in B
          break;
        case 'C':
          T.Mark(1);
          C.Off();
          H.On();
          state='H';
          break;
      }
    } else {
      switch(state) {
        case 'A':
          T.Mark(1);
          T.Right();
          A.Off();
          B.On();
          state='B';
          break;
        case 'B':
          T.Mark(1);
          T.Left();
          B.Off();
          A.On();
          state='A';
          break;
        case 'C':
          T.Mark(1);
          T.Left();
          C.Off();
          B.On();
          state='B';
          break;
      }
    }
  }
}


void keyPressed() {
  if(key==' ') {
    step();
  }
  if(key=='r') {
    reset();
  }
}


void draw() {
  background(250);
  
  AB.Draw();
  AC.Draw();
  BA.Draw();
  CB.Draw();
  CH.Draw();
  
  A.draw();
  B.draw();
  C.draw();
  H.draw();
  T.Draw();
  

  
}

