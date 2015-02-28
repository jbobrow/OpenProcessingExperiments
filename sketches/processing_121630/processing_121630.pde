
/*
   generate randon end points
   generate random start points
   allocate an end point to each start point (nearest ?)
   generate tween points for curved path (points on line + random offsets)
   draw circle at curvePoint based on tween points on make cone.
*/   
   
// Parameters

int NO_OF_ENDPOINTS = 3;
int NO_OF_CONES = 120;
int NO_OF_CURVES = 7;
int RANDOM_RANGE = 20;

float NO_OF_CIRCLES_PER_CURVE = 40;

color cEndPoint = color(255,0,0);
color cCircleStroke = color(0);
color cCircleFill = color(255);

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
  strokeWeight(0.25);
  fill(cCircleFill);
  
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
    
      // create points for curve
//      println(x+","+y);
//      println(endx[nearestEndPoint]+","+endy[nearestEndPoint]);
                      
      float deltax = (endx[nearestEndPoint] - x) / (NO_OF_CURVES); 
      float deltay = (endy[nearestEndPoint] - y) / (NO_OF_CURVES);

//      println(deltax+","+deltay);

          tweenx[0] = x;
          tweeny[0] = y;

//      println(tweenx[0]+","+tweeny[0]+"["+0+"]");
    
      for(int i=1; i<NO_OF_CURVES; i++) {
          tweenx[i] = x + (deltax * i) + random (-RANDOM_RANGE, RANDOM_RANGE);
          tweeny[i] = y + (deltay * i) + random (-RANDOM_RANGE, RANDOM_RANGE);
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
    } else if (deltaPoint < NO_OF_CURVES - 1.5 ) {
        int i = (int)deltaPoint - 1;
        float t = deltaPoint % 1;
        float cx = curvePoint(tweenx[i], tweenx[i+1], tweenx[i+2], tweenx[i+3], t); 
        float cy = curvePoint(tweeny[i], tweeny[i+1], tweeny[i+2], tweeny[i+3], t); 
    }
    
    ellipse(cx, cy, radius, radius);
    radius *= min(0.60 + 0.5*sqrt(deltaPoint), 1) ;  
    deltaPoint += delta;    



    
  }  

  void draw_0ld() {
    
    deltaPoint = 0;
    float radius = random(30,150);
//      println("");
//      println("");
    
    // FIRST CURVE first control point matches fIrst draw point
    for(float t=0; t<1.0; t += delta) {
        float cx = curvePoint(tweenx[0], tweenx[0], tweenx[1], tweenx[2], t); 
        float cy = curvePoint(tweeny[0], tweeny[0], tweeny[1], tweeny[2], t);
//             println(cx+","+cy+","+t);
        ellipse(cx, cy, radius, radius);
        radius *= min(0.60 + 0.5*sqrt(t), 1) ;        
    }
  
   
    for(int i=0; i<NO_OF_CURVES-2; i++) {
        for(float t=0; t<1.0; t += delta) {
             
             float cx = curvePoint(tweenx[i], tweenx[i+1], tweenx[i+2], tweenx[i+3], t); 
             float cy = curvePoint(tweeny[i], tweeny[i+1], tweeny[i+2], tweeny[i+3], t); 
 
 //            println(cx+","+cy+","+t);
        radius *= min(0.60 + 0.5*sqrt(t+1), 1) ;        
          
        ellipse(cx, cy, radius, radius);
 //       radius *= 0.99;        
          
        }
    }
    
    // LAST CURVE last control point matches laast draw point, leave a gap at the end.
    for(float t=0; t<0.5; t += delta) {
        float cx = curvePoint(tweenx[NO_OF_CURVES-2], tweenx[NO_OF_CURVES-1], tweenx[NO_OF_CURVES], tweenx[NO_OF_CURVES], t); 
        float cy = curvePoint(tweeny[NO_OF_CURVES-2], tweeny[NO_OF_CURVES-1], tweeny[NO_OF_CURVES], tweeny[NO_OF_CURVES], t);
//             println(cx+","+cy+","+t);
        ellipse(cx, cy, radius, radius);
//        radius *= 0.99;        
    }

    
  }  
  
}



