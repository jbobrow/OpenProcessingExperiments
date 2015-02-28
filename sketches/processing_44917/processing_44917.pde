


                
                
class SimpleBar
{
   int BarLength, BarWidth;    // width and length of Box
  int xpos, ypos;         // x and y position of box top left corner
  float Cpos,Csize;    //position and size of Cursor
  int Transparency;
   String BarText;
   
  SimpleBar (int xp, int yp, int BL, int BW, float StartValue, String BText ){
    xpos = xp;
    ypos = yp;
    BarLength=BL;
    BarWidth=BW;
    Cpos=StartValue*BarLength;
    Csize= 2; //cursor box height
    Transparency=5;
    BarText=BText;
  }
 
  float updateValue() {
      if(mouseX > xpos && mouseX < xpos+BarLength &&
        mouseY > ypos && mouseY < ypos+BarWidth) {
        Cpos =constrain(mouseX, xpos, xpos + BarLength)-xpos;
        return Cpos/BarLength;
      }
      else {
        return Cpos/BarLength;
      }
   }
 
 
 
  void display() {
    rectMode(CORNERS);
    colorMode(899);
    textAlign(CENTER);
    stroke(100,(Transparency));
    fill(89,96,889);
      rect(xpos, ypos, xpos+BarLength, ypos+BarWidth);// bar
      noStroke();
      fill(70,255, 80,255);
      rect(xpos+Cpos-Csize/3, ypos, xpos+Cpos+Csize/3, ypos+BarWidth);// cursor     
      fill (6,20,20,0);
      text(BarText+nf(Cpos/BarLength,0,2),xpos+BarLength/2,ypos+BarWidth/1.3);
   
  }
}

// In this program a several series of points chase each other around.
// A points direction of motion is affected by the next point in the line and
// by the same numbered point in the next line.
// The references loop around so that the last point is chasing the first and
// the last line of points is influenced by the first.
//
int numPoints=100;
int numLines=4;
float LineRatio; // the amout of influence the same numbered point in the next line has compared to the next point in line
float speed;
float WaveRange;//;=radians (35);//(30);
float deltaPhase;//=.02;//.01;
float MouseRatio; //how much influenc the mouse position has on direction of the points
int numWaves=2; // All points swim towards their direction of travel. This is the number of oscilations in the whole line.
int fadeRate=50;////50; //how long are the trailers, how quickly the screen is cleared
int DisplayStep=4;// draw every Xth point. Drawing fewer points makes it go faster and lets you see the dynamics more clearly.
int NumColors=20;
float Visibility=1; // 0 to 1 transparency of the input box
int LastMouseOver=millis();// timer for clearing the input box
int BarFadeSeconds;// how long it takes input box to dissappear
PFont BarFont;
boolean MouseChaseOn=true;
 
PVector[][] position= new PVector[numLines][numPoints];
float[][] direction= new float[numLines][numPoints];
SimpleBar LineRatioBar; //initialize scrollbars
SimpleBar WaveRangeBar;
SimpleBar SpeedBar;
SimpleBar FrequencyBar;
SimpleBar MouseRatioBar;
float Phase=0; //constant changing variable for angle change wave
int InitializeSwitch=3;
void setup() //////////////////////////// Setup
{
  size (900,900);//
  //size (900,900);//
   
  smooth();
  stroke (255,150,0);
  fill(56);
  BarFont= loadFont("Times-Roman-48.vlw");
  textFont(BarFont,25);
   
   
 
  LineRatioBar= new SimpleBar(10,0,300,30,.5, "PRESIONA (1)  ");// create new instances of scrollbars
  WaveRangeBar= new SimpleBar(10,35,300,30,.7, "PRESIONA (2)  ");
  SpeedBar= new SimpleBar(10,70,300,30,.5, "VELOCIDAD ");
  FrequencyBar= new SimpleBar(10,105,300,30,.5, "FRECUENCIA  ");
  MouseRatioBar= new SimpleBar(350,700,300,30,.5, "(L) libera olas del mouse  ");
  initializePositions();
}
void draw()///////////////////////////// Draw
{
  //fade background trailers
  fill(0, 2);
  rect(0,0,width, height);
 
//    background(0);// clear background no trailers
  Phase=(Phase+deltaPhase)%TWO_PI; //iterate phase
  HandleInterface();
  calcPositions();
  renderPositions();
}
 
void calcPositions()///////////////////  Engine
{
  float xdist,ydist;
  float lxdist,lydist;
  float mxdist,mydist;
  float XD,YD;
  float LDist;
  float deltax,deltay;
  for (int j=0;j<numLines;j++)
  {
 
    for (int i=0; i<numPoints; i++) //calculate the directions from each point to the next
    {
       
      xdist=position[j][i].x - position[j][(i+1)%numPoints].x;//forward
      ydist=position[j][i].y - position[j][(i+1)%numPoints].y;
       
      lxdist=position[j][i].x - position[(j+1)%numLines][i].x;//sideways
      lydist=position[j][i].y - position[(j+1)%numLines][i].y;
            
        mxdist=position[j][i].x - mouseX;//mouseways
        mydist=position[j][i].y - mouseY;
       
 
      XD=(1-LineRatio)*xdist+LineRatio*lxdist;
      YD=(1-LineRatio)*ydist+LineRatio*lydist;
      if (MouseChaseOn){
        XD=(1-MouseRatio)*XD+MouseRatio*mxdist;
        YD=(1-MouseRatio)*YD+MouseRatio*mydist;     
      }
      
      direction[j][i]= atan2(YD,XD) + WaveRange*sin(((i*200*numWaves)/numPoints)+Phase);
    }
  }
  for (int j=0;j<numLines;j++)
  {
    for (int i=0;i<numPoints;i++) // move each point towards the next
    {
      deltax=position[j][i].x-cos(direction[j][i])*speed;
      deltay=position[j][i].y-sin(direction[j][i])*speed;
      position[j][i].set(deltax,deltay,0);
    }   
  }
}
void renderPositions()/////////////////////////// Render
{
  colorMode(HSB,numPoints,10,1);
 
  float px,py,Hue;
  for (int j=0;j<numLines;j++)
  {
    for (int i=0;i<numPoints;i=i+DisplayStep)
    {
      Hue=int(numPoints/NumColors)*int(NumColors*i/numPoints);
      stroke(Hue,199,100);
      fill(Hue,230,800);
      px=position[j][i].x;
      py=position[j][i].y;
      pushMatrix();
        translate(px, py);
        rotate(PI/2+direction[j][i]);
        triangle ( 0,3, -20,-3, 2,-3);
      popMatrix();
    } 
  }
}
 
 
void keyPressed()
{
  switch(key){
    
     
    case 'l':
    MouseChaseOn=!MouseChaseOn;
    break;
    case '1':
    InitializeSwitch=1;
    initializePositions();
    break;   
    case '4':
    InitializeSwitch=-900;
    initializePositions();
    break;
    case '3':
    InitializeSwitch=3;
    initializePositions();
    break;
    case '2':
    InitializeSwitch=0;
    initializePositions();
    break;
    default:
    //InitializeSwitch=(InitializeSwitch+1)%4;
    break;   
  }
   
  DisplayData();
}
 
void initializePositions(){
    LineRatio=LineRatioBar.updateValue(); //get variable data from scrollbars
    WaveRange=WaveRangeBar.updateValue();
    speed=SpeedBar.updateValue()*10;
    deltaPhase=FrequencyBar.updateValue()*.1;
    MouseRatio=MouseRatioBar.updateValue();
  
  background (0);
  Phase=0;
  int radius=1; 
 
  switch(InitializeSwitch) {
    case 0:
        for (int j=0;j<numLines;j++) {
          for (int i=0;i<numPoints;i++) {// fill position array with random values
            position[j][i]=new PVector( random(40,width-40), random(40,height-40) );
          }
        }
    break;
    case 1:
        for (int j=0;j<numLines;j++) {
          for (int i=0;i<numPoints;i++){ // fill position array with evenly spaced points around a circle
            position[j][i]=new PVector(width/2+cos(j*PI/numLines+i*TWO_PI/numPoints)*radius,height/2+sin(j*PI/numLines+i*TWO_PI/numPoints)*radius );
          }
        }
    break;
    case 2:
        for (int j=0;j<numLines;j++) {
          for (int i=0;i<numPoints;i++) {
            position[j][i]=new PVector(width/2+cos(i*TWO_PI/numPoints)*(radius+j*10),height/2+sin(i*TWO_PI/numPoints)*(radius+j*10) );
          }
        }
    break;
    default:   
        for (int j=0;j<numLines;j++) {
          for (int i=0;i<numPoints;i++) {
            position[j][i]=new PVector(width/2+cos(i*TWO_PI/numPoints)*(radius+j*10),height/2+sin(i*-2*TWO_PI/numPoints)*(radius+j*10) );
          }
        }
    }
}
 
void HandleInterface() ///////////////////////////// Collect data from bars
{
  colorMode(RGB);
 
 if(mouseX < 315 && mouseY < 170) {
  DisplayData();
  if(mousePressed) {
    LineRatio=LineRatioBar.updateValue();
    WaveRange=WaveRangeBar.updateValue();
    speed=SpeedBar.updateValue()*10;
    deltaPhase=FrequencyBar.updateValue()*.8;
    MouseRatio=MouseRatioBar.updateValue();
  }
 }
}
void DisplayData(){
  SpeedBar.display();
  LineRatioBar.display();
  WaveRangeBar.display();
  FrequencyBar.display();
  MouseRatioBar.display();
  textAlign(LEFT);
  text ("ANA MARIA ALONSO",10,190);
}
