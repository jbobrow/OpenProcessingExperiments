
/**
   Bitnosis
   A bit kludgy recursive bitmap filter. Quite sluggish, but it's full antialiased...
   Ale González · 60rpm.tv/i · Pubic Domain
   Original image from the comic-book The Killing Joke, by my beloved Alan Moore+Brian Bolland...
**/


PGraphics     
m;        //Mask 
PImage       
i;        //Base picture
int 
s=600;
float       
x,        //Center-x of the slices
y;        //Center-y of the slices
float[]   
xLUT,     //Mouse-x lookup table 
yLUT;     //Mouse-y lookup table

/////////////////////////////////////////////////////////////////////////////////////////////////

void setup(){
  //General settings
  size(s,s,JAVA2D);
  smooth();
  background(-1);
  imageMode(CENTER);
  
  //Assigning values
  x = s/2; 
  y = s/2;
  xLUT= new float[s];                    
  yLUT= new float[s];
  //Map mouse positions in order to adjust the interaction
  float k=TWO_PI/s;
  for (int i=0;i<s;i++) {xLUT[i]= i*k; yLUT[i]= map(i,0,height,50,100);}   
  
  //Object settings
  i=loadImage ("j.png");
  m=createGraphics (width,height,JAVA2D);
  m.beginDraw();
  m.smooth();
  m.endDraw();
}

/////////////////////////////////////////////////////////////////////////////////////////////////

void draw(){ 
  background(i);
  translate(x,y);
  recursiveMask(s+yLUT[mouseY],yLUT[mouseY]);
}

/////////////////////////////////////////////////////////////////////////////////////////////////

//Recursive mask
//d: initial size of the recursion
//sizeFactor: factor to scale size through recursion

void recursiveMask (float d,float sF){
   if ((d-=sF)>sF) {
     m.beginDraw();
     m.background(0);
     m.ellipse(x,y,d,d);  
     m.endDraw();
     i.mask(m);   
     rotate(xLUT[mouseX]);
     image(i,0,0);
     recursiveMask(d,sF);
  }
}

