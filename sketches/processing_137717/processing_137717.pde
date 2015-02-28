

float W;
float H;

String MODE_INNER_BY_EXTERN  = "inn by ext";
String MODE_INNER_RANDOM     = "inn random";
String MODE_EXTERN_BY_INNER  = "ext by inn";
String MODE_EXTERN_RANDOM    = "ext random";
String MODE_EXTERN_BY_EXTERN = "ext by ext";

String[] aModes = {
  MODE_EXTERN_BY_INNER,
  MODE_EXTERN_RANDOM,
  MODE_EXTERN_BY_EXTERN
  };
  
String[] bModes = {
  MODE_INNER_BY_EXTERN,
  MODE_INNER_RANDOM,
  MODE_EXTERN_BY_EXTERN
  };
  
String aMode = MODE_EXTERN_RANDOM;
String bMode = MODE_INNER_RANDOM;
  
float rMin = 50;
float rMax = 200;

int iterations = 100;

boolean linkOut = false;
boolean linkIn  = false;

PVector a;
PVector b; 
PVector C;

color strokeColor = color(255);//color(240, 20, 60);//

void setup() { 
  size(800,600); 
  W = 600;
  H = 600;
  
  C = new PVector(500, 300);
  a = getExternPointRandom();
  
  setupGUI();
}

void draw() {
    
    background(0);
    stroke(strokeColor);
    
    for(int i=0; i<iterations; i++) {
        b = processPoint(bMode, a);
        line(a.x, a.y, b.x, b.y);
        a = processPoint(aMode, b);
        line(a.x, a.y, b.x, b.y);
        
        if (linkIn)  drawInput(a);
        if (linkOut) drawOutput(b);
    }
    
    fill(0);
    noStroke();
    rect(0,0,width-W,height);
    stroke(255);
    line(width-W,0,width-W,height);
}

void onSetModeExternByExtern() {
    a = getExternPointRandom();
}

PVector processPoint(String mode, PVector p) {
    if      (mode == MODE_INNER_BY_EXTERN)  return getInnerPointByExtern(p);
    else if (mode == MODE_INNER_RANDOM)     return getInnerPointRandom();
    else if (mode == MODE_EXTERN_BY_INNER)  return getExternPointByInner(p);
    else if (mode == MODE_EXTERN_RANDOM)    return getExternPointRandom();
    else if (mode == MODE_EXTERN_BY_EXTERN) return getExternPointByExtern(p);
    else {
      println("error processing point");
      return null;
    }
}

/**
 * getRandomPointInArc
 * @param l1 : the arc delimiter 1
 * @param l2 : the arc delimiter 2
 * @param center : the center of the arc
 * @param radius : the radius of the arc
 * @param wide : choose in wide area ore close area
 */
PVector getRandomPointInArc(PVector l1, PVector l2, PVector center, float radius, boolean wide) {
      l1.sub(center.x, center.y, 0);
      l2.sub(center.x, center.y, 0);
      
      float theta = l1.heading();
      float delta = substractTheta(l2, l1, wide);
      if (delta > 0) theta += random(0, delta);
      else           theta += random(delta, 0);
      
      return new PVector(center.x + cos(theta) * radius, center.y + sin(theta) * radius);
}

/**
 * substractTheta : return the difference between two angles (coul'd be negative, it's not a measure)
 * @param v1 : the vector that define of theta 1
 * @param v2 : the vector that define of theta 2
 * @param wide : choose in wide area ore close area
 */
float substractTheta(PVector v1, PVector v2, boolean wide) {
   //println("substractTheta");
   float t1 = v1.heading();
   float t2 = v2.heading();
   //println("t1:"+t1+" ("+(t1/TWO_PI*360)+"), t2:"+t2+" ("+(t2/TWO_PI*360)+")");
   if (t1 < 0) t1 += TWO_PI;
   if (t2 < 0) t2 += TWO_PI;
   //println("t1:"+t1+" ("+(t1/TWO_PI*360)+"), t2:"+t2+" ("+(t2/TWO_PI*360)+")");
   float r = t1 - t2;
   //println("r:"+r+" > "+(r/TWO_PI*360));
   if (!wide) {
       if (r >  PI) r -= TWO_PI;
       if (r < -PI) r += TWO_PI;
   } else {
       if (r <  PI && r > -PI) {
           if (r > 0) r -= TWO_PI;
           else       r += TWO_PI;
       }
   }
   //println("r:"+r+" > "+(r/TWO_PI*360));
   return r;
}

/** LineIntersectCircle
 * @param E starting point of the ray 
 * @param L end point of the ray
 * @param C center of the sphere
 * @param r radius of the sphere
 */
PVector[] lineIntersectCircle(PVector E, PVector L, PVector C, float r) {
  
    PVector[] inters = new PVector[2];
    
    PVector d = PVector.sub(L,E);
    PVector f = PVector.sub(E,C);
    
    // t*t * (d DOT d) + 2t*( f DOT d ) + ( f DOT f - r2 ) = 0
    // a*t^2 + t*b + c
    float a = d.dot(d) ;
    float b = 2*f.dot(d) ;
    float c = f.dot(f) - r*r ;
    
    float discriminant = b*b-4*a*c;
    
    if (discriminant < 0 ){
        // no intersection
    } else {
      // ray didn't totally miss sphere,
      // so there is a solution to
      // the equation.
    
      discriminant = sqrt( discriminant );
    
      // either solution may be on or off the ray so need to test both
      // t1 is always the smaller value, because BOTH discriminant and
      // a are nonnegative.
      float t1 = (-b - discriminant)/(2*a);
      float t2 = (-b + discriminant)/(2*a);
    
      // 3x HIT cases:
      //          -o->             --|-->  |            |  --|->
      // Impale(t1 hit,t2 hit), Poke(t1 hit,t2>1), ExitWound(t1<0, t2 hit), 
    
      // 3x MISS cases:
      //       ->  o                     o ->              | -> |
      // FallShort (t1>1,t2>1), Past (t1<0,t2<0), CompletelyInside(t1<0, t2>1)
    
      if( t1 >= 0 && t1 <= 1 )
      {
        // t1 is the intersection, and it's closer than t2
        // (since t1 uses -b - discriminant)
        // Impale, Poke
        inters[0] = PVector.add(E, PVector.mult(d, t1));
      } else {
        inters[0] = null;
      }
    
      if( t2 >= 0 && t2 <= 1 )
      {
        inters[1] = PVector.add(E, PVector.mult(d, t2));
      } else {
        inters[1] = null;
      }
    }
    
    
    return inters;
}

PVector[] circleIntersectCircle(PVector c0, float c0r, float c1x, float c1y, float c1r) {
    PVector[] solutions = null;
    float d = distance(c0.x, c0.y, c1x, c1y);
    if (d > c0r + c1r) {
        println("there are no solutions, the circles are separate");
    } else if (d < abs(c0r - c1r)) {
        println("there are no solutions, one circle is contained within the other.");
    } else if (d == 0 && c0r == c1r) {
        println("the circles are coincident and there are infinite number of solutions");
    } else {
        // Considerant : 
        // - P0 le centre de C0, P1 le centre de C1
        // - P3 intersection(s) des cercles C0 et C1 
        // - P2 le projetté othogonal de P3 sur la droite reliant les centre de C0 et C1
        // - a la distance entre p2 et le centre de C1
        // - h la distance entre P2 et P3  
        float a = (c0r*c0r - c1r*c1r + d*d) / (2*d);
        float h = sqrt(c0r*c0r - a*a);
        
        PVector p0 = new PVector(c0.x, c0.y);
        PVector p1 = new PVector(c1x, c1y);
        PVector p2 = PVector.add(p0, PVector.mult(PVector.sub(p1, p0), a/d));
        
        /* PRINT 
        println("d:"+d);
        println("a:"+a);
        println("h:"+h);
        println("p2(:"+p2.x+","+p2.y+")");
        */
        
        solutions = new PVector[2];
        solutions[0] = new PVector(p2.x + h * (p1.y - p0.y) / d, p2.y - h * (p1.x - p0.x) / d);
        solutions[1] = new PVector(p2.x - h * (p1.y - p0.y) / d, p2.y + h * (p1.x - p0.x) / d);
    }
    
    return solutions;
}

float distance(float x1, float y1, float x2, float y2) {
    return sqrt((x2-x1)*(x2-x1)+(y2-y1)*(y2-y1));
}

// projection of C on Vector(AB)
PVector orthogonalProjection(float ax, float ay, float bx, float by, float cx, float cy) {
    PVector v1 = new PVector(bx-ax, by-ay);
    PVector v2 = new PVector(cx-ax, cy-ay);
    float angleBetween = PVector.angleBetween(v1, v2);
    PVector p = new PVector(cos(angleBetween)*v2.mag(), sin(angleBetween)*v2.mag());
    p.add(ax, ay, 0); 
    
    return p;
} 
import controlP5.*;

ControlP5 cp5;
ListBox d1, d2;

void setupGUI() {
  
   cp5 = new ControlP5(this); 
   
   // Radius min
   cp5.addSlider("rMin")
     .setPosition(20,30)
     .setRange(10,150)
     .setValue(rMin)
     ;
     
   // Radius min
   cp5.addSlider("rMax")
     .setPosition(20,50)
     .setRange(160,400)
     .setValue(rMax)
     ;
     
   // Iterations
   cp5.addSlider("iterations")
     .setPosition(20,70)
     .setRange(10,200)
     .setValue(iterations)
     ;
     
   // create a toggle
   cp5.addToggle("linkIn")
     .setPosition(20,100)
     .setSize(50,10)
     ;
     
   // create a toggle
   cp5.addToggle("linkOut")
     .setPosition(20,130)
     .setSize(50,10)
     ;
   
   // point mode
   d1 = cp5.addListBox("a mode");
   d1.setPosition(20,180);
   customizeListbox(d1, aModes);
          
   // point mode
   d2 = cp5.addListBox("b mode");
   d2.setPosition(20,240);
   customizeListbox(d2, bModes);
   
}

void customizeListbox(ListBox lb, String[] modes) {
    lb.setColorActive(color(200));
    for(int i=0;i<modes.length;i++) {
      lb.addItem(modes[i], i);
    }
}

void controlEvent(ControlEvent theEvent) {
  

  if (theEvent.isGroup()) {
    // check if the Event was triggered from a ControlGroup
    // println("event from group : "+theEvent.getGroup().getValue()+" from "+theEvent.getGroup());
    onListboxEvent(theEvent.getGroup().getValue(),theEvent.getGroup());
  }/* 
  else if (theEvent.isController()) {
    println("event from controller : "+theEvent.getController().getValue()+" from "+theEvent.getController());
    //onListboxEvent(theEvent.getController().getValue(),theEvent.getController());
  }*/
}

void onListboxEvent(float index, ControllerGroup d) {
  String value = "";
  if (d.getName() == "a mode") {
      //println("a mode event : "+index);
      value = aModes[int(index)];
      aMode = value;
  } else if (d.getName() == "b mode") {
      //println("b mode event");
      value = bModes[int(index)];
      bMode = value;
  }
  
  if (value == MODE_EXTERN_BY_EXTERN){
      aMode = value;
      bMode = value;
      onSetModeExternByExtern();
  } else {
     if (aMode == MODE_EXTERN_BY_EXTERN) aMode = aModes[0];
     if (bMode == MODE_EXTERN_BY_EXTERN) bMode = bModes[0];
  }
}

//////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////
//
// - INNER
//

/** getInnerPoint
 * @param extern
**/
PVector getInnerPointByExtern(PVector extern) {
  //println("getInnerPointByExtern");
  float c1x = (C.x + extern.x) / 2;
  float c1y = (C.y + extern.y) / 2;
  float c1r = distance(C.x, C.y, c1x, c1y);
  
  /*debug
  stroke(0);
  ellipse(c1x, c1y, c1r*2, c1r*2);*/
  
  PVector[] inters = circleIntersectCircle(C, rMin, c1x, c1y, c1r);
  
  if (inters != null) {
    
      PVector inter1 = inters[0];
      PVector inter2 = inters[1];
      
      /*debug
      line(C.x, C.y, inter1.x, inter1.y);
      line(C.x, C.y, inter2.x, inter2.y);*/
      
      return getRandomPointInArc(inter1, inter2, C, rMin, false);
  } else {
    return null;
  }
}

/** 
 * getExternalPointRandom
**/
PVector getInnerPointRandom() {
    float theta = random(0,TWO_PI);
    return new PVector(C.x + cos(theta) * rMin, C.y + sin(theta) * rMin);
}

//////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////
//
// - EXTERN
//

/** 
 * getExternPoint
 * @param inner : the last point
**/
PVector getExternPointByInner(PVector inner) {
  //println("getExternPoint");
  if (inner == null) {
      return getExternPointRandom();
  } else {
      // 1 - récupérer la tangente (EL), sous forme de droite
      PVector d = PVector.sub(inner, C);
      d.setMag(1000);
      d.rotate(HALF_PI);
      PVector E = PVector.add(inner, d);
      d.rotate(-PI); 
      PVector L = PVector.add(inner, d);
      
      /*//debug
      stroke(240, 20, 60);
      line(E.x, E.y, L.x, L.y);*/
      
      // 2 - récupérer les intersections de la tangente (EL) au cercle C de rayon rMax
      PVector[] inters = lineIntersectCircle(E, L, C, rMax);
      
      if (inters != null) {
          PVector inter1 = inters[0];
          PVector inter2 = inters[1];
          
          /*//debug
          println("drawing inter1 in green");
          stroke(60, 240, 60);
          line(C.x, C.y, inter1.x, inter1.y);
          println("drawing inter2 in blue");
          stroke(60, 200, 200);
          line(C.x, C.y, inter2.x, inter2.y);
          stroke(0);*/
      
          return getRandomPointInArc(inter1, inter2, C, rMax, false);
      } 
      else {
          return null;
      } 
  }
}

/** 
 * getExternalPoint
 * @param extern
**/
PVector getExternPointByExtern(PVector extern) {
  //println("getExternalPoint");
  if (extern == null) {
      return getExternPointRandom();
  } else {
      //println("getInnerPoint");
      float c1x = (C.x + extern.x) / 2;
      float c1y = (C.y + extern.y) / 2;
      float c1r = distance(C.x, C.y, c1x, c1y);
      
      /*debug
      stroke(0);
      ellipse(c1x, c1y, c1r*2, c1r*2);*/
      
      PVector[] inters = circleIntersectCircle(C, rMin, c1x, c1y, c1r);
      PVector intersection1 = inters[0];
      PVector intersection2 = inters[1];
      
      /*debug
      line(C.x, C.y, intersection1.x, intersection1.y);
      line(C.x, C.y, intersection2.x, intersection2.y);*/
      
      PVector inter2End = PVector.add(intersection2, PVector.sub(intersection2, extern));
      PVector inter1End = PVector.add(intersection1, PVector.sub(intersection1, extern));
      
      /*debug
      stroke(200,150,20);
      line(extern.x, extern.y, inter1End.x, inter1End.y);
      line(extern.x, extern.y, inter2End.x, inter2End.y);*/
          
      return getRandomPointInArc(inter1End, inter2End, C, rMax, true);
  }
}

/** 
 * getExternalPointRandom
**/
PVector getExternPointRandom() {
    float theta = random(0,TWO_PI);
    return new PVector(C.x + cos(theta) * rMax, C.y + sin(theta) * rMax);
}

//////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////
//
// - INPUT / OUTPUT
//



void drawInput(PVector inner) {
  
    line(inner.x, inner.y, C.x, C.y);
}

void drawOutput(PVector extern) {
  
    float theta = PVector.sub(extern,C).heading();
    
    // V3
    line(extern.x, extern.y, C.x+cos(theta)*W, C.y+sin(theta)*H);
    
    /* V1
    if (theta >= 0 && theta < HALF_PI)        line(extern.x, extern.y, width, height);
    else if (theta >= HALF_PI && theta < PI)  line(extern.x, extern.y, 0,     height);
    else if (theta < 0 && theta >= -HALF_PI)  line(extern.x, extern.y, width, 0     );
    else                                      line(extern.x, extern.y, 0,     0     );
    */
          
    // V2
    //line(extern.x, extern.y, C.x+cos(theta)*width, C.y+sin(theta*height));
}


