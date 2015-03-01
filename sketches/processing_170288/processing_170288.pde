
  PImage img;
  float theta =0;
  float r = 20;
  boolean turnon = false;
  float opacity=0;
void setup(){
  size(600,600,P3D);
  background(0);
  img = loadImage("http://img3.wikia.nocookie.net/__cb20121029093457/megarp/images/a/a6/Harry_Potter_Logo.png");
}

float znoise = 0;

void draw()
{
  float xnoise =0, ynoise=0,inc =0.01;
  
  for (int y=0; y<height; y++){
    for (int x=0; x<width; x++){
      
      float r = noise(xnoise, ynoise, znoise)*255;
 
      stroke(r);
      point(x,y);
      xnoise = xnoise +inc;
    }
    xnoise =0;
    ynoise=ynoise+inc;
  }
znoise +=0.1;
theta +=radians(noise(xnoise, ynoise, znoise)*360);

if(turnon){
  if(opacity<100) opacity++;
  tint(255,opacity);
image(img, width/2-img.width/2 + r*cos(theta),height/2-img.height/2 + r*sin(theta));
}
}

void mousePressed(){
 turnon =!turnon;
 if(!turnon) opacity = 0;
}
  
