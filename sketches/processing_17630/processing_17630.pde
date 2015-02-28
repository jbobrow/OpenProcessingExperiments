
// x1, y1, cx1, cy1, cx2, cy2, x2, y2
//---   GLOBALS   ---
int width = 640;
int height = 480;
int anchorX = width/2;
int anchorY = height/2;
boolean headAnchor = false;
Curve bob = new Curve(true,0,0,0,0,0,0,0,0);
ArrayList curves = new ArrayList();
String[][] labels = {
  {
    " x1: "," y1: "
  }
  , {
    "cx1: ","cy1: "
  }
  , {
    "cx2: ","cy2: "
  }
  , {
    " x2: "," y2: "
  }
};
PFont font;
int fontsize=14;
String sayText;
int selectorMin = 0;
int selectorMax = 3;
int selector = selectorMin;
int textXorig = 10;
int textX = textXorig;
int textY = 20;
int spacing = 80;
int range = 20;
boolean hitTrigger=false;
int catchEm;
boolean firstRun = true;

//---    CORE   ---

void setup() {
  size(width,height);
  smooth();
  font=createFont("Arial",fontsize);
  textFont(font,fontsize);
}

//---

void draw() {

  background(0);

  drawAll();

  textX = textXorig;
  for(int i=0;i<bob.points.length;i++) {
    mouseMover(i);
if(selector==i){
  fill(255,0,0);
} else {
fill(255);
}
    text(labels[i][0] + bob.points[i][0],textX,textY);
    textX += spacing;
    text(labels[i][1] + bob.points[i][1],textX,textY);
    textX += spacing;
  }
  noFill();
  stroke(100,0,0);
  strokeWeight(1);
  line(bob.points[0][0],bob.points[0][1],bob.points[1][0],bob.points[1][1]);
  line(bob.points[2][0],bob.points[2][1],bob.points[3][0],bob.points[3][1]);

  stroke(255);
  strokeWeight(2);
  bezier(bob.points[0][0],bob.points[0][1],bob.points[1][0],bob.points[1][1],bob.points[2][0],bob.points[2][1],bob.points[3][0],bob.points[3][1]);

  stroke(255,0,0);
  strokeWeight(4);
  if(selector==0) {
    point(bob.points[0][0],bob.points[0][1]);
    headAnchor=true;
  }
  else if(selector==1) {
    point(bob.points[1][0],bob.points[1][1]);
    headAnchor=true;
  }
  else if(selector==2) {
    point(bob.points[2][0],bob.points[2][1]);
    headAnchor=false;
  }
  else if(selector==3) {
    point(bob.points[3][0],bob.points[3][1]);
    headAnchor=false;
  }
}

//---   FUNCTIONS   ---

void keyPressed() {
  for(int i=0;i<bob.points.length;i++) {
    if(selector==i) {
      if(keyPressed&&keyCode==UP) {
        bob.points[i][1]--;
      }
      if(keyPressed&&keyCode==DOWN) {
        bob.points[i][1]++;
      }
      if(keyPressed&&keyCode==LEFT) {
        bob.points[i][0]--;
      }
      if(keyPressed&&keyCode==RIGHT) {
        bob.points[i][0]++;
      }
    }
  }
  if(key==',') {
    selector--;
  } 
  if (key=='.') {
    selector++;
  }
  if(selector<selectorMin) {
    selector=selectorMax;
  } 
  if (selector>selectorMax) {
    selector=selectorMin;
  }
  //---
  if(key==' ') {
    curves.add(new Curve(false,bob.points[0][0],bob.points[0][1],bob.points[1][0],bob.points[1][1],bob.points[2][0],bob.points[2][1],bob.points[3][0],bob.points[3][1]));
    if(headAnchor){      
      anchorX = bob.points[0][0];
    anchorY = bob.points[0][1];
    } else if(!headAnchor){
      anchorX = bob.points[3][0];
    anchorY = bob.points[3][1];
    }
    bob.initPoints();
  }
}

void mouseMover(int q) {
  if(mousePressed&&hitTrigger==false&&hitDetect(bob.points[q][0],bob.points[q][1],range)) {
    hitTrigger=true;
    catchEm = q;
  }
  if(hitTrigger) {
    selector = catchEm;
    bob.points[catchEm][0]=mouseX;
    bob.points[catchEm][1]=mouseY;
    ellipseMode(CENTER);
    noFill();
    stroke(255,0,0,100);
    strokeWeight(1);
    ellipse(bob.points[catchEm][0],bob.points[catchEm][1],range,range);
  }
  //println("hitTrigger: " + hitTrigger);
}


void mouseReleased() {
  hitTrigger=false;
}

boolean hitDetect(int x, int y, int r) {
  if ((mouseX < x+r)&&(mouseX>x-r)&&(mouseY<y+r)&&(mouseY>y-r)) {
    return true;
  } 
  else {
    return false;
  }
}

void drawAll() {
  noFill();
  strokeWeight(2);
  stroke(127);
  for(int i=0;i<curves.size();i++) {
    Curve temp = (Curve) curves.get(i);
    bezier(temp.points[0][0],temp.points[0][1],temp.points[1][0],temp.points[1][1],temp.points[2][0],temp.points[2][1],temp.points[3][0],temp.points[3][1]);
  }
  println(curves.size());
}

//---   CLASSES   ---

class Curve {
  int[][] points = new int[4][2];

  Curve(boolean randomize, int x1, int y1, int cx1, int cy1, int cx2, int cy2, int x2, int y2) {
    if(randomize) {
      initPoints();
    }
    else {
      points[0][0] = x1;
      points[0][1] = y1;
      points[1][0] = cx1;
      points[1][1] = cy1;
      points[2][0] = cx2;
      points[2][1] = cy2;
      points[3][0] = x2;
      points[3][1] = y2;
    }
  }

  void initPoints() {
    int r = 5 * range;
    for(int i=0;i<points.length;i++) {
      int x = int(random(width));
      if(x<r) {
        x=r;
      }
      if(x>width-r) {
        x=width-r;
      }
      int y = int(random(height));
      if(y<r) {
        y=r;
      }
      if(y>width-r) {
        y=width-r;
      }
      points[i][0] = x;
      points[i][1] = y;
      points[0][0] = anchorX;
      points[0][1] = anchorY;
      //println(x + "   " + y + "   " + r);
    }
  }
}

//---   end


