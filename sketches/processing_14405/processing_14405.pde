


float ta=9;
int tspeed=8;
float ba=6;
int bspeed=4;


void setup(){
  size(400,400);
  background(22,180,52);
}

void draw(){
  smooth();
  
ba=ba+bspeed;
ta=ta+tspeed;

ellipse(ta,ba,ta,ba);
fill(127,0,99,10);
stroke(213, 169, 19);

  
  if(ba<0){


bspeed=7;}
if (ta<0){
    tspeed=4;
  }
    

if (ba>350){
bspeed=-2;}
if (ta>350){
   
    tspeed=-8;
 
    
  }
  }

