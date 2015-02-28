
ArrayList fireworks = new ArrayList();
int[][] points = new int[3][100000];
float camAngle=0;
 
void setup() {
  size(600, 400, P3D);
  colorMode(HSB, 255);
  noStroke();
     
  int px;int py;int pz;
  for (int z=0;z<50000;z++) {
    do {
      px=int(random(-1000,1000));
      py=int(random(-1000,1000));
      pz=int(random(-1000,1000));
    }
    while ((sqrt(sq(px)+sq(py)+sq(pz))>1000)||(sqrt(sq(px)+sq(py)+sq(pz))<980));
    points[0][z]=px;
    points[1][z]=py;
    points[2][z]=pz;
  }
  for (int i = 0; i < 25; i++) {
   fireworks.add(new firework(i));
 }
}
 
void draw() {
  background(0);
  camAngle +=0.003;
  camera(sin(camAngle)*2500,-600,cos(camAngle)*2500,0.0,-900,0.0,0.0, 1.0, 0.0);
  noStroke();
  fill(color(100,200,15));
  pushMatrix();
  rotateX(PI/2);
  rect(-1200,-1200, 2400, 2400);
  popMatrix();
  for (int i = 0; i < fireworks.size(); i++) {
    firework sh = (firework)fireworks.get(i);
    sh.step();
    sh.display();
  }
}
 
class firework {
  int x,y;
  int id;
  int step;
  int phase;
  int hueCol;
  int altitude;
  int diamiter;
  int[] steps = new int[3];
   
  firework(int sid) {
    id = sid;
    setVals();
    if (id==0) steps[0]=0;
  }
   
  void setVals() {
    step = 0;
    phase = 0;
    steps[0]=int(random(50,2000));
    steps[1]=150;
    steps[2]=80;
    x = int(random(-700,700));
    y = int(random(-700,700));
    hueCol = int(random(85,255));
    diamiter = int(random(5,120));
    altitude = int(random(100,300))+diamiter*12;
  }
   
  void display() {
    pushMatrix();
    rotateX(PI/2);
    if (phase==1) {
      stroke(color(30,200,255));
      point(x,y,sin(step*PI/(steps[1]*2.0))*altitude);
    }
     
    if (phase==2) {
      int drawPoints=diamiter*diamiter/8;
      int newAlt = int(cos(step*PI/400)*altitude);
      noStroke();
      fill(hueCol,step*400/steps[2],255);
      float sc=diamiter*sin((step*PI/(steps[2]*2.0)))/100;
      if (step>(steps[2]*0.5)) drawPoints = ((diamiter*diamiter)*((steps[2]-step)*2)/(steps[2]*8));
      for (int z=0;z<drawPoints;z++) {
        pushMatrix();
        translate(x+points[0][z]*sc,y+points[1][z]*sc,newAlt+points[2][z]*sc);
        box(11);
        popMatrix();
      }
    }
    popMatrix();
  }
   
  void step() {
    step++;
    if (step>steps[phase]) {
      phase++;
      step=0;
    }
    if (phase>2) {
      setVals();
    }
  }
}

