
// simple translation, rotation and scaling of triangle(s)
// computing center, incenter, incircle, circumcenter, circumcircle
// by Lubomir "WolfeSVK" Pilka

int trianglesCount = 1000;
int drawClip;
Triangle triang;
Triangles triangs;

// switches
boolean showCircumcircle   = false;
boolean showIncircle       = false;
boolean showCircleVertices = true;
boolean selfRotation       = true;
boolean clipping           = true;


float maxFPS =30; // initial for gprahic measure
float rotDir = 0;

float scal=1.05;

float totalRotation  = 0;
float    totalScale  = 0;
PVector  totalTrans  = new PVector(0, 0);


void setup() {
  size(640, 480, P2D);


  rotDir = 0;

  scal=1.05;

  totalRotation  = 0;
  totalScale  = 0;
  totalTrans  = new PVector(0, 0);


  background(240);

  triangs = new Triangles();


  for (int i=0;i<trianglesCount;i++) {
    do {
      triang = new Triangle (new Point(random(100), random(100)), new Point(random(100), random(100)), new Point(random(100), random(100)));
    }
    while ( (triang.alfa<25) || (triang.beta<25) || (triang.gama<25));

    //triang.translate(random(-width, width*2), random(-height, *height*2)); // random to square
    triang.translate(cos(i%360)*sqrt(i)*40+width/2, sin(i%360)*sqrt(i)*40+height/2);                         // random to circle


    // triang.translate(cos(i)*random(width*3)+width/2, sin(i)*random(height*3)+height/2);                            // random to ellipse

    triang.selfRotAngle = random(-15.00, 15.00);
    triang.selfRotAnchor = new Point((triang.A.x+triang.B.x+triang.C.x)/3, (triang.A.y+triang.B.y+triang.C.y)/3);

    triangs.add(triang);
  }



  triang = null; //gc clean this please
  System.gc();

  //  triang = new Triangle (new Point(random(100), random(100)), new Point(random(100), random(100)), new Point(random(100), random(100)));
  //  triang.translate(random(width/2), random(height/2));

  noCursor();
}

void draw() {
  background(240);

  paintAll();
  showFPS();

  if (mousePressed) {
    if (mouseButton == LEFT)  rotDir  = 1;
    if (mouseButton == RIGHT) rotDir = -1;
    if (mouseButton == CENTER) { // primitive mousedrag function
      //      triang.translate(mouseX-pmouseX, mouseY-pmouseY);
      triangs.translate(mouseX-pmouseX, mouseY-pmouseY);
      totalTrans.add(new PVector(mouseX-pmouseX, mouseY-pmouseY));

      pushStyle();
      fill(#144798, 10);
      stroke(#144798, 80);
      //vertical
      rect(mouseX -  5, mouseY - 15, 10, 10);
      rect(mouseX -  5, mouseY +  5, 10, 10);
      rect(mouseX -  5, mouseY - 22, 10, 5);
      rect(mouseX -  5, mouseY + 17, 10, 5);
      rect(mouseX -  5, mouseY - 26, 10, 2);
      rect(mouseX -  5, mouseY + 24, 10, 2);
      //horizontal
      rect(mouseX - 15, mouseY - 5, 10, 10);
      rect(mouseX +  5, mouseY - 5, 10, 10);
      rect(mouseX - 22, mouseY - 5, 5, 10);
      rect(mouseX + 17, mouseY - 5, 5, 10);
      rect(mouseX - 26, mouseY - 5, 2, 10);
      rect(mouseX + 24, mouseY - 5, 2, 10);
      //arrows
      triangle(mouseX, mouseY-35, mouseX-10, mouseY-28, mouseX+10, mouseY-28);
      triangle(mouseX, mouseY+35, mouseX-10, mouseY+28, mouseX+10, mouseY+28);
      triangle(mouseX-35, mouseY, mouseX-28, mouseY-10, mouseX-28, mouseY+10);
      triangle(mouseX+35, mouseY, mouseX+28, mouseY-10, mouseX+28, mouseY+10);
      popStyle();
    }

    if (mouseButton >= LEFT) {
      //      triang.rotate(mouseX, mouseY, 5*rotDir);
      triangs.rotate(mouseX, mouseY, 5*rotDir);
      totalRotation += 5*rotDir;
      totalRotation %= 360;

      pushStyle();
      noFill();

      for (int i=30;i<=50;i++) {
        stroke(#144798, 30);

        //        stroke(#FF0303, 10);

        arc(mouseX, mouseY, i, i, radians(totalRotation-30), radians(totalRotation+30));

        arc(mouseX, mouseY, i, i, radians(totalRotation-70), radians(totalRotation-38));
        arc(mouseX, mouseY, i, i, radians(totalRotation+38), radians(totalRotation+70));

        //stroke
        //        stroke(#FF0303, 10);
        stroke(#144798, 30);

        arc(mouseX, mouseY, i, i, radians(totalRotation+29), radians(totalRotation+30));
        arc(mouseX, mouseY, i, i, radians(totalRotation-30), radians(totalRotation-29));

        arc(mouseX, mouseY, i, i, radians(totalRotation-70), radians(totalRotation-69));
        arc(mouseX, mouseY, i, i, radians(totalRotation-39), radians(totalRotation-38));

        arc(mouseX, mouseY, i, i, radians(totalRotation+69), radians(totalRotation+70));
        arc(mouseX, mouseY, i, i, radians(totalRotation+38), radians(totalRotation+39));
      }

      //      stroke(#FF0303, 10);
      stroke(#144798, 30);

      arc(mouseX, mouseY, 30, 30, radians(totalRotation-30), radians(totalRotation+30));
      arc(mouseX, mouseY, 50, 50, radians(totalRotation-30), radians(totalRotation+30));

      arc(mouseX, mouseY, 30, 30, radians(totalRotation-70), radians(totalRotation-38));
      arc(mouseX, mouseY, 50, 50, radians(totalRotation-70), radians(totalRotation-38));

      arc(mouseX, mouseY, 30, 30, radians(totalRotation+38), radians(totalRotation+70));
      arc(mouseX, mouseY, 50, 50, radians(totalRotation+38), radians(totalRotation+70));
    }
  }


  // mouse cursor
  stroke(#6307DE);
  fill(#CEAAFF, 50);
  ellipse(mouseX, mouseY, 5, 5);
}



void paintAll() {

  triangs.draw();

  pushStyle();
  fill(0);
  text("Triangles drawn:   "+drawClip+" / "+trianglesCount, 0, 10);
  text("Total rotation:    "+round(totalRotation), 0, 20);
  text("Total translation: "+round(totalTrans.x)+","+round(totalTrans.y), 0, 30);
  text("Total scale:       "+totalScale, 0, 40);
  text("Clipping:          "+(clipping?"ON":"OFF"), 0, 50);
  popStyle();
}



////////////////////// 




void showFPS() {

  pushStyle();
  if (frameRate>maxFPS) maxFPS=frameRate;
  colorMode(HSB, 360, 100, 100);
  for (int i=height; i>=height-frameRate; i--) {
    stroke(map(frameRate, 0, maxFPS, 0, 115), 100, 100);
    line (width-20, i, width, i);
  }

  stroke(0);
  line (width-20, height-maxFPS, width, height-maxFPS);

  fill(0);

  text(round(frameRate), width-17, height-maxFPS-5);
  popStyle();
}

void keyPressed() {

  switch (keyCode) {

  case 32:
    setup();
    break;

  case 107: // +
    //    triang.scale(scal, scal);
    triangs.scale(scal, scal);
    totalScale += scal;
    break;

  case 109: // -
    //    triang.scale(1/scal, 1/scal);
    triangs.scale(1/scal, 1/scal);
    totalScale -= scal;
    break;

  case 73:  //  i/I Incircle
    showIncircle       = !showIncircle;
    break;

  case 79:   //  o/O Circumcircle
    showCircumcircle   = !showCircumcircle;
    break;

  case 86:   //  o/O circle/point vertices
    showCircleVertices = !showCircleVertices;
    break;

  case 82:   //  r/R rotate around own center
    selfRotation = !selfRotation;
    break;

  case 67:   //  c/C clipping
    clipping = !clipping;
    break;
  }
}

////////////////////////////////////// vvv P O I N T vvv ////////////////////////////////////// 

/// Point

class Point extends PVector {
  float circleRadius = 5;

  Point() {
    x = random(width  / 10, width  - width  / 10);
    y = random(height / 10, height - height / 10);
  }

  Point(float x, float y) {
    this.x = x;
    this.y = y;
  }

  /// transformations
  // scale point
  void scale(float scaleX, float scaleY) {
    x = x - width/2;
    y = y - height/2;
    x *= scaleX;
    y *= scaleY;
    x = x + width/2;
    y = y + height/2;
  }

  // translate point
  void translate(float newX, float newY) {
    this.add(new PVector(newX, newY));
  }

  // rotate point
  void rotate(float anchorX, float anchorY, float angle) {
    float rotX, rotY, origX, origY;

    origX = rotX = x - anchorX;  // subtract to get relative position
    origY = rotY = y - anchorY;  // or with other words, to get origin (anchor/rotation) point to 0,0
    //this is what I didn't understand althought I had calculus to rotate (that was only what I had)

    x -= rotX;
    y -= rotY;

    angle = radians(angle);

    rotX = origX * cos(angle) - origY * sin(angle);
    rotY = origX * sin(angle) + origY * cos(angle);

    x += rotX; // get it back to absolute position on screen
    y += rotY;
  }


  ////////////////////////// transformations


  void drawPoint() {
    point(x, y);
  }

  void drawCircle() {
    drawCircle(circleRadius);
  }

  void drawCircle(float r) {
    pushStyle();
    fill(255);
    ellipse(x, y, r, r);
    popStyle();
  }

  void drawRotationCircle (float anchorX, float anchorY) {
    stroke(50, 30);
    fill(100, 10);
    ellipse(anchorX, anchorY, 2*sqrt(sq(x-anchorX)+sq(y-anchorY)), 2*sqrt(sq(x-anchorX)+sq(y-anchorY)));
  }
}


class Triangle {
  //  Point rotAnch;
  float selfRotAngle;                  // self rotation angle
  Point selfRotAnchor;                 // self rotation anchor point

  Point A, B, C;                 // vertices
  Point Cen, I, O;               // center, incenter, circumcenter
  float alfa, beta, gama;        // angles A(alpha), B(beta), C(gama)
  float a, b, c;                 // sides
  float P, s, Ar;                // perimeter, semiperimeter, Area
  float Ir, Or;                  //  incircle + circumcircle radiuses
  float Cx, Cy, Ix, Iy, Ox, Oy;  // incenter + circumcenter separated

  Triangle() {

    //    A = new Point(random(300),random(300));
    //    B = new Point(random(300),random(300));
    //    C = new Point(random(300),random(300));

    //    calculate();
  }

  Triangle(Point p1, Point p2, Point p3) {
    // vertices
    A = p1;
    B = p2;
    C = p3;

    // some (most of) irrelevant countings..  I was just playing
    calculate();
  }

  void calculate() {

    // http://en.wikipedia.org/wiki/Incenter

    a = B.dist(C);
    b = C.dist(A);
    c = A.dist(B);

    alfa = getAngle(A, B, C);
    beta = getAngle(B, A, C);
    gama = getAngle(C, A, B);

    // perimeter
    P = a+b+c;

    // semiperimeter
    s = P/2; 
    // Area
    Ar = (1f/4)*sqrt(P*((a-b+c)*(b-c+a)*(c-a+b))); // = sqrt(s*(s-a)*(s-b)*(s-c));
    // incircle coordinates
    Ix = (a*A.x + b*B.x + c*C.x)/P;
    Iy = (a*A.y + b*B.y + c*C.y)/P;
    I = new Point(Ix, Iy); // = (A.mult(a) + B.mult(b) + C.mult(c)) / P;

    // circle radius
    Ir = (2*Ar)/P; // = sqrt(((s-a)*(s-b)*(s-c))/ s);


    // circumcircle radius
    float D;

    D  = 2*(A.x*(B.y-C.y)+B.x*(C.y-A.y)+C.x*(A.y-B.y));

    Ox = ((sq(A.y)+sq(A.x))*(B.y-C.y) + (sq(B.y)+sq(B.x))*(C.y-A.y) + (sq(C.y)+sq(C.x))*(A.y-B.y));
    Ox /= D;

    Oy = ((sq(A.y)+sq(A.x))*(C.x-B.x) + (sq(B.y)+sq(B.x))*(A.x-C.x) + (sq(C.y)+sq(C.x))*(B.x-A.x));
    Oy /= D;

    O = new Point(Ox, Oy);
    Or = (a*b*c)/sqrt(P*(b+c-a)*(c+a-b)*(a+b-c));
  }

  // get angle
  float getAngle(Point vert, Point vect1, Point vect2) {
    return(degrees(acos((((vert.x-vect1.x)*(vert.x-vect2.x))+((vert.y-vect1.y)*(vert.y-vect2.y)))/(vert.dist(vect1)*vert.dist(vect2)))));
  } 

  // scale triangle
  void scale(float scaleX, float scaleY) {
    A.scale(scaleX, scaleY);
    B.scale(scaleX, scaleY);
    C.scale(scaleX, scaleY);
    calculate();
  }

  // translate triangle
  void translate(float ofX, float ofY) {
    A.translate(ofX, ofY);
    B.translate(ofX, ofY);
    C.translate(ofX, ofY);
    calculate();
  }

  // rotate triangle
  void rotate(float anchorX, float anchorY, float angle) {
    A.rotate(anchorX, anchorY, angle);
    B.rotate(anchorX, anchorY, angle);
    C.rotate(anchorX, anchorY, angle);
    calculate();
  }

  // draw triangle with circle vertices
  void draw() {
    drawSides();

    if (showCircleVertices) drawVertices();

    //    fill(255, 0, 0);
    //    ellipse((A.x+B.x+C.x)/3,(A.y+B.y+C.y)/3,4,4); // Isn't this center ?
  }

  void drawIncircle() {
    pushStyle();
    noFill();
    stroke(0, 50);
    ellipse(Ix, Iy, Ir*2, Ir*2);
    popStyle();
  }

  void drawCircumcircle() {
    pushStyle();
    noFill();
    stroke(0, 50);
    ellipse(Ox, Oy, Or*2, Or*2);
    popStyle();
  }

  void drawIncenter() {
    pushStyle();
    stroke(0, 50);
    line(Ix-3, Iy, Ix+3, Iy);
    line(Ix, Iy-3, Ix, Iy+3);
    //    ellipse(Ix, Iy, 4, 4);
    popStyle();
  }

  void drawCircumcenter() {
    pushStyle();
    stroke(0, 50);
    line(Ox-3, Oy, Ox+3, Oy);
    line(Ox, Oy-3, Ox, Oy+3);
    //    ellipse(Ox, Oy, 4, 4);
    popStyle();
  }

  void drawSides() {
    pushStyle();
    stroke(0);
    line(A.x, A.y, B.x, B.y);
    line(B.x, B.y, C.x, C.y);
    line(C.x, C.y, A.x, A.y);
    popStyle();
  }

  void drawVertices() {
    drawVertices(A.circleRadius);
  }

  void drawVertices(float r) {
    pushStyle();
    stroke(0);
    A.drawCircle(r);
    B.drawCircle(r);
    C.drawCircle(r);
    popStyle();
  }
}

////////////////////////////////////// vvv T R I A N G L E S vvv //////////////////////////////////////

class Triangles {
  ArrayList Triangles;

  Triangles() {
    Triangles = new ArrayList();
  }

  void translate(float ofX, float ofY) {
    for (int i = 0; i < Triangles.size(); i++) {
      Triangle t = (Triangle) Triangles.get(i);
      t.translate(ofX, ofY);
    }
  }


  void rotate(float mx, float my, float angle) {
    for (int i = 0; i < Triangles.size(); i++) {
      Triangle t = (Triangle) Triangles.get(i);
      t.rotate(mx, my, angle);
    }
  }

  void scale(float scaleX, float scaleY) {
    for (int i = 0; i < Triangles.size(); i++) {
      Triangle t = (Triangle) Triangles.get(i);
      t.scale(scaleX, scaleY);
    }
  }


  void draw() {

    drawClip = 0;
    for (int i = 0; i < Triangles.size(); ++i) {
      Triangle t = (Triangle) Triangles.get(i);

      // lame clipping
      /*      if (!clipping || (  // too radical
       (min(t.A.x, t.B.x, t.C.x)>0) && (max(t.A.x, t.B.x, t.C.x)<width)
       &&
       (min(t.A.y, t.B.y, t.C.y)>0) && (max(t.A.y, t.B.y, t.C.y)<height)
       )) { //clipping -  loop to get if triangle is inside screen
       */

      if (!clipping || (
      (((t.A.x>0) && (t.A.x<width)) && ((t.A.y>0) && (t.A.y<height))) ||
        (((t.B.x>0) && (t.B.x<width)) && ((t.B.y>0) && (t.B.y<height))) ||
        (((t.C.x>0) && (t.C.x<width)) && ((t.C.y>0) && (t.C.y<height)))
        )) {

        drawClip++;
        if (showCircumcircle) t.drawCircumcircle();
        if (showIncircle)  t.drawIncircle();

        if (showCircumcircle)  t.drawCircumcenter();
        if (showIncircle)  t.drawIncenter();

        t.drawSides();
        if ((showCircleVertices) && (totalScale>-17)) // switch off if zoomed out too much
          t.drawVertices();
      } //clipping

      if (selfRotation) {
        t.selfRotAnchor = new Point((t.A.x+t.B.x+t.C.x)/3, (t.A.y+t.B.y+t.C.y)/3);
        t.rotate(t.selfRotAnchor.x, t.selfRotAnchor.y, t.selfRotAngle);
      }
    }
  }

  void add(Triangle tr) {
    Triangles.add(tr);
  }
}


