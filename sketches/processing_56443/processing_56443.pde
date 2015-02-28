
//screensaver/particle repulsion
// copyright 2012 benjamin corwin

final int NUM = 10;//number of balls
int product = 1; 

PVector [] vBall = new PVector[NUM];
float [] posX = new float[NUM];
float [] posY = new float[NUM];
float [] rad = new float [NUM];
color [] bwBall = new color [NUM]; //black and white
PVector v1, v2, r, r1,g;

void setup() {
  smooth();
  size(600,600);
  vBallSetup();
  radSetup();
  bwBall();
  posX();
  posY();
}

void draw() {
  prepWindow();
  radGrow();
  drawEllipses();
  drawLines();
  moveEllipse();
  bounceEllipse();
  repelEllipses();
  friction();
//  noLoop();
  
}
void friction(){
  PVector friction = new PVector (0.001,0.001);
  for(int i = 0; i<vBall.length; i++) {
    if(vBall[i].x > 0) {
      vBall[i].x = vBall[i].x - friction.x;
    }
    if(vBall[i].x < 0) {
      vBall[i].x = vBall[i].x + friction.x;
    }
    if(vBall[i].y > 0) {
      vBall[i].y = vBall[i].y - friction.y;
    }
    if(vBall[i].y < 0) {
      vBall[i].y = vBall[i].y + friction.y;
    }
  }
}
    

void repelEllipses() {
  for(int i = 0; i<vBall.length-1; i++) {
    for(int j = 1; j<vBall.length;j++) {
      PVector p1 = new PVector(posX[i],posY[i]);
      PVector p2 = new PVector(posX[j],posY[j]);
      PVector r = PVector.sub(p1,p2);
      PVector r1 = new PVector(r.x,r.y);
      float d =(1/r.mag()*1/r.mag()); //used to get the denominator (inverse square)
      r1.normalize();
      g = new PVector(r1.x,r1.y);
      g.mult(d);
      g.mult(rad[i]*rad[j]);
      g.mult((.15));
      if(posX[i] <= posX[j] && posY[i] <= posY[j] && (rad[i]+rad[j])/4 <= r.mag()) {
        vBall[i].add(g);
        vBall[j].sub(g);
      }
      if(posX[i] <= posX[j] && posY[i] >= posY[j] && (rad[i]+rad[j])/4 <= r.mag()) {
        vBall[i].add(g);
        vBall[j].sub(g);
      }
      if(posX[i] >= posX[j] && posY[i] >= posY[j] && (rad[i]+rad[j])/4 <= r.mag()) {
        vBall[i].add(g);
        vBall[j].sub(g);
      }
      if(posX[i] >= posX[j] && posY[i] <= posY[j] && (rad[i]+rad[j])/4 <= r.mag()) {
        vBall[i].add(g);
        vBall[j].sub(g);
      }
    }
  }
}
  
void bounceEllipse() {
  for(int i = 0; i<vBall.length; i++) {
    if(posX[i] >= width -.5 - rad[i]/2) {
      vBall[i].x = - vBall[i].x;
      if(posX[i] < width - rad[i]/2){
        posX[i] = width -1.5 - rad[i]/2;
      }
    }
    if(posX[i]<= .5 + rad[i]/2) {
      vBall[i].x = - vBall[i].x;
      if(posX[i] < 0 + rad[i]/2){
        posX[i] = 1.5 + rad[i]/2;
      }
    }
    if(posY[i] >= height -.5 - rad[i]/2) {
      vBall[i].y = - vBall[i].y;
      if(posY[i] < height - rad[i]/2){
        posY[i] = height -1.5 - rad[i]/2;
      }
    }
    else if(posY[i] <= .5 + rad[i]/2) {
      vBall[i].y = - vBall[i].y;
      if(posY[i] < 0 + rad[i]/2){
        posY[i] = 1.5 + rad[i]/2;
      }
    }
  }
}

void moveEllipse() {
  for(int i = 0; i<vBall.length; i ++) {
    posY[i] = posY[i] + vBall[i].y;
    posX[i] = posX[i] + vBall[i].x;
} }

void drawLines() {
  //stroke(0,50);
  float d,m,l,l2;//m = strokeweigh, l2 = expo opasity, l = expo color value
  float z;//z = inverse dist
  int k=1;
  
  for(int i = 0; i<vBall.length; i ++) {
    for(int j = 1; j + i < vBall.length; j = j + 1) {
      d = dist(posX[i], posY[i], posX[i+j],posY[i+j]);
      m = map(d,dist(0,0,width,height), 0, 0, 20);
      println(1/d + ",  " + 1/dist(0,0,width,height));
      z = map(1/d,1/dist(0,0,width,height),.005,0,1);
      l = lerp(0,(rad[i]+rad[i+j])/2,norm(pow(2,z),0,50));
      l2 = lerp(0,255,norm(pow(2,z),0,5));
      println("l:  " + l);

      if(l > rad[i]) {
        l = rad[i];
      }
      if ( l > rad[i+j]) {
        l = rad[i+j];
      }
      strokeWeight(l);
      stroke(255,0,0,l2);
      line(posX[i], posY[i], posX[i+j],posY[i+j]);
      //println("i: " + i + "  j: "+ j + "  m: " + m);
    } 
  }
}


void drawEllipses() {
  stroke(5);
  for(int i = 0; i< vBall.length; i ++) {
    noStroke();
    fill(bwBall[i]);
    ellipse(posX[i], posY[i], rad[i], rad[i]);
  }
}

void radGrow() {
  for (int i = 0; i<vBall.length; i++) {
    if( rad[i] >= 200) {
      rad[i] = rad[i] - random(-.05,.025);
    }
    else if (rad[i] <= 20) {
      rad[i] = rad [i] + random(-.025,.05);
    }
  }
}

void radSetup() {
  for ( int i = 0; i < rad.length; i ++) {
    rad[i] = int(random(25,100));
  }
}

void bwBall() {
  for (int i = 0; i<bwBall.length; i++) {
    bwBall[i] = color(int(random(0,50)),int(random(125,200)));
  }
}

void vBallSetup() {
  for ( int i = 0; i < vBall.length; i ++) {
    v1 = new PVector(random(-2,2),random(-2,2));
    vBall[i] = v1;
  }
}

void posX() {
  for ( int i = 0; i < posX.length; i ++) {
    posX[i] = int(random(0+rad[i],width-rad[i]));
} }

void posY() {
  for ( int i = 0; i < posY.length; i ++) {
    posY[i] = int(random(0+rad[i],height-rad[i]));
} }

void prepWindow(){
  noStroke();
  fill(255);
  rect(0,0,width,height);
}

