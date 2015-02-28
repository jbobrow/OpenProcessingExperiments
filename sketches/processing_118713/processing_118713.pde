
// draw a circle / random radius
// for each circle
//   pick a random angle and length
//   check distance to edge of each circle
//   if distance is positive draw circle to edge
//

float MAX_RADIUS = 200;

Colony[] colonies;

 
void setup() {
  
  randomSeed(1);
 
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
  
    if ( colonyLength < 2000) {
      for (var i = 0; i < colonyLength; i++) {
          colonies[i].drawColony();
          colonies[i].doRunner();
      }
    } else {
      noLoop() ;
      println(colonyLength + ": " + millis());
    }
 
}
  
class Colony {
  
  PVector  centre;
  float radius;
  int drawn;
  Flower sp;
  
  Colony () {
         drawn = 0;
//       println("Colony done");
  }
  
  void initColony (float xCentre, float yCentre, float newRadius) {
 
    centre = new PVector(xCentre, yCentre, 0);
    radius = newRadius;
    float  em = 12;
    float    n1 = 1.35;
    float    n2 = -0.8 + random(-0.4, 0);
    float    n3 = 0.4;

    sp = new Flower(em,n1,n2,n3); //<>//
 
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
     
    // find the largest colony we can have without overlapping
    
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
    if (colonyDist > 10.0 ) {
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

   sp.draw(centre.x , centre.y, radius, radius, random(TWO_PI));
     
   drawn = 1;
 
  }
  
}
 
class Flower {
 
   PShape _flower;
   int _noOfPoints = 400;  
  
   float m, n1, n2, n3;
   
   Flower (float m,float n1,float n2,float n3) {
  
    this.m = m;
    this.n1 = n1;
    this.n2 = n2;
    this.n3 = n3;
       
   } 

void draw(float cx, float cy, float xscale, float yscale, float rotate) {
  
  float d, sin_phi, cos_phi;

  sin_phi = sin(rotate);
  cos_phi = cos(rotate);
  
  fill(0,0,0, 127);
  noStroke();
   
  SuperShapeDraw(cx+20, cy + 20, xscale, yscale, sin_phi, cos_phi);  //<>//

  xscale += 20;
  yscale += 20;

  for(int i=0; i<20; i++) {
       xscale -= 4;
       yscale -= 4;

       d = 255 * ((float)i/20.0);
       fill(255, d, d+64, 60);
       stroke(255,0,51);
       strokeWeight(0.25);
       SuperShapeDraw(cx, cy, xscale, yscale, sin_phi, cos_phi);  //<>//
  }
  
}
   
   void SuperShapeDraw (float cx, float cy, float xscale, float yscale, float sin_phi, float cos_phi) {
    
    beginShape();

    for (int i=0;i<=_noOfPoints;i++) {

      float r;
      float t1,t2;
      float a=1,b=1;
      float x, y;
   
      phi = i * TWO_PI / _noOfPoints; //<>//

      t1 = cos(m * phi / 4) / a;
      t1 = abs(t1);
      t1 = pow(t1,n2);

      t2 = sin(m * phi / 4) / b;
      t2 = abs(t2);
      t2 = pow(t2,n3);

      r = pow(t1+t2,1/n1);
      if (abs(r) == 0) {
          x = 0;
          y = 0;
      } else {
         r = 1 / r;
         x = r * cos(phi);
         y = r * sin(phi);
     }
     
     float rx = (x  * cos_phi) - (y  * sin_phi);
     float ry = (y  * cos_phi) + (x * sin_phi);
    
     vertex(cx+(rx*xscale), cy+(ry*yscale));
           
   }

    endShape(CLOSE);

  
   }
}

