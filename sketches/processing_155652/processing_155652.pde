
/* Creative Coding
 
 JuLY 26 2014 - nanoBubblesLive v.01 FEEDING RELEASE
 by Julio Montabes
 Copyright (c) 2014 Julio Montabes
 
 This program draws objects called nanoBubbles that act according to the influence of
 different forces and events inspired in nature (gravitational, electrical, strong force, chemical
 forces, collisions, breaking impacts, etc.
 
 I am adding different behaviours in the nanoBubbles related to Life. They feed and reproduce.
 The conditions for feeding are simple so far. 
 - They eat each other of different absolute charge. Since the bubble pattern is related to charge, 
 I have chosen charge as the species differentiation.  Also when de first bubble population is created, 
 charge is established as a random number between relatively low natural numbers. So there not infitine 
 species, just several of them so we can follow  its evolution.
 - And the bigger eats the smaller
 - And the mouth (a smaller circle around the center point of the bubble) of the eating bubble must be 
 inside the body of the eated one.
 Feeding transfers matter from one, the eated, to the other, the eating bubble, and usually, but not 
 always, ends with the death (pfRadius=0) of one bubble. This will be developed.
 The conditions for reproducing are also simple, for the moment.. if
 - Their mutual centers must be inside each other,
 - They are the same absolute charge,
 - The reproducing one is bigger
 - The reproducing one ins bigger than one minimum maturity radius. 
 If this condition misses there is an interesting reproductive pattern! THE ONE OF THIS VERSION.
 - They are older than a minimun genetic age to reproduce, established as a property of the bubble when created.
 Reproduction implies the creation of new bubbles of same species, alleatory sign, and a size defined by a 
 character of the specie slightly modified randomly in the birth (or creation in the first generation) of the bubble.
 
 It is surprising the variety of outcomes that can come out of those several biological rules in combination
 with the several physical rules that were the basis of previous versions of nanoBubbles.
 
 
 <.. ON DEVELOPMENT ..>
 DblClick- Resets the bubbles
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
 
 
 "nanoBubblesLive" by Julio Montabes, licensed under Creative Commons Attribution-Share Alike 3.0 and GNU GPL license.
 Work: http://openprocessing.org/visuals/?visualID= 155492  
 License: 
 http://creativecommons.org/licenses/by-sa/3.0/
 http://creativecommons.org/licenses/GPL/2.0/ 
 
 */

// PARAMETERS
float frames=10;
int giIniNum=40;
int giNum=giIniNum;
int giMaxNum=50;
int giMaxRad=50;
int giMinRad=10;
int giDieRad=2.5*giMaxRad;
int maxInitialSpeed=50;
float gfLifExp=600000; //240000;

// PHYSICAL PARAMETERS
float elasticityWall=0.2;
float elasticity = 4;// 3000; //500000; // Factor of elasticity of the virtual matter of the balls.
float gravity=-0.0;
float electricalStrength=50000; //50; //300000; //500000; //1000000;
float chemicalStrength=0.5; //0.7;//50;//30; 
float nuclearStrength=0.3; //0.4;//80;//50; //50; 
float chemicalOverlap=1.00; // overlap of a circle when a chemical reaction happens
float nuclearOverlap=2.00; 
float speedOfLight=300; // max speed of anything. It is calculated as the average speed between frames that "does not escape from our universe"

// OBJECT
Bubble[] bubble = new Bubble[giNum];
color bColor = color(60);

// DISPLAY PARAMETERS
boolean drawObject = true;
boolean drawOuterCircle = true; 
boolean drawCenter = true;
boolean drawShape = true;
boolean drawLines = false;
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
int   lastNum=giNum;
int   lastMaxRadius = giMaxRad;
int   lastMinRadius = giMinRad;
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
int giNumS = 18;


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

// ..TEXT..
PFont myFont=createFont("Tahoma", 32);
//

// ..IMAGE..
PImage myImg;

void setup() {  //setup function called initially, only once
  dbg("setup()", 0, false);
  size(900, 600);
  colorMode(RGB);   //set colors to Hue, Saturation, Brightness mode
  frameRate(frames);
  randomSeed(year()+month()+day()+hour()+minute()+second()+millis());


  //
  textFont(myFont);
  //

  //
  myImg=loadImage("outImage.jpg");
  //

  resetCollection();
  drawCollection();
}

void draw() {  //draw function loops
  if (refreshImage || clickNumber()==1) {
    dbg("draw() -> ENTRANCE", 0, false);
    if (cleanBackground) {
      background(bColor);
      tint(255, 200);
      //image(myImg, 0, 0);
    }
    updateCollection();
    drawCollection();
    ///writePostcard();
  }
}

color oppositeColor(float x, float y) {
  pixCol=pixels[y*width+x];
  pixCol=color(255-red(pixCol), 255-green(pixCol), 255-blue(pixCol));
  return pixCol;
}

void writePostcard() {
  float x=width/20;
  float y=height/10;
  color pixCol;
  loadPixels();

  y+=50;
  textSize(50);
  fill(oppositeColor(x, y), 100);
  String greetingText="Hey guys!";
  text(greetingText, x, y);

  y+=60;
  textSize(30);
  fill(oppositeColor(x, y), 100);
  String greetingText="I hope you have enjoyed this course as much as I have.";
  text(greetingText, x, y);

  y+=50;
  textSize(30);
  fill(oppositeColor(x, y), 100);
  String greetingText="I leave you with my nanoBubbles which are the creatures";
  text(greetingText, x, y);

  y+=50;
  textSize(30);
  fill(oppositeColor(x, y), 100);
  String greetingText="I have learnt to love (ha ha!)";
  text(greetingText, x, y);

  y+=60;
  textSize(40);
  fill(oppositeColor(x, y), 100);
  String greetingText="Julio Montabes";
  text(greetingText, x, y);

  y+=70;
  textSize(20);
  fill(oppositeColor(x, y), 100);
  String greetingText="From Parc Güell in Barcelona for Creative Coding students. July 2014";
  text(greetingText, x, y);

  y+=90; 
  x+=250;
  textSize(20);
  fill(oppositeColor(x, y), 100);
  String greetingText=".. DblClick - Restart";
  text(greetingText, x, y);
  y+=30;
  textSize(20);
  fill(oppositeColor(x, y), 100);
  String greetingText=".. Click - To catch and drag a bubble";
  text(greetingText, x, y);
  y+=30;
  textSize(20);
  fill(oppositeColor(x, y), 100);
  String greetingText=".. You can also use letters b c/C d e/E f/F g/G l n/N r/R s and t";
  text(greetingText, x, y);
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
  for (int i=0; i<giNum; i++) {
    if (bubble[i].pbClicked) {
      n=i;
    }
  }
  return n;
}


int objectDoubleClicked() {
  int n=-1;
  if (clickCounter==0) {
    for (int i=0; i<giNum; i++) {
      if (bubble[i].pbClicked) {
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
  for (int i=0; i<giNum; ++i) {
    bubble[i].pbClicked=false;
    //bubble[i].pClickedX=0;
    //bubble[i].pClickedY=0;
    bubble[i].pvCli.set(0, 0);
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
      giNum=giIniNum;
      resetCollection ();
      drawCollection();

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
}// END OF mouseClicked


void mousePressed() {
  if (noObjectClicked==true) {
    for (int i=0; i<giNum; ++i) {
      if (bubble[i].sX()-bubble[i].sRadius()<mouseX && mouseX<bubble[i].sX()+bubble[i].sRadius() && bubble[i].sY()-bubble[i].sRadius()<mouseY && mouseY<bubble[i].sY()+bubble[i].sRadius()) {
        bubble[i].pbClicked=true;
        bubble[i].pvCli.set(bubble[i].pvPos.x-bubble[i].CTRx(mouseX), bubble[i].pvPos.y-bubble[i].CTRy(mouseY));
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
      for (int i=0; i<giNum; ++i) {
        if (bubble[i].pbClicked==true) {
          bubble[i].piCharge-=1;
          if (messageDisplay) println("bubble["+i+"].piCharge="+bubble[i].piCharge);
        }
      }
    }
    break;
  case 'C':
    if (noObjectClicked==false) {
      for (int i=0; i<giNum; ++i) {
        if (bubble[i].pbClicked==true) {
          bubble[i].piCharge+=1;
          if (messageDisplay) println("bubble["+i+"].piCharge="+bubble[i].piCharge);
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
    //giNum-=1;
    decreasePopulation();
    //deleteBubble(giNum-1);
    if (messageDisplay) println("giNum="+giNum);
    break;
  case 'N': // number of circles
    //giNum+=1;
    increasePopulation();
    if (messageDisplay) println("giNum="+giNum);
    break;
  case 'r':
    if (noObjectClicked==false) {
      for (int i=0; i<giNum; ++i) {
        if (bubble[i].pbClicked==true) {
          bubble[i].pfRadius*=0.9;
          bubble[i].pfMouthRadius*=0.9;
          bubble[i].pfBirthRadius*=0.9;
          bubble[i].pfMaturityRadius*=0.9;
          if (messageDisplay) println("bubble["+i+"].pRadius="+bubble[i].pfRadius);
        }
      }
    } else {
      for (int i=0; i<giNum; ++i) {
        bubble[i].pfRadius*=0.9;
        bubble[i].pfMouthRadius*=0.9;
        bubble[i].pfBirthRadius*=0.9;
        bubble[i].pfMaturityRadius*=0.9;
      }
    }
    break;
  case 'R':
    if (noObjectClicked==false) {
      for (int i=0; i<giNum; ++i) {
        if (bubble[i].pbClicked==true) {
          bubble[i].pfRadius*=1.1;
          bubble[i].pfMouthRadius*=1.1;
          bubble[i].pfBirthRadius*=1.1;
          bubble[i].pfMaturityRadius*=1.1;
          if (messageDisplay) println("bubble["+i+"].pfRadius="+bubble[i].pfRadius);
        }
      }
    } else {
      for (int i=0; i<giNum; ++i) {
        bubble[i].pfRadius*=1.1;
        bubble[i].pfMouthRadius*=1.1;
        bubble[i].pfBirthRadius*=1.1;
        bubble[i].pfMaturityRadius*=1.1;
      }
    }
    break;
  case 's':
    saveFrame("NBalls.jpg");
    break;
  case 't': // gives the table of circles
    if (messageDisplay) println("");
    if (messageDisplay) println("");
    for (int i=0; i<giNum; ++i) {
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
    //cleanConsole();
    println("");
    break;
  }
}

void mouseWheel(MouseEvent event) {
  float e = event.getCount();
  gravity+=0.1*e;
  if (messageDisplay) println("gravity="+gravity);
}


/*   USER FUNCTIONS    */



void increasePopulation() {
  Bubble[] bubble2 = new Bubble[giNum+1];
  for (int i=0; i<giNum; i++) {
    bubble2[i]=bubble[i];
  }

  bubble = new Bubble[giNum+1];

  for (int i=0; i<giNum; i++) {
    bubble[i]=bubble2[i];
  }
  createBubble(giNum);
  giNum+=1;
}

void decreasePopulation() {
  Bubble[] bubble2 = new Bubble[giNum-1];
  for (int i=0; i<giNum-1; i++) {
    bubble2[i]=bubble[i];
  }

  bubble = new Bubble[giNum-1];

  for (int i=0; i<giNum-1; i++) {
    bubble[i]=bubble2[i];
  }
  giNum-=1;
}


void deleteBubble(int i) {
  bubble[i].pbAlive=false;
  compressPopulation();
}


int getFreeBubbleNumber() {
  int j=-1;
  int i=-1;
  while (j==-1 && i<giNum-1) {
    i++;
    if (bubble[i].pfRadius<=giMinRad) {//@
      j=i;
    }
  }
  return j;
}

float population() {
  float s=0;
  for (int i=0; i<giNum; ++i) {
    if (bubble[i].pbAlive) {
    s++;
    }
  }
  return s;
}

float sumOfMass() {
  float s=0;
  for (int i=0; i<giNum; ++i) {
    s+=bubble[i].mass();
  }
  return s;
}

void createBubble(int i) {
  float x=random (width);
  float y=random (height);
  float sX=random (-maxInitialSpeed, maxInitialSpeed);
  float sY=random (-maxInitialSpeed, maxInitialSpeed);
  float radius=random (giMinRad, giMaxRad);
  //float radius=min(10*giMaxRad*(1/random (1, 100)), giMaxRad);
  color bodyColor=color (random (100, 150), random (100, 150), random (100, 150));
  //int charge=(int) map(radius, giMinRad, giMaxRad, -7, 7);
  int charge=(int) random(-9, 10);
  boolean clicked=false;
  float clickedX=0;
  float clickedY=0;

  boolean alive=true;
  float mouthRadius=0.1*radius*random(0.95, 1.05);
  float birthRadius=giMinRad*random(0.95, 1.05);
  float maturityRadius=(1/2)*(giMaxRad+giMinRad)*random(0.95, 1.05);
  float maturityAge=(1/3)*gfLifExp*random(0.95, 1.05); // maturity time in minutes
  float sexRadius=random(0.95, 1.05)*0.8;
  float fLifExp=gfLifExp*random(0.95,1.05);
  float dateOfBirth=millis() - random(0, fLifExp/2);
  bubble[i]= new Bubble(i, x, y, sX, sY, radius, bodyColor, charge, clicked, clickedX, clickedY, alive, mouthRadius, birthRadius, maturityRadius, maturityAge, sexRadius, fLifExp, dateOfBirth);
}

void resetCollection() {
  for (int i=0; i <giNum; ++i) {
    createBubble(i);
  }
}


void compressPopulation() { // under construction
  populationChanged=false;
}// END OF compressPopulation

boolean populationChanged=false;

void updateCollection() {
  if (populationChanged) {
    compressPopulation();
  }
  for (int i=0; i<giNum; ++i) {
    bubble[i].interact(bubble);
    bubble[i].move();
    bubble[i].feed(bubble);
    bubble[i].reproduce(bubble);
    bubble[i].die();
  }
} // END OF updateCollection


void drawCollection() {
  for (int i=0; i <giNum; ++i) {
    if (bubble[i].pfRadius>0) {
      bubble[i].display();
    }
  }
} // END OF drawCollection


void  saveLastParameters() {
  lastElasticity = elasticity;
  lastGravity = gravity;
  lastElectricalStrength = electricalStrength;
  lastChemicalStrength = chemicalStrength;
  lastNuclearStrength = nuclearStrength;
  lastChemicalOverlap = chemicalOverlap;
  lastNuclearOverlap = nuclearOverlap; 
  lastFrames = frames;
  lastNum=giNum;
  lastMaxRadius = giMaxRad;
  lastMinRadius = giMinRad;
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

void reportObjects() {
  println (" reportObjects giNum="+giNum);
  for (int i=0; i<giNum; i++) {
    reportObject(i);
  }
}
void reportObject(int i) {
  //if (bubble[i].pbAlive) {
  println("   "+i +"  xy="+bubble[i].pvPos +"  V="+bubble[i].pvVel );
  println("      G="+bubble[i].gravityAX()+"/"+bubble[i].gravityAY()+" Mc="+bubble[i].mechanicalAX()+"/"+bubble[i].mechanicalAY()+" E="+bubble[i].electricalAX()+"/"+bubble[i].electricalAY()+" ChF="+bubble[i].chemicalAX()+"/"+bubble[i].chemicalAY()+" NF="+bubble[i].nuclearAX()+"/"+bubble[i].nuclearAY());
  println("      Rad="+bubble[i].pfRadius +"  mRad="+bubble[i].pfMouthRadius +"  bRad="+bubble[i].pfBirthRadius +"  mRad="+bubble[i].pfMaturityRadius +"  Alive="+bubble[i].pbAlive );
  //println("              getFreeBubbleNumber()="+getFreeBubbleNumber() );
  //}
}

void reportAccelerations() {
  println("   FORCES: Gr="+gravity +" Mec="+elasticity +" Elec="+electricalStrength +" Chem="+chemicalStrength +" Nuc="+nuclearStrength );
}

void reportParameters() {
  println("   PHYSICAL par: frames="+frames, " giNum="+giNum, " giMaxRad="+giMaxRad, " giMinRad="+giMinRad, " maxInitialSpeed="+maxInitialSpeed);
  println("   DISPLAY par:  drawObject="+drawObject, " drawCenter="+drawCenter, " drawShape="+drawShape, " drawLines="+drawLines, " drawWallLines="+drawWallLines, " refreshImage="+refreshImage, " cleanBackground="+cleanBackground);
  println("   DEBUG par:    debugDisplay="+debugDisplay +" messageDisplay="+messageDisplay);
}


// OBJECT PROPERTIES

float graphicCenterX = 0;
float graphicCenterY = 0;
float graphicZoom=1; // when high each pixel is equal to few physical units, when low the other way around


int parameterBlink(int e) {
  if (parameter==e) {
    return (millis()/500)%2;
  } else {
    return 1;
  }
} // END OF parameterBlink

class Bubble {
  // instance variables
  int piNum;
  int piCharge;

  float pfRadius;

  color pcBodyColor;

  boolean pbClicked;

  PVector pvPos = new PVector(0, 0);
  PVector pvVel = new PVector(0, 0);
  PVector pvCli = new PVector(0, 0);

  PVector pvNucAcc = new PVector(0, 0);
  PVector pvCheAcc = new PVector(0, 0);
  PVector pvEleAcc = new PVector(0, 0);
  PVector pvGraAcc = new PVector(0, 0);
  PVector pvHumAcc = new PVector(0, 0);
  PVector pvWalAcc = new PVector(0, 0);
  PVector pvMecAcc = new PVector(0, 0);

  //PImage pImage;
  boolean pbAlive;
  float pfMouthRadius;
  float pfBirthRadius;
  float pfMaturityRadius;
  float pfMaturityAge;
  float pfSexRadius;
  float pfSexAlpha;
  float pfDateOfBirth; // in milliseconds
  float pfLifExp; // in milliseconds


  // CONSTRUCTOR

  //Bubble(int num_, float x_, float y_, float sX_, float sY_, float radius_, color bodyColor_, int charge_, boolean clicked_, float clickedX_, float clickedY_ ) {
  Bubble(int num_, float x_, float y_, float sX_, float sY_, float radius_, color bodyColor_, int charge_, boolean clicked_, float clickedX_, float clickedY_, boolean alive_, float mouthRadius_, float birthRadius_, float maturityRadius_, float maturityAge_, float sexRadius_, float fLifExp_, float dateOfBirth_ ) {
    piNum=num_; 
    pvPos.x=x_; 
    pvPos.y=y_; 
    pvVel.x=sX_; 
    pvVel.y=sY_; 
    pfRadius=radius_; 
    pcBodyColor=bodyColor_; 
    piCharge=charge_; 
    pvCli.x=clickedX_; 
    pvCli.y=clickedY_;
    pbClicked=clicked_;
    pbAlive = alive_;
    pfMouthRadius = mouthRadius_;
    pfBirthRadius = birthRadius_;
    pfMaturityRadius = maturityRadius_;
    pfMaturityAge = maturityAge_;
    pfSexRadius = sexRadius_;
    pfDateOfBirth = dateOfBirth_; //millis();
    pfLifExp=fLifExp_;
    pfSexAlpha = random(0, TWO_PI);
  }
  Bubble() { // DEFAULT CONSTRUCTOR
    piNum=pcBodyColor=piCharge=0;
    //pX=pY=pbClickedX=pbClickedY=0;
    pvCli.set(0, 0);
    pvPos.set(0, 0);
    pvVel.set(0, 0);
    pbClicked=false;
    pbAlive=true;
    pfMouthRadius = 10;
    pfBirthRadius = 20;
    pfMaturityRadius = 50;
    pfMaturityAge = 5;
    pfSexRadius = 0.8;
    pfDateOfBirth = millis();
    pfLifExp = 120000; // life expectancy in milliseconds
    pfSexAlpha = random(0, TWO_PI);
  }

  void interact(Bubble[] b) {
    if (pfRadius>0 && pbAlive) {
      PVector vIncVel = new PVector(0, 0);

      // Wall collision accelerations...
      pvWalAcc = wallMechanicalA();
      vIncVel.add(pvWalAcc);

      // Mechanical collisions 
      pvMecAcc = mechanicalA(b);
      vIncVel.add(pvMecAcc);


      // Let's add Earth gravity...
      pvGraAcc = gravityA();
      vIncVel.add(pvGraAcc);

      // Electromagnetic force
      pvEleAcc = electricalA(b);
      vIncVel.add(pvEleAcc);

      // Chemical forces
      //pvCheAcc.set(chemicalAX(b), chemicalAY(b) );
      pvCheAcc = chemicalA(b);
      vIncVel.add(pvCheAcc);

      // Strong nuclear force
      //pvNucAcc.set(nuclearAX(b), nuclearAY(b) );
      pvNucAcc = nuclearA(b);
      vIncVel.add(pvNucAcc);

      // and Human Forces
      if (pbClicked==true) {
        vIncVel.set(-pvVel.x+CTRx(mouseX)-CTRx(pmouseX), -pvVel.y+CTRy(mouseY)-CTRy(pmouseY));
      }

      accelerate(vIncVel);

      for (int j=0; j<giNum; j++) {
        if (j!=piNum) {
          boundaryEvents(b[j]);
        }
      }
    }
  }

  void move() {
    if (pbAlive) {
      pvPos.add(pvVel);
    }
  }

  void die() {
    if (pbAlive) {
      float r=random(0.95, 1.05);
      //if (pfRadius>r*giDieRad || age() > r*pfLifExp) {
      if (age() > r*pfLifExp || pfRadius * 2.2 > height) {
        //println("DIED piNum="+piNum +" pfRadius="+pfRadius +" r*giDieRad="+r*giDieRad +" age()="+age() +" pfLifExp="+pfLifExp );
        pbAlive=false;
        pcBodyColor=color(red(pcBodyColor), 255, blue(pcBodyColor));
      }
    }
  }

  float age() {
    return millis() - pfDateOfBirth;
  }

  void feed(Bubble[] b) {
    if (pbAlive) {
      for (int j=0; j<giNum; j++) {
        if (j!=piNum) {
          feedBubble(bubble[j]);
        }
      }
    }
  }
  void feedBubble(Bubble b) {
    //if (abs(piCharge)!=abs(b.piCharge) ) {
    float d=distance(b);
    if (abs(piCharge)!=abs(b.piCharge) && pfRadius>b.pfRadius && d<b.pfRadius || b.pbAlive==false && d<pfRadius+b.pfRadius ) {
      eat(this, b); // I am eating bubble 'b'
    }
    if (pfRadius<b.pfRadius) {
      if (d<b.pfRadius) { // bubble 'b' is eating me
        //eat(b, this);
      }
    }
    //}
  }
  void eat(Bubble a, Bubble b) {
    float maxBite = min(b.pfRadius, a.pfMouthRadius);
    float bite = sqrt(sq(a.pfRadius)+sq(maxBite)) - a.pfRadius;
    a.pfRadius += bite;
    b.pfRadius-=bite;
    if (b.pfRadius<=a.pfMouthRadius) {
      b.pbAlive=false;
    }
    if (b.pfRadius<=0) {
      populationChanged=true;
    }
  }

  void reproduce(Bubble[] b) {
    if (pbAlive) {
      for (int j=0; j<giNum; j++) {
        if (j!=piNum) {
          reproduceBubble(bubble[j]);
        }
      }
    }
  }

  float randomSign() {
    float rs         = random(-1, 1);
    rs = rs/abs(rs);
    return rs;
  }
  void reproduceBubble(Bubble b) {
    float d=distance(b);
    if (d<pfRadius && d<b.pfRadius && pfRadius>b.pfRadius && abs(piCharge)==abs(b.piCharge) ) { // bubles are reproducing. Sexual reproduction
      if (age()>pfMaturityAge && pfRadius>pfMaturityRadius) { 
        float rR = sqrt(sq(pfRadius) - sq(b.pfRadius));
        if (rR>pfBirthRadius) {
          int iFreNum=getFreeBubbleNumber();
          if (iFreNum==-1) {
            if (giNum<giMaxNum) {
              increasePopulation();
              iFreNum=giNum-1;
              bubble[iFreNum].pfRadius=0;
            }
          }
          if (iFreNum!=-1) {
            //println("SEXUAL REPRODUCTION iFreNum="+iFreNum);
            float alpha = random(0, TWO_PI);

            bubble[iFreNum].pbAlive = true;
            bubble[iFreNum].pfMouthRadius = random(0.99, 1.01) * (pfMouthRadius+b.pfMouthRadius)/2;
            bubble[iFreNum].pfBirthRadius = random(0.95, 1.05)*(pfBirthRadius+b.pfBirthRadius)/2;
            bubble[iFreNum].pfMaturityRadius = random(0.99, 1.01) * (pfMaturityRadius+b.pfMaturityRadius)/2;
            bubble[iFreNum].pfMaturityAge = random(0.99, 1.01) * (pfMaturityAge+b.pfMaturityAge)/2;
            bubble[iFreNum].pfSexRadius = random(0.99, 1.01) * (pfSexRadius+b.pfSexRadius)/2;
            bubble[iFreNum].pfLifExp = random(0.99, 1.01) * (pfLifExp+b.pfLifExp)/2;
            bubble[iFreNum].pfDateOfBirth=millis();

            int r=(int) constrain((red(pcBodyColor)+red(b.pcBodyColor))/2*random(0.50, 1.50), 1, 255);
            int g=(int) constrain((green(pcBodyColor)+green(b.pcBodyColor))/2*random(0.50, 1.50)*random(0.90, 1.10), 1, 255);
            int b=(int) constrain((blue(pcBodyColor)+blue(b.pcBodyColor))/2*random(0.50, 1.50), 1, 255);
            bubble[iFreNum].pcBodyColor = color(r, g, b);

            //bubble[iFreNum].piCharge = piCharge * (int) random(-3, 3) * randomSign();//@
            bubble[iFreNum].piCharge = piCharge * randomSign();

            bubble[iFreNum].pvPos.x = pvPos.x + cos(alpha) * pfSexRadius;//@
            bubble[iFreNum].pvPos.y = pvPos.y + sin(alpha) * pfSexRadius;
            bubble[iFreNum].pvVel.x = pvVel.x;
            bubble[iFreNum].pvVel.y = pvVel.y;
            bubble[iFreNum].pfRadius += bubble[iFreNum].pfBirthRadius;
            bubble[iFreNum].pbClicked = false;
            bubble[iFreNum].pvCli.x=0;
            bubble[iFreNum].pvCli.y=0;

            pfRadius=sqrt(sq(pfRadius)-sq(bubble[iFreNum].pfRadius));
          }
        }
      }
    }
    if (pfRadius>random(0.95, 1.05)*giDieRad) { // asexual reproduction
      int iFreNum=getFreeBubbleNumber();
      if (iFreNum==-1) {
        if (giNum<giMaxNum) {
          increasePopulation();
          iFreNum=giNum-1;
        }
      }
      if (iFreNum!=-1) {
        //println("ASEXUAL REPRODUCTION iFreNum="+iFreNum);
        float alpha = random(0, TWO_PI);

        bubble[iFreNum].pbAlive = true;
        bubble[iFreNum].pfMouthRadius = pfMouthRadius * random(0.99, 1.01);
        bubble[iFreNum].pfBirthRadius = pfBirthRadius * random(0.99, 1.01);
        bubble[iFreNum].pfMaturityRadius = pfMaturityRadius * random(0.99, 1.01);
        bubble[iFreNum].pfMaturityAge = pfMaturityAge * random(0.99, 1.01);
        bubble[iFreNum].pfSexRadius = pfSexRadius * random(0.99, 1.01);
        bubble[iFreNum].pfLifExp =  pfLifExp * random(0.99, 1.01);
        bubble[iFreNum].pfDateOfBirth=millis();

        int r=(int) constrain(red(pcBodyColor)*random(0.50, 1.50), 1, 255);
        int g=(int) constrain(green(pcBodyColor)*random(0.50, 1.50), 1, 255);
        int b=(int) constrain(blue(pcBodyColor)*random(0.50, 1.50), 1, 255);
        bubble[iFreNum].pcBodyColor = color(r, g, b);

        //bubble[iFreNum].piCharge = piCharge * randomSign();
        bubble[iFreNum].piCharge = piCharge * (int) random(-3, 3) * randomSign();//@

        bubble[iFreNum].pvPos.x = pvPos.x + cos(alpha) * pfSexRadius;
        bubble[iFreNum].pvPos.y = pvPos.y + sin(alpha) * pfSexRadius;
        bubble[iFreNum].pvVel.x = pvVel.x;
        bubble[iFreNum].pvVel.y = pvVel.y;
        bubble[iFreNum].pfRadius = bubble[iFreNum].pfBirthRadius;
        bubble[iFreNum].pbClicked = false;
        bubble[iFreNum].pvCli.x=0;
        bubble[iFreNum].pvCli.y=0;
        pfRadius=sqrt(sq(pfRadius)-sq(bubble[iFreNum].pfRadius));
      }
    }
  }






  void accelerate(PVector vIncVel) {
    pvVel.add(vIncVel);
  }



  PVector wallMechanicalA() { // MECHANICAL FORCE FROM UP AND DOWN WALLS
    float wMx= -10*elasticityWall*(penetrationL()+penetrationR());
    pvPos.x-=(penetrationL()+penetrationR());
    float wMy= -10*elasticityWall*(penetrationD()+penetrationU());
    pvPos.y-=(penetrationD()+penetrationU());
    PVector a = new PVector(wMx, wMy);
    return a;
  }

  PVector mechanicalA(Bubble[] b) {
    PVector a = new mechanicalF(b);
    a.div(mass());
    return a;
  }
  PVector mechanicalF(Bubble[] b) {
    PVector a = new PVector(0, 0);
    if (pfRadius>0) {
      for (int i=0; i<giNum; i++) {
        if (i!=piNum && b[i].pfRadius>0) {
          PVector v = new PVector(pvPos.x-b[i].pvPos.x, pvPos.y-b[i].pvPos.y);
          v.mult(b[i].boundaries(this) / v.mag());
          a.add(v);
        }
      }
    }
    return a;
  }

  float boundaries(Bubble b) {
    // MECHANICAL FORCE
    float a=0;
    if (pfRadius!=0 && b.pfRadius!=0) {
      float d=distance(b);
      float r1=pfRadius; // 1=present Bubble; 2=the other Bubble
      float r2=b.pfRadius;
      if (d==0 || r1==0 || r2==0 || d<abs(r1-r2)) {
        a=0;
      } else if (d>r1+r2) {
        a=0;
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
        a = sin(A-B)*cos(A-B)/abs(cos(A-B));
        a *= 2*sq(h); // two ends of the frontier straight line
        a*=elasticity;
      }
    }
    return a;
  }// END OF boundaries

  PVector gravityA() {    // VERTICAL GRAVITY
    PVector a = new PVector(0, gravity);
    return a;
  }
  PVector gravityF() {    // VERTICAL GRAVITY
    return gravityA.mult(mass());
  }

  PVector electricalA(Bubble[] b) {
    PVector a = new electricalF(b);
    a.div(mass());
    return a;
  }
  PVector electricalF(Bubble[] b) {
    PVector a = new PVector(0, 0);
    if (pfRadius>0) {
      for (int i=0; i<giNum; i++) {
        if (i!=piNum && b[i].pfRadius>0) {
          PVector v = new PVector(pvPos.x-b[i].pvPos.x, pvPos.y-b[i].pvPos.y);
          v.mult( b[i].electricalField(pvPos.x, pvPos.y) * sign() / v.mag() );
          a.add(v);
        }
      }
    }
    return a;
  }
  float electricalField(float x_, float y_) {
    float a=0;
    if (pfRadius!=0) {
      float x = dist(pvPos.x, pvPos.y, x_, y_);
      float Re = pfRadius * 0.8;
      float K=electricalStrength;
      float Q=piCharge; 
      a=(K*Q/sq(x));
      a =(x==0 || x<Re)? 0 : a;
    }
    return a;
  }// END OF electricalField

  PVector chemicalA(Bubble[] b) {
    PVector a = new chemicalF(b);
    a.div(mass());
    return a;
  }
  PVector chemicalF(Bubble[] b) {
    PVector a = new PVector(0, 0);
    if (pfRadius>0) {
      for (int i=0; i<giNum; i++) {
        if (i!=piNum && b[i].pfRadius>0) {
          PVector v = new PVector(pvPos.x-b[i].pvPos.x, pvPos.y-b[i].pvPos.y);
          v.mult( b[i].chemicalField(pvPos.x, pvPos.y) / v.mag() );
          a.add(v);
        }
      }
    }
    return a;
  }
  float chemicalField(float x_, float y_) {
    float a=0;
    if (pfRadius!=0) {
      float x = dist(pvPos.x, pvPos.y, x_, y_);
      float Ri = pfRadius * 0.8;
      float Re = pfRadius * 1.0;
      float M = mass();
      a = (x==Ri || Re==Ri)? 0 : -(pow(sin((x-Ri)*2.5/(Re-Ri)), 4) / pow((x-Ri)*2.5/(Re-Ri), 4));
      a *= M * chemicalStrength;
    }
    return a;
  }//END OF chemicalField

  PVector nuclearA(Bubble[] b) {
    PVector a = new nuclearF(b);
    a.div(mass());
    return a;
  }
  PVector nuclearF(Bubble[] b) {
    PVector a = new PVector(0, 0);
    if (pfRadius>0) {
      for (int i=0; i<giNum; i++) {
        if (i!=piNum && b[i].pfRadius>0) {
          PVector v = new PVector(pvPos.x-b[i].pvPos.x, pvPos.y-b[i].pvPos.y);
          v.mult( b[i].nuclearField(pvPos.x, pvPos.y) / v.mag() );
          a.add(v);
        }
      }
    }
    return a;
  }
  float nuclearField(float x_, float y_) {
    float a=0;
    if (pfRadius!=0) {
      float x = dist(pvPos.x, pvPos.y, x_, y_);
      float Ri = pfRadius * 0.2;
      float Re = pfRadius * 0.8;
      float M = mass();
      //a= x==Ri? 0 : -(pow(sin((x-Ri)*2.5/(Re-Ri)), 6) / pow((x-Ri)*2.5/(Re-Ri), 6));
      a = (x==Ri || Re==Ri)? 0 : -(pow(sin((x-Ri)*2.5/(Re-Ri)), 6) / pow((x-Ri)*2.5/(Re-Ri), 6));
      a *= M * nuclearStrength;
    }
    return a;
  }//END OF nuclearField






  void boundaryEvents(Bubble b) {
    // BOUNDARY EVENTS
    float d=distance(b);
    float r1=pfRadius; // 1=present Bubble; 2=the other Bubble
    float r2=b.pfRadius;
    float x0=pvPos.x+pvVel.x; // next x
    float y0=pvPos.y+pvVel.y; // next y
    float bx0=b.pvPos.x+b.pvVel.x; 
    float by0=b.pvPos.y+-b.pvVel.y;
    float d0=dist(x0, y0, bx0, by0);
    float energyTransfer=0.5;
    if (r1+r2-d0>=1*r2 && r1+r2-d<1*r2) { // bubble1 has COVERED bubble2
      //println("bubble "+r1 +" has COVERED bubble "+r2);
      //pfRadius+=b.pfRadius;
    }
    if (r1+r2-d>=1*r2 && r1+r2-d0<1*r2) { // bubble1 has UNCOVERED bubble
      //println("bubble "+r1 +" has UNCOVERED bubble "+r2);
      //pfRadius-=b.pfRadius;
    }
    if (r1+r2-d0>=1*r1 && r1+r2-d<1*r1) { // bubble1 has got IN bubble2
      float eT=energyTransfer*(1/2)*mass()*(sq(pvVel.x)+sq(pvVel.y));
      float velVar1 = sqrt(2*eT/mass());
      float velVar2 = sqrt(2*eT/b.mass());
      //println("bubble "+r1 +" has got IN bubble "+r2 +" sqrt((sq(pvVel.x)+sq(pvVel.y)))="+sqrt((sq(pvVel.x)+sq(pvVel.y))) +" velVar1="+velVar1 +" velVar2="+velVar2);
    }
    if (r1+r2-d>=1*r1 && r1+r2-d0<1*r1) { // bubble1 has got OUT bubble2
      //println("bubble "+r1 +" has got OUT bubble "+r2);
      float eT=energyTransfer*(1/2)*mass()*(sq(pvVel.x)+sq(pvVel.y));
      float velVar1 = sqrt(2*eT/mass());
      float velVar2 = sqrt(2*eT/b.mass());
    }
  }




  // PROPERTIES RELATED TO OTHER BUBBLES
  float penetration(Bubble b) { // penetration of on i circle inside j circle and viceversa
    float p=0;
    p = max(pfRadius+b.pfRadius-distance(b), 0);
    return p;
  }
  float distance(Bubble b) { // distance between i and j. It has NO SIGN.
    return sqrt(sq(pvPos.x-b.pvPos.x)+sq(pvPos.y-b.pvPos.y));
  }
  float distanceX(Bubble b) { // distance between i and j. It has a SIGN.
    return pvPos.x-b.pvPos.x;
  }
  float distanceY(Bubble b) { // distance between i and j. It has a SIGN.
    return pvPos.y-b.pvPos.y;
  }
  float penetrationL() { // penetration of one circle inside the LEFT side of the walls, etc.
    float p=0;
    p=min(pvPos.x-pfRadius-CTRx(0), 0);
    return p;
  }

  float penetrationR() { // penetration of one circle inside the LEFT side of the walls, etc.
    float p=0;
    p=max(pfRadius+pvPos.x-CTRx(width), 0);
    return p;
  }

  float penetrationD() { // penetration of one circle inside the LEFT side of the walls, etc.
    float p=0;
    p=min(pvPos.y-pfRadius-CTRy(height), 0);//
    return p;
  }

  float penetrationU() { // penetration of one circle inside the LEFT side of the walls, etc.
    float p=0;
    p=max(pfRadius+pvPos.y-CTRy(0), 0);
    return p;
  }



  // OBJECT DERIVED PROPERTIES

  float mass() {
    return PI*sq(pfRadius);
  }

  float kineticEnergy() { 
    return (1/2)*mass()*sq(speed());
  }

  float speed() { 
    return sqrt(sq(pvVel.x)+sq(pvVel.y));
  }

  float sign() {
    float s=0;
    if (piCharge!=0) {
      s=piCharge/abs(piCharge);
    }
    return s;
  }


  // CHANGE OF COORDINATE SYSTEM
  float CTGx(float realX) { // CONVERT TO GRAPHIC
    return realX*graphicZoom+graphicCenterX;
  }
  float CTRx(float graphicX) { // CONVERT TO REAL
    return (graphicX-graphicCenterX)/graphicZoom;
  }
  float CTGy(float realY) {
    return height-realY*graphicZoom-graphicCenterY;
  }
  float CTRy(float graphicY) {
    //return -(graphicY-height+graphicCenterY)/graphicZoom;// ERROR DE SIGNE
    return -(graphicY-height-graphicCenterY)/graphicZoom;
  } 



  float sRadius() {
    return CTGx(pfRadius);
  }
  float sMouthRadius() {
    return CTGx(pfMouthRadius);
  }
  float sBirthRadius() {
    return CTGx(pfBirthRadius);
  }
  float sMaturityRadius() {
    return CTGx(pfMaturityRadius);
  }
  float sX() {
    return CTGx(pvPos.x);
  }
  float sSX() {
    return pvVel.x/graphicZoom;
  }
  float gravityAsX() {
    //return gravityAX()/graphicZoom;
    return pvGraAcc.x/graphicZoom;
  }
  float mechanicalAsX() {
    //return mechanicalAX(b)/graphicZoom;
    return pvMecAcc.x/graphicZoom;
  }
  float nuclearAsX() {
    //return nuclearAX(b)/graphicZoom;
    return pvNucAcc.x/graphicZoom;
  }
  float chemicalAsX() {
    //return chemicalAX(b)/graphicZoom;
    return pvCheAcc.x/graphicZoom;
  }
  float electricalAsX() {
    //return electricalAX(b)/graphicZoom;
    return pvEleAcc.x/graphicZoom;
  }

  float sY() {
    return CTGy(pvPos.y);
  }
  float sSY() {
    return -pvVel.y/graphicZoom;
  }
  float gravityAsY() {
    //return -gravityAY()/graphicZoom;
    return -pvGraAcc.y/graphicZoom;
  } // this case is negative because gravity to Earth is defined as negative
  float mechanicalAsY() {
    //return -mechanicalAY(b)/graphicZoom;
    return -pvMecAcc.y/graphicZoom;
  }
  float nuclearAsY() {
    //return -nuclearAY(b)/graphicZoom;
    return -pvNucAcc.y/graphicZoom;
  }
  float chemicalAsY() {
    //return -chemicalAY(b)/graphicZoom;
    return -pvCheAcc.y/graphicZoom;
  }
  float electricalAsY() {
    //return -electricalAY(b)/graphicZoom;
    return -pvEleAcc.y/graphicZoom;
  }


  void display() {

    int strokeType=0; //5
    fill (pcBodyColor, 80);
    noStroke();

    if (drawObject) {
      //if (parameterBlink(circleS)==1) {
      if (drawOuterCircle) {
        stroke(pcBodyColor, 160);
        strokeWeight(1);
      } else {
        noStroke();
      }
      ellipse ( sX(), sY(), sRadius()*2, sRadius()*2);
      /*@float x=CTGx(pvPos.x + cos(pfSexAlpha) * pfSexRadius);
       float y=CTGy(pvPos.y + sin(pfSexAlpha) * pfSexRadius);
       stroke(0);
       rect(x,y,10,10); 
       //println(" x="+x +" y="+y);
       */
      //}
    }

    if (drawCenter) {
      // CENTER POINT
      //strokeType=parameterBlink(chemicalOverlapS);

      //strokeWeight(1+2*strokeType);
      strokeWeight((int) age()/60000);
      //stroke(bColor);
      stroke(pcBodyColor);
      //ellipse ( sX(), sY(), pfRadius/10, sRadius()/10);//@
      //ellipse ( sX(), sY(), 2*pfMouthRadius, 2*pfMouthRadius);//@
      ellipse ( sX(), sY(), 2*CTGx(pfMouthRadius), 2*CTGy(pfMouthRadius));//@
    }

    if (drawShape) {
      // SHAPES
      strokeType=parameterBlink(drawShapeS);

      beginShape();

      stroke(pcBodyColor*strokeType);
      strokeWeight(1);

      float x=sX(), y=sY();
      float radius=pfRadius;
      float sides=abs(piCharge);

      float w=frameCount%(10*giNum)*TWO_PI/giNum;
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



