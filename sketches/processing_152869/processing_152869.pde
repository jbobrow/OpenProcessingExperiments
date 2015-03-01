
/*
 * Creative Coding
 * Week 4, 01 - an interactive colour wheel picker
 * by Indae Hwang and Jon McCormack
 * Copyright (c) 2014 Monash University
 *
 * This program draws an interactive colour selection wheel
 * Drag the colour circle around the hue wheel to change hue, change the distance
 * from the wheel to control brightness.
 *
 * Another colour circle is displayed showing the colour 180 degrees from the current colour
 *
 * Extended using classes (thanks Pierre)
 *
 * PS Mode
 * Added scale and rectangle to show "crispening" with thanks to David Briggs
 * as this shows brightness have changed the handle to saturation
 *
 * 
 */
import controlP5.*;

ControlP5 MyController;

PGraphics wheelLayer;
PGraphics handlesLayer;

// colourHandle: the user interface element to changing colours over the wheel
// It has a postion and a size
//
float colorHandleX;
float colorHandleY;
float handleSize = 30;

// boolean isLocked
// the state of handle: when the color handle is pressed, 
// color hand is locked–released as the left mouse button is released 
//
boolean isLocked = false;
boolean togBright = false;

// Wheel radius: inner and outer
//
float innerR = 100; // inner
float outerR = 200; // outer
float outerR2 = outerR * 1.5; // limit of the handle's "pull" range

// current and complementry colour
float hueValue = 180;
float brightValue = 100;
float saturationValue = 100;

float complementryHue = 0;
int comHandles;

//brightness of the gray
float greyValue = 50;
int scalePoints = 9;
int dr11Points=0;

int selectedCs=-1;


ArrayList <ColourHandle> colourHandles;
//ArrayList <ColourWheel> colourWheels;

ColourWheel myWheel;
GrayScale   myScale;
ColourHandle myHandle;
ColourHandle workHandle;

void setup() {

  size(800, 800);
  colorMode(HSB, 360, 100, 100); // use HSB colour mode, H=0->360, S=0->100, B=0->100

  comHandles=6;
  
  colorHandleX = width/2+300;
  colorHandleY = height/2;

  colourHandles=new ArrayList<ColourHandle>();
  //colourWheels=new ArrayList<ColourWheel>();

  //replace controlP5 
  MyController = new ControlP5(this);
  MyController.addSlider("greyValue",0,100,greyValue,(width/12),(height/24),10,(height/6));
  
  MyController.addButton("Munsell",  0,  (8*(width/9)),  height/24+(height/6)/3,  (width/12),20);


  wheelLayer=createGraphics(2*(int)outerR, 2*(int)outerR);
    wheelLayer.beginDraw();
    wheelLayer.background(0, 0);
    wheelLayer.colorMode(HSB, 360, 100, 100);
    //wheelLayer.loadPixels();
  wheelLayer.endDraw();


  handlesLayer=createGraphics(2*(int)outerR, 2*(int)outerR);
    handlesLayer.beginDraw();
    handlesLayer.background(0, 0);
    handlesLayer.colorMode(HSB, 360, 100, 100);
  handlesLayer.endDraw();  
  
  createHandles();
  
  myWheel=new ColourWheel("Itten",30.0);
  
  myScale=new GrayScale((width/6), (height/24), 2*width/3, (height/6),0,0,scalePoints);
  
}


void draw() {
  background(0, 0, 100);

  // draw reference line at the 0/360 hue boundary
  stroke(0, 40);
  line(width/2 - innerR, height/2, width/2 - outerR2, height/2);
  
  //draw colour wheel
  myWheel.display();

    
  //drawComplementaryHandles();
  for (int i=0; i<colourHandles.size (); i++) {
    colourHandles.get(i).display(togBright);
  }

  //draw gray value rectangle 
  myScale.display(colourHandles.get(0).col,colourHandles.get(0).sat);

  image(wheelLayer, width/2-outerR, height/2-outerR);
  image(handlesLayer, width/2-outerR, height/2-outerR);


  handlesLayer.beginDraw();
    handlesLayer.background(0, 0);
  handlesLayer.endDraw();
   
}


/*
 * isWithinCircle
 * boolean function that returns true if the mouse is within the circle with centre (x,y) radius r
 */
boolean isWithinCircle(float x, float y, float r) {
  float dist = dist(mouseX, mouseY, x, y);
  return (dist <= r);
}



void Munsell() {
  if(dr11Points == 0){
    dr11Points = 1;
    scalePoints=11;
  } else {
    dr11Points = 0;
    scalePoints=9;
  }
}


void keyPressed() {
  if ((key =='b') || (key == 'B')) {
    togBright = togBright ? false : true;
    switchHandleModes();
  }
}



void createHandles() {
  ColourHandle myHandle=new ColourHandle(TWO_PI/4, 140, true, 0);
  colourHandles.add(myHandle);

  for (int i=1; i<=comHandles; i++) {
    myHandle=new ColourHandle(TWO_PI/4, 140, false, i*(TWO_PI/(comHandles+1)));
    colourHandles.add(myHandle);
  }
}

void switchHandleModes(){
    for (int i=0; i<colourHandles.size (); i++) {
      workHandle=colourHandles.get(i);
      workHandle.switchMode(togBright);
    }
}




void mousePressed() {
  if (mouseButton==LEFT) {
    for (int i=0; i<colourHandles.size (); i++) {
      workHandle=colourHandles.get(i);
      if (dist(mouseX, mouseY, workHandle.x, workHandle.y)<workHandle.dia/2) {
        workHandle.dragged=true;
        return;
      }
    }
  } else {
    boolean removed=false;
    for (int i=colourHandles.size ()-1; i>0; i--) {
      workHandle=colourHandles.get(i);
      if (dist(mouseX, mouseY, workHandle.x, workHandle.y)<workHandle.dia/2) {
        colourHandles.remove(workHandle);
        removed=true;
        println("removed");
      }
    }
    if (removed==false) {
      float thisTheta=atan2(mouseX-width/2, mouseY-height/2);
      colourHandles.add(new ColourHandle(thisTheta, dist(mouseX, mouseY, width/2, height/2), false, 0));
      //preparedeco();
    }
  }
}



void mouseDragged() {
  if (dist(mouseX, mouseY, width/2, height/2)<outerR) {
    for (int i=0; i<colourHandles.size (); i++) {
      workHandle=colourHandles.get(i);
      if (workHandle.dragged) {
        workHandle.x=mouseX;
        workHandle.y=mouseY;
        workHandle.radius=dist(mouseX, mouseY, width/2, height/2);
        //workHandle.theta=atan2(mouseX-width/2, mouseY-height/2)+workHandle.offset;
        //workHandle.display(togBright);
 
        if (workHandle.master) {         
          for (int ns=1; ns<colourHandles.size (); ns++) {
            ColourHandle workHandle1=colourHandles.get(ns);
            workHandle1.theta=atan2(mouseX-width/2, mouseY-height/2)+workHandle1.offset;
            workHandle1.radius=min(outerR, workHandle1.radius0*workHandle.radius/workHandle.radius0);
            workHandle1.x=width/2+workHandle1.radius*sin(workHandle1.theta);
            workHandle1.y=height/2+workHandle1.radius*cos(workHandle1.theta);
            workHandle1.display(togBright);
          }
        } 
      }
    }
  }
}



void mouseReleased() {
  for (int i=0; i<colourHandles.size (); i++) {
    //println(i + "  :  "  + colourHandles.get(i).dragged);
    
    if (colourHandles.get(i).dragged) colourHandles.get(i).radius0=dist(mouseX, mouseY, width/2, height/2);
    colourHandles.get(i).dragged=false;
    colourHandles.get(i).update(togBright);
  }
}


void mouseClicked() {
  selectedCs=-1;
  for (int i=0; i<colourHandles.size (); i++) {
    myHandle=colourHandles.get(i);
    if (dist(mouseX, mouseY, myHandle.x, myHandle.y)<myHandle.dia/2) {
      myHandle.selected=!myHandle.selected;
      if (myHandle.selected) {
        selectedCs=i;
      }
    } else {
      myHandle.selected=false;
    }
  }
}



class GrayScale  {
  float gXpos, gYpos, gWidth, gHeight, gCol, gSat, gPoints;
  
  GrayScale (float gXpos, float gYpos, float gWidth, float gHeight, float gCol, float gSat, int gPoints) {
    this.gXpos=gXpos;
    this.gYpos=gYpos;
    this.gWidth=gWidth;
    this.gHeight=gHeight;
    this.gCol=gCol;
    this.gSat=gSat;
    this.gPoints=gPoints;

    display(this.gCol, this.gSat);
  }  
  
  void display(float gdCol, float gdSat ) {

    fill(0,0,greyValue);
    rect(gXpos, gYpos, gWidth, gHeight);
  
    float scaleBoxDim = gWidth / ((gPoints * 2) + 1);
    
    this.gCol=gdCol;
    this.gSat=gdSat;
    
    //place scale squares
    noStroke();
    for (int i=0; i<gPoints; i++) {
     fill(gdCol,gdSat,(100/gPoints)*i);
     rect(gXpos+scaleBoxDim+(i*scaleBoxDim * 2),gYpos+(gHeight-scaleBoxDim)/2,scaleBoxDim,scaleBoxDim);
    }
  }
}


  
class ColourHandle {
  float theta, radius, radius0, col, sat, bright, dia, x, y, satX, satY, brX, brY, brightRad, satRad, offset;
  boolean dragged=false;
  boolean master, selected;
  
  ColourHandle(float theta, float radius, boolean master, float offset) {
    this.radius=this.radius0=radius;
    this.theta=theta;
    this.master=master;
    this.offset=offset;
    selected=false;
    bright=255;
    dia=25;
    
    x=width/2+radius*sin(theta+offset);
    y=height/2+radius*cos(theta+offset);

    brX=x;
    brY=y;
    satX=x;
    satY=y;
    satRad=radius;
    brightRad=radius;
    
    col=getHandleColour(x-width/2+outerR, y-height/2+outerR);
    sat=getHandleSaturation(x-width/2+outerR, y-height/2+outerR);
    display(togBright);
  }
    
  void display(boolean brightMode) {
    
    col=getHandleColour(x-width/2+outerR, y-height/2+outerR);
    
    //sat=getHandleSaturation(satX, satY);
    if (brightMode) {
      bright =  getHandleSaturation(x, y);
    } else {
      sat  =getHandleSaturation(x, y);
    }
    
    
    handlesLayer.beginDraw();
      handlesLayer.fill(col,sat,bright);
      handlesLayer.stroke(255*int(!dragged));
      handlesLayer.strokeWeight(1);
      handlesLayer.line(outerR, outerR, x-width/2+outerR, y-height/2+outerR);

      handlesLayer.strokeWeight(2+3*int(master));
      if (brightMode) {
        handlesLayer.stroke(col,0,100);
      } else {
        handlesLayer.stroke(col,100,100);
      }
      handlesLayer.ellipse(x-width/2+outerR, y-height/2+outerR, dia, dia);
    handlesLayer.endDraw();
    
  }

  void switchMode (boolean brightMode) {
    float smOffset = 0;
    
    if (!master) smOffset = this.offset;
    
    if (brightMode) {            
      x=(width/2 + this.brightRad*sin(theta+smOffset));
      y=(height/2 + this.brightRad*cos(theta+smOffset));
      this.radius=brightRad;
      this.radius0=brightRad;
      
    } else {
      x=(width/2 + this.satRad*sin(theta+smOffset));
      y=(height/2 + this.satRad*cos(theta+smOffset));
      this.radius=satRad;
      this.radius0=satRad;
      
    } 
    //update(brightMode);
  }
  
  void update(boolean brightMode) {
    this.theta=atan2(x-width/2, y-height/2);
    this.radius0=this.radius;
    if (!master) {
      this.offset=this.theta-colourHandles.get(0).theta;
    }
    
    if (brightMode) {
      this.brightRad=this.radius;
    } else {
      this.satRad=this.radius;
    } 
      
  
  }
  
  float getHandleColour(float x, float y) {
    float ptcAngle = degrees(atan2(y-outerR, x-outerR));
    return map(ptcAngle, -180, 180, 360,0);
  }
  
  float getHandleSaturation(float x, float y) {
    //should be relative to the position of the layer - maybe later
    float distance = dist(x, y, width/2, width/2);
    return map(distance,0,outerR,0,100);
  }
}




class ColourWheel {
  String cwType;
  float cwDivisions;
  
  ColourWheel(String cwType, float cwDivisions) {
    this.cwType = cwType;
    this.cwDivisions = cwDivisions;
    
    display();
  }

  //might want to add other colour wheel types in future  
  void display() {  
    if (cwType == "Itten") drawItten();
  }
  
  void drawItten() {
    
    wheelLayer.beginDraw();  
      //draw itten's color wheel - we'll use a QUAD_STRIP for this
      wheelLayer.noStroke();
      
      wheelLayer.beginShape(QUAD_STRIP);
        for (int i=0; i<=cwDivisions; i++) {
          float angle = radians(360.0/cwDivisions*i-90); // 10 x 36 degree steps          
          
          wheelLayer.fill(360.0/cwDivisions*i, 100, 100);
 
          //outside(top)
          wheelLayer.vertex(outerR + outerR*sin(angle), outerR + outerR*cos(angle) );
          
          //inside(down)
          wheelLayer.vertex(outerR + innerR*sin(angle), outerR + innerR*cos(angle) );
        }
      wheelLayer.endShape(CLOSE);
    wheelLayer.endDraw(); 
    
  }
    
}



