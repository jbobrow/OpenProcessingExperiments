
// Calculate road color based on distance (to correct for perspective).

int myW=848; // Screen width.
int myH=480; // Screen height.

float[] zDepth  = new float[myH/2];
float[] xPos    = new float[myH/2];
float[] xWidth  = new float[myH/2];

int speed = 5;
int positionOld = 0;
int position = positionOld;

int currentColor;
int horizontalDivisions = 10;

void setup() 
{
  size(myW, myH);  

  noSmooth();

  // Precalculate values for the 'fake' perspective.
  for (int i=0;i<(myH/2);i++){
    zDepth[i]  = -140.0/(i-(myH/2));
    xPos[i]    = ((-myW/zDepth[i])/2)+(myW/2);
    xWidth[i]  = (  myW/zDepth[i])/horizontalDivisions;    
  }

}

void draw() {
  background(0,0,0);

  noStroke();
  fill(100,200,255);
  rect(0,0,width,(height/2)+8);
  fill(100,200,100);
  rect(0,(height/2)+8,width,height/2);

  noFill();

  positionOld+=speed;
  if (positionOld>64){positionOld=positionOld-64;}
  position=positionOld;

  for (int i=0;i<(height/2)-7;i++){

    position++;
    if (position>64){position=0;}
    
    currentColor=148;
    if ( (((zDepth[i]*10)+position) % 64) > 32) {
      currentColor=128;
      }
    stroke(currentColor);
    
    float xOffset = round(((mouseX-(width/2))/10.0)*zDepth[i]);


    // Alternate colors horizontaly, and draw width 5 times to generate a grid pattern.
    for (int j=0;j<horizontalDivisions;j++){
      line( xPos[i]+xOffset+(j*xWidth[i]),height-i,xPos[i]+xOffset+(j*xWidth[i])+xWidth[i],height-i );   
      if (currentColor==128){
          currentColor=148;}
          else{
            currentColor=128;
          }
      stroke(currentColor);
    }

  }

}
