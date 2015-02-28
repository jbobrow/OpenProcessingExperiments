
/*

  Drawing dots like a sunflower would
  moritz@stefaner.eu
  
  This code requires the processing IDE
  http://processing.org
  
  or, just let in run in your browser at
  http://www.openprocessing.org/visuals/?visualID=30062

*/

// circle size
float radius = 6f;

// phi, see http://en.wikipedia.org/wiki/Golden_ratio
float PHI = .6180339887;

// we will advance a golden section of a full circle in each step
float angleStep = TWO_PI * PHI;

// set counters to zero
int counter = 0;
float angle = 0;

// setup drawing basics
void setup(){
  size(600,600);
  noStroke();
  smooth();
  frameRate(60);
  fill(0);
}

// setup drawing basics
void draw(){
  
  background(240);
  
  // reset angle
  angle = 0;
  // uncomment above line for psy trance visuals
  
  // in each frame, draw one dot more
 if(counter<10000) counter += 1;

  for (int i = 0; i < (int) counter; i++){
    
    float r = radius; 

    // variation: scale inside to outside
    // r *= (Math.sqrt(i)*.05f);
    
     // radius proportional to square of index of point
    float distance = (float) Math.sqrt(i+.5) * radius;
    
    // variation: tunnel
    // distance /= (i*.005f);
    
    // place dot at current angle and radius
    float x = (float) (300 + Math.cos(angle) * distance);
    float y = (float) (300 + Math.sin(angle) * distance);
    
    ellipse(x, y, r, r);   
    
    // advance current angle by golden section of full circle
    angle += angleStep;
    
    // that's it!
  }
}

