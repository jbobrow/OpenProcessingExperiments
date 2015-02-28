


boolean SYMMETRY = true;

float ROT = 1141.5;
int CYC = 777;

PGraphics platno;
ArrayList generators;
ArrayList machines;

int counter = 0;

float dirsx[] = {
  -1, 0, 1, -1, 0, 1, -1, 0, 1
};
float dirsy[] = {
  -1, -1, -1, 0, 0, 0, 1, 1, 1
};

float SMOOTHING = 300.0;

int BORDER = 200;

float CYCLES = 1.31;
float SPEED = 0.0205;
float AL = 25.5;

float TRAS = 1.125;

int NUM_GEN = 7;
int NUM_MACHINES = 100;


float ATT = 100.0;

void setup() {

  size(512, 512);

  textFont(loadFont("Lane-Narrow-48.vlw"));

  clear();
}

void clear() {

  background(0);

  generators = new ArrayList();

  for (int i = 0 ; i < NUM_GEN;i++) {
    generators.add(new Generator());
  }

  machines = new ArrayList();

  for (int i = 0 ; i < NUM_MACHINES;i++) {
    machines.add(new Machine());
  }

  platno = createGraphics(width, height, JAVA2D);

  platno.loadPixels();
}

void mousePressed() {

  clear();
}

void draw() {

  background(0);

  for (Object tmp : machines) {
    Machine m = (Machine)tmp;
    m.draw(platno);
  }

  float tx = (noise(0, frameCount)-0.5)*TRAS;
  float ty = (noise(frameCount, 0)-0.5)*TRAS;

  tint(255, random(200, 255));
  image(platno, tx, ty);

  fill(255);
  textAlign(RIGHT);
  text("#"+counter, width-50+tx, height-50+ty);

  if (frameCount%CYC==0) {
    clear();
    counter++;
  }
}


class Machine {
  PVector pos, lpos;
  int current;
  int cycle;
  float speed;
  float smx, smy;
  PVector dir;// = new PVector(0,0);

  Machine() {


    dir = new PVector(0, 0);

    speed = random(90, 100) * SPEED;

    pos = new PVector(width/2, height/2);
    lpos = new PVector(pos.x, pos.y);

    smx = pos.x;
    smy = pos.y;

    cycle = (int)(random(90, 100) * CYCLES);
    current = 0;//(int)random(generators.size());
  }


  void draw(PGraphics _platno) {


    noStroke();
    fill(255, 150);
    rectMode(CENTER);

    pushMatrix();
    translate(width/2, height/2);
    rotate(frameCount/ROT);
    translate(-width/2, -height/2);

    rect(pos.x, pos.y, 3, 3);
    rect(width-pos.x, pos.y, 3, 3);
    popMatrix();
    float d = dist(pos.x, pos.y, lpos.x, lpos.y);
    if (d<=100) {

      _platno.beginDraw();
      _platno.stroke(255, AL);
      _platno.translate(width/2, height/2);
      _platno.rotate(frameCount/ROT);
      _platno.translate(-width/2, -height/2);
      _platno.line(pos.x, pos.y, lpos.x, lpos.y);
      if (SYMMETRY) {
        _platno.scale(-1, 1);

        _platno.translate(-width, 0);
        _platno.stroke(255, AL);
        _platno.line(pos.x, pos.y, lpos.x, lpos.y);
      }
      _platno.endDraw();
    }
    move();
  }

  void move() {

    lpos = new PVector(pos.x, pos.y);



    Generator curr = (Generator)generators.get(current);
    boolean mat[] = new boolean[curr.matrix.length];

    for (int i = 0 ; i < curr.matrix.length;i++)
      mat[i]=curr.matrix[i];

    if (frameCount%cycle==0)
      current += machines.indexOf(this);//(int)random(generators.size());
    /*
       if(current>=generators.size()){ 
     int overlap = current-generators.size();
     current = overlap%(generators.size()-1);
     }
     */
    current %= (generators.size());

    for (int i = 0 ; i < curr.matrix.length;i++) {
      if (mat[i]) {
        dir.add(new PVector(dirsx[i], dirsy[i]));
      }
    }

    // println(dir.x+" "+dir.y);
    dir.normalize();
    dir.mult(speed);
    /*
       PVector target = new PVector(dir.x,dir.y);
     target.mult(cycle);
     target.add(pos);
     
     
     smx += (target.x-smx)/SMOOTHING;
     smy += (target.y-smy)/SMOOTHING;
     */
    pos.add(dir);



    att();
    border();
  }

  void att() {

    for (Object m : machines) {
      Machine tmp = (Machine)m;
      float d = dist(pos.x, pos.y, tmp.pos.x, tmp.pos.y)+1.0;
      if (m!=this) {
        pos.x += (tmp.pos.x-pos.x)/(ATT*d);
        pos.y += (tmp.pos.y-pos.y)/(ATT*d);

        dir.x += (tmp.dir.x-dir.x)/(ATT*d);
        dir.y += (tmp.dir.y-dir.y)/(ATT*d);
      }

      if (d<5.0) {
        pos.x -= (tmp.pos.x-pos.x)/(ATT*d);
        pos.y -= (tmp.pos.y-pos.y)/(ATT*d);
      }
    }
  }

  void border() {

    /*
       if(pos.x>width){pos.x=width;dir.x*=-1.0;}
     if(pos.x<0){pos.x=0;dir.x*=-1.0;}
     if(pos.y>height){pos.y=height;dir.y*=-1.0;}
     if(pos.y<0){pos.y=0;dir.y*=-1.0;}
     */
    float d = dist(pos.x, pos.y, width/2, height/2);

    if (d>BORDER) {
      float theta = atan2(height/2-pos.y, width/2-pos.x);
      theta += TWO_PI;
      pos.x = cos(theta)*BORDER+width/2;
      pos.y = sin(theta)*BORDER+height/2;
    }
    /*
     if()
     if(pos.x>width-BORDER)pos.x=BORDER;
     if(pos.x<BORDER)pos.x=width-BORDER;
     if(pos.y>height-BORDER)pos.y=BORDER;
     if(pos.y<BORDER)pos.y=height-BORDER;
     */
  }
}

class Generator {

  boolean [] matrix;

  Generator() {


    matrix = new boolean[9];

    for (int i = 0 ;i < matrix.length;i++) {
      matrix[i] = (random(50)>25)?true:false;
    }
  }

  void draw() {
  }
}


