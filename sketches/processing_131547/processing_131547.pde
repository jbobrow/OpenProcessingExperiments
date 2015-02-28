
float li = 100;
float lj = 500-20;
float lk = 500-20;
float ll = 100;
float lx = 100;
float ly = 100;

float a;
float o = 0;
float as= random(0,3);
float w = random(0,3);

float x;
float y;
float dx;
float dy;
float maxspeed = random(1,5);

float r = 254;
float g = 0;
float b = 0;

float rspeed = 0;
//from red to yellow:
float gspeed = maxspeed;
float bspeed = 0;
int maxr = 255;
int maxg = 255;
int maxb = 255;
float maxs = random(100,200);
float s = maxs;

void setup(){
  size(500,500);
 // colorMode(HSB);
}
void draw(){
  if ((li<mouseX) && (mouseX<li+300) && (lj-20<mouseY) && (mouseY<lj+20) && (mousePressed)){
    lx = mouseX-li;
     
  }
  if ((lk-20<mouseX) && (mouseX<lk+20) && (ll<mouseY) && (mouseY<ll+300) && (mousePressed)){
    ly = mouseY-ll;
  }
//  background(lx,240,ly);
  // scrolling bar X
  stroke(0);
  fill(250,150,50);
  rect(li,lj-20,300,40);
  line(li,lj,li+300,lj);
  ellipse(lx+li,lj,15,25);
  //scrolling bar Y
  rect(lk-20,ll,40,300);
  line(lk,ll,lk,ll+300);
  ellipse(lk,ly+ll,25,15);
  
  s-=0.2;
  a+=as;
  o=o+w;
  x=sin(o)*s+dx;
  y=cos(o)*s+dy;
  dx=cos(a)*100+250;
  dy=sin(a)*100+250;
  fill(r,g,b);
  //the object(circle)
  noStroke(); 
  ellipse(x,y,25,25);
  //the numbers on the side
  stroke(0);
  fill(255);
  rect(3,8,40,15);
  fill(0);
  text(as,10,20);
  
  fill(255);
  rect(453,8,40,15);
  fill(0);
  text(w,460,20);
  
  fill(255);
  rect(3,478,40,15);
  fill(0);
  text(maxspeed,10,490);
  
  fill(255);
  rect(433,478,60,15);
  fill(0);
  text(maxs,440,490);
   
   r = r + rspeed;
  g = g + gspeed;
  b = b + bspeed;
 // yellow
  if ((g>=maxg)){
    gspeed = 0;
    rspeed = -maxspeed;
  }
  //green
  if (r<=0){
    rspeed = 0;
    bspeed = maxspeed;
  }
  //sky
  if (b>=maxb){
    bspeed = 0;
    gspeed = -maxspeed;
  }
  //dark blua
  if (g<=0){
    gspeed = 0;
    rspeed = maxspeed;
  }
 // pink
  if (r>=maxr){
    rspeed = 0;
    bspeed = -maxspeed;
  }//red
  if (b<=-1){
    bspeed = 0;
    r=254;
    g=0;
    b=0;
    gspeed=maxspeed;
  }
  if (s<=-150){
    s=s*-1;
  }
  if ((mousePressed) && (mouseX<=20)){
    r=random(0,255);
    g=random(0,255);
    b=random(0,255);
    background(r,g,b);
    as= random(0,3);
    w = random(0,3);
    maxs = random(100,200);
  }
  w=lx/500;
  as=ly/500;
  
  
}
