
int n;
int d;
int count, counte;
Ball[] b; 
PVector pAux, aAux, vAux;
boolean looping;

void setup() {
  size(500, 500);
  frameRate(90);

  n = 5;
  d= 10;
  b = new Ball[n];
  for (int i=0; i<n; i++) {
    pAux = new PVector(random(width/10, width - (width/10)), random(height/10, height - (height/10)));
    vAux = new PVector(random(-2, 2), random(-2, 2));
    aAux = new PVector(0, 0);
    b[i] = new Ball(pAux, vAux, aAux, d, 1);
  }
  looping = true;
}

void draw() {
  fill(255, 100);
  rect(0, 0, width, height);

  for (int i=0; i<n; i++) {
    b[i].move();
    edgeCollide(b[i]);
  }

  ballCollide();

  for (int i=0; i<n; i++) {
    fill(50);
    b[i].vecDraw();
    if (b[i].hits!=0) {
      b[i].col=true;
      b[i].hits=0;
    } else {
      b[i].col=false;
    }
//    print("b["+i+"].col="+b[i].col+" ");
//    if (b[i].col) {
//      noLoop();
//    }
  }
//  if (mousePressed) {
//    addBall();
/*    if (looping) {
      noLoop();
      for (int i=0; i<n; i++) {
        print("b["+i+"].pos="+b[i].p.x+","+b[i].p.y+" ");
      }
      looping = false;
    } else {
      loop();
      looping = true;
    } */
//  }
  
  println(frameRate);
}

void mousePressed() {
  addBall();
}

void keyPressed() {
  if (key!= 'E') {
    count = (-1);
  }
  counte = 0;
  loop();
}

void edgeCollide(Ball b) {
  PVector vAux = new PVector();
  if (! (b.col)) {
    if ((b.p.x<b.r/2)&&(b.v.x<0)) {
      vAux.set(((-1)*b.v.x), b.v.y, 0);
      b.collide(vAux);
      b.col=true;
    } 
    else if ((b.p.x>(width-b.r/2))&&(b.v.x>0)) {
      vAux.set(((-1)*b.v.x), b.v.y, 0);
      b.collide(vAux);
      b.col=true;
    }
    if ((b.p.y<b.r/2)&&(b.v.y<0)) {
      vAux.set(b.v.x, ((-1)*b.v.y), 0);
      b.collide(vAux);
      b.col=true;
    } 
    else if ((b.p.y>(height-b.r/2))&&(b.v.y>0)) {
      vAux.set(b.v.x, ((-1)*b.v.y), 0);
      b.collide(vAux);
      b.col=true;
    }
    else {
      b.col=false;
    }
  } 
}

void ballCollide() {
  Ball Ba, Bb;
  PVector newa = new PVector();
  PVector newb = new PVector();
  PVector finala = new PVector();
  PVector finalb = new PVector();
  float dx, dy, t, maga, magb, d1, d2;

  for (int i=0; i<n-1; i++) {
    for (int j=i+1; j<n; j++) {
      if (PVector.dist(b[i].p, b[j].p)<=b[i].r/2+b[j].r/2) {
        if (!(b[i].col) && !(b[j].col)) {
//          println("ball["+i+"].col="+b[i].col+" ball["+j+"].col="+b[j].col);
          Ba=b[i];
          Bb=b[j];
          dx = Ba.p.x-Bb.p.x;
          dy = Ba.p.y-Bb.p.y;
          t = atan2(dy, dx);
          maga = Ba.v.mag();
          magb = Bb.v.mag();
//          println("t="+t+"; maga="+maga+"; magb="+magb);
          d1 = atan2(Ba.v.y, Ba.v.x);
          d2 = atan2(Bb.v.y, Bb.v.x);
//          println("d1="+d1+"; d2="+d2);
          newa.set(maga*cos(d1-t), maga*sin(d1-t), 0);
          newb.set(magb*cos(d2-t), magb*sin(d2-t), 0);
          finala.set(((Ba.m-Bb.m)*newa.x + (2*Bb.m)*newb.x) / (Ba.m+Bb.m), newa.y, 0);
          finalb.set(((Ba.m+Ba.m)*newa.x + (Bb.m-Ba.m)*newb.x) / (Ba.m+Bb.m), newb.y, 0);
          newa.set( (cos(t)*finala.x + cos(t + HALF_PI)*finala.y), (sin(t)*finala.x + cos(t + HALF_PI)*finala.y), 0 );
          newb.set( (cos(t)*finalb.x + cos(t + HALF_PI)*finalb.y), (sin(t)*finalb.x + cos(t + HALF_PI)*finalb.y), 0 );
          Ba.collide(newa);
          Bb.collide(newb);
//          countDown(10);
//          println("ball["+i+"].col="+b[i].col+" ball["+j+"].col="+b[j].col+" frameCount:"+frameCount);
        }
        b[i].hits++;
        b[j].hits++;
      } 
    }
  }
}

void countDown(int i) {
  if (count>0) {
    counte=1;
  }
  count = i;
}

void addBall() {
  Ball[] baux;
  Ball aux;

  n++;
  pAux = new PVector(mouseX, mouseY);
  vAux = new PVector(random(-5, 5), random(-5, 5));
  aAux = new PVector(0, 0);
  aux = new Ball(pAux, vAux, aAux, d, 1);
  baux = (Ball[])append(b, aux);
  b=baux;
}


class Ball {

  PVector p;
  PVector v;
  PVector a;
  int r,hits;
  float m;
  boolean col;

  Ball(PVector pAux, PVector vAux, PVector aAux, int rAux, int mAux) {
    p = pAux;
    v = vAux;
    a = aAux;
    r = rAux;
    m = mAux;
    col = false;
    hits=0;
  }

  void move() {
    v.add(a);
    p.add(v);
  }

  void move(PVector aAux) {
    a.set(aAux);
    v.add(a);
    p.add(v);
  }

  void vecDraw() {
    ellipse(p.x, p.y, r, r);
  }

  void collide(PVector vNew) {
    v.set(vNew);
  }

}


