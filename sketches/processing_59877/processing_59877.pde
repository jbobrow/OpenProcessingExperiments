
// **Created by Aparna J. Nambiar
//Displays alternative black and white strands

int bColor = 0; //background color
double length2;
int midpointx;
int midpointy;
int currentStroke=255;

void setup()
{
  //initialize the screen
  screenWidth=500;
  screenHeight=300;
  size(screenWidth, screenHeight);
  background(bColor);
  smooth();
  noFill();
  strokeWeight(4);
  //initialize random points
  int x1 = (int) random(0,screenWidth);
  int x2 = (int) random(0,screenWidth);
  int y1 = (int) random(0,screenHeight);
  int y2 = (int) random(0,screenHeight);
  length2 = Math.pow(x2-x1,2)+Math.pow(y2-y1,2);
  stroke(255);
  line(x1,y1,x2,y2);
  midpointx =(x1+x2) /2;
  midpointy =(y1+y2) /2;
  frameRate(10);
}

void draw()
{
  int x = (int) random(0, (float)Math.sqrt(length2));
  x=midpointx+(x * ((int)random(0,2)*2-1)); 
  //midpoint +- something less than length
  if(x<0 ||x >screenWidth){
    x= (x-midpointx) *-1 +midpointx ; 
  } // ensure that selected point is within bounds

  double y2 =  length2 - Math.pow(x-midpointx,2);
  int y = (int) ((Math.sqrt(y2)* ((int)random(0,2)*2-1))+midpointy);
  if(y<0 ||y >screenHeight){
   y= (y-midpointy) *-1 +midpointy ;
 }
 line(  midpointx, midpointy,x,y);
 midpointx = (midpointx +x)/2;
 midpointy = (midpointy +y)/2;
//delay(500);
if(frameCount %300 ==0){
  currentStroke = Math.abs(255-currentStroke);
  stroke(currentStroke);
}
// stroke(255-((frameCount/8)%255));

}




