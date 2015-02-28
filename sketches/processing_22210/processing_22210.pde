
PImage cone; PFont billo;
float x=0;float y=0;float direcX=0;float direcY=0;
int t=0;

void setup(){
  size(800,600);
  smooth();
  colorMode(HSB,360,100,100);
  cone = loadImage("ice_cream_cone_smaller_flipped.png");
  billo = loadFont("Billo-100.vlw");
  direcX=5;direcY=5;
  
}

void draw(){
  imageMode(CENTER);
  background(#F55980);
  textAlign(CENTER);
  textFont(billo);
  text("HIT THE iSCREAM!",width/2,height/2);
  x+=direcX;y+=direcY;
  translate(x,y);
  image(cone,0,0);
    if(y>=height){
      pushMatrix();
      direcY= -5;
      popMatrix();
    } 
    if(x>=width){
      direcX= -5;
    }
    if(y<=0){
      pushMatrix();
      direcY=5;
      popMatrix();
    }
    if(x<=0){
      pushMatrix();
      direcX=5;
      popMatrix();
    } 
   if(t>=18){
     t=0;
     t++;
   }
}

void mousePressed(){
  if(y>height/2 && x>width/2 && dist(x,y,mouseX,mouseY)<=100){
    t++;
    direcX=15;
    direcY=15;
    tint(t*20,100,100);
  }
  if(x>width/2 && y<height/2 && dist(x,y,mouseX,mouseY)<=100){
    t++;
    direcX=15;
    direcY= -15;
    tint(t*20,100,100);
    if(t>=300){
      t=0;
    }
  }
  if(x<width/2 && y<height/2 && dist(x,y,mouseX,mouseY)<=100){
    t++;
    direcX= -15;
    direcY= -15;
    tint(t*20,100,100);
  }
  if(x<width/2 && y>height/2 && dist(x,y,mouseX,mouseY)<=100){
    t++;
    direcX= -15;
    direcY=15;
    tint(t*20,100,100);
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

