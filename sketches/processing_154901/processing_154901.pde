
/* Creative Coding
 
 June 20 2014 - nanoBubbles V3
 by Julio Montabes
 Copyright (c) 2014 Julio Montabes
 
 This program draws objects called bubbles that act according to the influence of
 different forces and events inspired in nature (gravitational, electrical, strong force, chemical
 forces, collisions, breaking impacts, etc.
 
 Click   - Select one bubble
 RClick  - Stops mouvement
 
 b       - stops / restart the refreshment of the background
 c/C     - decreases / INCREASES the charge of the bubble
 d       - draws / doesn't draw the bubble body
 e/E     - decreases / INCREASES the electrical intensity
 f/F     - decreases / INCREASES the chemical, (lClick) nuclear of (rClick) elasticity intensity
 g/G     - decreases / INCREASES the gravitational intensity
 l       - draws / doesn't draw the acceleration lines
 n/N     - decreases / INCREASES the number of bubbles
 r/R     - decreases / INCREASES the radius of the bubbles (one bubble if selected)
 s       - makes a jpg of the actual image
 t       - displays upon the console a table of properties of all the bubbles and the forces
 
 
 
 */

// PARAMETERS
float frames=10;
int num=25;
int maxRadius=90;
int minRadius=10;
int maxInitialSpeed=0;

// PHYSICAL PARAMETERS
float elasticityWall=0.2;
float elasticity = 4;// 3000; //500000; // Factor of elasticity of the virtual matter of the balls.
float gravity=-0.0;
float electricalStrength=10000; //50; //300000; //500000; //1000000;
float chemicalStrength=0.5; //0.7;//50;//30; 
float nuclearStrength=0.3; //0.4;//80;//50; //50; 
float chemicalOverlap=1.00; // overlap of a circle when a chemical reaction happens
float nuclearOverlap=2.00; 
float speedOfLight=300; // max speed of anything. It is calculated as the average speed between frames that "does not escape from our universe"

// OBJECT
Bubble[] bubble = new Bubble[num];
color bColor = color(100, 190, 190);

// DISPLAY PARAMETERS
boolean drawObject = true;
boolean drawOuterCircle = true; 
boolean drawCenter = true;
boolean drawShape = true;
boolean drawLines = true;
boolean drawWallLines = false;
boolean refreshImage = true;
boolean cleanBackground = true;

// USER INTERFACE PARAMETERS
boolean debugDisplay = false;
boolean messageDisplay=true;

// PARAMETERS RECORD
float lastElasticity = elasticity;
float lastGravity = gravity;
float lastElectricalStrength = electricalStrength;
float lastChemicalStrength = chemicalStrength;
float lastNuclearStrength = nuclearStrength;
float lastChemicalOverlap = chemicalOverlap;
float lastNuclearOverlap = nuclearOverlap; 
float lastFrames = frames;
int   lastNum=num;
int   lastMaxRadius = maxRadius;
int   lastMinRadius = minRadius;
int   lastMaxInitialSpeed = maxInitialSpeed;
boolean lastDrawObject = true;
boolean lastDrawCenter = true;
boolean lastDrawShape = true;
boolean lastDrawLines = true;
boolean lastDrawWallLines = true;
boolean lastRefreshImage = true;
boolean lastCleanBackground = true;
boolean lastDebugDisplay = false;
boolean lastMessageDisplay=true;


void  saveLastParameters() {
  lastElasticity = elasticity;
  lastGravity = gravity;
  lastElectricalStrength = electricalStrength;
  lastChemicalStrength = chemicalStrength;
  lastNuclearStrength = nuclearStrength;
  lastChemicalOverlap = chemicalOverlap;
  lastNuclearOverlap = nuclearOverlap; 
  lastFrames = frames;
  lastNum=num;
  lastMaxRadius = maxRadius;
  lastMinRadius = minRadius;
  lastMaxInitialSpeed = maxInitialSpeed;
  lastDrawObject = drawObject;
  lastDrawCenter = drawCenter;
  lastDrawShape = drawShape;
  lastDrawLines = drawLines;
  lastDrawWallLines = drawLines;
  lastRefreshImage = refreshImage;
  lastCleanBackground = cleanBackground;
  lastDebugDisplay = debugDisplay;
  lastMessageDisplay=messageDisplay;
}

// PARAMETER SELECTION NAMES AND ORDER
int gravityS = 0;
int elasticityS = 1;
int electricalStrengthS = 2;
int chemicalStrengthS = 3;
int nuclearStrengthS = 4;
int framesS = 5;
int radiusS = 6;
int circleS= 7;
int drawCenterS = 8;
int drawShapeS = 9;
int drawLinesS = 10;
int drawWallLinesS = 11;
int refreshImageS = 12;
int cleanBackgroundS = 13;
int debugDisplayS = 14;
int messageDisplayS = 15;

boolean selectedParameter=false;
int parameter=-1;
int numberOfEntities=15;

int chemicalOverlapS = 16; // under construction
int nuclearOverlapS = 17;
int numS = 18;


// EVENTS RECORD
int lastPressMouseX = -1;
int lastPressMouseY = -1;
boolean noObjectClicked = true;


float convertToGraphAX(float physicalValue) {
  return physicalValue / graphicZoom;
}
float convertToRealAX(float graphicalValue) {
  return graphicalValue * graphicZoom;
}
float convertToGraphAY(float physicalValue) {
  return -physicalValue / graphicZoom;
}
float convertToRealAY(float graphicalValue) {
  return -graphicalValue * graphicZoom;
}

void setup() {  //setup function called initially, only once
  dbg("setup()", 0, false);
  size(900, 600);
//  size(displayWidth, displayHeight);
  colorMode(RGB);   //set colors to Hue, Saturation, Brightness mode
  frameRate(frames);
  randomSeed(year()+month()+day()+hour()+minute()+second()+millis());
  resetCollection();
  drawCollection();
}

void draw() {  //draw function loops
  if (refreshImage || clickNumber()==1) {
    dbg("draw() -> ENTRANCE", 0, false);
    if (cleanBackground) {
      background(bColor);
    }
    updateCollection();
    drawCollection();
  }
}


void cleanConsole() {
  for (int i=0; i<30; i++) {
    println("");
  }
}

void changeMouvement() {
  if (noObjectClicked) {
    refreshImage = refreshImage==false;
  }
}

int objectClickedNumber() {
  int n=-1;
  for (int i=0; i<num; i++) {
    if (bubble[i].pClicked) {
      n=i;
    }
  }
  return n;
}


int objectDoubleClicked() {
  int n=-1;
  if (clickCounter==0) {
    for (int i=0; i<num; i++) {
      if (bubble[i].pClicked) {
        n=i;
      }
    }
  }
  return n;
}

int clickNumber() {
  int cC=clickCounter;
  clickCounter=-1;
  return cC;
}

int lastClickedMillis = 0; // Last milisecond mouseClicked happened.
int clickCounter=-1;
int previousDblClick=0;

void messageDisplay(String message) {
  if (messageDisplay) {
    println(hour(), minute(), second(), millis(), message);
  }
}
float dbgMillis=0;
void dbg(String message, int timer, boolean timerTrigger) {
  if (timer>0) {
    if (timerTrigger==false) {
      debugDisplay=false;
    }
    dbgMillis=millis()+timer;
  }
  if (debugDisplay || millis()-dbgMillis<timer || timer==-1) {
    println("");
    println(hour(), minute(), second(), millis(), message);
  }
}

void resetMouseClick() {
  if (parameter==drawCenterS) {
    drawCenter=drawCenter==false;
  }
  if (parameter==drawShapeS) {
    drawShape =drawShape ==false;
  } 
  if (parameter==drawLinesS) {
    drawLines =drawLines ==false;
  } 
  if (parameter==refreshImageS) {
    refreshImage  =refreshImage  ==false;
  }
  if (parameter==cleanBackgroundS) {
    refreshImage =refreshImage ==false;
  } 
  if (parameter==debugDisplayS) {
  }

  if (parameter==messageDisplayS) {
  }

  selectedParameter=false;
  parameter=-1;
}
void resetMousePressed() {
  lastPressMouseX=-1;
  lastPressMouseY=-1;
  resetObjectClicked();
  saveLastParameters();
}
void resetObjectClicked() {
  for (int i=0; i<num; ++i) {
    bubble[i].pClicked=false;
    bubble[i].pClickedX=0;
    bubble[i].pClickedY=0;
  }
  noObjectClicked=true;
}

void mouseClicked() {
  //g("mouseClicked at "+hour()+":"+minute()+":"+second(), 100, debugDisplay==false);

  int i=0;

  if (millis()-lastClickedMillis<600) {
    // doble-click
    clickCounter++;
  } else {
    clickCounter=-1;
  } 

  if (mouseButton==37) {

    // LEFT MOUSE
    if (clickCounter==-1) { 

      // ONE CLICK
      if (refreshImage==false) {
        clickCounter=1; // it is put to 1 because at draw() it is checked to draw the frame even thought the drawing is stoped
      }

      if (selectedParameter) {
        parameter++; // passing through another parameter to select
        println(+hour()+":"+minute()+":"+second()+","+millis()+" --> mouseClicked with parameter selected");
        reportAccelerations();
        reportParameters();
        if (parameter>=numberOfEntities) { // in case arrived to the last parameters Parameter Selection stops
          resetMouseClick();
        }
      }
    } else if (clickCounter==0) { 

      // TWO CLICKS 
      selectedParameter=selectedParameter==false;
      if (selectedParameter) {
        parameter++;
      } else {
        resetMouseClick();
      }
      println(+hour()+":"+minute()+":"+second()+","+millis()+" --> mouseClickedTwice");
      reportAccelerations();
      reportParameters();
    } else if (clickCounter==1) { 

      // THREE CLICKS
      resetCollection ();
      drawCollection();
    }
  }

  if (mouseButton==39) {
    // RIGHT MOUSE
    changeMouvement();
    println(+hour()+":"+minute()+":"+second()+","+millis()+" --> RIGHT mouseClicked");
    reportAccelerations();
    reportParameters();
    reportObjects();
  }

  lastClickedMillis=millis();
}


void mousePressed() {
  if (noObjectClicked==true) {
    for (int i=0; i<num; ++i) {
      if (bubble[i].sX()-bubble[i].sRadius()<mouseX && mouseX<bubble[i].sX()+bubble[i].sRadius() && bubble[i].sY()-bubble[i].sRadius()<mouseY && mouseY<bubble[i].sY()+bubble[i].sRadius()) {
        bubble[i].pClicked=true;
        bubble[i].pClickedX=bubble[i].pX-convertToRealX(mouseX);
        bubble[i].pClickedY=bubble[i].pY-convertToRealY(mouseY);
        noObjectClicked=false;
      }
    }
  }
  if (lastPressMouseX==-1) {
    lastPressMouseX=mouseX;
    lastPressMouseY=mouseY;
  }
}

int dragX() {
  if (lastPressMouseX!=-1) {
    return mouseX-lastPressMouseX;
  } else {
    return 0;
  }
}

int dragY() {
  if (lastPressMouseX!=-1) {
    return mouseY-lastPressMouseY;
  } else {
    return 0;
  }
}

void mouseReleased() {
  if (noObjectClicked) {
    if (parameter==gravityS || keyPressed && key=='g') {
      gravity+=0.05*dragY();
    } else if (parameter==framesS || keyPressed && key=='f') {
      frames+=0.05*dragX();
      if (frames==0) frames=1;
      if (frames<=-1) frames=-1/frames;
      frameRate(frames);
    }
  }
  resetMousePressed();
}


void keyPressed() {
  switch(key) {
  case 'b': // swaps between cleaning the screen of not after a frame
    cleanBackground=cleanBackground==false;
    break;
  case 'c':
    if (noObjectClicked==false) {
      for (int i=0; i<num; ++i) {
        if (bubble[i].pClicked==true) {
          bubble[i].pCharge-=1;
          if (messageDisplay) println("bubble["+i+"].pCharge="+bubble[i].pCharge);
        }
      }
    }
    break;
  case 'C':
    if (noObjectClicked==false) {
      for (int i=0; i<num; ++i) {
        if (bubble[i].pClicked==true) {
          bubble[i].pCharge+=1;
          if (messageDisplay) println("bubble["+i+"].pCharge="+bubble[i].pCharge);
        }
      }
    }
    break;
  case 'd':
    if (mousePressed==false) {
      drawObject = drawObject==false;
      if (messageDisplay) println("drawObject[i]="+drawObject);
    } else if (mousePressed && mouseButton==37) {
      drawShape = drawShape==false ;
      if (messageDisplay) println("drawShape[i]="+drawShape);
    } else if (mousePressed) {
      drawCenter = drawCenter==false;
      if (messageDisplay) println("drawCenter[i]="+drawCenter);
    }
    break;
  case 'e':
    electricalStrength*=0.9;
    if (messageDisplay) println("electricalStrength="+electricalStrength);
    break;
  case 'E':
    electricalStrength=max(electricalStrength*1.1, 0);
    if (messageDisplay) println("electricalStrength="+electricalStrength);
    break;
  case 'f': // swaps between cleaning the screen of not after a frame
    if (mousePressed==false) {
      chemicalStrength *= 0.9;
      if (messageDisplay) println("chemicalStrength="+chemicalStrength);
    } else if (mousePressed && mouseButton==37) {
      nuclearStrength *= 0.9;
      if (messageDisplay) println("nuclearStrength="+nuclearStrength);
    } else if (mousePressed) {
      elasticity *= 0.9;
      if (messageDisplay) println("elasticity="+elasticity);
    }
    break;
  case 'F': // swaps between cleaning the screen of not after a frame
    if (mousePressed==false) {
      chemicalStrength *= 1.1;
      if (messageDisplay) println("chemicalStrength="+chemicalStrength);
    } else if (mousePressed && mouseButton==37) {
      nuclearStrength *= 1.1;
      if (messageDisplay) println("nuclearStrength="+nuclearStrength);
    } else if (mousePressed) {
      elasticity *= 1.1;
      if (messageDisplay) println("elasticity="+elasticity);
    }
    break;
  case 'g':
    gravity-=0.1;
    if (messageDisplay) println("gravity="+gravity);
    break;
  case 'G':
    gravity+=0.1;
    if (messageDisplay) println("gravity="+gravity);
    break;
  case 'i':
    resetCollection();
    drawCollection();
    break;
  case 'l':
    drawLines = drawLines==false;
    if (messageDisplay) println("drawLines="+drawLines);
    break;
  case 'm':
    changeMouvement();
    break;
  case 'n': // number of circles
    num-=1;
    if (messageDisplay) println("num="+num);
    break;
  case 'N': // number of circles
    num+=1;
    if (messageDisplay) println("num="+num);
    break;
  case 'r':
    if (noObjectClicked==false) {
      for (int i=0; i<num; ++i) {
        if (bubble[i].pClicked==true) {
          bubble[i].pRadius*=0.9;
          if (messageDisplay) println("bubble["+i+"].pRadius="+bubble[i].pRadius);
        }
      }
    } else {
      for (int i=0; i<num; ++i) {
        bubble[i].pRadius*=0.9;
      }
    }
    break;
  case 'R':
    if (noObjectClicked==false) {
      for (int i=0; i<num; ++i) {
        if (bubble[i].pClicked==true) {
          bubble[i].pRadius*=1.1;
          if (messageDisplay) println("bubble["+i+"].pRadius="+bubble[i].pRadius);
        }
      }
    } else {
      for (int i=0; i<num; ++i) {
        bubble[i].pRadius*=1.1;
      }
    }
    break;
  case 's':
    saveFrame("NBalls.jpg");
    break;
  case 't': // gives the table of circles
    if (messageDisplay) println("");
    if (messageDisplay) println("");
    for (int i=0; i<num; ++i) {
      //printCircle(i);
      reportObject(i);
      reportAccelerations();
    }
    break;
  case 'w':
    drawWallLines = drawWallLines==false;
    if (messageDisplay) println("drawWallLines="+drawWallLines);
    break;
  case 'x': // error display on or off
    debugDisplay = debugDisplay==false;
    messageDisplay = messageDisplay==false;
    break;
  case 'X': // error display on or off
    cleanConsole();
    break;
  }
}

void mouseWheel(MouseEvent event) {
  float e = event.getCount();
  gravity+=0.1*e;
  if (messageDisplay) println("gravity="+gravity);
}


/*   USER FUNCTIONS    */

void resetCollection() {
  for (int i=0; i <num; ++i) {
    float x=random (width);
    float y=random (height);
    float sX=random (-maxInitialSpeed, maxInitialSpeed);
    float sY=random (-maxInitialSpeed, maxInitialSpeed);
    //float radius=random (minRadius, maxRadius);
    float radius=min(10*maxRadius*(1/random (1, 100)), maxRadius);
    color bodyColor=color (random (100, 150), random (100, 150), random (100, 150));
    int charge=(int) map(radius, minRadius, maxRadius, -7, 7);
    boolean clicked=false;
    float clickedX=0;
    float clickedY=0;
    bubble[i]= new Bubble(i, x, y, sX, sY, radius, bodyColor, charge, clicked, clickedX, clickedY);
  }
}


void updateCollection() {
  for (int i=0; i<num; ++i) {
    float increaseSpeedX=0;
    float increaseSpeedY=0;
    float speed=0;
    float acceleration=0;

    // wall collision accelerations...
    increaseSpeedX+=bubble[i].wallMechanicalAX();
    increaseSpeedY+=bubble[i].wallMechanicalAY();

    // Let's add Earth gravity...
    increaseSpeedX+=bubble[i].gravityAX();
    increaseSpeedY+=bubble[i].gravityAY();

    increaseSpeedX += bubble[i].mechanicalAX();
    increaseSpeedY += bubble[i].mechanicalAY();

    increaseSpeedX += bubble[i].chemicalAX(); 
    increaseSpeedY += bubble[i].chemicalAY();

    increaseSpeedX += bubble[i].nuclearAX(); 
    increaseSpeedY += bubble[i].nuclearAY();

    increaseSpeedX += bubble[i].electricalAX(); 
    increaseSpeedY += bubble[i].electricalAY();

    // and Human Forces
    if (bubble[i].pClicked==true) {
      increaseSpeedX=-bubble[i].pSX+convertToRealX(mouseX)-convertToRealX(pmouseX);
      increaseSpeedY=-bubble[i].pSY+convertToRealY(mouseY)-convertToRealY(pmouseY);
    }

    bubble[i].accelerate(increaseSpeedX, increaseSpeedY);

    bubble[i].move();

    for (int j=0; j<num; j++) {
      if (j!=i) {
        bubble[i].boundaryEvents(bubble[j]);
      }
    }
  }
} // END OF updateCollection

void reportObjects() {
  for (int i=0; i<num; i++) {
    reportObject(i);
  }
}
void reportObject(int i) {
  println("   "+i +"  xy="+bubble[i].pX +","+bubble[i].pY +"  V="+bubble[i].pSX +","+bubble[i].pSY +"  Rad="+bubble[i].pRadius );
  println("      G="+bubble[i].gravityAY()+"/"+bubble[i].gravityAX()+" Mc="+bubble[i].mechanicalAY()+"/"+bubble[i].mechanicalAX()+" E="+bubble[i].electricalAY()+"/"+bubble[i].electricalAX()+" ChF="+bubble[i].chemicalAY()+"/"+bubble[i].chemicalAX()+" NF="+bubble[i].nuclearAY()+"/"+bubble[i].nuclearAX());
}

void reportAccelerations() {
  println("   FORCES: Gr="+gravity +" Mec="+elasticity +" Elec="+electricalStrength +" Chem="+chemicalStrength +" Nuc="+nuclearStrength );
}

void reportParameters() {
  println("   PHYSICAL par: frames="+frames, " num="+num, " maxRadius="+maxRadius, " minRadius="+minRadius, " maxInitialSpeed="+maxInitialSpeed);
  println("   DISPLAY par:  drawObject="+drawObject, " drawCenter="+drawCenter, " drawShape="+drawShape, " drawLines="+drawLines, " drawWallLines="+drawWallLines, " refreshImage="+refreshImage, " cleanBackground="+cleanBackground);
  println("   DEBUG par:    debugDisplay="+debugDisplay +" messageDisplay="+messageDisplay);
}


// OBJECT PROPERTIES

float graphicCenterX = 0;
float graphicCenterY = 0;
float graphicZoom=1; // when high each pixel is equal to few physical units, when low the other way around

float convertToGraphX(float realX) {
  return realX*graphicZoom+graphicCenterX;
}
float convertToRealX(float graphicX) {
  return (graphicX-graphicCenterX)/graphicZoom;
}
float convertToGraphY(float realY) {
  return height-realY*graphicZoom-graphicCenterY;
}
float convertToRealY(float graphicY) {
  //return -(graphicY-height+graphicCenterY)/graphicZoom;// ERROR DE SIGNE
  return -(graphicY-height-graphicCenterY)/graphicZoom;
} 


void drawCollection() {
  for (int i=0; i <num; ++i) {
    bubble[i].display();
  }
} // END OF drawCollection

int parameterBlink(int e) {
  if (parameter==e) {
    return (millis()/500)%2;
  } else {
    return 1;
  }
} // END OF parameterBlink


class Bubble {
  // instance variables
  float pNum;
  float pX;
  float pY;
  float pSX;
  float pSY;
  float pRadius;
  color pBodyColor;
  int pCharge;
  boolean pClicked;
  float pClickedX;
  float pClickedY;

  // CONSTRUCTOR

  Bubble(int num_, float x_, float y_, float sX_, float sY_, float radius_, color bodyColor_, int charge_, boolean clicked_, float clickedX_, float clickedY_) {
    pNum=num_; 
    pX=x_; 
    pY=y_; 
    pSX=sX_; 
    pSY=sY_; 
    pRadius=radius_; 
    pBodyColor=bodyColor_; 
    pCharge=charge_; 
    pClickedX=clickedX_; 
    pClickedY=clickedY_;
    pClicked=clicked_;
  }
  Bubble() { // DEFAULT CONSTRUCTOR
    pNum=pBodyColor=pCharge=0;
    pX=pY=pSX=pSY=pClickedX=pClickedY=0;
    pClicked=false;
  }

  void move() {
    float x=pX+pSX; // The new position is the result of addint to the old one the velocity per 1 frame.
    float y=pY+pSY;
    //if (pClicked==true) {
    //  x=convertToRealX(mouseX)+pClickedX;
    //  y=convertToRealY(mouseY)+pClickedY;
    //}
    pX=x;
    pY=y;
  }

  float boundaries(Bubble b) {
    // MECHANICAL FORCE
    float d=distance(b);
    float r1=pRadius; // 1=present Bubble; 2=the other Bubble
    float r2=b.pRadius;
    float f=0;
    //if (d<=r1+r2) {    
    if (d<abs(r1-r2)) {
      f=0;
    } else if (d>r1+r2) {
      f=0;
    } else {
      float d1=(sq(r1)-sq(r2)+sq(d))/(2*d);
      float d2=d-d1;
      float h=sqrt(sq(r1)-sq(d1));
      // The force of boundary repulsion is the surface (volume) of the babble INSIDE the other bubble
      // f = areaInside * unionLine / 2PI
      /*float sT2 = d2*h;                      // triangle formed by collision in bubble2 
       float S2 = acos(d2/r2)*sq(r2)-sT2;     // surface of circle2 inside circle1
       float A1 = acos(d1/r1);                // colliding LINE of circle1 (affected arc -or surface if 3D)
       f=(A1/TWO_PI)*S2;                      // acceleration
       f*=elasticity;*/
      // another calculation: unionLine * surfaceTension
      float A=acos(d1/r1);
      float B=acos(-d2/r2);
      f=sin(A-B)*cos(A-B)/abs(cos(A-B));
      f*=2*sq(h); // two ends of the frontier straight line
      f*=elasticity;
      //if (r1>r2) f*=-1;
    }
    //}
    //if (f!=0) println(" r1="+r1 + " r2="+r2 + " d="+d +" S2="+S2 +" f="+f);
    return f;
  }// END OF boundaries

  void boundaryEvents(Bubble b) {
    // BOUNDARY EVENTS
    float d=distance(b);
    float r1=pRadius; // 1=present Bubble; 2=the other Bubble
    float r2=b.pRadius;
    float x0=pX-pSX; 
    float y0=pY-pSY;
    float bx0=b.pX-b.pSX; 
    float by0=b.pY-b.pSY;
    float d0=dist(x0, y0, bx0, by0);
    float energyTransfer=0.5;
    if (r1+r2-d>=1*r2 && r1+r2-d0<1*r2) { // bubble1 has COVERED bubble2
      //println("bubble "+r1 +" has COVERED bubble "+r2);
      //pRadius+=b.pRadius;
    }
    if (r1+r2-d0>=1*r2 && r1+r2-d<1*r2) { // bubble1 has UNCOVERED bubble
      //println("bubble "+r1 +" has UNCOVERED bubble "+r2);
      //pRadius-=b.pRadius;
    }
    if (r1+r2-d>=1*r1 && r1+r2-d0<1*r1) { // bubble1 has got IN bubble2
      //float eT=energyTransfer*(1/2)*sqrt((sq(pSX)+sq(pSY)));
      float eT=energyTransfer*(1/2)*mass()*(sq(pSX)+sq(pSY));
      float velVar1 = sqrt(2*eT/mass());
      float velVar2 = sqrt(2*eT/b.mass());
      //b.pSX+=velVar2;
      //b.pSY+=velVar2;
      //pSX-=velVar1;
      //pSY-=velVar1;
      //println("bubble "+r1 +" has got IN bubble "+r2 +" sqrt((sq(pSX)+sq(pSY)))="+sqrt((sq(pSX)+sq(pSY))) +" velVar1="+velVar1 +" velVar2="+velVar2);
    }
    if (r1+r2-d0>=1*r1 && r1+r2-d<1*r1) { // bubble1 has got OUT bubble2
      //println("bubble "+r1 +" has got OUT bubble "+r2);
      //float eT=energyTransfer*(1/2)*sqrt(sq(pSX)+sq(pSY))/0.9;
      float eT=energyTransfer*(1/2)*mass()*(sq(pSX)+sq(pSY));
      float velVar1 = sqrt(2*eT/mass());
      float velVar2 = sqrt(2*eT/b.mass());
      //println(" energyTransferOUT="+eT +" velVar1="+velVar1 +" velVar2 ="+velVar2 );
      //b.pSX-=velVar2;
      //b.pSY-=velVar2;
      //pSX+=velVar1;
      //pSY+=velVar1;
    }
  }

  void accelerate(float dSX_, float dSY_) {
    pSX+=dSX_;
    pSY+=dSY_;
  }

  float electricalField(float x_, float y_) {
    float f=0;
    float x = dist(pX, pY, x_, y_);
    float Re = pRadius * 0.8;
    float K=electricalStrength;
    float Q=pCharge; 
    f=(K*Q/sq(x));
    //f/=(Re/x-1)*7;
    //f= Re==x? 0 : f/(1-Re/x)*7;
    f= x<Re? 0 : f;
    return f;
  }// END OF electricalField
  float nuclearField(float x_, float y_) {
    float f=0;
    float x = dist(pX, pY, x_, y_);
    float Ri = pRadius * 0.2;
    float Re = pRadius * 0.8;
    float M = mass();
    f= x==Ri? 0 : -(pow(sin((x-Ri)*2.5/(Re-Ri)), 6) / pow((x-Ri)*2.5/(Re-Ri), 6));
    f=f*M*nuclearStrength;
    return f;
  }//END OF nuclearField
  float chemicalField(float x_, float y_) {
    float f=0;
    float x = dist(pX, pY, x_, y_);
    float Ri = pRadius * 0.8;
    float Re = pRadius * 1.0;
    float M = mass();
    f= x==Ri? 0 : -(pow(sin((x-Ri)*2.5/(Re-Ri)), 4) / pow((x-Ri)*2.5/(Re-Ri), 4));
    f=f*M*chemicalStrength;
    return f;
  }//END OF chemicalField



  // PROPERTIES RELATED TO OTHER BUBBLES
  float penetration(Bubble b) { // penetration of on i circle inside j circle and viceversa
    float p=0;
    p = max(pRadius+b.pRadius-distance(b), 0);
    return p;
  }
  float distance(Bubble b) { // distance between i and j. It has NO SIGN.
    return sqrt(sq(pX-b.pX)+sq(pY-b.pY));
  }
  float distanceX(Bubble b) { // distance between i and j. It has a SIGN.
    return pX-b.pX;
  }
  float distanceY(Bubble b) { // distance between i and j. It has a SIGN.
    return pY-b.pY;
  }
  float penetrationL() { // penetration of one circle inside the LEFT side of the walls, etc.
    float p=0;
    p=min(pX-pRadius-convertToRealX(0), 0);
    return p;
  }

  float penetrationR() { // penetration of one circle inside the LEFT side of the walls, etc.
    float p=0;
    p=max(pRadius+pX-convertToRealX(width), 0);
    return p;
  }

  float penetrationD() { // penetration of one circle inside the LEFT side of the walls, etc.
    float p=0;
    p=min(pY-pRadius-convertToRealY(height), 0);//
    return p;
  }

  float penetrationU() { // penetration of one circle inside the LEFT side of the walls, etc.
    float p=0;
    p=max(pRadius+pY-convertToRealY(0), 0);
    return p;
  }



  // OBJECT DERIVED PROPERTIES

  float mass() {
    return PI*sq(pRadius);
  }

  float kineticEnergy() { 
    return (1/2)*mass()*sq(speed());
  }

  float speed() { 
    return sqrt(sq(pSX)+sq(pSY));
  }

  float sign() {
    float s=0;
    if (pCharge!=0) {
      s=pCharge/abs(pCharge);
    }
    return s;
  }


  // CHANGE OF COORDINATE SYSTEM
  float sRadius() {
    return convertToGraphX(pRadius);
  }
  float sX() {
    return convertToGraphX(pX);
  }
  float sSX() {
    return pSX/graphicZoom;
  }
  float gravityAsX() {
    return gravityAX()/graphicZoom;
  }
  float mechanicalAsX() {
    return mechanicalAX()/graphicZoom;
  }
  float nuclearAsX() {
    return nuclearAX()/graphicZoom;
  }
  float chemicalAsX() {
    return chemicalAX()/graphicZoom;
  }
  float electricalAsX() {
    return electricalAX()/graphicZoom;
  }

  float sY() {
    return convertToGraphY(pY);
  }
  float sSY() {
    return -pSY/graphicZoom;
  }
  float gravityAsY() {
    return -gravityAY()/graphicZoom;
  } // this cas is negative because gravity to Earth is defined as negative
  float mechanicalAsY() {
    return -mechanicalAY()/graphicZoom;
  }
  float nuclearAsY() {
    return -nuclearAY()/graphicZoom;
  }
  float chemicalAsY() {
    return -chemicalAY()/graphicZoom;
  }
  float electricalAsY() {
    return -electricalAY()/graphicZoom;
  }

  float gravityAX() {    // HORIZONTAL GRAVITY
    return 0;
  }
  float gravityAY() {    // VERTICAL GRAVITY
    return gravity;
  }

  float electricalAX() {
    float aX = 0;
    for (int i=0; i<num; i++) {
      if (i!=pNum) {
        aX += electricalAnX(i);
      }
    }
    return aX;
  }
  float electricalAY() {
    float aY = 0;
    for (int i=0; i<num; i++) {
      if (i!=pNum) {
        aY += electricalAnY(i);
      }
    }
    return aY;
  }
  float electricalAnX(int m) {
    float x=pX;
    float y=pY;
    float acceleration =  bubble[m].electricalField(x, y) / mass();
    acceleration*=sign();
    return acceleration * distanceX(bubble[ m]) / distance(bubble[m]);
  }
  float electricalAnY(int m) {
    float x=pX;
    float y=pY;
    float acceleration =  bubble[m].electricalField(x, y) / mass();
    acceleration*=sign();
    return acceleration * distanceY(bubble[ m]) / distance(bubble[m]);
  }

  float nuclearAX() {
    float aX = 0;
    for (int i=0; i<num; i++) {
      if (i!=pNum) {
        aX += nuclearAnX(i);
      }
    }
    return aX;
  }
  float nuclearAY() {
    float aY = 0;
    for (int i=0; i<num; i++) {
      if (i!=pNum) {
        aY += nuclearAnY(i);
      }
    }
    return aY;
  }
  float nuclearAnX(int m) {
    float x=pX;
    float y=pY;
    float acceleration =  bubble[m].nuclearField(x, y) / mass();
    return acceleration * distanceX(bubble[m]) / distance(bubble[m]);
  }
  float nuclearAnY(int m) {
    float x=pX;
    float y=pY;
    float acceleration =  bubble[m].nuclearField(x, y) / mass();
    return acceleration * distanceY(bubble[m]) / distance(bubble[m]);
  }

  float chemicalAX() {
    float aX = 0;
    for (int i=0; i<num; i++) {
      if (i!=pNum) {
        aX += chemicalAnX(i);
      }
    }
    return aX;
  }
  float chemicalAY() {
    float aY = 0;
    for (int i=0; i<num; i++) {
      if (i!=pNum) {
        aY += chemicalAnY(i);
      }
    }
    return aY;
  }
  float chemicalAnX(int m) {
    float x=pX;
    float y=pY;
    float acceleration =  bubble[m].chemicalField(x, y) / mass();
    return acceleration * distanceX(bubble[ m]) / distance(bubble[m]);
  }
  float chemicalAnY(int m) {
    float x=pX;
    float y=pY;
    float acceleration =  bubble[m].chemicalField(x, y) / mass();
    return acceleration * distanceY(bubble[ m]) / distance(bubble[m]);
  }

  float mechanicalAX() {
    float aX = 0;
    for (int i=0; i<num; i++) {
      if (i!=pNum) {
        aX += mechanicalAnX(i);
      }
    }
    return aX;
  }
  float mechanicalAY() {
    float aY = 0;
    for (int i=0; i<num; i++) {
      if (i!=pNum) {
        aY += mechanicalAnY(i);
      }
    }
    return aY;
  }
  float mechanicalAnX(int m) {
    // NUCLEAR FORCE
    float x=pX;
    float y=pY;
    float acceleration =  bubble[m].boundaries(this) / mass(); 
    return acceleration * distanceX(bubble[m]) / distance(bubble[m]);
  }
  float mechanicalAnY(int m) {
    // NUCLEAR FORCE
    float x=pX;
    float y=pY;
    float acceleration =  bubble[m].boundaries(this) / mass();
    return acceleration * distanceY(bubble[ m]) / distance(bubble[m]);
  }

  float wallMechanicalAX() { // MECHANICAL FORCE FROM LEFT AND RIGHT WALLS
    float wM= -10*elasticityWall*(penetrationL()+penetrationR());
    pX-=(penetrationL()+penetrationR());
    return wM;
  }
  float wallMechanicalAY() { // MECHANICAL FORCE FROM UP AND DOWN WALLS
    float wM= -10*elasticityWall*(penetrationD()+penetrationU());
    pY-=(penetrationD()+penetrationU());
    return wM;
  }


  void display() {

    int strokeType=0; //5
    fill (pBodyColor, 80);
    noStroke();

    if (drawObject) {
      // CIRCLE
      if (parameterBlink(radiusS)==0) { // parameterBlink returns 1 when the particular selection parameter is OFF, and ON/OFF every 500 miliseconds otherwise
        strokeType=parameterBlink(radiusS);
        stroke((1-strokeType)*240);
        strokeWeight(3);
        ellipse ( sX(), sY(), sRadius()*2, sRadius()*2);
      }

      if (parameterBlink(circleS)==1) {
        if (drawOuterCircle) {
          stroke(pBodyColor, 160);
          strokeWeight(1);
        } else {
          noStroke();
        }
        ellipse ( sX(), sY(), sRadius()*2, sRadius()*2);
      }
    }

    if (drawCenter) {
      // CENTER POINT
      strokeType=parameterBlink(chemicalOverlapS);

      strokeWeight(1+2*strokeType);
      stroke(bColor);
      ellipse ( sX(), sY(), pRadius/10, sRadius()/10);
    }

    if (drawShape) {
      // SHAPES
      strokeType=parameterBlink(drawShapeS);

      beginShape();

      stroke(pBodyColor*strokeType);
      strokeWeight(1);

      float x=sX(), y=sY();
      float radius=pRadius;
      float sides=abs(pCharge);

      float w=frameCount%(10*num)*TWO_PI/num;
      int step=1;
      if (sides==0) {
        ellipse(x, y, radius, radius);
      } else if (sides==1) {
        line(x, y-radius*cos(w)/2, x, y+radius*sin(w)/2);
      } else if (sides==2) {
        line(x-sin(w)*radius/2, y+cos(w)*radius/2, x, y);
        line(x+sin(w)*radius/2, y+cos(w)*radius/2, x, y);
      } else if (sides%2==1) {
        step=floor(sides/2);
        for (int i=0; i<sides; i++) {
          vertex(x+sin(((step*i)+w)*TWO_PI/sides)*radius, y+cos(((step*i)+w)*TWO_PI/sides)*radius);
        }
      } else {
        step=1;
        for (int i=0; i<sides; i++) {
          vertex(x+sin(((step*i)+w)*TWO_PI/sides)*radius, y+cos(((step*i)+w)*TWO_PI/sides)*radius);
        }
      }

      endShape(CLOSE);
    }


    if (drawLines) {
      // LINES
      float x1, y1, x2, y2;

      x1=sX();
      y1=sY();
      strokeWeight(1);
      int square=width/5;
      int gap=square/2;

      // Gravity lines
      strokeType=parameterBlink(gravityS);
      x2=x1+10*gravityAsX();
      y2=y1+10*gravityAsY();//!!transformation of acceleration is not correct. Should invert the sign of gravityAY
      stroke(240*strokeType, 127*strokeType, 127*strokeType, 255*strokeType);
      strokeWeight(1);
      line(x1, y1, x2, y2);
      ellipse(x2, y2, 10, 10);

      // Mechanical force lines
      strokeType = parameterBlink(elasticityS);
      x2=x1+10*mechanicalAsX();
      y2=y1+10*mechanicalAsY();
      //g(" n="+n +" x1y1=("+x1 +","+y1 +") oMA="+mechanicalAsX() +","+mechanicalAsY(), 0, false);
      stroke(0*strokeType, 240*strokeType, 240*strokeType, 255*strokeType);
      strokeWeight(1);
      line(x1, y1, x2, y2);
      ellipse(x2, y2, 10, 10);

      // Mechanical force lines of the walls

      if (drawWallLines) {
        float Ax=wallMechanicalAX();
        float Ay=wallMechanicalAY();
        if (Ax!=0 || Ay!=0) {
          x1=sX();
          y1=sY();
          x2=x1+10*convertToGraphAX(Ax); 
          y2=y1+10*convertToGraphAY(Ay);
          stroke(0, 127);
          strokeWeight(3);
          line(x1, y1, x2, y2);
          ellipse(x2, y2, 10, 10);
          strokeWeight(1);
        }
      }

      // lines of nuclear force

      strokeType=parameterBlink(nuclearStrengthS);

      x2=x1+10*nuclearAsX();
      y2=y1+10*nuclearAsY();
      stroke(255*strokeType, 255*strokeType, 0*strokeType, 255*strokeType);
      strokeWeight(1);
      line(x1, y1, x2, y2);
      ellipse(x2, y2, 10, 10);

      // lines of chemical force

      strokeType=parameterBlink(chemicalStrengthS);

      x2=x1+10*chemicalAsX();
      y2=y1+10*chemicalAsY();
      stroke(255*strokeType, 0*strokeType, 255*strokeType, 255*strokeType);
      strokeWeight(1);
      line(x1, y1, x2, y2);
      ellipse(x2, y2, 10, 10);

      // lines of electrical force

      strokeType=parameterBlink(electricalStrengthS);

      x2=x1+10*electricalAsX();
      y2=y1+10*electricalAsY();
      stroke(240*-sign()*strokeType, 0*strokeType, 240*sign()*strokeType, 255*strokeType);
      strokeWeight(1);
      line(x1, y1, x2, y2);
      ellipse(x2, y2, 10, 10);
    }
  }
}

