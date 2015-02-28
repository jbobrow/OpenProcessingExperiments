
int numPoints=600;
float speed=.9;
float waveRange=radians (35);//(30);
float deltaPhase=.02;//.01;
int numWaves=6;


PVector[] position= new PVector[numPoints];
float[] direction= new float[numPoints];
InputBox PhaseSpeedBox;
String PhaseSpeedBoxText="<Frequency/Speed^";
float Phase=0; //constant changing variable for angle change wave
int circleSwitch=1;
void setup() //////////////////////////// Setup
{
  ellipseMode(CENTER);
  size (600,600);
  smooth();
  //frameRate(30);
  stroke (255,150,150);
  fill(40,40,230,200);
  PhaseSpeedBox= new InputBox(0,0,20,110,200, PhaseSpeedBoxText);
  //PhaseSpeedBox.setX(10);
  initializePositions();
}
void draw()///////////////////////////// Draw
{
  //fade background
  fill(0, 30);
  rect(0,0,width, height);

  //  background(0);
  Phase=(Phase+deltaPhase)%TWO_PI;
  HandleInterface();
  calcPositions();
  renderPositions();
}
void HandleInterface() ///////////////////////////// Collect data from buttons
{
  colorMode(RGB);
  PhaseSpeedBox.update();
  PhaseSpeedBox.display();
  speed=PhaseSpeedBox.getY()*3;
  deltaPhase=PhaseSpeedBox.getX()*.1;  
}

void calcPositions()///////////////////  Engine
{
  float xdist,ydist;
  float deltax,deltay;
  for (int i=0; i<numPoints; i++) //calculate the directions from each point to the next
  {
    xdist=position[i].x - position[(i+1)%numPoints].x;
    ydist=position[i].y - position[(i+1)%numPoints].y;
    direction[i]=atan2(ydist,xdist)+waveRange*sin(((i*TWO_PI*numWaves)/numPoints)+Phase); 
  }
  for (int i=0;i<numPoints;i++) // move each point towards the next
  {
    deltax=position[i].x-cos(direction[i])*speed;
    deltay=position[i].y-sin(direction[i])*speed;
    position[i].set(deltax,deltay,0);
  }    
}
void renderPositions()/////////////////////////// Render
{
  colorMode(HSB,numPoints,100,100);

  float px,py;
  for (int i=0;i<numPoints;i++) 
  {
    stroke(i,100,100);
    fill(i,100,100);
    px=position[i].x;
    py=position[i].y;
    pushMatrix();
    translate(px, py);
    rotate(PI/2+direction[i]);
    triangle ( 0,3, -2,-3, 2,-3);
    popMatrix();
  }  

  //  stroke (255,150,150);
  //  fill(40,40,230,200);  
  //  for (int i=0;i<numPoints;i++) 
  //  {
  //    point(position[i].x, position[i].y);
  //    //ellipse(position[i].x, position[i].y, 5,5);
  //  }  
}
void initializePositions()
{
  background (0);
  Phase=0;
  if (circleSwitch==0)
  {
    for (int i=0;i<numPoints;i++) // fill position array with random values
    {
      position[i]=new PVector( random(40,width-40), random(40,height-40) ); 
    }
    circleSwitch=1;
  }
  else
  {
    int radius=100;
    for (int i=0;i<numPoints;i++) // fill position array with evenly spaced points around a circle
    {
      position[i]=new PVector(width/2+cos(i*TWO_PI/numPoints)*radius,height/2+sin(i*TWO_PI/numPoints)*radius ); 
    }
    circleSwitch=0;
  }
}

void keyPressed()
{
  initializePositions();
}



