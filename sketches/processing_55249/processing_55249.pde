
//code adaption from http://processing.org/discourse/yabb2/YaBB.pl?num=1260051290
//By Anne Marie Hood
//ysdn 1006 Interactivity project 2D

float x=.25;
int x1 = 130;
int y1 = 130;
int x2 = -130;
int y2 = -130;
int a1 = 170;
int b1 = 130;
int a2 = 430;
int b2 = -120;
int c1 = 170;
int d1 = 170;
int c2 = 380;
int d2 = 380;
int e1 = 130;
int f1 = 170;
int e2 = -120;
int f2 = 420;

float interpolate = 0;

int startTime;
int growTime = 1500;//1s

void setup()
{
  size(300, 300);
  smooth();
  int startTime = millis();
}

void draw()
{
  frameRate (10);
  background(0);
  stroke(random (255), random(255), random(255)); //line colour constantly changes
  strokeWeight(x);
  x +=1;
  if (x>50){
  x=.25;}
  //line weight grows by 1 unit from .25 to 50 and then returns to .25 again
  
interpolate = (float)(millis()-startTime)/growTime;
  if(interpolate < 1)
  {
    line(x1, y1, 
	   (int)( (1-interpolate)*x1 + interpolate*x2 ),
	   (int)( (1-interpolate)*y1 + interpolate*y2 ) );	   
  } 
  else
  {
    startTime = millis();
  }//draws line on top left from point near center to out of page
  
interpolate = (float)(millis()-startTime)/growTime;
  if(interpolate < 1)
  {
    line(a1, b1, 
	   (int)( (1-interpolate)*a1 + interpolate*a2 ),
	   (int)( (1-interpolate)*b1 + interpolate*b2 ) );	   
  } 
  else
  {
    startTime = millis();
  }//draws line from top right center to out of page
  
interpolate = (float)(millis()-startTime)/growTime;
  if(interpolate < 1)
  {
    line(c1, d1, 
	   (int)( (1-interpolate)*c1 + interpolate*c2 ),
	   (int)( (1-interpolate)*d1 + interpolate*d2 ) );	   
  } 
  else
  {
    startTime = millis();
  }//draws bottom right line from center to out of page
  
interpolate = (float)(millis()-startTime)/growTime;
  if(interpolate < 1)
  {
    line(e1, f1, 
	   (int)( (1-interpolate)*e1 + interpolate*e2 ),
	   (int)( (1-interpolate)*f1 + interpolate*f2 ) );	   
  } 
  else
  {
    startTime = millis();
  }//draws bottom left line from center to out of page
  
noStroke();
fill(255,255,255, random(255)); 
ellipseMode(CENTER);
ellipse(width/2,height/2,40,40);
//draws a circle of random opacities in the center of the page
}

