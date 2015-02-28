
//fill from sum-height with parts
//part color dependant on dist to sum

boolean boob()
{
  int x=int(random(666));
  if( x>333 ){ return true; } else { return false; }  
}

//waves[] period, phase, amplitude

int wc=23;
float amp[]=new float[wc];
float period[]=new float[wc];
float phase[]=new float[wc];
float speed[]=new float[wc];
boolean sincos[]=new boolean[wc];
float yscaler=0.5;
float tscaler=0.06;
float hscaler=.9;
float wscaler=1; //direct; bigger=wider waves

float nextyscaler=.5;
float nexttscaler=0.01;
float nexthscaler=0.3;
float nextwscaler=0.1;

int stepping=0;
int step=0;
int steplength=33;

//step counter and save frame divisor
int f=0;
int fl=3333;

//dude
int dude=1;
int dudex;
float dudey;
int dudespeed=10;
int dudesize=23;
int dgrowthrate=3;
int dsg=1; //must be at max dgr/2
int ddepth=0;
//goal
int goals=1;
int goal[][]=new int[3000][2];
int goalsize=33;
int goalage[]=new int[3000];

boolean blackback=false;
int fading=0;
int filling=1;
int drawl=0;

//lerp
int Y_AXIS = 1;
int X_AXIS = 2;
color sky=color(235,123,58);
color deep=color(11,33,66);

//drag system - nAH
int parts[][]=new int[60000][2];
float backpull=0.1;
//have parts drop if none under?

import ddf.minim.*;
Minim minim;
AudioPlayer player;

///////////////////////////////////////////////////////////

void setGradient(int x, int y, float w, float h, color c1, color c2, int axis ) {

  noFill();

  if (axis == Y_AXIS) {  // Top to bottom gradient
    for (int i = y; i <= y+h; i++) {
      float inter = map(i, y, y+h, 0, 1);
      color c = lerpColor(c1, c2, inter);
      stroke(c);
      line(x, i, x+w, i);
    }
  }  
  else if (axis == X_AXIS) {  // Left to right gradient
    for (int i = x; i <= x+w; i++) {
      float inter = map(i, x, x+w, 0, 1);
      color c = lerpColor(c1, c2, inter);
      stroke(c);
      line(i, y, i, y+h);
    }
  }
}

void rando(){
  for( int j=0; j<wc; j++ )
  { 
    amp[j]=random(hscaler*j); 
    period[j]=int(random(width)*wscaler); 
    phase[j]=int(random(width*2)); 
    speed[j]=int(random(width)*tscaler);
    sincos[j]=boob(); 
  } 
}

int returny( int x )
{
  int sum=0;
    for( int i=0; i<wc; i++ )
    {  
      if( sincos[i] ){
        sum+=int(sin((x+phase[i])/period[i])*amp[i]); }
      else{
        sum+=int(cos((x+phase[i])/period[i])*amp[i]); }
    }
    return sum;
}

void setup() {
  size(999,666);
  frameRate(120);
  colorMode(RGB, 255, 255, 255, 100);
  rando();
  dudex=width/2;
  goalage[0]=0;
  goal[0][0]=width/2;
  goal[0][1]=0;
  
  minim = new Minim(this);
  player = minim.loadFile("THEME.mp2");
  player.play();
}

void draw() {
  //background
  
  //y t h w
  if(stepping==1)
  {
  if(step==steplength){
    yscaler=nextyscaler;
    tscaler=nexttscaler;
    wscaler=nextwscaler;
    hscaler=nexthscaler;
    nextyscaler=random(0,3);
    nexthscaler=random(0,10);
    nexttscaler=random(10,30);
    nextwscaler=random(0,3);
    step=0;
  }
  else
  {
    yscaler=yscaler+(((nextyscaler-yscaler)/steplength)*step);
    tscaler=tscaler+(((nexttscaler-tscaler)/steplength)*step);
    hscaler=hscaler+(((nexthscaler-hscaler)/steplength)*step);
    wscaler=wscaler+(((nextwscaler-wscaler)/steplength)*step);
    step+=1;
  }
  }
  
  
  for( int j=0; j<wc; j++ ){ 
    phase[j]+=speed[j];
    if( phase[j] > 2 ){
      phase[j]-=2; }
    if( phase[j] < 0 ){
      phase[j]+=width; } 
  }
  
  if( blackback ){
  if( fading==1){
    fill(0, 3);
    rect(0,0,width,height); 
  }
  else {
    background(0); }
  }
  else{
    color skyy = color(235-(ddepth*3),123-((dudey-height/2)/2),58-ddepth);
    setGradient(0,0,width,height,skyy,deep,Y_AXIS);
  }
  
  if( filling==0 ){
    stroke(128);
    fill(255,0);
  }
  else {
    noStroke();
    fill(0,64,196,33);
  }
  beginShape();
  int y=0;
  for (int x = 0; x < width; x++) {
    y=(returny(x)+returny(constrain(x+1, 0, width))+returny(constrain(x-2, 0, width)))/3;
    vertex(x,y/yscaler+(height/2));
  }
  if( filling==1 ){
    vertex(width,height);
    vertex(0, height);
  }
  endShape();
  
  //move dude etc
  if( dude==1 ){
    float rx=(returny(dudex)/yscaler+(height/2))-(dudesize/2);
    
    if( keyPressed && keyCode==LEFT ){
      dudex=constrain(dudex-dudespeed, 0, width); }
    if( keyPressed && keyCode==RIGHT ){
      dudex=constrain(dudex+dudespeed, 0, width); }
    if( keyPressed && keyCode==DOWN ){
      ddepth+=5;
      dudey+=5; }
    if( keyPressed && keyCode==UP && ddepth>0){
      ddepth=0;
      dudey=rx; }
    if( (keyPressed && ( key==RETURN || key==ENTER )) || dudesize-(ddepth/10)<0 ){
      dudex=500;
      dudey=height/2;
      dudespeed=10;
      dudesize=23;
      ddepth=0;
      goals=1;
      goalage[0]=255;
      rando();
    }
      
    if( ddepth> 0 ){
      ddepth-=1;
      dudey-=1; 
      if( dudey<=rx ){
        ddepth=0;
        dudey=rx; 
      }
    }
    if( ddepth==0 ){
      dudey=rx; }
    
    ellipseMode(CENTER);
    fill(255,255);
    ellipse(dudex, dudey, dudesize-(ddepth/10),dudesize-(ddepth/10));
  }
  
  if( goals>0 )
  {
    for( int i=0; i<goals; i++ )
    {
      boolean d=(dist(goal[i][0],goal[i][1],dudex,dudey))<=(goalsize/2)+(dudesize/2);
      if( goalage[i]>=255 || d ){
        goal[i][0]=int(random(0,width));
        goal[i][1]=int(random(0,height/2));
        goalage[i]=0;
        if( d ){ 
          dudesize+=dgrowthrate; 
          dudespeed+=dsg;
        }
        else
        {
          dudesize-=dgrowthrate; 
          dudespeed-=dsg; 
        }
      }
      else{ 
        goalage[i]+=2;
        if(goal[i][1]<(returny(goal[i][0])/yscaler+(height/2))-(goalsize/2) ) {
          goal[i][1]+=4; }
        else{
          goal[i][1]+=2; }
      }
      fill(255-goalage[i],0,0,255);
      noStroke();  
      ellipse(goal[i][0],goal[i][1],goalsize,goalsize);
      if( dudesize>goalsize*goals && goals<2999 ){
        goals+=1;
        goalage[i+1]=255;
      }
    }
  }
  
  if(dudesize>=width){
      fill(255,255);
      text("YOU WIN! \n press Return to play again \n ESC to exit", width/2, height/2-height/4); }
  if( drawl<235 ){
    drawl++;
    fill(255,255);
    text("You are the Rising Sun! \n catch every drop! \n Arrow Key - controls \n Return - restart \n Esc - exit", width/2, height/2-height/4); 
  }
  
  f+=1;
  if( f%fl==0 || ( keyPressed && key=='b' ))
  { saveFrame("fl######.png"); }
  
  if(  keyPressed && key==',' ){
    rando();
  }
}
