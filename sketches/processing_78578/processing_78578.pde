




ArrayList atoms;
float G = 1E6;
float massSmallMin = 0.1;
float massSmallMax = 0.3;
float massBigMin = 0.7;
float massBigMax = 1.0;
boolean isRunning = false;
boolean drawBg    = false;
boolean drawCn    = false;
boolean drawVt    = true;
boolean drawAl    = true;

int step=0;


void setup() {
  size(500, 500);
  background(0);
  atoms = new ArrayList();
  smooth();
}

float mouseXStart;
float mouseYStart;

void draw() {
  if(drawBg) {background(0);}
  noFill();
  noStroke();
  if(drawAl) {
    fill(0,0,0,5);
    rect(0,0,width,height);
  };
  // Display new string
  println("-----STEP: "+step+++" -- running: "+isRunning+" --");
  //println("atoms: "+atoms.size());
  for (int li=0;li<atoms.size();li++) {
    Atom atom = (Atom) atoms.get(li);
    //println(atom.n+")\t"+int(100*atom.mass));
    atom.blit();
  }
  if(drawCn) {
    for (int li=0;li<atoms.size();li++) {
      Atom atom = (Atom) atoms.get(li);
      atom.drawConnectors();
    }
  }
  for (int li=0;li<atoms.size();li++) {
    Atom atom = (Atom) atoms.get(li);
    atom.drawVectors();
  }
  if (isRunning) {
    for (int li=0;li<atoms.size();li++) {
      Atom atom = (Atom) atoms.get(li);
      atom.update();
    }
  }
  delay(10);
}


void mousePressed() {
  mouseXStart=mouseX;
  mouseYStart=mouseY;
  println("add atom");
  float mass=0;
  switch(mouseButton) {
    case LEFT  : mass = random(1)*(massSmallMax - massSmallMin) + massSmallMin; break;
    case RIGHT : mass = random(1)*(massBigMax   - massBigMin  ) + massBigMin;   break;
  }
  atoms.add(new Atom(atoms.size(), mouseX, mouseY, mass));
}

void keyPressed() {
  switch(key) {
    case ' ':             isRunning  =! isRunning;  break;
    case 'b': case 'B':   drawBg     =! drawBg;     break;
    case 'v': case 'V':   drawVt     =! drawVt;     break;
    case 'c': case 'C':   drawCn     =! drawCn;     break;
    case 'a': case 'A':   drawAl     =! drawAl;     break;
    case 'r': case 'R':   reset();                  break;
  }
}

void reset() {
  int n=atoms.size();
  for (int li=0;li<n;li++) {
    atoms.remove(0);
  }
  background(0);
  isRunning=false;
}

class Atom {

  float x;
  float y;
  float mass;
  int   n;
  float fX;
  float fY;
  float vX;
  float vY;

  Atom(int nT, float xT, float yT, float massT) {
    n          = nT;
    x          = xT;
    y          = yT;
    vX         = 0;
    vY         = 0;
    mass       = massT;
    fX         = 0;
    fY         = 0;
  }

  void type() {
    print(" x:"+x+" y:"+y);
  }

  void blit() {
    int cl = int(255*(mass-massSmallMin)/(massBigMax-massSmallMin));
    //println("mass: "+mass+" cl: "+cl);
    fill(cl,cl,cl);
    stroke(255);
    int s = cl/15>5? cl/15 : 5;
    ellipse(x, y, s, s);
  }

  void drawConnectors() {
    for (int li=0;li<atoms.size();li++) {
      Atom atom = (Atom) atoms.get(li);
      if (atom.n!=n) {
        //lines between points
        stroke(0, 0, 100);
        line(atom.x, atom.y, x, y);
      }
    }
  }
  void drawVectors() {
    fX=0;
    fY=0;
    for (int li=0;li<atoms.size();li++) {
      Atom atom = (Atom) atoms.get(li);
      if (atom.n!=n) {
        //vectors itself
        //linear parameters
        float a = (atom.y-y)/(atom.x-x);
        float b = y-a*x;
        //distance
        float r = dist(atom.x, atom.y, x, y);
        //potential value
        float pot = potential(r, atom.mass);
        float potX= pot*(atom.x-x)/r;
        float potY= pot*(atom.y-y)/r;

        //update the net force
        fX+=potX;
        fY+=potY;

        stroke(255, 0, 0);
        if(drawVt) {line(x, y, x+potX, y+potY);}

        //        println("from: "+atom.n+" to: "+n+" a: "+a+" b: "+b+" r: "+r+" m: "+atom.mass+" v: "+v+" vx: "+vx+" vy: "+vy);
      }
    }
    stroke(0, 255, 0);
    if(drawVt) {line(x, y, x+fX, y+fY);}
  }
  void update() {
    vX+=0.01*fX;
    vY+=0.01*fY;
    x+=vX;
    y+=vY;
  }

  float potential(float rT, float mT) {
    return G*mT/pow((rT+100), 2);
  }
}


