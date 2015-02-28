
int numLeaves;
Leaf[] Leaves = new Leaf[20];

void setup(){
  size(600,400);
  smooth();
  noStroke();
  //frameRate(30);
}

void draw(){
 background(255);
 for (int i = 0; i < numLeaves; i++){
   Leaves[i].display();
   Leaves[i].move(); 
 }
}

class Leaf{
  float iRad, xPos, yPos, angle, speed;
  int iNum, iFre;
  color clr;
  Leaf (float r, float x, float y, float a, int n, float s, int f, color c){
    iRad = r;
    xPos = x;
    yPos = y;
    angle = a;
    iNum = n;
    speed = s;
    iFre = f;
    clr = c;
  }
  void move(){
    xPos = xPos + iRad * (cos(radians(angle + iNum * speed))-cos(radians(angle)));
    yPos = yPos + iRad * (sin(radians(angle + iNum * speed))-sin(radians(angle)));
    angle = angle + iNum * speed;
    if (iFre%2 ==0) {
      if (angle <=150 && angle >60) {
        speed = sin(radians(1.9 * (angle - 59)));
      }
      if (angle <= 60) {
        angle = 15;
        iFre = iFre + 1;
        iNum = 1;
        iRad = sqrt((iRad * iRad) + (iRad * iRad));
      }
    }
    else {
      if (angle >=15 && angle <105) {
        speed = sin(radians(1.9 * (106 - angle))); 
      }
      if (angle >= 105) {
        angle = 150;
        iFre = iFre + 1;
        iNum = -1;
        iRad = sqrt((iRad * iRad) + (iRad * iRad));
      }
    }
  }
  
  void display(){
    fill(clr);
    ellipseMode(CENTER);
    ellipse(xPos, yPos, 30, 30);
  }
}

void mousePressed(){
  float r = random(50, 100);
  float x = mouseX;
  float y = mouseY;
  float a = 15.0;
  int n = 1;
  float s = 0;
  int f = 1;
  color c = color(random(0, 200));
  Leaves[numLeaves] = new Leaf(r,x,y,a,n,s,f,c);
  numLeaves = numLeaves + 1;
}



