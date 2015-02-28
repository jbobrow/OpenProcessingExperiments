

float z=5,i,w,h;
float n()
{return noise(++z);}
PImage bkg;

void setup()
{
  size(500,400);
  smooth();
  bkg = loadImage("night_obs.gif");
}

void draw(){
  
background(bkg);
w=width;h=height;
smooth();
for(i=0;i<60;i++){noFill();
stroke(190,n()*190);
bezier(w*.1,h*.1,n()*w,n()*h,n()*w*2,n()*h*2,w*2,h*2);}
filter(17);

}

