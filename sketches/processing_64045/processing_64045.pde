
//number of curves to show
int lineCount = 40;

void setup()
{
//  size(screen.width,screen.height,P2D);
  size(600,400,P2D);
  noCursor();
  initCachedSin();  
}

void draw()
{
  background(0);

  //number of verticies in each curv
  int segCount = width;
  float hSpacing = width*1.0f/segCount;
  //strokeWeight(5);
  strokeJoin(ROUND);
  stroke(255);
  
  //consistent time value for all sine calculations
  float tm = millis()/400.0;
  //a modulating amount holding the max amplitude for the sine waves
  float maxLineAmp = -200.0f*(sn(tm/2.3) + 1)/2.0;
  //spacing between lines
  float vSpacing = (height- maxLineAmp)*1.0f/lineCount;
  //amount to offset the lines - note we go from -lineCount/2 to +lineCount/2
  float vOffset = 0.5f*height + height*0.45f/lineCount;//*1.0f/lineCount;
  //this periodically changes the frequency of the lines
  float snModulator = 1.0f+2.0*(sn(tm/10)+1.0f)/2.0f;
  for(int i = 0; i < lineCount; i++)
  {
    beginShape(LINES);
    for(int j = 0; j < segCount; j++)
    {
      //calculate the vertical displacement of this vertex in the curve
      float amp = sn( (j-segCount/2.0)/(15.0*snModulator)) * (i-lineCount/2.0)*maxLineAmp/lineCount;
      // add the smaller wiggle
      amp += (maxLineAmp/190) * sn(j/2.0f+tm*5);
      vertex(j*hSpacing,vOffset + (i-lineCount/2)*vSpacing + amp);
    }
    endShape();
  }
  println("frameRate:" + frameRate);
}

//////////////////
//lookup table implementation for sin; to speed it up.
//number of values to hold in the lookup table - more values better, more conituous function
// fewer values - faster implementation, less memory footprint.
final int sinCacheSz = (int)(50*TWO_PI); 
float sinCacheSzDivTWOPI; 
float cachedSin[];

//cache all the values for the array
void initCachedSin()
{
  //we will want this value later when we're pulling values from the array
  sinCacheSzDivTWOPI = (sinCacheSz/TWO_PI);
  cachedSin = new float[sinCacheSz];
  for(int i = 0; i < cachedSin.length; i++)
  {
    cachedSin[i] = sin(i*TWO_PI/cachedSin.length);
  }
}

//new implementation of sin() function
float sn(float t)
{  
  //reduce 't' to a number between 0 and TWO*PI
  float tmp = t%TWO_PI;
  //if it's (now) a negative number increase by two pi
  if(tmp < 0)
    tmp += TWO_PI;
  // scale up the new index
  int index = (int)(tmp * sinCacheSzDivTWOPI);
  return cachedSin[index];
}
//////////////////////////

