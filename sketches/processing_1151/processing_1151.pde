
// a simple oscilloscope by Dr. Goulu (www.goulu.net)
// use left/right arrow keys to change timebase
// up/down arrow keys to change sine frequency
// space to reset to 1 Hz/1Hz
// "g" key toggles grid
// "x" key toggles X-Y mode to draw lissajous 
 
int sx=200; int sy=200; // half of scope size
int eraser=5; // remanence effect
float steps=10; // calculated steps at each fame
boolean xy; // xy mode

boolean grid=true;

float time,dt,freq; 
float inc=1.77827941003892280123; // 10^(1/4)
float x=sx; float y=sy; // last spot position

void setup(){ 
  size(sx*2,sy*2); 
  colorMode(RGB, 255); 
  background(0); 
  dt=1/frameRate;
  freq=1; // Hz
} 

void draw(){ 
  // erase with remanence effect
  stroke(0); fill(0,eraser); 
  rect(0,0,sx*2,sy*2); 

  // draw spot
  stroke(0,255,0,255); 
  strokeWeight(5); 
  for (int i=1;i<=steps;i++) {
    float px=x; float py=y;
    time=time+dt/steps;
    float nx=time%2-1; //[-1,1]
    if (xy) {nx=sin(PI*nx);} // xy mode
    float ny=sin(freq*PI*time); // sin function on Y
    x=sx+sx*nx;
    y=sy+sy*ny;
   
    if (abs(x-px)<sx) {line(px,py,x,y);}
  } // for
  
  if (grid) {
    stroke(128,255); 
    strokeWeight(1); 
    for (int i=-sx;i<=2*sx;i+=(sx/5)) {line(i,0,i,2*sy);}
    for (int i=-sy;i<=2*sy;i+=(sy/5)) {line(0,i,2*sx,i);}
  }
} // draw

void keyPressed() {
  if (key==' ') {setup();} //reset
  if (key == 'x' || key == 'X') {xy=!xy;} // toggle xy mode
  if (key == 'g' || key == 'G') {grid=!grid;} // show/hide grid
  if(keyCode == UP) { dt*=inc; freq*=inc; steps*=inc*inc;}
  if(keyCode == DOWN) {dt/=inc; freq/=inc; steps/=inc*inc;}
  if(keyCode == LEFT) { freq/=inc; steps/=inc;}
  if(keyCode == RIGHT) { freq*=inc; steps*=inc;} 
  steps=min(1000,max(1,steps));
  println("dt="+dt+" freq="+freq+" steps"+steps);
}


