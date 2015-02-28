
ArrayList<RandRecord> currents = new ArrayList<RandRecord>();
RandRecord jet = new RandRecord(null, null, null);
Triangle test = new Triangle( new Point( 200, 400 ), new Point( 300, 200 ), new Point( 400, 400 ) );
Point freshAB = jet.getRandPt( test.a, test.b );
Point freshBC = jet.getRandPt( test.b, test.c );
Point freshAC = jet.getRandPt( test.a, test.c );
Triangle test2 = new Triangle(freshAB, freshAC, test.a);
Triangle test3 = new Triangle(freshAB, freshBC, test.b);
Triangle test4 = new Triangle(freshAC, freshBC, test.c);
    
void setup() {
  size(600, 600);
  background(200);
  noLoop();
  smooth();
}

void draw() {
  
  background(255);
  Triangle test = new Triangle( new Point( 200, 400 ), new Point( 300, 200 ), new Point( 400, 400 ) );
  recur(test, 2);
  recur(test2, 2);
  recur(test3, 2);
  recur(test4, 2);
}

void recur(Triangle first, int step) {
  println("step is " + step);
  if ( step == 0) {
    println("step = 0, rendering \"first\"");
    first.render();
    return;
  } 
  else {
    Point freshAB = jet.getRandPt( first.a, first.b );
    Point freshBC = jet.getRandPt( first.b, first.c );
    Point freshAC = jet.getRandPt( first.a, first.c );
    Triangle t1 = new Triangle(freshAB, freshBC, freshAC);
    Triangle t2 = new Triangle(freshAB, freshAC, first.a);
    Triangle t3 = new Triangle(freshAB, freshBC, first.b);
    Triangle t4 = new Triangle(freshAC, freshBC, first.c);
    println("about to recurse on triangle " + "t1"); 
   // t1.render();
   int next = step-1;
    recur( t1, next);
    println("about to recurse on triangle " + "t2"); 
   // t2.render();
    recur( t2, next);
    println("about to recurse on triangle " + "t3");
   // t3.render();
    recur( t3, next);
    println("about to recurse on triangle " + "t4");
   // t4.render();
    recur( t4, next);
  }
}


class Triangle {
  Point a;
  Point b;
  Point c;
  Line abLine;
  Line bcLine;
  Line acLine;

  Triangle(Point d, Point e, Point f) {
    a = d;
    b = e;
    c = f;
    abLine = new Line ( a, b );
    bcLine = new Line ( b, c );
    acLine = new Line ( a, c );
  }

  /*Point midAB() {
   return new Point( (a.x + b.x) / 2 , (a.y + b.y) / 2);
   }
   
   Point midBC() {
   return new Point( (b.x + c.x) / 2 , (b.y + c.y) / 2);
   }
   
   Point midAC() {
   return new Point( (a.x + c.x) / 2 , (a.y + c.y) / 2);
   }*/

  Point randBetweenAB() {
    return abLine.pointAir();
  }

  Point randBetweenBC() {
    return bcLine.pointAir();
  }

  Point randBetweenAC() {
    return acLine.pointAir();
  }

  void render() {
    line(a.x, a.y, b.x, b.y);
    line(a.x, a.y, c.x, c.y);
    line(c.x, c.y, b.x, b.y);
  }
}

class Point {
  float x;
  float y;
  Point( float ax, float ay ) {
    x = ax;
    y = ay;
  }
}



class RandRecord {
  Point a = null;
  Point b = null;
  Point r = null;



  RandRecord( Point g1, Point g2, Point b3) {
    a = g1;
    b = g2;
    r = b3;
  }

  Point getRandPt( Point x, Point y) {
    for (RandRecord cur : currents) {
      if (x == cur.a && y == cur.b || y == cur.a && x == cur.b ) { //record found
        return cur.r;
      }
    }

    //rand pt btwn x & y was never determined, find that pt & add to list of records
    Line l = new Line(x, y);
    Point rand = l.pointAir();
    currents.add( new RandRecord(x, y, rand));
    return rand;
  }
}

class Line {
  Point orig1;
  Point orig2;
  float origM;
  float origB;
  float mInverse;
  float bInverse;
  // float distance12;

  Line(Point a, Point b) {
    orig1 = a;
    orig2 = b;
    origM = (orig1.y- orig2.y) / (orig1.x - orig2.y);
    origB = (a.y - origM * a.x);
    //distance12 = Math.sqrt(Math.pow(orig1.y - orig2.y, 2) + Math.pow( orig1.x - orig2.x, 2 ));
    mInverse = - 1/origM;
  }

  Point randPointOnLine() {
    float firstX;
    float firstY;

    if ( orig1.x == orig2.x ) {
      firstX = orig1.x;
      if ( orig1.y > orig2.y ) {
        firstY = random(orig2.y, orig1.y);
      } 
      else {
        firstY = random(orig1.y, orig2.y);
      }
      
    } 
    
   
      
    else if ( orig1.x > orig2.x) {
      firstX = random(orig2.x, orig1.x);
    } 
    else {
      firstX = random(orig1.x, orig2.x);
    } 
    firstY = origM * firstX  +  origB;
    bInverse = firstY - mInverse * firstX;
    Point firstP = new Point (firstX, firstY);
    return firstP;
  }

  Point pointAir() {
    Point rand = this.randPointOnLine();
    Point air;
    float finalX;
    float finalY;
    float c4;
    float cX;
    float cY;
    
    if (origM == 0) {
      float d;
      if(orig2.x > orig1.x) {
        d = orig2.x - orig1.x;
        finalX = random(orig1.x, orig2.x);
       // finalY = random(orig1.y - d/3, orig1.y + d/3);
      } else {
        d = orig1.x - orig2.x;
        finalX = random(orig1.x, orig2.x);
      }
      finalY = random(orig1.y - d/3, orig1.y + d/3);
      air = new Point( finalX, finalY );
      return air;
    }
    
     if ( orig1.y == orig2.y ) {
       float d;
       if(orig1.y < orig2.y) {
         d = orig2.y - orig1.y;
         finalY = random( orig1.y, orig2.y);
       } else {
         d = orig1.y - orig2.y;
         finalY = random( orig2.y, orig1.y );
       }
       finalX = random( orig1.x - d/3, orig1.x + d/3);
       air = new Point( finalX, finalY ) ;
       return air;
     }   
    
    cX = abs(orig1.x - orig2.x);
    cY = abs(orig1.y - orig2.y);
    if( orig1.x > orig2.x && orig1.y > orig2.y){
      finalX = random( orig2.x - cX/2, orig1.x + cX/2);
      finalY = random( orig2.y - cY/2, orig1.y + cY/2);
    } else if ( orig1.x < orig2.x && orig1.y < orig2.y) {
      finalX = random( orig1.x - cX/2, orig2.x + cX/2);
      finalY = random( orig1.y - cY/2, orig2.y + cY/2);
    } else if ( orig1.x > orig2.x && orig1.y < orig2.y) { 
      finalX = random( orig2.x - cX/2, orig1.x + cX/2);
      finalY = random( orig1.y - cY/2, orig2.y + cY/2);
    } else {//if( orig1.x < orig2.x && orig1.y > orig2.y)  {
      finalX = random( orig1.x - cX/2, orig2.x + cX/2);
      finalY = random( orig2.y - cY/2, orig1.y + cY/2);
    }  
    return new Point(finalX, finalY);
     
    
    /*if ( orig1.x < orig2.x ) {
      c4 = (orig2.x - orig1.x) / 3;
      finalX = random(orig1.x + c4, orig2.x - c4);
    } 
    else {//( orig1.x >  orig2.x) 
      c4 = (orig1.x - orig2.x) / 3 ;
      finalX = random(orig2.x + c4, orig2.x - c4);
    }

    finalY = mInverse * finalX + bInverse;
    air = new Point(finalX, finalY);
    return air;*/
  }
}


