
/* Creative Coding
 
 June 20 2014 - nanoBubbles V3
 by Julio Montabes
 Copyright (c) 2014 Julio Montabes
 
 ENJOY!
 
 UNDER CONSTRUCTION:
 1) Adding forces. Electrical and nuclear and "Finger-gravitational".
 2) Linking objects to one another.
 3) Destroying and creating objects (Game KILL THE BUBBLES).
 4) 3D
 
 
 */

float frames=10;
int num=25;
int maxRadius=90;
int minRadius=10;
int maxInitialSpeed=100;


float[] objectX = new float[num];
float[] objectY = new float [num];
float[] objectSpeedX = new float [num];
float[] objectSpeedY = new float [num];
float[] objectClickedX = new float [num]; // Point where the circle was clicked related to its center
float[] objectClickedY = new float [num];
float[] objectRadius = new float [num];
color[] objectColor = new color [num];
boolean[] objectClicked = new boolean[num];
int[] objectCharge = new int[num];
float[] objectGravityAX = new float[num];
float[] objectGravityAY = new float[num];
float[] objectCollisionAX = new float[num];
float[] objectCollisionAY = new float[num];
float[] objectElectricalAX = new float[num];
float[] objectElectricalAY = new float[num];
float[] objectNuclearAX = new float[num];
float[] objectNuclearAY = new float[num];
float[] objectChemicalAX = new float[num];
float[] objectChemicalAY = new float[num];

//float[] needleX = new float[num];
//float[] needleY = new float[num];

boolean bDrawObject = true;
boolean bDrawCenter = true;
boolean bDrawShape = true;
boolean bDrawLines = true;

boolean drawImage = true;
boolean noObjectClicked = true;
boolean cleanFrame = true;
boolean debugDisplay = false;
boolean messageDisplay=true;

int lastPressMouseX = -1;
int lastPressMouseY = -1;



void setup() {  //setup function called initially, only once
  size(600, 600);
  background(240);  //set background white
  colorMode(RGB);   //set colors to Hue, Saturation, Brightness mode
  frameRate(frames);
  randomSeed(year()+month()+day()+hour()+minute()+second()+millis());
  resetCollection ();
  drawCollection();
  resetUserEvents();
}

void draw() {  //draw function loops
  if (drawImage || clickNumber()==1) {
    if (cleanFrame) {
      background(100, 190, 190);
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
    drawImage = drawImage==false;
    println("drawImage="+drawImage);
  } else {
  }
}

int objectClickedNumber() {
  int n=-1;
  for (int i=0; i<num; i++) {
    if (objectClicked[i]) {
      n=i;
    }
  }
  return n;
}


int objectDoubleClicked() {
  int n=-1;
  if (clickCounter==0) {
    for (int i=0; i<num; i++) {
      if (objectClicked[i]) {
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

void mouseClicked() {
  if (millis()-lastClickedMillis<500) {
    // doble-click
    clickCounter++;
  } else {
    clickCounter=-1;
  } 
  if (mouseButton==37) {
    if (clickCounter==-1) { // one click
      if (drawImage==false) {
        clickCounter=1; // it is put to 1 because at draw() it is checked to draw the frame even thought the drawing is stoped
      }
      /*
      if (selectedEntity) {
       selectedEntity=false;
       entity=-1;
       }
       */
    } else if (clickCounter==0) { // two clicks 
      selectedEntity=true;
      entity++;
      if (entity>=numberOfEntities) {
        entity=-1;
        selectedEntity=false;
      }
      println("MENU ", selectedEntity, entity, entityBlink(entity));
    } else if (clickCounter==1) { // three clicks
      resetCollection ();
      drawCollection();
      resetUserEvents();
      entity=-1;
      selectedEntity=false;
      //println("RESTART click counter="+clickCounter, selectedEntity, entity);
    }
  }

  if (mouseButton==39) {
    changeMouvement();
    selectedEntity=false;
    entity=-1;
  }
  lastClickedMillis=millis();
}

void mousePressed() {
  if (noObjectClicked==true) {
    for (int i=0; i<num; ++i) {
      if (objectX[i]-objectRadius[i]<mouseX && mouseX<objectX[i]+objectRadius[i] && objectY[i]-objectRadius[i]<mouseY && mouseY<objectY[i]+objectRadius[i]) {
        objectClicked[i]=true;
        objectClickedX[i]=objectX[i]-mouseX;
        objectClickedY[i]=objectY[i]-mouseY;
        noObjectClicked=false;
        printCircle(i);
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
    if (entity==gravityE) {
      gravity+=0.05*dragY();
      if (messageDisplay) println("gravity="+gravity);
    } else if (entity==frameE) {
      frames+=0.05*dragX();
      if (frames==0) frames=1;
      if (frames<=-1) frames=-1/frames;
      frameRate(frames);
      if (messageDisplay) println("frameRate="+frameRate);
    } else if (entity==collisionE) {
      collisionPower+=100*dragY();
      if (messageDisplay) println("collisionPower="+collisionPower);
    } else if (entity==radiusE) {
      for (int i=0; i<num; ++i) {
        objectRadius[i]=max(1, objectRadius[i]+dragY());
      }
      if (messageDisplay) println("Radios increased="+0.9*dragY());
    }
  }

  resetUserEvents();
}

void keyPressed() {

  switch(key) {
  case 'b': // swaps between cleaning the screen of not after a frame
    cleanFrame=cleanFrame==false;
    break;
  case 'c':
    if (noObjectClicked==false) {
      for (int i=0; i<num; ++i) {
        if (objectClicked[i]==true) {
          objectCharge[i]-=1;
          if (messageDisplay) println("objectCharge[i]="+objectCharge+"("+i+")");
        }
      }
    }
    break;
  case 'C':
    if (noObjectClicked==false) {
      for (int i=0; i<num; ++i) {
        if (objectClicked[i]==true) {
          objectCharge[i]+=1;
          if (messageDisplay) println("objectCharge[i]="+objectCharge+"("+i+")");
        }
      }
    }
    break;
  case 'd':
    if (mousePressed==false) {
      bDrawObject = bDrawObject==false;
      if (messageDisplay) println("bDrawObject[i]="+bDrawObject);
    } else if (mousePressed && mouseButton==37) {
      bDrawShape = bDrawShape==false ;
      if (messageDisplay) println("bDrawShape[i]="+bDrawShape);
    } else if (mousePressed) {
      bDrawCenter = bDrawCenter==false;
      if (messageDisplay) println("bDrawCenter[i]="+bDrawCenter);
    }
    break;
  case 'e':
    coulombConstant*=0.9;
    if (messageDisplay) println("coulombConstant=", coulombConstant, 0.9*coulombConstant);
    break;
  case 'E':
    if (messageDisplay) println("coulombConstant=", coulombConstant, 1.1*coulombConstant);
    coulombConstant=max(coulombConstant*1.1, 0);
    break;
  case 'f': // swaps between cleaning the screen of not after a frame
    if (mousePressed==false) {
      chemicalStrength *= 0.9;
      if (messageDisplay) println("chemicalStrength="+chemicalStrength);
    } else if (mousePressed && mouseButton==37) {
      nuclearStrength *= 0.9;
      if (messageDisplay) println("nuclearStrength="+nuclearStrength);
    } else if (mousePressed) {
      if (messageDisplay) println("UNDER CONSTRUCTION");
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
      if (messageDisplay) println("UNDER CONSTRUCTION");
    }
    break;
  case 'i':
    resetCollection();
    drawCollection();
    break;
  case 'l':
    bDrawLines = bDrawLines==false;
    if (messageDisplay) println("bDrawLines="+bDrawLines);
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
    for (int i=0; i<num; ++i) {
      objectRadius[i]*=0.9;
    }
    break;
  case 'R':
    for (int i=0; i<num; ++i) {
      objectRadius[i]*=1.1;
    }
    break;
  case 's':
    saveFrame("NBalls.jpg");
    break;
  case 't': // gives the table of circles
    if (messageDisplay) println("");
    if (messageDisplay) println("");
    for (int i=0; i<num; ++i) {
      printCircle(i);
    }
    break;
  case 'x': // error display on or off
    debugDisplay = debugDisplay==false;
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


/*   USER FUNCTIONS ORDERED BY NAME     */

float mass(int n) {
  return 2*PI*objectRadius[n];
}

void printCircle(int i) {
  if (mouseButton==39) {
    println("");
    println(i, ")", "radius="+objectRadius[i], "x="+objectX[i], "y="+objectY[i], "speedX="+objectSpeedX[i], "speedY="+objectSpeedY[i]);
    println("charge="+objectCharge[i]);
    println("gravityAX="+objectGravityAX[i], "gravityAY="+objectGravityAY[i], "collisionAX="+objectCollisionAX[i], "collisionAY="+objectCollisionAY[i]);
    println("electricalAX="+objectElectricalAX[i], "electricalAY="+objectElectricalAY[i], "nuclearAX="+objectNuclearAX[i], "nuclearAY="+objectNuclearAY[i]);
  }
}

void checkForces() {

  for (int i=0; i<num; ++i) {

    // Let's add the interaction forces...
    //
    objectSpeedX[i]+=objectGravityAX[i];
    objectSpeedY[i]+=objectGravityAY[i];
    objectSpeedX[i]+=objectCollisionAX[i];
    objectSpeedY[i]+=objectCollisionAY[i];
    objectSpeedX[i]+=objectElectricalAX[i];
    objectSpeedY[i]+=objectElectricalAY[i];
    objectSpeedX[i]+=objectNuclearAX[i];
    objectSpeedY[i]+=objectNuclearAY[i];
    objectSpeedX[i]+=objectChemicalAX[i];
    objectSpeedY[i]+=objectChemicalAY[i];

    // and Human Forces
    if (objectClicked[i]==true) {
      objectSpeedX[i]=mouseX-pmouseX;
      objectSpeedY[i]=mouseY-pmouseY;
    }
  }
}


float sumRadius(int i, int j) {
  return objectRadius[i]+objectRadius[j];
}

float sinDO(int i, int j) { // i=Destination, j=Origin
  return distanceX(i, j)/distance(i, j);
}           

float cosDO(int i, int j) { // i=Destination
  return distanceY(i, j)/distance(i, j);
}           


float gravity=0;
float elasticity = 1; // Factor of elasticity of the virtual matter of the balls.
float coulombConstant=2000000;
float chemicalOverlap=0.6; // overlap of a circle when a chemical reaction happens
float nuclearOverlap=0.4; 
float chemicalStrength=50; //0.1;
float nuclearStrength=50; //0.25;
float collisionPower=10000;

void checkInteractions() {

  float aM=1000; // arrow magnification
  float x1=0, y1=0, x2=0, y2=0;

  for (int i=0; i<num; ++i) {
    objectGravityAX[i]=0;
    objectGravityAY[i]=0;
    objectCollisionAX[i]=0;
    objectCollisionAY[i]=0;
    objectElectricalAX[i]=0;
    objectElectricalAY[i]=0;
    objectNuclearAX[i]=0;
    objectNuclearAY[i]=0;
  }

  for (int i=0; i<num; ++i) {
    for (int j=0; j<num; ++j) {

      if (i!=j) { // not looking with interaction with itself

        // gravity forces
        objectGravityAX[i]=0;
        objectGravityAY[i]=gravity;


        // Collition forces

        if (overlap(i, j)>0) { // there is a collision

          float aIX=0;
          float aIY=0;
          float collisionAcceleration=0;

          if (overlap(i, j)<chemicalOverlap) { // there is a MECHANIC collision

            /*
Inelastic collision v = m1/(m1+m2)*v1 (supposed v2=0)
             Elastic collision 
             ... working ...
             */

            collisionAcceleration=collisionPower*overlap(i, j)/objectMass(i); 

            if (overlap(i, j)==1) {
              collisionAcceleration*=-1;
            }
            if (overlap(i, j)<1) {
            }

            objectCollisionAX[i]+=(collisionAcceleration*distanceX(i, j)/distance(i, j)); 
            objectCollisionAY[i]+=(collisionAcceleration*distanceY(i, j)/distance(i, j));
          } else { // there is a TRANSFORMATION collision

            if (overlap(i, j)<nuclearOverlap) { // CHEMICAL reaction
              collisionAcceleration=-chemicalStrength*distance(i, j)/objectMass(i); // the sign is NEGATIVE because it is supposed chemical energy is attracting

              if (debugDisplay) {  
                println("Chemical", "i="+i, "j="+j, "sumRadius(i,j)="+sumRadius(i, j), "Dij="+distance(i, j), "collisionAcceleration="+collisionAcceleration, "overlap(i,j)="+overlap(i, j), "pene="+penetration(i, j), "oR="+objectRadius[i]);
                printCircle(i);
                printCircle(j);
              }

              objectChemicalAX[i]+=(collisionAcceleration*distanceX(i, j)/distance(i, j)); 
              objectChemicalAY[i]+=(collisionAcceleration*distanceY(i, j)/distance(i, j));
            } else { // NUCLEAR reaction

              //collisionAcceleration=-nuclearStrength*distance(i, j);
              collisionAcceleration=-nuclearStrength*distance(i, j)/objectMass(i);

              if (debugDisplay) {  
                println("NUCLEAR", "i="+i, "j="+j, "sumRadius(i,j)="+sumRadius(i, j), "Dij="+distance(i, j), "collisionAcceleration="+collisionAcceleration, "overlap(i,j)="+overlap(i, j), "pene="+penetration(i, j), "oR="+objectRadius[i]);
              }
            }
            //objectNuclearAX[i]+=(collisionAcceleration*distanceX(i, j)/distance(i, j))/objectMass(i); 
            //objectNuclearAY[i]+=(collisionAcceleration*distanceY(i, j)/distance(i, j))/objectMass(i);
            objectNuclearAX[i]+=(collisionAcceleration*distanceX(i, j)/distance(i, j)); 
            objectNuclearAY[i]+=(collisionAcceleration*distanceY(i, j)/distance(i, j));
          }
        } else {
        }
        // Electrical forces
        float aEX=0;
        float aEY=0;
        float K=coulombConstant;
        float Q=objectCharge[j]; 
        float q=objectCharge[i];  
        float r2=sq(distance(i, j));
        // Equal sign, +distanceY(i, j), +distanceX(i, j); opposite sign -distanceY(i, j), -distanceX(i, j)
        float sE=0;
        if (objectCharge[i]!=0 && objectCharge[j]!=0) {
          sE = objectCharge[i]/abs(objectCharge[i]);
        }
        aEX=(K*Q/r2)*sE*distanceX(i, j)/distance(i, j);
        aEY=(K*Q/r2)*sE*distanceY(i, j)/distance(i, j);
        aEX*=(1-overlap(i, j));
        aEY*=(1-overlap(i, j));
        objectElectricalAX[i]+=aEX/objectMass(i);
        objectElectricalAY[i]+=aEY/objectMass(i);
      }
    }
  }
}

float objectMass(int n) {
  return PI*sq(objectRadius[n]);
}

float overlap(int i, int j) {
  return penetration(i, j) / objectRadius[i];
} //objectRadius[Ã¬];


float penetration(int i, int j) { // penetration of on i circle inside j circle and viceversa
  return max(objectRadius[i]+objectRadius[j]-distance(i, j), 0);
}

float distance(int i, int j) { // distance between i and j
  return sqrt(sq(objectX[i]-objectX[j])+sq(objectY[i]-objectY[j]));
}

float distanceX(int i, int j) { // distance between i and j
  return objectX[i]-objectX[j];
}

float distanceY(int i, int j) { // distance between i and j
  return objectY[i]-objectY[j];
}

void checkWalls() {

  for (int i=0; i<num; ++i) {

    if (objectX[i]-objectRadius[i]<0) {
      objectSpeedX[i]=elasticity*(objectRadius[i]-objectX[i]);
    }
    if (objectX[i]+objectRadius[i]>width) {
      objectSpeedX[i]=-elasticity*(objectX[i]+objectRadius[i]-width);
    }
    if (objectY[i]-objectRadius[i]<0) {
      objectSpeedY[i]=elasticity*(objectRadius[i]-objectY[i]);
    }
    if (objectY[i]+objectRadius[i]>height) {
      objectSpeedY[i]=-elasticity*(objectY[i]+objectRadius[i]-height);
    }
  }
}

boolean selectedEntity=false;
int entity=-1;
int numberOfEntities=12;

int gravityE = 0;
int collisionE = 1;
int chemicalE = 2;
int nuclearE = 3;
int electricalE = 4;
int radiusE = 5;
int minorRadiusE = 6;
int numE = 7;
int frameE = 8;
int chargeE = 9;
int shapeE = 10;
int objectE= 11;

void drawSquareCross(int gapX, int gapY, int square) {

  int x = gapX+square/3;
  int y = gapY;

  beginShape();

  vertex(x, y);
  x+=square/3;
  vertex(x, y);
  y+=square/3;
  vertex(x, y);
  x+=square/3;
  vertex(x, y);
  y+=square/3;
  vertex(x, y);
  x-=square/3;
  vertex(x, y);
  y+=square/3;
  vertex(x, y);
  x-=square/3;
  vertex(x, y);
  y-=square/3;
  vertex(x, y);
  x-=square/3;
  vertex(x, y);
  y-=square/3;
  vertex(x, y);
  x+=square/3;
  vertex(x, y);

  endShape(CLOSE);
}


void drawClock(int gapX, int gapY, int square, int hour, int minute, int second) {


  int x=gapX+square/2; 
  int y=gapY+square/2;

  beginShape();

  fill(240);
  ellipse(x, y, square, square);


  for (int i=0; i<12; i++) {
    line(x, y+square+10, x, y+square+10);
  }

  strokeWeight(3);
  line(x, y, x+((square-10)/2)*cos(radians((3-hour)/12)), y+((square-10)/2)*sin(radians((3-hour)/12)));
  strokeWeight(2);
  line(x, y, x+(square-5/2)*cos(radians(minute/60)), y+(square-5/2)*sin(radians(minute/60)));
  strokeWeight(1);
  line(x, y, x+(square-5/2)*cos(radians(second/60)), y+(square-5/2)*sin(radians(second/60)));


  endShape(CLOSE);
}



void drawLineEllipse(int gapX, int gapY, int square, int radius, float angle) {

  beginShape();

  rotate(angle);

  int x=gapX+square/2;
  int y=gapY+radius;
  ellipse(x, y, radius*2, radius*2);

  y+=radius;
  line(x, y, x, y+square-radius);

  endShape(CLOSE);
}


void drawCollection() {
  //background(100, 190, 190);
  for (int i=0; i <num; ++i) {
    drawObject (i);
  }

  int strokeType=1;

  int square=width/5;
  int gap=square/2;

  if (entity==numE) {
    strokeType=entityBlink(numE);
    stroke(strokeType-1);
    strokeWeight(1);

    drawSquareCross(gap, gap, square);
  }

  if (entity==frameE) {
    strokeType=entityBlink(frameE);
    stroke(strokeType);
    strokeWeight(1);

    drawClock(gap, gap, square, (int) frames, minute(), second());
  }
}

int entityBlink(int e) {
  if (entity==e) {
    //return floor(millis()/500)%500;
    return (millis()/500)%2;
  } else {
    return 1;
  }
}


float drawScrollBar(float x, float y, float range, float value, float radius) {

  line(x, y, x, y+range);
  ellipse(x, y+range-value, radius*2, radius*2);
  line(x-10,y,x+10,y);
  line(x-10,y+range,x+10,y+range);
  line(x-10,y+range/2,x+10,y+range/2);  

  //println("keypresssssss", keyPressed);
  if (mousePressed && mouseOnCircle(x, y+range-value, radius)) {
    value=y+range-mouseY;
  }
  return value;
}

boolean mouseOnCircle(float x, float y, float radius) {
  if (x-radius<mouseX && mouseX<x+radius && y-radius<mouseY && mouseY<y+radius) { 
    return true;
  } else {
    return false;
  }
}

void drawObject (int n) {
  // draws the circle

  float sign=objectSign(n);
  int strokeType=0; //5
  fill (objectColor[n], 180);
  noStroke();

  float scrollX= 0.9*width;
  float scrollY= 0.1*height;
  float scrollRange=0.8*width;


  if (bDrawObject) {

    if (entityBlink(radiusE)==0) {
      strokeType=entityBlink(radiusE);
      stroke((1-strokeType)*240);
      strokeWeight(3);
      ellipse ( objectX[n], objectY[n], objectRadius[n]*2, objectRadius [n]*2);

      strokeWeight(3);
      fill(240, 127);
      float value = map(maxRadius, 1, 200, -scrollRange/2, scrollRange/2);
      float scroll=drawScrollBar(scrollX, scrollY, scrollRange, value, 50);
      println("scroll="+scroll, map(scroll, 0.1*height, 0.9*height, 1, 200));
      float max = map(scroll, 0.1*height, 0.9*height, 1, 200);
      //@//for (int i=0; i<num; ++i) {
      //  objectRadius[i]=max*objectRadius[i]/maxRadius;
      //}
      //minRadius=(int) max*minRadius/maxRadius;
      //maxRadius=(int) max;
      //@
    }
    // chemicalE = 2;
    // nuclearE = 3;
    // electricalE = 4;
    //  = 5;
    // minorRadiusE = 6;
    // numE = 7;
    // frameE = 8;
    // chargeE = 9;
    // shapeE = 10;
    // gravity=0;
    // elasticity = 1; // Factor of elasticity of the virtual matter of the balls.
    // coulombConstant=2000000;
    // chemicalOverlap=0.6; // overlap of a circle when a chemical reaction happens
    // nuclearOverlap=0.4; 
    // chemicalStrength=50; //0.1;
    // nuclearStrength=50; //0.25;
    // collisionPower=10000;

    if (entityBlink(objectE)==1) {
      //stroke(0);
      //strokeWeight(1);
      noStroke();
      ellipse ( objectX[n], objectY[n], objectRadius[n]*2, objectRadius [n]*2);
    }
  }

  // center point
  if (bDrawCenter) {

    strokeType=entityBlink(minorRadiusE);

    if (entity==minorRadiusE) {
      println("minorRadiusE="+minorRadiusE, strokeType);
    }

    strokeWeight(1+2*strokeType);
    stroke((1-strokeType)*240);

    ellipse ( objectX[n], objectY[n], objectRadius[n]/10, objectRadius [n]/10);
  }

  // drawings
  if (bDrawShape) {

    strokeType=entityBlink(shapeE);

    beginShape();

    stroke(objectColor[n]*strokeType);
    strokeWeight(1);

    float x=objectX[n], y=objectY[n];
    float radius=objectRadius[n];
    float sides=abs(objectCharge[n]);

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



  // draws the lines

  if (bDrawLines) {

    float x1, y1, x2, y2;

    x1=objectX[n];
    y1=objectY[n];
    strokeWeight(1);
    int square=width/5;
    int gap=square/2;

    // lines of Gravity

    strokeType=entityBlink(gravityE);

    x2=x1+10*objectGravityAX[n];
    y2=y1+10*objectGravityAY[n];
    stroke(240*strokeType, 127*strokeType, 127*strokeType, 255*strokeType);
    strokeWeight(1);
    line(x1, y1, x2, y2);
    ellipse(x2, y2, 10, 10);


    if (entity==gravityE) {
      strokeWeight(3);
      fill(240, 127);
      float value = map(gravity, -100, 100, 0.1*height, 0.9*height);
      float scroll=drawScrollBar(scrollX, scrollY, scrollRange, value, 50);
      gravity=map(scroll, 0.1*height, 0.9*height, -100, 100);
    }


    // lines of collision force

    strokeType = entityBlink(collisionE);

    x2=x1+10*objectCollisionAX[n];
    y2=y1+10*objectCollisionAY[n];
    stroke(0*strokeType, 240*strokeType, 240*strokeType, 255*strokeType);
    strokeWeight(1);
    line(x1, y1, x2, y2);
    ellipse(x2, y2, 10, 10);


    if (entity==collisionE) {
      strokeWeight(3);
      fill(240, 127);
      float value = map(collisionPower, -100000, 100000, 0.1*height, 0.9*height);
      float scroll=drawScrollBar(scrollX, scrollY, scrollRange, value, 50);
      //println("scroll="+scroll, map(scroll, 0.1*height, 0.9*height, -100, 100));
      collisionPower=map(scroll, 0.1*height, 0.9*height, -100000, 100000);
    }



    // lines of nuclear force

    strokeType=entityBlink(nuclearE);

    x2=x1+10*objectNuclearAX[n];
    y2=y1+10*objectNuclearAY[n];
    stroke(255*strokeType, 255*strokeType, 0*strokeType, 255*strokeType);
    strokeWeight(1);
    line(x1, y1, x2, y2);
    ellipse(x2, y2, 10, 10);

    if (entity==nuclearE) {
      strokeWeight(3);
      fill(240, 127);
      float value = map(nuclearStrength, -500, 500, 0.1*height, 0.9*height);
      float scroll=drawScrollBar(scrollX, scrollY, scrollRange, value, 50); //@
      //println("scroll="+scroll, map(scroll, 0.1*height, 0.9*height, -500, 500));
      nuclearStrength=map(scroll, 0.1*height, 0.9*height, -500, 500);
    }


    // lines of chemical force

    strokeType=entityBlink(chemicalE);

    x2=x1+10*objectChemicalAX[n];
    y2=y1+10*objectChemicalAY[n];
    stroke(255*strokeType, 0*strokeType, 255*strokeType, 255*strokeType);
    strokeWeight(1);
    line(x1, y1, x2, y2);
    ellipse(x2, y2, 10, 10);

    if (entity==chemicalE) {
      strokeWeight(3);
      fill(240, 127);
      float value = map(chemicalStrength, -500, 500, 0.1*height, 0.9*height);
      float scroll=drawScrollBar(scrollX, scrollY, scrollRange, value, 50); //@
      //println("scroll="+scroll, map(scroll, 0.1*height, 0.9*height, -500, 500));
      chemicalStrength=map(scroll, 0.1*height, 0.9*height, -500, 500);
    }

    // =0;
    // elasticity = 1; // Factor of elasticity of the virtual matter of the balls.
    // coulombConstant=2000000;
    // chemicalOverlap=0.6; // overlap of a circle when a chemical reaction happens
    // nuclearOverlap=0.4; 
    // chemicalStrength=50; //0.1;
    // nuclearStrength=50; //0.25;
    // =10000;


    // lines of electrical force

    strokeType=entityBlink(electricalE);

    x2=x1+10*objectElectricalAX[n];
    y2=y1+10*objectElectricalAY[n];
    stroke(240*-sign*strokeType, 0*strokeType, 240*sign*strokeType, 255*strokeType);
    strokeWeight(1);
    line(x1, y1, x2, y2);
    ellipse(x2, y2, 10, 10);

    if (entity==electricalE) {
      strokeWeight(3);
      fill(240, 127);
      float value = map(coulombConstant, 0, 4000000, 0.1*height, 0.9*height);
      float scroll=drawScrollBar(scrollX, scrollY, scrollRange, value, 50); //@
      //println("scroll="+scroll, map(scroll, 0.1*height, 0.9*height, 0, 4000000));
      coulombConstant=map(scroll, 0.1*height, 0.9*height, 0, 4000000);
    }
  }
}

float objectSign(int n) {
  float sign=0;
  if (objectCharge[n]!=0) {
    sign=objectCharge[n]/abs(objectCharge[n]);
  }
  return sign;
}


void resetCollection() {
  for (int i=0; i <num; ++i) {
    objectX [i]=random (width);
    objectY [i]=random (height);
    objectSpeedX [i]=random (-maxInitialSpeed, maxInitialSpeed);
    objectSpeedY [i]=random (-maxInitialSpeed, maxInitialSpeed);
    //objectRadius [i]=random (minRadius, maxRadius);
    objectRadius [i]=min(10*maxRadius*(1/random (1, 100)), maxRadius);
    objectColor [i]=color (random (100, 150), random (100, 150), random (100, 150));
    objectCharge[i] =(int) map((objectRadius[i]), minRadius, maxRadius, -7, 7);

    objectGravityAX[i] = 0;
    objectGravityAY[i] = 0;
    objectCollisionAX[i] = 0;
    objectCollisionAY[i] = 0;
    objectElectricalAX[i] = 0;
    objectElectricalAY[i] = 0;
    objectNuclearAX[i] = 0;
    objectNuclearAY[i] = 0;
  }
}

void resetUserEvents() {
  for (int i=0; i<num; ++i) {
    objectClicked[i]=false;
    objectClickedX[i]=0;
    objectClickedY[i]=0;
  }
  noObjectClicked=true;

  lastPressMouseX=-1;
  lastPressMouseY=-1;
}


void updateCollection() {
  checkWalls();
  checkInteractions();
  checkForces();
  for (int i=0; i<num; ++i) {
    objectX[i]=objectX[i]+objectSpeedX[i]; // The new position is the result of addint to the old one the velocity per 1 frame.
    objectY[i]=objectY[i]+objectSpeedY[i];
    if (objectClicked[i]==true) {
      objectX[i]=mouseX+objectClickedX[i];
      objectY[i]=mouseY+objectClickedY[i];
    }
  }
}


/*
 SUMMARY
 
 This program draws circles of random radius and random position.
 If one circle overlap any box margin it is projected at a velocity 
 proportional to the overlap and always oriented to the interior of 
 the box.
 
 If one circle collides with another they expell each other adding 
 to the actual velocity of each one a vector proportional to the 
 width of the intersection of the two circles and opposite oriented 
 to the center of each other.
 
 USER CONTROLS
 
 - Mouse Press on a bubble: captures the selected bubble
 - Drag-and-Throw: with a captured bubble, it changes position and 
 sets velocity to be used when the event mouseRelease would happen
 - Mouse scroll: increases-decreases gravity
 - Double-click: restart the program
 - Press 'i': restart the program
 - Press 'l' swaps Collision Lines visible / unvisible
 - Press 's' to save one jpg file
 
 PHYSICAL REALITY SIMPLIFIED VIRTUAL MODEL
 
 The program is a simplified model of physical reality at quantum
 level. It emulates the behaviour of very small particles (could be
 atoms or mollecules, but also particles of several mollecules but
 really small.
 
 At this very small size level the walls of our container (our
 scketch window) are not still but always shaking. We can't see it
 because our frames coincide with the vibration of the walls and we
 see them allways at the very same moment of their cicle. But they
 vibrate and it can be deduced from the fact that between one 
 frame and the next one our Bubbles can "penetrate" beyond the limits
 of the walls we can see. In the physical reality it can be seen a
 the displacement of the whole wall in the same X or Y direction
 of the coming ball until when the next phase of the wall vibration 
 starts the wall finds and hits the bubble giving it much energy
 coming from the same wall vibration.
 
 This back movement of the wall and the hitting of the coming bubble
 if the cause of the Bubbles being projected ramdomly and of its
 vibration when gravity is high. It can be seen as the effect of
 temperature of the walls that transmits energy in the form of heat 
 to the bubble.
 
 
 FUTURE DEVELOPMENTS ON JUNE 20
 
 The program will be developed in the following aspects:
 
 1) Collisions will be rewritten so they follow the momentum and 
 conservation energy conservation laws. This will probably force 
 to rewrite friction and other energy losses so the system can
 slow down (cold down in the real world), as it does so far.
 
 2) Chemical and nuclear reactions can be emulated by linking
 Bubbles to each other when reaching a particular level of force
 between them.
 
 3) Events will be rewritten so gestures can be used with smartphones
 and tablets, in order to avoid the keyboard and some mouse events
 that don't work properly with these devices.
 
 Human Forces
 If one bubble has been caught by clicking it, its 'clicked'
 property is set to true, so it can have a particular movement
 treatment. 
 
 The real analogy would be that the object is linked to another 
 object (a human through technology) and follows its carrier 
 movements.
 
 But the human, that is the user, can add energy to the system
 similarly as the way energy is added to a system by throwing
 something. We just need to assign velocity to the clicked object
 when it would be eventually released. Event that will trigger
 the mouseRelease event.
 
 The velocity calculated is the actual velocity at which the
 cursor is moving along the sketch window. Since the "sketch time" 
 is mesured by the actual frameRate parameter, as it is easily 
 deduced from the fact that we make a calculation every time a 
 frame is displayed, and the movement of our objects are 
 syncronized with that representation, it follows that we can know
 easily what is the velocity given to a bubble by throwing it, just
 calculating the pixels advanced by this bubble per unit of time,
 that is, per one frame-time. Since the time is one, we can ignore 
 it and calculate the velocity just measuring space, that is the 
 pixels advanced during the frame (mouseX-pmouseX, mouseY-pmouseY).
 
 The visual effect of calculating velocity this way is similar to
 the impression we have when throwing an object away, following 
 the well known parabolic trail.
 
 */

/* By scrolling the mouse wheel we can change the parameter
 gravity. Scrolling forward increases gravity. Scrolling 
 backwards decreases gravity. The factor is 1/10 of a virtual
 Newton each scroll click. It is a bit slow when trying high
 gravities but it makes possible to reach near 0 gravity.
 
 Zero gravity is interesting because all the Bubbles end reaching
 stillness. If one bubble is "drag-and-thrown"(1) it adds energy
 to the system, until that energy gets lost or disipated through
 the walls and the Bubbles get still again.
 
 
 1) See Human Forces
 */

//// objectSpeedX[i]=elasticity*(objectRadius[i]-objectX[i]);
/* 20140621.1322
 The new speed of one circle, after colliding with
 a wall, will be a constant factor, called elasticity,
 multiplied by the number of pixels this circle has
 got inside the wall during a frame time. Let's call
 that "penetration". So, penetration will be comprised
 between 0 and the X or Y component of the circle
 velocity, since that velocity is defined in pixels
 per frame also.
 
 
 If a circle is very near of a wall just after the frame
 has been display and a new cycle begins, then when the
 new frame has to be displayed, this circle will have 
 "penetrated" almost its whole speed in pixels, since 
 speeds are in this program implied as pixels per frame.
 
 So this circle gets expelled back at a velocity proportional
 to that penetration, what is a realistic assumption about
 nano particles.
 
 Lets suppose a circle is arriving to the left wall at
 a rate of one pixel per frame. In the last frame displayed
 this circle X coordinate was exactly equal to its radius.
 Then in the next frame its X coordinate will be one pixel
 less than its radius. When the calculation occurs that
 means that it is assined a velocity to the right of 
 exactly 1pixel*elasticity. Let's suppose elasticity is set 
 to one. Then that circle velocity does not change. So
 energy does not change. There is no loss of energy.
 
 It is very easy to derive from that that in any other 
 situation, having elasticity=1, there will be a loss
 of energy and the circles will slow down, as it actually
 happens. 
 
 This calculation can be seen as if the walls vibrated
 at a rate of one cycle per frame. Any sinthonized 
 circle (that is any circle at a velocity equal to the 
 frequency of vibration of the walls) will be unaltered.
 The rest of them will experience random losses of energy,
 depending on the phase they find the wall is when they
 hit it. That fase is measured by what we have called
 "penetration" before.
 
 In fact I think it is a good model for describing how
 nano particles might behave and as an explanation of the
 general experience of transfer of heat between bodies
 of different temperature.
 
 In that sense, our factor "elasticity" is in reality
 THE TEMPERATURE OF THE WALLS.
 
 */

/*
             // Collition forces
 // Addition to the actual velocity of the collition vector. The strength of the impact is proportional to the 
 // intersection of the two circles at the very moment of the frame time. 
 //objectSpeedX[i]+=distanceX(i, j)*(sumRadius(i,j)-Dij)/sumRadius(i,j);
 //objectSpeedY[i]+=distanceY(i, j)*(sumRadius(i,j)-Dij)/sumRadius(i,j);
/* This is a curios formula that needs to be reviewed
 it implies things that can not be a good model of
 reality...
 */

/*
20140621.1411
 We need to introduce here another property to the circles.
 That is CHARGE. So I created the array objectCharge as a
 boolean, since we will have positive and negative charges.
 
 Then multiplying charges we will have that, if both are the
 same sign the result will be positive, if they are different
 sign the result will be negative. So attraction will occur
 when we have negative values, and repulsion when we have
 positive values.
 */
