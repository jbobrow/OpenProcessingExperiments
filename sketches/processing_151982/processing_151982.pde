
/*
 * Creative Coding
 * Week 3, 06 - rule-based system
 * by Indae Hwang and Jon McCormack
 * Copyright (c) 2014 Monash University
 *
 * This sketch draws a series of moving Elements (circles) according to the following rules:
 * - start from a random position and move in a constant random direction
 * - if the point reaches the boundary of the screen move in the opposite direction with new velocity
 * - if the circles intersect then draw a line connecting their centres, colouring the line based on the circle being odd or even
modified by Marius Ivaskevicius
Implemented FloatScreen object which holds all pixel colors in float values.
Also has functions to draw rectangles and lines with alpha channels.
(alpha is in range 0 to 1)
Its very slow, can be used only to render images for animation.
Also does not run on openprocessing. Sorry. :( I don't know why.
 */
boolean record=false; //enable this to record every (skipFrames)'th frame to files
int wSize=100;
int skipframes=wSize;
float speed=0.1;
float[] xPos;      // position
float[] yPos;
float[] xInc;   // change per frame
float[] yInc;
int numArray;   // number of elements
float proximity;  // if distance between elements < proximity then draw a line between them
class Pix{
  float r,g,b;
  Pix(float rIn,float gIn,float bIn){
    this.r=rIn;
    this.g=gIn;
    this.b=bIn;
  }
  void paint(float rIn,float gIn,float bIn,float aIn){
    //http://en.wikipedia.org/wiki/Alpha_compositing
    this.r=this.r*(1-aIn)+rIn*aIn;
    this.g=this.g*(1-aIn)+gIn*aIn;
    this.b=this.b*(1-aIn)+bIn*aIn;
  }
  float getR(){return this.r;}
  float getG(){return this.g;}
  float getB(){return this.b;}
}
class FloatScreen{
  float r,g,b,a;
  int maxX,maxY;
  Pix[] pixs;
  FloatScreen(){
    this.pixs=new Pix[width*height];
    for(int i=0;i<width*height;i++){
      this.pixs[i]=new Pix(0,0,0);
    }
  }
  void setPaint(float rIn,float gIn,float bIn,float aIn){
    this.r=rIn;
    this.g=gIn;
    this.b=bIn;
    this.a=aIn;
  }
  void lin(int xf,int yf,int xt,int yt){
    int x,y;
    int range=int(dist(xf,yf,xt,yt));
    for(int i=0;i<range;i++){
      x=int(map(i,0,range,xf,xt));
      y=int(map(i,0,range,yf,yt));
      try{
        this.pixs[y*width+x].paint(this.r,this.g,this.b,this.a);
      }catch(ArrayIndexOutOfBoundsException e){
        println(e,xf,yf,xt,yt," ",x,y,y*width+x);
      }
    }
  }
  void rec(int xf,int yf,int xt,int yt){
    int n;
    for(int y=yf;y<yt;y++){
      for(int x=xf;x<xt;x++){
        n=y*width+x;
        this.pixs[y*width+x].paint(this.r,this.g,this.b,this.a);      }
    }
  }
  void action(){
    int n;
    for(int y=0;y<height;y++){
      for(int x=0;x<width;x++){
        n=y*width+x;
        stroke(this.pixs[n].getR(),this.pixs[n].getG(),this.pixs[n].getB());
        point(x,y);
      }
    }
  }
}
FloatScreen myFloatScreen;
void setup() {
  size(wSize,wSize);
  myFloatScreen= new FloatScreen();
  numArray = 20;
  // allocate arrays
  xPos= new float[numArray];
  yPos= new float[numArray];
  xInc= new float[numArray];
  yInc= new float[numArray];
  proximity = wSize/5;   // influence distance
  // random starting position and direction
  for (int i=0; i<numArray; i++) {
    xPos[i] = random(width);
    yPos[i] = random(height);
    xInc[i] = random(speed*-1,speed);
    yInc[i] = random(speed*-1,speed);
  }
}
void draw() {
  for(int skip=0;skip<skipframes;skip++){
    myFloatScreen.setPaint(0,0,0,0.0005);
    myFloatScreen.rec(0,0,width,height);
    for (int i=0; i<numArray; i++) {
      xPos[i] += xInc[i];
      yPos[i] += yInc[i];
      // bounce off the sides of the window
      if (xPos[i] > width || xPos[i] < 0) {
        xInc[i] = xInc[i] > 0 ? -random(speed) : random(speed);
      }
      if (yPos[i] > height || yPos[i] < 0 ) {
        yInc[i] = yInc[i] > 0 ? -random(speed) : random(speed);
      }
    }
    for (int i=0; i<numArray; i++) {
      for (int j=0; j<i; j++) {
        float dist = dist(xPos[i], yPos[i], xPos[j], yPos[j]  );
        if (dist < proximity) {
          if (i%2 == 0 || j%2==0) {
            //stroke(0, 0, 255, 20);
            myFloatScreen.setPaint(128,0,0,0.5);
          } 
          else {
            //stroke(255, 0, 255, 20);
            myFloatScreen.setPaint(255,128,0,0.5);
          }
          myFloatScreen.lin(constrain((int)xPos[i],0,width-1),
                            constrain((int)yPos[i],0,height-1),
                            constrain((int)xPos[j],0,width-1),
                            constrain((int)yPos[j],0,height-1));
        }
      }
    }
  }
  myFloatScreen.action();
  if(record){saveFrame("float####.jpg");}
}
