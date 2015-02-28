
//erica coombs
//image processor
//March 1 2011
//art 479

import controlP5.*;
ControlP5 controlP5;
int myColor = color(0,0,0);
int sliderValue = 100;
int sliderTicks1 = 100;
PImage imgin;
PImage imgsized;
PImage imgman;
PImage imgsave;
String temp=null;
String output=null;

Slider a;
Slider b;
Slider c;
Slider d;

public float Opacity = 255;
public float Shape = 3;
public float Size = 0;



void setup() {
  size(500,500);
  background(45);
  smooth();
  frameRate(1000000000);
  controlP5 = new ControlP5(this);//Filter Sliders
   a = controlP5.addSlider("Shape",0,3,228,350,80,100,10);
   Slider s2 = (Slider)controlP5.controller("Shape");
   s2.setNumberOfTickMarks(4);
   b = controlP5.addSlider("Size",0,20,228,350,120,100,10);
   c = controlP5.addSlider("Opacity",0,255,228,350,140,100,10);
   

  
  
  ///////////////////////// LOAD AND SAVE BUTTONS ///////////////////////
  pushStyle(); //open image button
  fill(0,54,82);
  stroke(0,105,140);
  //rect(20,20,350,40);
  rect(350,40,100,21);
  popStyle();
  text("Open Image",360,55);
 
  pushStyle();// save image button
  fill(0,54,82);
  stroke(0,105,140);
  rect(350,450,100,21);
  popStyle();
  text("Save Image",360,466);
}

void draw() {
  fill(sliderValue);
  
  ////////////////////////// LOAD IMAGE ////////////////////////////////
  if(load){
    load=false;
    temp=selectInput();
    if(temp!=null){
      imgin=loadImage(temp);
 
      if(imgin!=null){
        imgsave=imgin.get();
        imgsized=imgin.get();
        imgman=imgsized.get();
        imgsized.resize(300,0);
        image(imgsized,20,40);
        imgman.resize(100,0);
        image(imgman,350,160);
      }
    }
  }
  
  if(imgin!=null){
 

  ////////////////////// SAVE IMAGE ////////////////////////////////
 if(Save){
 
      output=selectOutput();
 
      if(output!=null){
 
        for(int x=0;x<imgsave.width; x++)
        {
          for(int y=0; y<imgsave.height; y++)
          { 
           imgsave.save(output);
      }
 
      Save=false;
    }  
  }
 }
///////////////////////////////////////////////////////////////////////////
  int x = int(random(imgsized.width-20));
  int y = int(random(imgsized.height-20));
  int loc = x + y*imgsized.width;
  
  // Look up the RGB color in the source image
  loadPixels();
  float r = red(imgsized.pixels[loc]);
  float g = green(imgsized.pixels[loc]);
  float b = blue(imgsized.pixels[loc]);
  noStroke();
  
  // Draw an ellipse at that location with that color
  float pointillize = Size;
  fill(r,g,b,Opacity);
  
  
  if (Shape==0)
  ellipse(x +20,y +40,pointillize,pointillize);
 
  if(Shape==1)
    rect(x +20, y +40, pointillize,pointillize);
  
  if(Shape==2){
    PShape s;
    s = loadShape("shape1.svg");
    smooth();
    s.disableStyle();
    shape(s, x+20, y+40, pointillize*2, pointillize*2);}
  
  if(Shape==3){
    PShape t;
    t = loadShape("brush2.svg");
    smooth();
    t.disableStyle();
    shape(t, x+20, y+40, pointillize*2, pointillize*2);
   
  }}}

 
void slider(float theColor) {
  myColor = color(theColor);
  println("a slider event. setting background to "+theColor);
}

boolean load=false;  
boolean Save=false;

void keyPressed(){
  if((key=='l')||(key=='L')){
       load=true; 
  if((key=='s')||(key=='S')){
    Save=true;
  }
  }
}

void mouseClicked(){
  if((mouseX>350) && (mouseX<450) && (mouseY>40) && (mouseY<61)){
        load=true;
  if((mouseX>350) && (mouseX<450) && (mouseY>450) && (mouseY<471)){
       Save=true;
  if(imgin!=null){
            Save=true;
    }
  }
  }
}

