
// draw a circle / random radius
// for each circle
//   pick a random angle and length
//   check distance to edge of each circle 
//   if distance is positive draw circle to edge
//
 
Colony[] colonies;
color[] goodcolor = {#f8f7f1, #6b6556, #a09c84, #908b7c, #79746e, #755d35, #937343, #9c6b4b, #ab8259, #aa8a61, #578375, #f0f6f2, #d0e0e5, #d7e5ec, #d3dfea, #c2d7e7, #a5c6e3, #a6cbe6, #adcbe5, #77839d, #d9d9b9, #a9a978, #727b5b, #6b7c4b, #546d3e, #47472e, #727b52, #898a6a, #919272, #AC623b, #cb6a33, #9d5c30, #843f2b, #652c2a, #7e372b, #403229, #47392b, #3d2626, #362c26, #57392c, #998a72, #864d36, #544732 }; 
float MAX_RADIUS = 100;
float SAND_PAINTER_MULTIPIER = 3.0;

void setup() {
 
//  randomSeed(1);

  size(800,800,P2D);
  background(255);
  colonies = new Colony[0];
  Colony tmp = new Colony();
  tmp.initColony(random(800), random(800), random(MAX_RADIUS));  
  colonies[0] = tmp;

}
 
void draw() {
   
    int colonyLength = colonies.length;

//  println("colonyLength: " + colonyLength );
 
    if ( colonyLength < 6000) {
      for (var i = 0; i < colonyLength; i++) {
          colonies[i].drawColony();
          colonies[i].doRunner();
      }
    } else {
      noLoop() ;
//      println(colonyLength + ": " + millis());
    }

}
 
class Colony {
 
  PVector  centre;
  float radius;
  int drawn;
  SandPainter sp;
 
  Colony () {
         drawn = 0;
//       println("Colony done");
  }
 
  void initColony (float xCentre, float yCentre, float newRadius) {

    centre = new PVector(xCentre, yCentre, 0);
    radius = newRadius;
    sp = new SandPainter(radius);

  }
 
  void doRunner () {
 
//       println("Colony doRunner");

    // choose a random angle and a random length, greater than this colonies radius
    // and less than the max radius away from its edge.
   
    float newRadius=random(radius, MAX_RADIUS+radius);
    float angle = random(TWO_PI);
    PVector start = new PVector((cos(angle) * newRadius) + centre.x, (sin(angle) * newRadius) + centre.y, 0);
 
    if (start.x < -MAX_RADIUS || start.y < -MAX_RADIUS ||
        start.x > 900+MAX_RADIUS || start.y > 900+MAX_RADIUS){
          return;
    }
    
    // find the largest conoly we can have without overlapping
   
    float colonyDist = MAX_RADIUS;
    float tmpDist;
 
    int colonyLength = colonies.length;
 
//  println("colonyLength: " + colonyLength );
   
    for (var i = 0; i < colonyLength; i++) {
      Colony tmpColony = colonies[i];
      tmpDist = tmpColony.centre.dist(start) - tmpColony.radius;
      if (tmpDist < 0) {
         // we are inside a colony, so new colony does not grow
         colonyDist = 0;
         break;
      } else {
         if (tmpDist < colonyDist) {
             colonyDist = tmpDist;
         }
     }
 
       
       
    }
   
    // if the colony is too close to an existing on it does not grow.
    if (colonyDist > 1.0 ) {
          Colony tmp =   new Colony();
          tmp.initColony(start.x, start.y, colonyDist);
          colonies[colonyLength] = tmp;
    }
       
  }
 

  void drawColony() {

    if (drawn == 1) {
      // already drawn so don't waste CPU
      return; 
    }
    
    float angle, angleDelta;
    
    angleDelta = asin(1.0 / radius);
    for (angle = 0; angle < TWO_PI;  angle+=angleDelta) {
       float moveX = SAND_PAINTER_MULTIPIER * radius *  sin(angle + 0.5*PI);
       float moveY = SAND_PAINTER_MULTIPIER * radius *  cos(angle + 0.5*PI);

       sp.render(centre.x + moveX , centre.y + moveY, centre.x, centre.y ); 
    }
   
   drawn = 1; 

  }
 
}

// OBJECTS ---------------------------

class SandPainter {

  color c[];
  float g;
  int grains;

  SandPainter(float radius) {

    color tmp = color(somecolor());
    g = random(0.01,0.1);
    // calculate grains by distance
    grains = radius * SAND_PAINTER_MULTIPIER ;
    // smuge the smaller ones
    if (grains < 4) {
      grains = 4;
    }
    
    c = new color[grains];
    for (int i=0;i<grains;i++) {
      float a = 0.1-i/(grains*10.0);
      c[i] = color(red(tmp),green(tmp),blue(tmp),a*256);
    }
    
    
  }
  void render(float x, float y, float ox, float oy) {
    // modulate gain
    g+=random(-0.050,0.050);
    float maxg = 1.0;
    if (g<0) g=0;
    if (g>maxg) g=maxg;
    

    // lay down grains of sand (transparent pixels)
    float w = g/(grains-1);
    for (int i=0;i<grains;i++) {
      float a = 0.1-i/(grains*10.0);
      stroke(c[i]);
      point(ox+(x-ox)*sin(sin(i*w)),oy+(y-oy)*sin(sin(i*w)));
    }
  }
}

// COLOR METHODS -----------------------------------------------

color somecolor() {
  // pick some random good color
  return goodcolor[int(random(goodcolor.length))];
}

