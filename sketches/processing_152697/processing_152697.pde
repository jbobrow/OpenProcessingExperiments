
float a=0;
float rad=0;
float maxspeed = 2;
float r = 254;
float g = 0;
float b = 0;
float rspeed = 0;

float gspeed = maxspeed;
float bspeed = 0;
int maxr = 255;
int maxg = 255;
int maxb = 255;
int maxs = 250;
void setup(){
size(600,600);
background(0);
stroke(500);
}
void draw(){
fill(r,g,b);
noStroke();

ellipse(width/2 + cos(a) * rad,height/2 +sin(a) * rad,5,5);
a= a+0.05;
rad= rad+0.1;
r = r + rspeed;
g = g + gspeed;
b = b + bspeed;
if ((g>=maxg)){
gspeed = 0;
rspeed = -maxspeed;
}
  
if (r<=0){
rspeed = 0;
bspeed = maxspeed;
}
  
if (b>=maxb){
bspeed = 0;
gspeed = -maxspeed;
}
  
if (g<=0){
gspeed = 0;
rspeed = maxspeed;
}
 
if (r>=maxr){
rspeed = 0;
bspeed = -maxspeed;
}
if (b<=-1){
bspeed = 0;
r=254;
g=0;
b=0;
gspeed=maxspeed;
}

}

