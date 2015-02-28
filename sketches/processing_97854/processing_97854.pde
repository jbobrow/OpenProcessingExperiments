
//TODO:
//Single-player functionality
//level controlled by number-input at start
//exclude inscribed angle.

float arcStep = PI/100;
boolean fixedLevel = true;
int level = 1;

boolean p1turn;
boolean waiting;

float diam;
PVector p1CircleCenter;
PVector p2CircleCenter;
float p1arcStart, p1arcEnd;
float p2arcStart, p2arcEnd, p2arcShift;

void setup() {
  size(1000, 600);
  background(255);
  diam = height*.6;
  p1CircleCenter = new PVector(0.25*width, 0.5*height);
  p2CircleCenter = new PVector(0.75*width, 0.5*height);

  initial();

  strokeWeight(4);
  smooth();
}

void initial() {
  p1turn = true;
  waiting = false;

  p1arcStart = 0; 
  p1arcEnd = 0; 
  p2arcStart = 0;  
  p2arcEnd = 0;
  p2arcShift = random(0, 2*PI);
}


void draw() {
  background(255);
  strokeWeight(4);   
  stroke(0);
  line(width/2, 20, width/2, height-20);

  //draw P1 side:
  strokeWeight(4); 
  noFill(); 
  stroke(100, 0, 55);
  ellipse(p1CircleCenter.x, p1CircleCenter.y, diam, diam);
  if (p1turn)
    p1arcEnd = (p1arcEnd+arcStep)%(2*PI);

  strokeWeight(10);
  stroke(0, 200, 100);
  arc(p1CircleCenter.x, p1CircleCenter.y, diam, diam, p1arcStart-p1arcEnd, 0);  


  //draw P2 side:
  strokeWeight(4);   
  noFill(); 
  stroke(100, 0, 55);
  ellipse(p2CircleCenter.x, .5*height, diam, diam);
  if (!p1turn)
    p2arcEnd = (p2arcEnd+arcStep)%(2*PI);

  strokeWeight(10);
  stroke(0, 200, 100);
  arc(p2CircleCenter.x, p2CircleCenter.y, diam, diam, p2arcStart-p2arcEnd+p2arcShift, p2arcShift);
}

void makeResults(int lev) {
  strokeWeight(2); 
  stroke(100, 0, 55);
  fill(100, 0, 55);
  switch(lev) {
  case 1:
    ellipse(p1CircleCenter.x, p1CircleCenter.y, 10, 10);
    line(p1CircleCenter.x, p1CircleCenter.y, p1CircleCenter.x+.5*diam*cos(p1arcStart-p1arcEnd), p1CircleCenter.y+0.5*diam*sin(p1arcStart-p1arcEnd));
    line(p1CircleCenter.x, p1CircleCenter.y, p1CircleCenter.x+.5*diam, p2CircleCenter.y);

    ellipse(p2CircleCenter.x, p2CircleCenter.y, 10, 10);
    line(p2CircleCenter.x, p2CircleCenter.y, p2CircleCenter.x+0.5*diam*cos(p2arcStart-p2arcEnd+p2arcShift), p2CircleCenter.y+0.5*diam*sin(p2arcStart-p2arcEnd+p2arcShift));
    line(p2CircleCenter.x, p2CircleCenter.y, p2CircleCenter.x+0.5*diam*cos(p2arcShift), p2CircleCenter.y+0.5*diam*sin(p2arcShift));  
    break;
  case 2:
    float rpt = (p1arcStart-p1arcEnd)/2+PI;
    PVector pt = new PVector(p1CircleCenter.x+0.5*diam*cos(rpt), p1CircleCenter.y+0.5*diam*sin(rpt));
    line(pt.x, pt.y, p1CircleCenter.x+0.5*diam*cos(p1arcStart-p1arcEnd), p1CircleCenter.y+0.5*diam*sin(p1arcStart-p1arcEnd));
    line(pt.x, pt.y, p1CircleCenter.x+0.5*diam, p1CircleCenter.y);

    rpt = rpt+p2arcShift;
    pt = new PVector(p2CircleCenter.x+0.5*diam*cos(rpt), p2CircleCenter.y+0.5*diam*sin(rpt));
    line(pt.x, pt.y, p2CircleCenter.x+0.5*diam*cos(p2arcStart-p2arcEnd+p2arcShift), p2CircleCenter.y+0.5*diam*sin(p2arcStart-p2arcEnd+p2arcShift));
    line(pt.x, pt.y, p2CircleCenter.x+0.5*diam*cos(p2arcShift), p2CircleCenter.y+0.5*diam*sin(p2arcShift));
    break;
  case 3:
    background(255);
    strokeWeight(10);
    stroke(0, 200, 100);
    noFill();
    arc(p1CircleCenter.x, p1CircleCenter.y, diam, diam, p1arcStart-p1arcEnd, 0);  
    arc(p2CircleCenter.x, p1CircleCenter.y, diam, diam, p2arcStart-p2arcEnd+p2arcShift, p2arcShift);

    strokeWeight(4);   
    stroke(0);
    line(width/2, 20, width/2, height-20);

    if(!fixedLevel)
      level = 0;
    break;
  }
}

void keyPressed() {
  if (key == ' ') {
    if (waiting) { //All actions have already been stoped
      waiting = false;
      if (p1turn) {//p1 went, we looked, now p2 wants to play
        p1turn = false;
        loop();
      }
      else {//we've seen the results, now level up and start over!
        if (!fixedLevel)
          level++;
        initial();
        loop();
      }
    }
    else {//All actions need to stop now
      waiting = true;
      if (p1turn) {//p1 went, now we want to look
        noLoop();
      }
      else {//p2 went, now we want to look and see results
        noLoop();
        makeResults(level);
      }
    }
  }
  else if (key == 'p') {
    println("waiting: " + waiting);
    println("p1turn: " + p1turn);
  }
  else if (key == CODED) {
    if (keyCode == UP) {
      arcStep = PI/(min(PI/arcStep + 1, 400));
    }
    else if (keyCode == DOWN) {
      arcStep = PI/(max(PI/arcStep-1, 12));
    }
    println(PI/arcStep);
  }
}
