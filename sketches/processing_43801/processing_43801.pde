
int trunks = 5;
float aveX;
float[] xs = new float[trunks];
int branch=0;

Trunk[] trunk = new Trunk[trunks];


void setup() {
  size(500,500);
  smooth();
  for (int i = 0; i < trunks; i++) {
  trunk[i] = new Trunk(random(width/5)+((width/5)*i),height,i);
  }
  background(255);
  branch = 0;
}

void draw() {
  checkOthers();
  branchDevider();
  for (int i = 0; i < trunks; i++) {
  trunk[i].move();
  }
}

class Trunk {
 float x, y;
 float lastx,lasty;
 float speedy = 0;
 color c;
 int id;
 float strWei;
 int len=0;
int branches = 10;
  int branchid=0;

Branch[] branch1 = new Branch[branches];

Trunk(float X,float Y, int ID) {
 x = X;
 lastx = x;
 y = Y;
 lasty = y;
 id = ID;
 c =  0;
 strWei = 10;  
}
  
  void move() {
    if (id+1 > branch){
    avoidOthers();
    if(aveX > x) x += (aveX-x)/8;
    if(aveX < x) x -= abs((aveX-x)/8);
    y--;}
    else{
      if (x < width-20){
    x++;
    y += speedy;
    speedy += random(-0.01,0.01);
    brancher();
    }}
      for(int j = 0; j < branchid; j++){
   branch1[j].move(); 
  }
    render();
    lastx = x; lasty = y;
}

void brancher() {
  len++;
  if (len%50 == 0){
  branch1[branchid] = new Branch(x,y,branchid,strWei);
  branchid++;
  }
}

void avoidOthers() {
 for (int i = 0; i < trunks; i++){
  if (xs[i] > x-strWei && xs[i] < x+strWei) {
   if (xs[i] > x) {x -= strWei/16;}
   if (xs[i] < x) {x += strWei/16;}
  }
 } 
}

void render() {
  stroke(c);
  strokeWeight(strWei);
 line(x,y,lastx,lasty); 
strWei = ((width-x)/width)*10;
}
}

class Branch {
 float x, y;
 float lastx,lasty;
 color c;
 int id;
 float strWeig,strWei;
 int len=0;
 float branchLenght = height/(trunks*2);
 float speedx=1;
 int leaveID = 0;
 
Leave[] leave = new Leave[5];

Branch(float X,float Y, int ID, float STRWEI) {
 x = X;
 lastx = x;
 y = Y;
 lasty = y;
 id = ID;
 c =  0;
 strWeig = STRWEI;  
 strWei = strWeig;
}
  
  void move() {
    if (len < branchLenght){
    if (id%2 == 0){
    y++;}
    if (id%2 == 1){
    y--;  
    }
    x += speedx;
    speedx += random(-0.1,0.1);
    if (len % (branchLenght/5) == 1) {leaveMaker();}
    render();
    len++;
  lastx = x;
  lasty = y;
  }
  for (int i = 0; i < leaveID; i++){
   leave[i].move(); 
  }
}

void leaveMaker() {
  if (id%2 == 0){
    if (leaveID%2 == 0) leave[leaveID] = new Leave(x-10,y+10);
    if (leaveID%2 == 1) leave[leaveID] = new Leave(x+10,y-10);
  }
  if (id%2 == 1){
    if (leaveID%2 == 0) leave[leaveID] = new Leave(x+10,y+10);
    if (leaveID%2 == 1) leave[leaveID] = new Leave(x-10,y-10);
  }
    leaveID++;
}

void render() {
  strWei = strWeig* ((branchLenght-len)/branchLenght);
  stroke(c);
  strokeWeight(strWei);
 line(x,y,lastx,lasty); 
}
}

class Leave {
 float x, y;
 float lastx,lasty;
 color c;
 int leavelife = 0;

Leave(float X,float Y) {
 x = X;
 lastx = x;
 y = Y;
 lasty = y;
 c =  #88FF00;
}
  
  void move() {
    if (leavelife > 51){
     x = lastx + random(-20,20);
     y = lasty + random(-20,20);
     leavelife=0;
    }
    leavelife++;
    render();
}

void render() {
  noStroke();
  fill(c,5);
  rectMode(CENTER);
  ellipse(x,y,15,15);
}
}

void checkOthers() {
  int count=0;
  aveX = 0;
  for(int j = 0; j < trunks; j++) {
    aveX += trunk[j].x;
    xs[j] = trunk[j].x;
  }
  aveX += 100;
  aveX = aveX/(trunks+5);
}

void mouseClicked() {
 setup(); 
}

void branchDevider() {
  for (int i = 0; i < trunks+1; i++){
  if(frameCount > (height/trunks-3)*i) branch = i;
  }
}               
