
// Robert Cortlandt
//midterm
//I wanted the hawk to be able to catch the mouse and bring it to the nest. (connecting the three points ) 
//not quite there yet
//portions copied from ball bounce code
//portions copied from Nicky's hit the iscream code 
///incorporates image as data, mouse input, movement, translate, conditionals and variables.

PImage micky; 
PImage hawk1;
PImage nest2;
float x=0;float y=0;float direcX=0;float direcY=0;
int t=0;

void setup(){
  size(700,800);
  smooth();
  micky = loadImage("micky.gif");
  hawk1 = loadImage("hawk1.gif");
  nest2  = loadImage ("nest2.gif");
   
}
 
void draw(){
  imageMode(CENTER);
   delay(10);  
  background(255);
  image (micky,mouseX,795);
  image (nest2, 555,99);
  x+=direcX;y+=direcY;
  
 
  translate(x,y);
  image(hawk1,50,20);
    if(y>=height){
      pushMatrix();
      direcY= -5;
      popMatrix();
    }
    if(x>=width){
      direcX= -10;
    }
    if(y<=0){
      pushMatrix();
      direcY=10;
      popMatrix();
    }
    if(x<=0){
      pushMatrix();
      direcX=10;
      popMatrix();
    
   }
}
 
void mouseX(){
  if(y>height/2 && x>width/2 && dist(x,y,mouseX,mouseY)<=100){
    t++;
    direcX=15;
    direcY=15;

  }
  if(x>width/2 && y<height/2 && dist(x,y,mouseX,mouseY)<=100){
    t++;
    direcX=15;
    direcY= -15;
  
    if(t>=300){
      t=0;
    }
  }
  if(x<width/2 && y<height/2 && dist(x,y,mouseX,mouseY)<=100){
    t++;
    direcX= -15;
    direcY= -15;
  
  }
  if(x<width/2 && y>height/2 && dist(x,y,mouseX,mouseY)<=100){
    t++;
    direcX= -15;
    direcY=15;
 
  }
   
}
 
void mouseDragged(){
   
  if(y>height/2 && x>width/2){
    direcX=25;
    direcY=25;
  }
  if(x>width/2 && y<height/2){
    direcX=25;
    direcY= -25;
  }
  if(x<width/2 && y<height/2){
    direcX= -25;
    direcY= -25;
  }
  if(x<width/2 && y>height/2){
    direcX= -25;
    direcY=25;
    
  
  }
}


