

//change size of the great circle (place and speed) 
//\\s=?? and s=s+? 
//change speed of color changing || maxspeed = ?
//speed of printing(omega) || w = ??
//size of the circles || ellipse(x,y,??,??)
//(others)circle,colour,the great shape(to a star*)
float o = 0;
float w = 5.1;
float x = 250;
float y = 250;

float maxspeed = 4;
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
int maxs = 250;
float s = maxs;
void setup(){
  size(500,500);
  background(50);
}
void draw(){
 // background(100);
 s = s - 0.2;
  o=o+w;
  x=sin(o)*s+250;
  y=cos(o)*s+250;
  fill(r,g,b);
  noStroke();
  point(x,y);
  ellipse(x,y,25,25);
  point(x,y);
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
  if (s<=-250){
    s=s*-1;
  }
}
/*any ideas for easier change of colors please comment
btw,you can change anything to create more
by what i said in the beginning*/



