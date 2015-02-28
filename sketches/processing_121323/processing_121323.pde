
/*
   generate randon end points
   generate random start points
   allocate an end point to each start point (nearest ?)
   generate tween points for curved path (points on line + random offsets)
   draw circle at curvePoint based on tween points on make cone.
*/  
    
// Parameters
 
int NO_OF_ENDPOINTS = 3;
int NO_OF_CONES = 150;
int NO_OF_CURVES = 4;
int RANDOM_RANGE = 30;
 
float NO_OF_CIRCLES_PER_CURVE = 40;
 
color cEndPoint = color(255,0,0);
color cCircleStroke = color(190);
color cCircleFill = color(255);
int colorFade=150;
 
float[] endx = new float[NO_OF_ENDPOINTS];
float[] endy = new float[NO_OF_ENDPOINTS];
 
Cones[] cones = new Cones[NO_OF_CONES];
 
void setup () {
  size(800,600, P2D);
  smooth(4);
  frameRate(30);
  refresh();
}
 
void refresh() {
  background(255);
  setupEndpoints();
  setupCones();
}
 
void mouseReleased() {
  refresh();
}
 
void draw() {
   
  stroke(cCircleStroke);
  strokeWeight(1);
  fill(cCircleFill);
 
  cCircleStroke = color(colorFade) ; 
  colorFade = max(--colorFade, 110);
  
  for (int i=0; i<NO_OF_CONES; i++) {
    cones[i].draw();
  }
 
  stroke(cEndPoint);
  for (int i=0; i<NO_OF_ENDPOINTS; i++) {
     ellipse(endx[i], endy[i], 3,3);
  }
   
//  noLoop();
}
void setupEndpoints() {
   
  for (int i=0; i<NO_OF_ENDPOINTS; i++) {
   
    endx[i] = random(100,width-100);
    endy[i] = random(100,height-100);
     
  }
}
void setupCones() {
 
  for (int i=0; i<NO_OF_CONES; i++) {
   
    cones[i] = new Cone(random(0,width), random(0,height), endx, endy);
     
  }
}
 
class Cone {
 
  float[] tweenx = new float[NO_OF_CURVES+1];
  float[] tweeny = new float[NO_OF_CURVES+1];
   
  float radius = random(30,150);
  float delta =  1.0 / NO_OF_CIRCLES_PER_CURVE;
  float deltaPoint =  0;

 
  Cone (float x, float y, float[] endx, float[] endy) {
     
      float nearest = MAX_FLOAT;
      int nearestEndPoint = 0;
      // find the nearest endpoint
      for (int i=0; i<NO_OF_ENDPOINTS; i++) {
          float distanceSquared = ((x - endx[i]) * (x - endx[i])) + ((y - endy[i]) * (y - endy[i])) ;
          if (distanceSquared < nearest) {
             nearest = distanceSquared;
             nearestEndPoint = i;
          }
      }
     
     
      float deltax = endx[nearestEndPoint] - x;
      float deltay = endy[nearestEndPoint] - y;
      // create points for curve
//      println(x+","+y);
//      println(endx[nearestEndPoint]+","+endy[nearestEndPoint]);


 
      // figure out the y=mx+c;  c = y=mx
      float m = deltay/deltax;
      float mpd = -1/m;
      float c = y - (m*x) ;
      

                             
      deltax /= NO_OF_CURVES;      
      deltay /= NO_OF_CURVES;      


//      println(deltax+","+deltay);
 
       tweenx[0] = x;
       tweeny[0] = y;
 
//      println(tweenx[0]+","+tweeny[0]+"["+0+"]");

      // create the tween points as points on parallel lines at random distances
      // from the line between the cone startpoint and chosen endpoint
     
      for(int i=1; i<NO_OF_CURVES; i++) {
        

          float x1 =  x + (deltax * i) ;
          float y1 =  y + (deltay * i) ;
                            
          // parallel line
          float cpl = c + random (-RANDOM_RANGE, RANDOM_RANGE);
         
          float xpl = -1; 
          float ypl = (m*xpl)+cpl;
          
           float b1 = xpl;    // xpl - 0
           float a1 = cpl - ypl;
           float c1 = (a1 * xpl) + (b1 * ypl);
                
         // perpendicular line
          float cpd =  y1 - (mpd*x1); 
         
          float xpd = -1; 
          float ypd =  (mpd*xpd)+cpd;
          
         float b2 = xpd - x1;   
         float a2 = y1 - ypd;
         float c2 = a2 * x1 + b2 * y1;
         
          // calculate the intersection between perpendiclar and parallel line
         
         float det =  a1*b2 - a2*b1; 
           
         tweenx[i] = (b2*c1 - b1*c2)/det;
         tweeny[i] = (a1*c2 - a2*c1)/det;
                    

//      println(tweenx[i]+","+tweeny[i]+"["+i+"]");
      }
       
      tweenx[NO_OF_CURVES] = x + (deltax * NO_OF_CURVES);
      tweeny[NO_OF_CURVES] = y + (deltay * NO_OF_CURVES);
 
//      println(tweenx[NO_OF_CURVES]+","+tweeny[NO_OF_CURVES]+"["+(NO_OF_CURVES)+"]");
    
          
  }
   
  void draw() {
     
     
    if( deltaPoint < 1) {;
        float cx = curvePoint(tweenx[0], tweenx[0], tweenx[1], tweenx[2], deltaPoint);
        float cy = curvePoint(tweeny[0], tweeny[0], tweeny[1], tweeny[2], deltaPoint);
//    } else if (deltaPoint < NO_OF_CURVES - 1.5 ) {
    } else if (deltaPoint < NO_OF_CURVES + 0.5 ) {
        int i = (int)deltaPoint - 1;
        float t = deltaPoint % 1;
        float cx = curvePoint(tweenx[i], tweenx[i+1], tweenx[i+2], tweenx[i+3], t);
        float cy = curvePoint(tweeny[i], tweeny[i+1], tweeny[i+2], tweeny[i+3], t);
    }
     
    ellipse(cx, cy, radius, radius);
    radius *= min(0.60 + 0.55*sqrt(deltaPoint), 0.95) ; 
    radius = max (radius , 0.5);
    deltaPoint += delta;  
 }
    
}

 
 
