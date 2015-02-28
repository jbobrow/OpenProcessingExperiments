

PFont myFont;
int W,H;

int units=1000;
int unitsize=50;
int lopx=0;
int hipx=units*unitsize;
int lpos=lopx;


int tick1=unitsize;
int tick2=tick1/2;
int tick3=tick2/12;

kscroll scroller=new kscroll();


void setup() {
  size(600,300);
  W=width;
  H=height;
  smooth();
  frameRate(30);
  colorMode(RGB,255,255,255,100);
  //noLoop();
  stroke(100);
  
  }//setup()

  void draw() {
    background(0);
    draw_scale();

    lpos=constrain(lpos-int(scroller.slowdown()),lopx,hipx-W);
  }

void draw_scale()
{
  stroke(255);
  fill(100);
  line(0,H/2,W,H/2);
  
  for(int i=lpos; i<lpos+W; i++)
  {
    float x=i-lpos;
    if(i % tick1==0) {
      stroke(200);
      line(x,H/2+15,x,H/2-15); 
      text(i/tick1+1, x, H/2-20);
    } else if(i % tick2==0) {
      stroke(200);
      line(x,H/2+10,x,H/2-10); 
    }
  }
  
  stroke(0);
  fill(#FF0000);
  rect(20,250,30,abs(scroller.decay*scroller.speed)*-3);
  
  //abs();
  text(abs(scroller.decay*scroller.speed), 10, 10);
}//draw_scale


void mouseDragged() 
{
  scroller.begin(mouseX);
  lpos=constrain(lpos-int(scroller.speed),lopx,hipx-W);
}//mouseDragged

void mousePressed() 
{
  scroller.grab(mouseX);
}//mousePressed

void mouseReleased() 
{
  scroller.startslowdown();
}//mouseReleased


float sigmoid(float v, float vmax)
{
  float vmid=vmax/2;
  float i=vmax/3;
  int j=80;
  float r=100/( pow(j,((vmid+i/2-v)/i))) ;
  return r;
}//sigmoid

float inverse(float v,float vmax)
{
   float i=v/vmax;
   float r=1+pow((1-i),3)*-1; 
   return r;
}//inverse

class kscroll
{
  float speed=0;
  float start;
  float decay;
  float decay_start;
  int decay_maxmillis=5000;

  // decrease scrolling speed once mouse is released
  float slowdown()
  {
    float d=0;
    // if there is still some scrolling energy
    if(this.decay>0)
    {
      //i tried a few slowing formulas
      this.decay=1-inverse(millis()-this.decay_start,this.decay_maxmillis);
      //this.decay=1-sigmoid(millis()-this.decay_start,this.decay_maxmillis);
      //this.decay=this.decay*.9;
      d=this.speed*this.decay;
    }
    return d;
  } //slowdown

  void begin(int x)
  {
    // the initial scrolling speed is the speed it was being dragged
    this.speed = x-this.start;
    this.start = x;
  } //begin

  void grab(int x)
  {
    // while grabbing is occuring, the scrolling link to mouse movement
    this.start = x;
    this.speed = 0;
  } //grab

  void startslowdown()
  {
    // the mouse has been released and we can start slowing the scroll
    // the speed starts at 100% of the current scroll speed
    // record the time so we can calualte the decay rate
    this.decay=1;
    this.decay_start=millis();
  } //startslodown
}//kdrag

