
import point2line.*;

element3[] linez;

int L = 50;
int maxDi = 20;

void setup() { 
  size(500, 500);
  //smooth();


  int numLines = 200;

  Vect2[] newLine;
  linez = new element3[numLines];

  for (int i = 0; i < numLines; i++) {
    int x1 = int(random(width));
    int y1 = int(random(height));
    int angle = int(random(360));
    float rad = radians(angle);
    int x2 = x1 + int(cos(rad) * L);
    int y2 = y1 + int(sin(rad) *L);

    newLine = new Vect2[2];
    newLine [0] = new Vect2( x1, y1);
    newLine [1] = new Vect2( x2, y2);



    linez[i] = new element3(L, newLine);
  }
  background(255);
}

void draw() {
  

  for (int i = 0; i < linez.length; i++) {
    for (int j = 0; j < linez.length; j++) {
      if (i != j) {
        Vect2 line1[], line2[];
        line1 = linez[i].pointGetter();
        line2 = linez[j].pointGetter();

        Vect2 intersectionPoint = Space2.lineSegmentIntersection( line1[ 0 ], line1[ 1 ], line2[ 0 ], line2[ 1 ] );
        if ( intersectionPoint != null ) {

          linez[i].rotateLine();
          linez[j].rotateLine();
        }
        if ( intersectionPoint == null) {
          linez[i].opacDecrease();
          linez[j].opacDecrease();
        }
      }
    }
    linez[i].display();
    linez[i].forward();
  }
  
  if((keyPressed == true) && (key == 'r')) {
     background(255);
  }
}



class element3 {
  Vect2[] lin;
  int leng;
  int col = int(random(255));
  float siz = random(maxDi);
  float opac;

  element3(int lg, Vect2[] p) {
    lin = p;
    leng = lg;
  }

  void display() {
    stroke(col, opac);
    line( lin[ 0 ].x, lin[ 0 ].y, lin[ 1 ].x, lin[ 1 ].y );

    if ((lin[0].x > width) && (lin[1].x > width)) {
      lin[0].x = lin[0].x - (width+L);
      lin[1].x = lin[1].x - (width+L);
    }
    if ((lin[0].x < 0) && (lin[1].x < 0)) {
      lin[0].x = lin[0].x + (width+L);
      lin[1].x = lin[1].x + (width+L);
    }
    if ((lin[0].y > height) && (lin[1].y > height)) {
      lin[0].y = lin[0].y - (height+L);
      lin[1].y = lin[1].y - (height+L);
    }
    if ((lin[0].y <  0) && (lin[1].y < 0)) {
      lin[0].y = lin[0].y + (height+L);
      lin[1].y = lin[1].y + (height+L);
    }
  }
  void forward() {
    float xSlope = lin[0].x - lin[1].x;
    float ySlope = lin[0].y - lin[1].y;

    float rate = .02;

    lin[0].x += (xSlope * rate);
    lin[1].x += (xSlope * rate);
    lin[0].y += (ySlope * rate);
    lin[1].y += (ySlope * rate);

    //stroke(col);
  }

  Vect2[] pointGetter() {
    return lin;
  }
  void opacDecrease() {
    if (opac > 0) { 
      opac-= .001;
    }
  }


  void rotateLine() {
  

    float midX = lin[1].x + (lin[0].x - lin[1].x)/2;
    float midY = lin[1].y + (lin[0].y - lin[1].y)/2;

    Vect2 midpoint = new Vect2( midX, midY);

    lin[0].rotateAround( midpoint, radians(.2));
    lin[1].rotateAround( midpoint, radians(.2));

    opac+=.1;
    //stroke(col,opac);     
    ellipseMode(CENTER);
    //ellipse(midX, midY, siz, siz);

    
  }
}


