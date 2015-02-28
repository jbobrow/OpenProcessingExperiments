

//change size of the great circle (place and speed) 
//\\s=?? and s=s+? 
//change speed of color changing || maxspeed = ?
//speed of printing(omega) || w = ??
//size of the circles || ellipse(x,y,??,??)
//(others)circle,colour,the great shape(to a star*)
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
  background(50);
}
void draw(){
 // background(100);
 s-=0.2;
  a+=as;
  o=o+w;
  x=sin(o)*s+dx;
  y=cos(o)*s+dy;
  dx=cos(a)*100+250;
  dy=sin(a)*100+250;
  fill(r,g,b);
  noStroke();
  
  ellipse(x,y,25,25);
  
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
  if (mousePressed){
    r=random(0,255);
    g=random(0,255);
    b=random(0,255);
    background(r,g,b);
    as= random(0,3);
    w = random(0,3);
    maxs = random(100,200);
  }
}
/*any ideas for easier change of colors please comment
btw,you can change anything to create more
by what i said in the beginning*/
