
void setup() {
  size(300,300);
  background(200);
  //framerate(70);
  smooth();
}

void draw() {
  background(255);
  
  Triangle test = new Triangle( new Point( 200 , 20 ) , new Point( 40 , 250 ) , new Point( 250 , 250 ) );
  fractalMountain hill = new fractalMountain(test);
  hill.iterate(hill.getStart() , 5);
  println(hill.getTriangles().size());
  for(int a = 0; a < hill.getTriangles().size() ; a++) {
   Triangle b = (Triangle)hill.getTriangles().get(a);
   b.render(); 
  }
}

class fractalMountain {
  int step;
  Triangle start;
  ArrayList Triangles = new ArrayList();
  fractalMountain(Triangle a) {
    start = a;
  }
  
 void iterate(Triangle first, int steps) {
   // Triangle t1 = new Triangle(first.midAB() , first.midBC(), first.midAC());
    Triangle t2 = new Triangle(first.midAB() , first.midAC() , first.a);
    Triangle t3 = new Triangle(first.midAB() , first.midBC() , first.b);
    Triangle t4 = new Triangle(first.midAC() , first.midBC() , first.c);
    if (steps == 0) {
      return;
    } else {
    //  Triangles.add(t1);
      Triangles.add(t2);
      Triangles.add(t3);
      Triangles.add(t4);
      steps--;
   //   iterate( t1 , steps);
      iterate( t2 , steps);
      iterate( t3 , steps);
      iterate( t4 , steps);
    }
    
  }
  
  ArrayList getTriangles() {
    return Triangles;
  }
  
  Triangle getStart() {
    return start;
  }
  
}


class Triangle {
  Point a;
  Point b;
  Point c;
  
  Triangle(Point d, Point e, Point f) {
    a = d;
    b = e;
    c = f;
  }
  
  Point midAB() {
    return new Point( (a.x + b.x) / 2 , (a.y + b.y) / 2);
  }
        
  Point midBC() {
    return new Point( (b.x + c.x) / 2 , (b.y + c.y) / 2);
  }
  
  Point midAC() {
    return new Point( (a.x + c.x) / 2 , (a.y + c.y) / 2);
  }
  
  void render() {
    line(a.x, a.y, b.x, b.y);
    line(a.x, a.y, c.x, c.y);
    line(c.x, c.y, b.x, b.y);
  }
   
}

class Point {
  int x;
  int y;
  Point( int ax, int ay ) {
    x = ax;
    y = ay;
  }
}

