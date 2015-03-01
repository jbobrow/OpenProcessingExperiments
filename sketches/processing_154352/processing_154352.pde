
Tree [] trees;
Flower[] flowers;
int numTrees=2;
int numFlowers=18;
color trunk, leaves;
float time, light;

void setup() {
  float sx, sy;
  size(800, 400);
  trees=new Tree[numTrees];
  trunk=color(150, 100, 50);
  leaves=color(50, 250, 50);
  //Tree(length,length ratio,L/R assym,angle,angle change,width,width change,leaf size,trunk colour,leaf colour,generations,px,py)
  for (int i=0;i<numTrees;i++) {
    trees[i]=new  Tree(height/5, 0.7+random(0.2), 0.9+random(0.2), -PI/2, random(PI/4, PI/2), random(4, 10), 0.5+random(0.5), random(5, 10), trunk, leaves, 5+int(random(5)), width/8+(i%2)*width*0.75, height*0.8);
  }

  flowers=new Flower[numFlowers];
  for (int i=0; i<numFlowers;i++) {
    sx=width/20+(i%6)*width/6+random(width/10);
    sy=height-random(15, 50)-(i/6)*height/6;
    flowers[i]=new Flower(sx, sy, sx+random(10), sy-random(20, 50));
  }
}

void draw() {
  float px, py, t;
  time=hour()+(float)minute()/60;
  time=(float)(frameCount%1200)/50;
  // Comment out the next line to make it behave properly as a clock!
  light=120-10*abs(12-time);
  background(light, light, 130+light);
  noStroke();
  ellipseMode(CENTER);
  if (time>6 && time<18) {
    //draw the sun
    t=(time-6)/12;
    px=width/2-width*0.4*cos(PI*t);
    py=height/2-height*0.4*sin(PI*t);
    fill(250, 250, 20, 30);
    for (int c=80;c>40;c-=5) {
      ellipse(px, py, c, c);
    }
  }

  else {
    t=time+6;
    if (time>6) t-=24;
    px=width/2-width*0.45*cos(PI*t/12);
    py=height/2-height*0.45*sin(PI*t/12);
    fill(220, 220, 220, 30);
    for (int c=60;c>20;c-=5) {
      ellipse(px, py, c, c);
    }
  }

  fill(light, 2*light, light);
  rect(0, height/2, width, height/2);

  for (int i=0;i<numFlowers;i++) {
    flowers[i].drawFlower();
  }

  for (int i=0;i<numTrees;i++) {
    trees[i].draw();
  }
}

void mouseClicked() {
 int x=mouseX/(width/3);

  switch(x) {
  case 0:
    trees[0].reset();
    break;
  case 1:
    for (int i=0;i<numFlowers;i++) {
      flowers[i].reset();
    }
    break;
  case 2:
    trees[1].reset();
  }
}

//Contains elements for genetically determined "flowers"
class Flower {

  int numPetalsOuter, rows, leaves;
  float diamOuter, diamInner, rowRatio, diamMiddle, petalRatio, leafLength, leafWidth;
  color cPetal, cCircle, cMiddle, cStem, cLeaves;
  float sx, sy, cx, cy, ht, lht;

  Flower(float sx_, float sy_, float cx_, float cy_) {
    sx=sx_;
    sy=sy_;
    cx=cx_;
    cy=cy_;
    ht=sy-cy;
    if (ht<5) {
      ht=5;
      cy=sy-5;
    }
    reset();
  }

  void drawStem() {
    float tx, ty, bx, by;
    strokeWeight(ht/10);
    stroke(cStem);
    bezier(sx, sy, sx, sy-ht/2, cx, cy+ht/2, cx, cy);
    strokeWeight(1);
    stroke(0, 50);
    fill(cLeaves);
    ellipseMode(CORNERS);
    if (leaves%2==1) {
      for (int l=0;l<leaves;l++) {
        bx=bezierPoint(sx, sx, cx, cx, l/(2*leaves)); 
        by=bezierPoint(sy, sy-ht/2, cy+ht/2, cy, (float)l/(2*leaves));
        if (l%2==1)
          ellipse(bx, by, bx+leafLength, by-leafWidth);
        else ellipse(bx, by, bx-leafLength, by-leafWidth);
      }
    }
    else {
      //even number of leaves: draw them in pairs
      for (int l=0;l<leaves;l+=2) {
        bx=bezierPoint(sx, sx, cx, cx, l/(2*leaves)); 
        by=bezierPoint(sy, sy-ht/2, cy+ht/2, cy, l/(2*leaves));
        ellipse(bx, by, bx+leafLength, by-leafWidth);
        ellipse(bx, by, bx-leafLength, by-leafWidth);
      }
    }
  }

  void drawFlower() {
    float ps, dc;
    int np;
    drawStem();
    //noStroke();
    strokeWeight(1);
    stroke(0, 50);
    pushMatrix();
    translate(cx, cy);
    ellipseMode(CENTER);
    for (int r=0;r<rows;r++) {
      ps=diamOuter*pow(rowRatio, r)/2;
      np=int(numPetalsOuter*pow(petalRatio, r));
      if (np<3) np=3;
      dc=TWO_PI*ps/np;
      for (float a=0;a<TWO_PI;a+=TWO_PI/np) {
        pushMatrix();
        rotate(a);
        fill(cPetal);
        triangle(0, 0, ps, dc/2, ps, -dc/2);
        translate(ps, 0);
        ellipse(0, 0, dc, dc);
        fill(cCircle);
        ellipse(0, 0, dc*.8, dc*.8);
        popMatrix();
      }
    }
    fill(cMiddle);
    ellipse(0, 0, diamMiddle, diamMiddle);
    popMatrix();
  }

  void reset() {
    lht=sy+random(ht);
    numPetalsOuter=int(random(4, 32));
    rows=10-int(sqrt(random(1, 100)));
    leaves=int(random(1, 7));
    diamOuter=random(ht/5, ht);
    rowRatio=random(0.5, 0.9);
    diamInner=diamOuter*pow(rowRatio, rows-1);
    diamMiddle=random(diamInner/4, diamInner/2);
    petalRatio=random(0.3, 1);
    leafLength=random(ht/4, ht/2);
    leafWidth=random(ht/10, leafLength/2);
    cPetal=color(random(255), random(255), random(255));
    cCircle=color(random(255), random(255), random(255));
    cMiddle=color(random(255), random(255), random(255));
    cStem=color(20, 200, 20);
    cLeaves=color(0, 150, 0);
  }
}

//Contains the genetic elements and drawing routines to draw a tree
class Tree {

  color trunkCol, leafCol;
  int gens;
  float len, lenChange, leftRightAssym, angle, angleChange, acr, wide, widthChange, leafSize;
  float x, y;

  //constructor
  Tree(float l, float lc, float lra, float a, float ac, float w, float wc, float ls, color tc, color lec, int g, float px, float py) {
    trunkCol=tc;
    leafCol=lec;
    gens=g;
    len=l;
    lenChange=lc;
    leftRightAssym=lra;
    angle=a;
    angleChange=ac;
    acr=random(0.9, 1.1);
    wide=w;
    widthChange=wc;
    leafSize=ls;
    x=px;
    y=py;
  }

  void draw() {
    rectMode(CORNER);
    ellipseMode(CORNER);  
    drawTree(x, y, gens, len, lenChange, leftRightAssym, angle, angleChange, wide, widthChange, trunkCol, leafCol);
  }

  void drawTree(float x, float y, int g, float l, float lc, float lra, float a, float ac, float w, float wc, color tc, color lec) {
    float nextX, nextY;
    pushMatrix();
    translate(x, y);
    rotate(a);
    noStroke();
    if (g>1) {
      fill(tc);
      rect(0, 0, l, w);
      drawTree(l, 0, g-1, l*lc*lra, lc, lra, ac*lra, ac*acr, w*wc, wc, tc, lec);
      drawTree(l, 0, g-1, l*lc/lra, lc, lra, -ac/lra, ac*acr, w*wc, wc, tc, lec);
    }
    else {
      fill(lec);
      ellipse(0, 0, leafSize, 2*leafSize);
    }
    popMatrix();
  }

  void reset() {
    gens=5+int(random(5));
    len=height/5;
    lenChange=0.7+random(0.2);
    leftRightAssym= 0.9+random(0.2);
    angleChange=random(PI/4, PI/2);
    acr=random(0.9, 1.1);
    wide=random(4, 10);
    widthChange=0.5+random(0.5);
    leafSize=random(5, 10);
  }

//The remaining routines aren't currently in use: they were for a program which used biomorph-like selection

  float getX() {
    return x;
  }

  float getY() {
    return y;
  }

  void setX(float t) {
    x=t;
  }

  void setY(float t) {
    y=t;
  }

  void cpy(Tree t2) {
    this.trunkCol=t2.trunkCol;
    this.leafCol=t2.leafCol;
    this.gens=t2.gens;
    this.len=t2.len;
    this.lenChange=t2.lenChange;
    this.leftRightAssym=t2.leftRightAssym;
    this.angle=t2.angle;
    this.angleChange=t2.angleChange;
    this.acr=t2.acr;
    this.wide=t2.wide;
    this.widthChange=t2.widthChange;
    this.leafSize=t2.leafSize;
  }


  void mutate() {
    int r=int(random(10));
    int c;
    /*
 color trunkCol, leafCol;
     int gens;
     float len, lenChange, leftRightAssym,angle, angleChange, wide, widthChange;
     */
    switch(r) {
    case 0:
      c=int(random(150));
      trunkCol=color(100+c, 50+c+random(50), 50+random(50));
      break;
    case 1:
      c=int(random(150));
      leafCol=color(random(10), 100+c, random(100));
      break;
    case 2:
      if (random(1)<0.5) gens-=1;
      else gens+=1;
      gens=constrain(gens, 1, 20);
      break;
    case 3:
      len*=random(0.8, 1.2);
      break;
    case 4:
      lenChange*=random(0.8, 1.2);
      break;
    case 5:
      leftRightAssym*=random(0.8, 1.2);
      break;
    case 6:
      angleChange*=random(0.8, 1.2);
      break;
    case 7:
      wide*=random(0.8, 1.2);
      break;
    case 8:
      widthChange*=random(0.8, 1.2);
      break;
    case 9:
      acr*=random(0.8, 1.2);
    }
  }
}



