
dots test1;
dots test2;
void setup() {
  size(600, 600,P3D );

  //dots(StartPunkt, EndPunkt,Anzahl der Zwischenpunkte, LotAbstand der Punkte zu Linen 
  test1 = new dots( new PVector(0, 80), new PVector(), 150, 20);
  test2 = new dots( new PVector(0, 600-80), new PVector(), 150, 20);
}
void draw() {
  background(255);
  test1.display();
  test2.display();

  fill(0);
  //  text(int(frameRate) + " fps  " +(test1.n+test2.n) + " dots", 20, 20);
  test1.B.set(mouseX, mouseY);
  test2.B.set(mouseX, height-mouseY);
}

/*boolean sketchFullScreen() {
 return true;
 }*/
class dots {
  PVector A, B;
  int n;
  float maxDist;
  FloatList onLine = new FloatList(); 
  FloatList strokeWeight = new FloatList(); 
  FloatList distFromLine = new FloatList(); 
  ArrayList <PVector> PointsOnLine; 
  ArrayList <PVector> PointsPerpendicular2Line; 

  dots(PVector _A, PVector _B, int _n, float _maxDist) {
    A=_A;
    B=_B;
    n=_n;
    maxDist=_maxDist;
    PointsOnLine = new ArrayList<PVector>();  
    PointsPerpendicular2Line = new ArrayList<PVector>();  
    for (int i =0; i<n+1;i++)strokeWeight.append(5);
    for (int i =0; i<n+1;i++)distFromLine.append(random( -maxDist, maxDist));
    for (int i =0; i<n+1;i++)onLine.append(random(0.000001, 1));
    calcPointsonLine();
    calcPointsPerpendicular2Line();
  }
  void update() {
    chkNeighbour();
    calcPointsonLine();
    calcPointsPerpendicular2Line();
  }
  void display() {
    update() ;
    // strokeWeight(1);
    // carLine(A, B);
    //carPoint(A);
    //carPoint(B);
    //  for (PVector p : PointsOnLine) carPoint(p);
    for (PVector p : PointsPerpendicular2Line) {
      stroke(0, 100);
      strokeWeight(strokeWeight.get(PointsPerpendicular2Line.indexOf(p)));
      carPoint(p);
    }
  }
  void calcPointsonLine() {
    PointsOnLine.clear();

    for (int i =0; i<n;i++) {
      PVector A2B = PVector.sub(B, A);
      A2B.mult(onLine.get(i));
      A2B.add(A);
      PointsOnLine.add(A2B);
    }
  }
  void calcPointsPerpendicular2Line() {    
    PointsPerpendicular2Line.clear();
    for (int i =0; i<n;i++) {
      PVector A2B = PVector.sub(B, A);
      PVector perpendicular2Line = A2B.cross( new PVector(0, 0, 1));
      perpendicular2Line.setMag(distFromLine.get(i));
      perpendicular2Line.add(PointsOnLine.get(i));
      PointsPerpendicular2Line.add(perpendicular2Line);
    }
  }

  void carPoint(PVector p) {
    point(p.x, p.y);
    point(600-p.x, 600-p.y);
  }  
  void carLine(PVector A, PVector B) {
    line(A.x, A.y, B.x, B.y);
  }
  void chkNeighbour() {
    if (this==test1) {
      for (PVector p1: PointsPerpendicular2Line) {
        boolean test = false;
        for (PVector p2: test2.PointsPerpendicular2Line) {
          if (PVector.dist(p1, p2)<20)  test=true;
        }
        if (test) strokeWeight.set(PointsPerpendicular2Line.indexOf(p1), strokeWeight.get( PointsPerpendicular2Line.indexOf(p1 ))+1);
        else  strokeWeight.set(PointsPerpendicular2Line.indexOf(p1), strokeWeight.get( PointsPerpendicular2Line.indexOf(p1 ))-1);
        if ( strokeWeight.get( PointsPerpendicular2Line.indexOf(p1 ))<5) strokeWeight.set(PointsPerpendicular2Line.indexOf(p1), 5);
      }
    }    
    if (this==test2) {
      for (PVector p1: PointsPerpendicular2Line) {
        boolean test = false;
        for (PVector p2: test1.PointsPerpendicular2Line) {
          if (PVector.dist(p1, p2)<20)  test=true;
        }
        if (test) strokeWeight.set(PointsPerpendicular2Line.indexOf(p1), strokeWeight.get( PointsPerpendicular2Line.indexOf(p1 ))+1);
        else  strokeWeight.set(PointsPerpendicular2Line.indexOf(p1), strokeWeight.get( PointsPerpendicular2Line.indexOf(p1 ))-1);
        if ( strokeWeight.get( PointsPerpendicular2Line.indexOf(p1 ))<5) strokeWeight.set(PointsPerpendicular2Line.indexOf(p1), 5);
      }
    }
  }
}


