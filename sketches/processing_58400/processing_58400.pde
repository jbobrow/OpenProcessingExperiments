
//scrolling and mapsize
int mapsize=2000;
int vx=0;
float vxm=15;
float vxmm=0;

//HashMap of all buildings
HashMap<PVector, Integer> hm = new HashMap<PVector, Integer>();

//fonts and images
PFont calibri;
PFont PerfectDark;
PFont Roboto;

//debug
boolean debug=true;

//mechanics
int buildmode=0;
int w, h;
boolean shif=false;
boolean anyghost;
boolean released=false;
int uimode=2;
infoholder iholder=new infoholder(false);
int gamemode=0;
int gameTimer=0;

//start cash
int cash=2000;
int pcash=cash;//previous cash
int pcashm;//previous cash millisecond
int cpm=0;//cash per minute

//array of resources
resource[]resources=new resource[300];
//ArrayLists
ArrayList miners;
ArrayList relays;
ArrayList factories;
ArrayList ships;
ArrayList demolishanimations;
ArrayList lasers;
ArrayList shipdeaths;

void setup() {
  size(1200, 600, JAVA2D);
  background(0);
  smooth();
  w=width;
  h=height-100;
  int x=w/2;
  int y=h/2;
  for (int i=0; i<resources.length;i++) {
    if (int(i*.1)*10==i) {//every 10 frames find a rand cluster location
      x=int(random(0, mapsize));
      y=int(random(0, h));
    }
    int xa=int(random(-20, 20));//add a rand to the cluster location
    int ya=int(random(-20, 20));
    x+=xa;
    y+=ya;
    if (y+30>h) {
      y=h-30;
    }
    int r=int(random(100, 755));
    resources[i]=new resource(x, y, r);
  }

  calibri=loadFont("Calibri-48.vlw");
  PerfectDark=loadFont("PerfectDark(BRK)-48.vlw");
  Roboto=loadFont("Roboto-Light-48.vlw");

  miners=new ArrayList();
  miners.add(new miner(-1000, -1000));

  relays=new ArrayList();
  relays.add(new relay(30, 30));

  factories=new ArrayList();
  factories.add(new factory(30, 30));
  int fx=int(roundd(random(10, 300)));
  int fy=int(roundd(random(10, h-10)));
  factories.add(new factory(fx, fy));
  hm.put(new PVector(roundd(fx+vx), roundd(fy)), 3);

  ships=new ArrayList();
  ships.add(new Ship(30, 30, "LOL WUT"));

  demolishanimations=new ArrayList();
  demolishanimations.add(new DemolishAnimator(30, 30));

  lasers=new ArrayList();
  lasers.add(new Laser(200, 200, "LOL"));

  shipdeaths=new ArrayList();
  shipdeaths.add(new ShipDeath(10, 10));
}

float roundd(float number) {
  int x=int(number);
  int a=x%;
  int y=x-a;
  if (a>12.5) {
    a=25;
  }
  else {
    a=0;
  }
  return(y+a);
}

void info(float x, float y, int type) {
  iholder.active=true;
  if (type==1) {//if it is a relay
    for (int i=relays.size()-1;i>0;i--) {
      relay r1=(relay) relays.get(i);
      if (r1.x==x && r1.y==y) {
        uimode=2;
        println("---------RELAY----------");
        println("Energy " + r1.en);
        println("Capacity " + r1.capac);
        println("assigned" + frameCount);
        iholder.typeindex.x=type;
        iholder.typeindex.y=i;
      }
    }
  }
  if (type==2) {//if it is a miner
    for (int i=miners.size()-1;i>0;i--) {
      miner m1=(miner) miners.get(i);
      if (m1.x==x && m1.y==y) {
        uimode=2;
        println("---------MINER----------");
        println("Location (" + m1.x + ", " + m1.y +")");
        println("Energy " + m1.en);
        println("Capacity " + m1.capac);
        println("assigned" + frameCount);
        iholder.typeindex.x=type;
        iholder.typeindex.y=i;
      }
    }
  }
  if (type==3) {//if it is a factory
    for (int i=factories.size()-1;i>0;i--) {
      factory f=(factory) factories.get(i);
      if (f.x==x && f.y==y) {
        uimode=2;
        println("---------FACTORY----------");
        println("Location (" + f.x + ", " + f.y +")");
        println("Energy " + f.en);
        println("Capacity " + f.capac);
        println("assigned" + frameCount);
        iholder.typeindex.x=type;
        iholder.typeindex.y=i;
      }
    }
  }
  if (type==4) {//if it is a laser
    for (int i=lasers.size()-1;i>0;i--) {
      Laser l=(Laser) lasers.get(i);
      if (l.loc.x==x && l.loc.y==y) {
        uimode=2;
        iholder.typeindex.x=type;
        iholder.typeindex.y=i;
      }
    }
  }
}

/*
Hashmap & buildmode codes:
 0=not building
 1=relay
 2=miner
 3=factory
 */

void mouseReleased() {
  rectMode(CORNERS);
  pushMatrix();
  translate(vx,0);
  if (mouseY>h && uimode==1) {
    if (mouseX<w/3+((w-(w/3))/4) && mouseX>w/3) {
      buildmode=1;
    }
    if (mouseX>w/3+((w-(w/3))/4) && mouseX<w/3+(((w-(w/3))/4)*2)) {
      buildmode=2;
    }
    if (mouseX>w/3+(((w-(w/3))/4)*2) && mouseX<w/3+(((w-(w/3))/4)*3)) {
      buildmode=3;
    }
    if (mouseX>w/3+(((w-(w/3))/4)*3)) {
      buildmode=4;
    }
  }

  if (roundd(mouseY)<h) {
    boolean resourceAvailable=false;
    boolean occupied=false;

    for (int i=0;i<resources.length;i++) {//determine if there are resources nearby (for miners)
      if (resources[i] != null) {
        if (dist(roundd(mouseX+vx), roundd(mouseY), resources[i].x, resources[i].y)<50 && cash>=100) {
          resourceAvailable=true;
        }
      }
    }


    boolean infoed=false;
    Iterator i = hm.entrySet().iterator();//get an iterator
    while (i.hasNext ()) {//run through hashmap
      Map.Entry me = (Map.Entry) i.next();
      PVector p=(PVector) me.getKey();
      if (roundd(mouseX+vx)==p.x && roundd(mouseY)==p.y) {
        occupied=true;
        if (buildmode==0) {
          Integer value = (Integer) me.getValue();
          info(roundd(mouseX+vx), roundd(mouseY), value);
          infoed=true;
        }
      }
    }

    if (occupied || mouseButton==RIGHT) {
      buildmode=0;
    }

    if (!infoed) {
      iholder.active=false;
      uimode=1;
    }


    if (buildmode==2) {//miners
      if (resourceAvailable==true && occupied==false && cash>=100) {    
        miners.add(new miner(int(roundd(mouseX+vx)), int(roundd(mouseY))));
        hm.put(new PVector(roundd(mouseX+vx), roundd(mouseY)), 2);
        cash-=100;
        if (!shif) {
          buildmode=0;
        }
      }
      else if (cash<100) {
        strokeWeight(2);
        stroke(255, 0, 0);
        fill(255, 0, 0, 200);
        rect(w/3+((w-(w/3))/4), h, w/3+(((w-(w/3))/4)*2), height);
      }
    }

    if (buildmode==1) {//relays
      if (occupied==false && cash>=50) {
        relays.add(new relay(int(roundd(mouseX+vx)), int(roundd(mouseY))));
        hm.put(new PVector(roundd(mouseX+vx), roundd(mouseY)), 1);
        cash-=50;
        if (!shif) {
          buildmode=0;
        }
      }
      else if (cash<50) {
        strokeWeight(2);
        stroke(255, 0, 0);
        fill(255, 0, 0, 200);
        rectMode(CORNERS);
        rect(w/3, h, w/3+((w-(w/3))/4), height);
        rectMode(CORNER);
      }
    }

    if (buildmode==3) {//factories
      if (occupied==false & cash>=500) {
        factories.add(new factory(int(roundd(mouseX+vx)), int(roundd(mouseY))));
        hm.put(new PVector(roundd(mouseX+vx), roundd(mouseY)), 3);
        cash-=500;
        if (!shif) {
          buildmode=0;
        }
      }
      else if (cash<500) {
        strokeWeight(2);
        stroke(255, 0, 0);
        fill(255, 0, 0, 200);
        rectMode(CORNERS);
        rect(w/3+(((w-(w/3))/4)*2), h, w/3+(((w-(w/3))/4)*3), height);
        rectMode(CORNER);
      }
    }

    if (buildmode==4) {//lasers
      if (occupied==false & cash>=200) {
        lasers.add(new Laser(int(roundd(mouseX+vx)), int(roundd(mouseY)), "LOL"));
        hm.put(new PVector(roundd(mouseX+vx), roundd(mouseY)), 4);
        cash-=200;
        if (!shif) {
          buildmode=0;
        }
      }
      else if (cash<200) {
        strokeWeight(2);
        stroke(255, 0, 0);
        fill(255, 0, 0, 200);
        rectMode(CORNERS);
        rect(w/3+(((w-(w/3))/4)*3), h, width, height);
        rectMode(CORNER);
      }
    }
  }
  released=true;
  rectMode(CORNER);
  popMatrix();
}



void draw() {
  if (gamemode==0) {
    menu();
  }
  if (gamemode==2) {
    aboutmenu();
  }
  if (gamemode==1) {
    gameTimer++;
    h=height-100;
    pcash=cash;
    shif=false;
    //scrolling start
    if (mouseX<w-50 && mouseX>50) {
      vxm=0;
      vxmm=0;
    }

    if (gameTimer==0) {
      for (int i=0;i<gameTimer/1000;i++) {
        ships.add(new Ship(mapsize, random(0, h), "."));
      }
    }

    if (mouseX>w-50 || mouseX<50) {
      if (mouseX!=0) {
        if (mouseX<w/2) {
          if (vx>0) {
            vxmm+=.05;
            vxm+=vxmm;
            vx-=vxm;
          }
        }
        if (mouseX>w/2) {
          if (vx<mapsize-w) {
            vxmm+=.05;
            vxm+=vxmm;
            vx+=vxm;
          }
        }
      }
    }
    translate(-vx, 0);//view location on map
    //scrolling finish

    background(0);

    if (debug==true) {
      textSize(15);
      stroke(0);
      fill(255);
      fill(0, 255, 255);
      textFont(Roboto);
      textSize(20);
      textAlign(CENTER);
      textAlign(BASELINE);
      text(int(frameRate), 370+vx, h+25);
      //    text(buildmode, w-30+vx, 30);
      //    text(cash, w/2+vx, 30);
      //    text("(" + roundd(mouseX + vx) + ", " + roundd(mouseY) + ")", 30+vx, h-30);
    }

    for (int i=0; i<resources.length;i++) {//update resources
      if (resources[i] != null) {
        resources[i].update();
        if (resources[i].r<0) {
          resources[i]=null;
        }
      }
    }
    for (int i=relays.size()-1;i>0;i--) {//update relays and kill dead ones
      relay r1=(relay) relays.get(i);
      r1.update();
    }
    for (int i=factories.size()-1;i>0;i--) {
      factory f1=(factory) factories.get(i);
      f1.update();
    }
    for (int i=miners.size()-1;i>=0;i--) {//update miners and kill dead ones
      miner m1=(miner) miners.get(i);
      m1.update();
    }

    for (int i=lasers.size()-1 ;i>0;i--) {
      Laser l=(Laser) lasers.get(i);
        l.update();
      l.display();
    }

    for (int i=ships.size()-1;i>0;i--) {
      Ship s=(Ship) ships.get(i);
      if (s.killme) {
        ships.remove(i);
        shipdeaths.add(new ShipDeath(s.loc.x, s.loc.y));
        for (int j=lasers.size()-1;j>0;j--) {
          Laser l=(Laser) lasers.get(j);
          l.enIndex=-11;
        }
      }
      if(s.en>0){
      s.update();
      }
      s.display();
    }

    for (int i=demolishanimations.size()-1;i>0;i--) {
      DemolishAnimator d=(DemolishAnimator) demolishanimations.get(i);
      if (d.killme) {
        demolishanimations.remove(i);
      }
      d.update();
      d.display();
    }
    for (int i=shipdeaths.size()-1;i>0;i--) {
      ShipDeath s=(ShipDeath) shipdeaths.get(i);
      if (s.killme) {
        shipdeaths.remove(i);
      }
      s.update();
    }
    if (millis()%5==0) {
      if (int(((cash-pcash)*frameRate)*60)!=0) {
        cpm=int(((cash-pcash)*frameRate)*60);
      }
    }
    if (keyPressed && key==CODED && keyCode==SHIFT) {
      shif=true;
    }

    iholder.update();

    ghostbuildings();
    userinterface();
  }
  released=false;
  
}//draw end

void ghostbuildings() {
  anyghost=false;
  if (buildmode==1) {
    boolean isghost=false;
    for (int i=relays.size()-1;i>0;i--) {
      relay r=(relay) relays.get(i);
      if (r.ghost) {
        isghost=true;
        anyghost=true;
      }
    }
    if (!isghost) {
      relays.add(new relay(int(roundd(mouseX+vx)), int(roundd(mouseY)), "ghostish"));
    }
  }
  else {
    for (int i=relays.size()-1;i>0;i--) {
      relay r=(relay) relays.get(i);
      if (r.ghost) {
        relays.remove(i);
      }
    }
  }

  if (buildmode==2) {
    boolean isghost=false;
    for (int i=miners.size()-1;i>0;i--) {
      miner m=(miner) miners.get(i);
      if (m.ghost) {
        isghost=true;
        anyghost=true;
      }
    }
    if (!isghost) {
      miners.add(new miner(int(roundd(mouseX+vx)), int(roundd(mouseY)), "ghostish"));
    }
  }
  else {
    for (int i=miners.size()-1;i>0;i--) {
      miner m=(miner) miners.get(i);
      if (m.ghost) {
        miners.remove(i);
      }
    }
  }

  if (buildmode==3) {
    boolean isghost=false;
    for (int i=factories.size()-1;i>0;i--) {
      factory f=(factory) factories.get(i);
      if (f.ghost) {
        isghost=true;
        anyghost=true;
      }
    }
    if (!isghost) {
      factories.add(new factory(int(roundd(mouseX+vx)), int(roundd(mouseY)), "ghostish"));
    }
  }
  else {
    for (int i=factories.size()-1;i>0;i--) {
      factory f=(factory) factories.get(i);
      if (f.ghost) {
        factories.remove(i);
      }
    }
  }

  if (buildmode==4) {
    boolean isghost=false;
    for (int i=lasers.size()-1;i>0;i--) {
      Laser l=(Laser) lasers.get(i);
      if (l.ghost) {
        isghost=true;
        anyghost=true;
      }
    }
    if (!isghost) {
      lasers.add(new Laser(int(roundd(mouseX+vx)), int(roundd(mouseY)), "LOL", "ghostish"));
    }
  }
  else {
    for (int i=lasers.size()-1;i>0;i--) {
      Laser l=(Laser) lasers.get(i);
      if (l.ghost) {
        lasers.remove(i);
      }
    }
  }
}


void removeR(int index) {
  if (index<relays.size()) {
    relay r=(relay) relays.get(index);
    hm.remove(new PVector( r.x, r.y));
    demolishanimations.add(new DemolishAnimator(r.x, r.y));
    relays.remove(index);
  }
}

void removeM(int index) {
  if (index<miners.size()) {
    miner m=(miner) miners.get(index);
    hm.remove(new PVector( m.x, m.y));
    demolishanimations.add(new DemolishAnimator(m.x, m.y));
    miners.remove(index);
  }
}

void removeF(int index) {
  if (index<factories.size()) {
    factory m=(factory) factories.get(index);
    hm.remove(new PVector( m.x, m.y));
    demolishanimations.add(new DemolishAnimator(m.x, m.y));
    factories.remove(index);
  }
}

void removeL(int index) {
  if (index<lasers.size()) {
    Laser l=(Laser) lasers.get(index);
    hm.remove(new PVector(l.loc.x, l.loc.y));
    demolishanimations.add(new DemolishAnimator(l.loc.x, l.loc.y));
    lasers.remove(index);
  }
}

void keyReleased() {
  int num1=49;
  int num2=50;
  int num3=51;
  int num4=52;
  int num5=53;
  if (keyCode==num1) {
    buildmode=1;
  }
  if (keyCode==num2) {
    buildmode=2;
  }
  if (keyCode==num3) {
    buildmode=3;
  }
  if (keyCode==num4) {
    buildmode=4;
  }
  if (key=='d') {
    if (uimode==2 && iholder.active) {
      iholder.kill();
      iholder.active=false;
    }
  }
  if(key==CODED && keyCode==RIGHT){
    vx+=100;
  }
  if(key==CODED && keyCode==LEFT){
    vx-=100;
  }
  if(vx<0){
    vx=0;
  }
  if(vx>mapsize-w){
    vx=mapsize-w;
  }

}

class infoholder {
  int en, capac;
  int x, y;
  boolean active;
  PVector typeindex=new PVector(-1, 0);
  infoholder(int cen, int ccapac) {
    en=cen;
    capac=ccapac;
    active=true;
  }
  infoholder(boolean cactive) {
    active=cactive;
  }
  /*
Hashmap & buildmode codes:
   0=not building
   1=relay
   2=miner
   3=factory
   4=laser
   */
  void update() {
    boolean typecorrupt=true;
    if (typeindex.x==1) {
      if (relays.size()>typeindex.y) {
        relay r=(relay) relays.get(int(typeindex.y));
        x=r.x;
        y=r.y;
        en=int(r.en);
        capac=r.capac;
        typecorrupt=false;
      }
      else {
        active=false;
      }
    }
    if (typeindex.x==2) {
      if (miners.size()>typeindex.y) {
        miner r=(miner) miners.get(int(typeindex.y));
        x=r.x;
        y=r.y;
        en=int(r.en);
        capac=r.capac;
        typecorrupt=false;
      }
      else {
        active=false;
      }
    }
    if (typeindex.x==3) {
      if (factories.size()>typeindex.y) {
        factory r=(factory) factories.get(int(typeindex.y));
        x=r.x;
        y=r.y;
        en=int(r.en);
        capac=int(r.capac);
        typecorrupt=false;
      }
      else {
        active=false;
      }
    }
    if (typeindex.x==4) {
      if (lasers.size()>typeindex.y) {
        Laser l=(Laser) lasers.get(int(typeindex.y));
        x=int(l.loc.x);
        y=int(l.loc.y);
        en=int(l.en);
        capac=int(l.capac);
        typecorrupt=false;
      }
      else {
        active=false;
      }
    }

    if (!typecorrupt && active) {
      strokeWeight(2);
      noFill();
      stroke(0, 168, 255);
      ellipse(x, y, 45, 45);
    }
  }
  void kill() {
    if (typeindex.x==1) {
      removeR(int(typeindex.y));
      cash+=25;
    }
    if (typeindex.x==2) {
      removeM(int(typeindex.y));
      cash+=50;
    }
    if (typeindex.x==3) {
      removeF(int(typeindex.y));
      cash+=250;
    }
    if (typeindex.x==4) {
      removeL(int(typeindex.y));
      cash+=100;
    }
  }
}

class DemolishAnimator {
  PVector loc;
  int r;
  boolean killme=false;
  DemolishAnimator(float x, float y) {
    loc=new PVector(x, y);
    r=2;
  }
  void update() {
    r+=map(r, 2, 50, 1, 5);
    if (r>50) {
      killme=true;
    }
  }
  void display() {
    strokeWeight(3);
    stroke(255, 0, 0);
    fill(255, 0, 0, 255-map(r, 2, 50, 0, 255));
    ellipse(loc.x, loc.y, r, r);
  }
}

class ShipDeath {
  PVector loc;
  int timer;
  ArrayList particles=new ArrayList();
  boolean killme=false;
  ShipDeath(float x, float y) {
    loc=new PVector(x, y);
    for (int i=0;i<15;i++) {
      particles.add(new Particle(loc));
    }
  }
  void update() {
    killme=true;
    for (int i=particles.size()-1;i>0;i--) {
      Particle p=(Particle) particles.get(i);
      p.update();
      p.display();
      if (!p.killme) {
        killme=false;
      }
    }
  }
}

class Particle {
  PVector loc;
  PVector ploc;
  PVector vel;
  boolean killme=false;
  color c;
  Particle(PVector loc_) {
    loc=loc_;
    ploc=loc;
    vel=new PVector(random(-20, 20), random(-20, 20));
    c=color(random(0, 255), random(0, 255), random(0, 255));
  }
  void update() {
    ploc.x=loc.x;
    ploc.y=loc.y;
    vel.mult(.8);
    loc=PVector.add(vel, loc);
    if (vel.mag()<1) {
      killme=true;
    }
  }
  void display() {
    strokeWeight(2);
    stroke(c);
    line(loc.x, loc.y, ploc.x, ploc.y);
  }
}

class resource {
  int x, y, r;
  resource(int cx, int cy, int cr) {
    x=cx;
    y=cy;
    r=cr;
  }
  void update() {
    noStroke();
    fill(100, 255, 100, r/20);
    ellipse(x, y, 50, 50);
    fill(153, 153);
  }
}

class factory {
  int x, y;
  float en;
  float capac;
  int s=30;
  int ticker=0;
  float rspeed;
  int r=0;
  boolean killme;
  int killmeIndex;
  float convspeed=4;
  boolean ghost;

  factory(int cx, int cy) {
    x=cx;
    y=cy;
    en=-500;
    capac=50;
    ghost=false;
  }
  factory(int cx, int cy, String s) {
    x=cx;
    y=cy;
    en=-500;
    capac=50;
    ghost=true;
  }

  void update() {
    if(killme){
      removeF(killmeIndex);
    }
    ticker++;
    if (ghost && mouseY<height-100) {
      x=int(roundd(mouseX+vx));
      y=int(roundd(mouseY));
    }

    convspeed=map(en, 0, capac, 2, 8);

    if (en>convspeed && en>0 && en>-1 && !ghost) {
      en-=convspeed;
      cash+=convspeed/2;
    }

    display();
  }
  void display() {
    if (en>-1 &&!ghost) {
      rspeed=map(convspeed, 2, 8, 0, 30);
    }
    pushMatrix();
    translate(x, y);
    r+=rspeed;
    rotate(radians(r));
    fill(0);
    stroke(200, 0, 255);
    if (en<0 &&!ghost) {
      fill(153, 153);
      stroke(153);
    }
    ellipse(0, 0, s, s);
    fill(255, 100, 255, 100);
    if (en<0 &&!ghost) {
      fill(153);
    }
    ellipse(0, 0, s/2, s/2);

    for (int i=0;i<3;i++) {
      float a = (TWO_PI/3)*i;
      float x1 = 0 + cos(a)*s/4;
      float y1 = 0 + sin(a)*s/4;
      fill(255);
      noStroke();
      if (en<0 &&!ghost) {
        fill(253);
      }
      ellipse(x1, y1, s/6, s/6);
      float x2 = 0 + cos(a)*s/1.5;
      float y2 = 0 + sin(a)*s/1.5;
      stroke(255, 0, 255);
      if (en<0 &&!ghost) {
        fill(153, 153);
        stroke(153);
      }
      line(0, 0, x2, y2);
    }
    popMatrix();
  }
}
class miner {
  int x, y;
  float en;
  int resdist;
  int counter=0;
  boolean alive=true;
  boolean killme;
  int killmeIndex;
  boolean active;
  boolean ghost;
  int capac=5;
  miner(int cx, int cy) {
    x=cx;
    y=cy;
    en=-80;
    ghost=false;
  }
  miner(int cx, int cy, String s) {
    x=cx;
    y=cy;
    en=-80;
    ghost=true;
  }
  void update() {
    if(killme){
      removeM(killmeIndex);
    }
    if (ghost && mouseY<height-100) {
      x=int(roundd(mouseX+vx));
      y=int(roundd(mouseY));
    }
    counter++;
    active=false;
    for (int i=0; i<resources.length;i++) {
      if (resources[i] != null) {
        resdist=int(dist(x, y, resources[i].x, resources[i].y));
        if (resdist<50) {
          active=true;
          stroke(0, 0, 255, 153);
          line(x, y, resources[i].x, resources[i].y);
          if (int(counter*.1)*10==counter) {//every ten frames(ten frames?)
            if (en<capac && !ghost) {//if it won't exceed it's capacity
              resources[i].r-=1;
              en+=capac;
              stroke(0, 168, 255);
              line(x, y, resources[i].x, resources[i].y);
            }
          }
        }
      }
    }

    if (ghost) {
      active=true;
    }

    if (active==true && en>-1) {
      if (int(counter*.1)*10==counter && en<capac) {
        fill(0, 168, 255);
      }
      else {
        fill(0, 0, 255, 153);
      }
    }
    else {
      if (int(counter*.1)*10==counter) {
        fill(0, 168, 255);
      }
      fill(153, 153);
    }
    noStroke();
    ellipse(x, y, 15, 15);
  }
}

class relay {
  int x, y;
  float en, pen;
  int capac;
  int range;
  boolean active;
  boolean killme;
  int killmeIndex;
  boolean ghost;
  relay(int cx, int cy) {
    x=cx;
    y=cy;
    capac=10;
    en=-20;
    range=80;
    ghost=false;
  }
  relay(int cx, int cy, String s) {
    x=cx;
    y=cy;
    capac=10;
    en=-20;
    range=80;
    ghost=true;
  }
  void update() {
    if (killme) {
      removeR(killmeIndex);
    }
    pen=en;
    active=false;
    if (ghost && mouseY<height-100) {
      x=int(roundd(mouseX+vx));
      y=int(roundd(mouseY));
    }
    Iterator i = hm.entrySet().iterator();//get an iterator
    while (i.hasNext ()) {//run through hashmap
      Map.Entry me = (Map.Entry) i.next();
      PVector p=(PVector) me.getKey();
      Integer value= (Integer) me.getValue();
      strokeWeight(.5);

      if (p.x==x && p.y==y) {
      }
      else {
        if (dist(p.x, p.y, x, y)<range) {//if it is within range
          if (value==1 || value==2 || value==3 || value==4) {
            stroke(255, 0, 0, 153);
            line(x, y, p.x, p.y);
          }

          if (value==2) {//miner
            for (int j=miners.size()-1;j>0;j--) {//loop through miners to get energy
              miner m1=(miner) miners.get(j);
              if (m1.x==p.x && m1.y==p.y) {//if it is the same one as the one in the hashmap
                if (m1.en>0 && en<capac && !ghost) {//if it has energy and you are not full and are not a ghost
                  m1.en-=1;
                  en+=1;
                  stroke(255, 168, 0);
                  line(x, y, m1.x, m1.y);
                }
                if (m1.en<0 && en>0) {//if this miner is under construction (?)
                  m1.en+=1;
                  en-=1;
                }
                if (m1.active) {
                  active=true;
                }
              }
            }
          }
          if (value==1 && en>-1 && !ghost) {//loop through relays to trade energy
            float lowesten=1000;
            int lowDir=-13;
            for (int j=relays.size()-1;j>0;j--) {
              relay r1=(relay) relays.get(j);
              if (r1.x==p.x && r1.y==p.y) {//if it is the same one as the one in the hashmap
                if (r1.en<en && r1.en<capac && en>0 && r1.en<lowesten) {//if it has less energy than you and it is not full and you are not empty
                  lowesten=r1.en;
                  lowDir=j;
                }
                if (r1.active) {
                  active=true;
                }
              }
            }
            if(lowDir!=-13){
            relay r1=(relay) relays.get(lowDir);
            r1.en+=1;
            en-=1;
            stroke(255, 168, 0);
            line(x, y, r1.x, r1.y);
            }
          }
          if (value==3 && en>-1 && !ghost) {//factory
            for (int f=factories.size()-1;f>0;f--) {//loop through factories
              factory f1=(factory) factories.get(f);
              if (f1.x==p.x && f1.y==p.y) {//if it is the same factory as in the hashmap
                if (f1.en<f1.capac && en>2) {
                  en-=2;
                  f1.en+=2;
                  stroke(255, 168, 0);
                  line(x, y, f1.x, f1.y);
                }
                active=true;
              }
            }
          }
          if (value==4 && en>-1 && !ghost) {//laser
            float lowesten=10000;
            int lowDir=-10;
            for (int j=lasers.size()-1;j>0;j--) {
              Laser l=(Laser) lasers.get(j);
              if (l.loc.x==p.x && l.loc.y==p.y) {//if it is the same one as the one in the hashmap
                if (l.en<l.capac && en>0) {//if it has less energy than you and it is not full and you are not empty
                  lowesten=l.en;
                  lowDir=j;
                  l.en+=1;
                  en-=1;
                  stroke(255, 168, 0);
                  line(x, y, l.loc.x, l.loc.y);
                }
                active=true;
              }
            }
          }
        }
      }
    }


    if (anyghost) {
      for (int j=relays.size()-1;j>0;j--) {
        relay r1=(relay) relays.get(j);
        if (dist(r1.x, r1.y, x, y)<range) {
          if (r1.ghost) {
            stroke(255, 0, 0);
            line(x, y, r1.x, r1.y);
          }
        }
      }
      for (int k=miners.size()-1;k>0;k--) {
        miner m1=(miner) miners.get(k);
        if (dist(m1.x, m1.y, x, y)<range) {
          if (m1.ghost) {
            stroke(255, 0, 0);
            line(x, y, m1.x, m1.y);
          }
        }
      }
      for (int p=factories.size()-1;p>0;p--) {
        factory f=(factory) factories.get(p);
        if (dist(f.x, f.y, x, y)<range) {
          if (f.ghost) {
            stroke(255, 0, 0);
            line(x, y, f.x, f.y);
          }
        }
      }
      for (int p=lasers.size()-1;p>0;p--) {
        Laser l=(Laser) lasers.get(p);
        if (dist(l.loc.x, l.loc.y, x, y)<range) {
          if (l.ghost) {
            stroke(255, 0, 0);
            line(x, y, l.loc.x, l.loc.y);
          }
        }
      }
    }



    fill(153);
    if (active && en>=0 || ghost) {
      fill(255, map(en, 0, capac, 0, 168), 0);//color based on amount of energy
    }



    noStroke();
    ellipse(x, y, 10, 10);

    if (anyghost) {
      noFill();
      stroke(255);
      ellipse(x, y, range*2, range*2);
    }
  }
}

class Ship {
  PVector loc;
  PVector vel=new PVector (0, 0);
  PVector dir=new PVector(0, 0);
  int ARadius=200;
  boolean killme=false;
  float r=0;

  int enIndex=-12;
  int penIndex;
  int enType=-5;
  int penType;
  boolean inRange=false;
  boolean inRange3=false;
  int alph=0;
  PVector enLoc;
  int shotIndex;
  int shotType;
  PVector shotLoc;
  boolean shot=false;
  int timer =0;

  float speed, agility;
  float en=100;
  int h=100;
  int efficiency=10;//higher is better
  int range=75;
  int damage=5;
  int huntMode=0;
  int rate=50;
  /*
   0=closest building w/retaliation*
   1=ships only
   2=buildings only*
   3=retaliation only*
   */

  PVector desired=new PVector(width/2, height/2);

  Ship(float x, float y, String type) {
    loc=new PVector(x, y);
    speed=1;
    agility=.2;
    shotLoc=loc;
  }

  PVector enemyLoc() {
    PVector eLoc=new PVector(10, 10);
    int lowDist=100000;
    int lowDir=-1;
    int lowType=-1;

    if (huntMode==1) {
      for (int i=ships.size()-1;i>0;i--) {
        Ship s=(Ship) ships.get(i);
        boolean isSelf=false;
        int distance=int(dist(loc.x, loc.y, s.loc.x, s.loc.y));
        if (loc.x==s.loc.x && loc.y==s.loc.y) {
          isSelf=true;
        }
        if (distance<lowDist && !isSelf) {
          lowDist=distance;
          lowDir=i;
          lowType=5;
        }
      }
    }
    if (huntMode==2 || huntMode==0 || huntMode==3) { 
      for (int i=relays.size()-1;i>0;i--) {
        relay r=(relay) relays.get(i);
        int distance=int(dist(loc.x, loc.y, r.x, r.y));
        if (distance<lowDist && !r.ghost) {
          lowDist=distance;
          lowDir=i;
          lowType=1;
        }
      }
      for (int i=miners.size()-1;i>0;i--) {
        miner m=(miner) miners.get(i);
        int distance=int(dist(loc.x, loc.y, m.x, m.y));
        if (distance<lowDist && !m.ghost) {
          lowDist=distance;
          lowDir=i;
          lowType=2;
        }
      }
      for (int i=factories.size()-1;i>0;i--) {
        factory f=(factory) factories.get(i);
        int distance=int(dist(loc.x, loc.y, f.x, f.y));
        if (distance<lowDist && !f.ghost) {
          lowDist=distance;
          lowDir=i;
          lowType=3;
        }
      }
      for (int i=lasers.size()-1;i>0;i--) {
        Laser l=(Laser) lasers.get(i);
        int distance=int(dist(loc.x, loc.y, l.loc.x, l.loc.y));
        if (distance<lowDist && !l.ghost) {
          lowDist=distance;
          lowDir=i;
          lowType=4;
        }
      }
    }

    enIndex=lowDir;
    enType=lowType;
    if (lowDist<range) {
      inRange=true;
      inRange3=true;
    }

    return getLoc(lowType, lowDir);
  }

  PVector getLoc(int type, int index) {
    if (type==1) {
      relay r=(relay) relays.get(index);
      return new PVector(r.x, r.y);
    }
    if (type==2) {
      miner m=(miner) miners.get(index);
      return new PVector(m.x, m.y);
    }
    if (type==3) {
      factory f=(factory) factories.get(index);
      return new PVector(f.x, f.y);
    }
    if (type==4) {
      Laser l=(Laser) lasers.get(index);
      return(l.loc);
    }
    if (type==5) {
      Ship s=(Ship) ships.get(index);
      return s.loc;
    }
    return new PVector(10, 10);
  }

  PVector arrival(PVector target) {
    PVector steer; // The steering vector
    PVector desired = PVector.sub(target, loc); // A vector pointing from current location to the target
    float distance = mag2(desired); // Distance from the target is the magnitude of the vector
    // If the distance is greater than 0, calc steering (otherwise return zero vector)
    if (distance > 0) {
      desired.normalize(); // Normalize desired
      if (distance < ARadius*ARadius) {
        distance = (float) Math.sqrt(distance);
        desired.mult(speed*(distance/ARadius)); // This damping is somewhat arbitrary
      }
      else desired.mult(agility);
      steer = PVector.sub(desired, vel); // Steering = Desired minus Velocity
    }
    else {
      steer = new PVector();
    }
    return steer;
  }

  float mag2(PVector v) {
    return (v.x*v.x + v.y*v.y + v.z*v.z);
  }

  int indexFor(int type, PVector loc) {
    if (type==1) {
      for (int i=relays.size()-1;i>0;i--) {
        relay r=(relay) relays.get(i);
        if (r.x==loc.x && r.y==loc.y) {
          return i;
        }
      }
    }
    if (type==2) {
      for (int i=miners.size()-1;i>0;i--) {
        miner m=(miner) miners.get(i);
        if (m.x==loc.x && m.y==loc.y) {
          return i;
        }
      }
    }
    if (type==3) {
      for (int i=factories.size()-1;i>0;i--) {
        factory f=(factory) factories.get(i);
        if (f.x==loc.x && f.y==loc.y) {
          return i;
        }
      }
    }
    if (type==4) {
      for (int i=lasers.size()-1;i>0;i--) {
        Laser l=(Laser) lasers.get(i);
        if (l.loc==loc) {
          return i;
        }
      }
    }
    if (type==5) {
      for (int i=ships.size()-1;i>0;i--) {
        Ship s=(Ship) ships.get(i);
        if (s.loc==loc) {
          return i;
        }
      }
    }
    return 8008132;
  }

  void update() {
    timer++;
    desired=enemyLoc();

    if (huntMode==0 || huntMode==3) {
      if (shot) {
        desired=shotLoc;
        enIndex=indexFor(shotType, shotLoc);
        enType=shotType;
        if (dist(loc.x, loc.y, desired.x, desired.y)<range) {
          inRange=true;
        }
        else {
          inRange=false;
        }
      }
    }

    if (enIndex==8008132) {
      shot=false;
    }

    int enDist=int(dist(loc.x, loc.y, desired.x, desired.y));
    if (enDist>range) {
      inRange=false;
    }
    else {
      inRange=true;
    }


    dir=PVector.sub(desired, loc);
    dir.limit(agility);
    if (huntMode!=3 || shot) {
      vel.add(dir);
    }
    if (enDist<ARadius && huntMode!=3 || enDist<ARadius && shot) {
      vel.add(arrival(desired));
    }
    vel.limit(speed);
    if (enDist<range) {
      vel=new PVector();
    }
    en-=(vel.mag()/efficiency)/3;
    if(en>0){
    loc.add(vel);
    }


    if (timer%rate==0 && inRange && en>=damage/2) {
      shoot();
    }

    if (h<=0) {
      killme=true;
    }
    if (alph>0) {
      alph-=20;
    }
  }
  void display() {
    fill(255);
    /*
    if (enType==1) {
     text("r  ", loc.x-30, loc.y+20);
     }
     }
     if (enType==2) {
     text("m  ", loc.x-30, loc.y+20);
     }
     if (enType==3) {
     text("f  ", loc.x-30, loc.y+20);
     }
     if (enType==4) {
     text("l  ", loc.x-30, loc.y+20);
     }
     text(enIndex, loc.x, loc.y+20);
     */

    stroke(255);
    strokeWeight(3);
    pushMatrix();
    translate(loc.x, loc.y);
    scale(.5);
    translate(0, 0);
    if (vel.mag()>0) {
      r=radians(90+degrees(vel.heading2D()));
    }
    rotate(r);
    stroke(0, 255, 0);
    if(en<=1){
          stroke(0, 255, 0,100);
    }
    noFill();
    line(0, -15, -8, 15);
    line(-8, 15, 0, 10);
    line(0, 10, 8, 15);
    line(8, 15, 0, -15);
    popMatrix();

    if (h!=100) {
      rectMode(CORNER);
      noStroke();
      fill(255, 0, 0);
      rect(loc.x-15, loc.y-10, 15, 3);
      fill(0, 255, 0);
      rect(loc.x-15, loc.y-10, map(h, 0, 100, 0, 15), 3);
    }
    
    if(en>0){
      rectMode(CORNER);
      noStroke();
      fill(255, 0, 0);
      rect(loc.x-15, loc.y-7, 15, 3);
      fill(0, 168, 255);
      rect(loc.x-15, loc.y-7, map(en, 0, 100, 0, 15), 3);      
    }
    
    if (inRange) {
      stroke(0, 255, 0, alph);
      strokeWeight(1);
      line(loc.x, loc.y, desired.x, desired.y);
    }
  }
  void shoot() {
    if (enType==1) {
      relay r=(relay) relays.get(enIndex);
      r.en-=damage;
      en-=damage/2;

      if (r.en<0 || r.killme) {
        inRange=false;
        r.killme=true;
        r.killmeIndex=enIndex;
      }
    }
    if (enType==2) {
      miner m=(miner) miners.get(enIndex);
      m.en-=damage;
      en-=damage/2;

      if (m.en<0 || m.killme) {
        inRange=false;
        m.killme=true;
        m.killmeIndex=enIndex;
      }
    }
    if (enType==3) {
      factory m=(factory) factories.get(enIndex);
      m.en-=damage;
      en-=damage/2;

      if (m.en<0 || m.killme) {
        inRange=false;
        m.killme=true;
        m.killmeIndex=enIndex;
      }
    }
    if (enType==4) {
      Laser l=(Laser) lasers.get(enIndex);
      l.en-=damage;
      en-=damage/2;

      if (l.en<0) {
        shot=false;
        inRange=false;
        l.killme=true;
        l.killmeIndex=enIndex;
      }
    }

    alph=255;
  }
}
void userinterface() {
  textFont(PerfectDark);
  pushMatrix();
  translate(vx, 0);
  strokeWeight(1);
  stroke(255);
  fill(0, 100);
  rect(0, height-100, width, 100);

  fill(255);
  textFont(Roboto);
    textSize(40);
  text("$  " + cash, 20, h+40);
  text("$/minute  " + cpm, 20, h+80);

  if (uimode==1) {
    rectMode(CORNERS);
    noStroke();
    fill(0, 168, 255, 200);
    //button highliting below
    if (mouseY>h) {
      if (mouseX<w/3+((w-(w/3))/4) && mouseX>w/3) {
        rect(w/3, h, w/3+((w-(w/3))/4), height);
      }
      if (mouseX>w/3+((w-(w/3))/4) && mouseX<w/3+(((w-(w/3))/4)*2)) {
        rect(w/3+((w-(w/3))/4), h, w/3+(((w-(w/3))/4)*2), height);
      }
      if (mouseX>w/3+(((w-(w/3))/4)*2) && mouseX<w/3+(((w-(w/3))/4)*3)) {
        rect(w/3+(((w-(w/3))/4)*2), h, w/3+(((w-(w/3))/4)*3), height);
      }
      if (mouseX>w/3+(((w-(w/3))/4)*3)) {
        rect(w/3+(((w-(w/3))/4)*3), h, width, height);
      }
    }
    rectMode(CORNER);


    //button lines and numbers below
    textSize(20);
    fill(255);
    stroke(255);
    line(w/3, h+10, w/3, height-10);
    text("$50", w/3+10, h+25);
    line(w/3+((w-(w/3))/4), h+10, w/3+((w-(w/3))/4), height-10);
    text("$100", (w/3+((w-(w/3))/4))+10, h+25);
    line(w/3+(((w-(w/3))/4)*2), h+10, w/3+(((w-(w/3))/4)*2), height-10);
    text("$500", (w/3+(((w-(w/3))/4)*2))+10, h+25);
    line(w/3+(((w-(w/3))/4)*3), h+10, w/3+(((w-(w/3))/4)*3), height-10);
    text("$200", (w/3+(((w-(w/3))/4)*3))+10, h+25);

    //labels
    textAlign(CENTER);
    text("Relay", ((w/3)+w/3+((w-(w/3))/4))/2, height-15);
    text("Miner", (((w/3+(((w-(w/3))/4)*2)))+w/3+((w-(w/3))/4))/2, height-15);
    text("Factory", ((((w-(w/3))/4)*3)  +  ((w/3+(((w-(w/3))/4)*4))+10))/2, height-15);
    text("Laser", width-((w-(w/3))/8), height-15);
    textAlign(BASELINE);

    //factory picture
    pushMatrix();
    float x=((((w-(w/3))/4)*3)  +  ((w/3+(((w-(w/3))/4)*4))+10))/2;
    float y=height-60;
    int s=40;
    translate(x, y);
    fill(0);
    stroke(200, 0, 255);
    ellipse(0, 0, s, s);
    fill(255, 100, 255, 100);
    ellipse(0, 0, s/2, s/2);
    for (int i=0;i<3;i++) {
      float a = (TWO_PI/3)*i;
      float x1 = 0 + cos(a)*s/4;
      float y1 = 0 + sin(a)*s/4;
      fill(255);
      noStroke();
      fill(253);
      ellipse(x1, y1, s/6, s/6);
      float x2 = 0 + cos(a)*s/1.5;
      float y2 = 0 + sin(a)*s/1.5;
      stroke(255, 0, 255);
      line(0, 0, x2, y2);
    }
    popMatrix();

    //miner picture
    noStroke();
    fill(0, 84, 255);
    ellipse((w/3+((w-(w/3))/4)*1.5), height-60, 20, 20);

    //relay picture
    noStroke();
    fill(255, 84, 0);
    ellipse((w/3+(w/3+((w-(w/3))/4)))/2, height-60, 15, 15);

    //turret picture
    fill(255,0,255);
    ellipse( width-((w-(w/3))/8), height-60, 22, 22);
    

  }
  if (uimode==2) {
    stroke(255);
    line(w/3, h+10, w/3, height-10);

    if (iholder.active) {
      fill(255, 0, 0);
      text("DEMOLISH", (w/2)-150, h+85);

      if (released && mouseX<(w/2) && mouseX>w/2-160 && mouseY>h+50) {
        iholder.kill();
      }

      fill(255);
      pushMatrix();
      translate(-15, -20);

      text("ENERGY", (w/2)-120, h+65);

      strokeWeight(5);
      stroke(153);
      int sx=w-520, ex=w-25;
      line(sx, h+50, ex, h+50);

      int v1=int(map(iholder.en, 0, iholder.capac, sx, ex));

      if (v1<sx) {
        v1=sx;
      }
      if (v1>ex) {
        v1=ex;
      }

      stroke(0, 168, 255);
      line(sx, h+50, v1, h+50);

      strokeWeight(1);
      popMatrix();
    }
    else {
      uimode=1;
    }
  }

  popMatrix();
  textFont(calibri);
}


class Laser {
  //mechanics
  PVector loc;
  int enIndex=-11;
  float en=-50;
  int capac=50;
  int alph=0;
  boolean ghost;
  boolean killme=false;
  int killmeIndex;
  String toSay="";
  int timer=0;

  //properties
  int damage=5;
  float cost=10;
  int rate=25;
  int range=100;
  String type="";
  int targetMode=0;
  /*
  0=weakest
   1=deadliest
   */

  Laser(float x, float y, String ctype) {
    loc=new PVector(x, y);
    type=ctype;
    damage=5;
    cost=10;
    ghost=false;
  }
  Laser(float x, float y, String ctype, String s) {
    loc=new PVector(x, y);
    type=ctype;
    damage=5;
    cost=10;
    ghost=true;
  }

  void update() {    
    timer++;
    if (killme) {
      removeL(killmeIndex);
    }
    if (ghost && mouseY<height-100) {
      loc.x=int(roundd(mouseX+vx));
      loc.y=int(roundd(mouseY));
    }

    if (enIndex!=-11 && ships.size()-1>0) {//if we have an enemy
      Ship s=(Ship) ships.get(enIndex);
      int distance=int(dist(loc.x, loc.y, s.loc.x, s.loc.y));
      if (distance<range) {
        if (timer%rate==0 && !ghost &&en;>=cost) {
          shoot();
        }
      }
      else {
        enIndex=-11;
      }
    }
    else {//if we don't have an enemy
      if (ships.size()-1>0) {//if there are ships
        if (timer ==0) {//only check every 20 frames (reduce sqrt calls)
          enIndex=findShip();
        }
      }
    }
    if (alph>0) {
      alph-=20;
    }
  }
  void display() {
    strokeWeight(1);
    if (en>=0) {
      stroke(255, 153-map(en, 0, capac, 0, 255));
    }else{
      noStroke();
    }
    fill(map(en, 0, capac, 0, 255), 0, map(en, 0, capac, 0, 255), 255);
    if (en<0) {
      fill(153);
    }
    ellipse(loc.x, loc.y, 16, 16);

    if (enIndex!=-11) {
      Ship s=(Ship) ships.get(enIndex);
      stroke(255, 0, 255, alph);
      strokeWeight(2);
      line(loc.x, loc.y, s.loc.x, s.loc.y);
    }
    if (anyghost || iholder.active && iholder.typeindex.x==4) {
      noFill();
      strokeWeight(1);
      stroke(255, 0, 255);
      ellipse(loc.x, loc.y, range*2, range*2);
    }
  }
  int findShip() {
    int weakHealth=10000;
    int weakDir=-11;
    int deadlyDamage=-10;
    int deadlyDir=-11;
    for (int i=ships.size()-1;i>0;i--) {
      Ship s=(Ship) ships.get(i);
      if (s.h>0) {
        if (dist(loc.x, loc.y, s.loc.x, s.loc.y)<range) {
          if (s.h<weakHealth) {
            weakHealth=s.h;
            weakDir=i;
          }
          if (s.damage>deadlyDamage) {
            deadlyDamage=s.damage;
            deadlyDir=i;
          }
        }
      }
    }
    if (targetMode==0) {
      return weakDir;
    }
    if (targetMode==1) {
      return deadlyDir;
    }
    return -100;
  }
  void shoot() {
    //ship
    Ship s=(Ship) ships.get(enIndex);
    s.h-=damage;
    s.shotType=4;
    s.shotLoc=loc;
    s.shot=true;

    //laser
    en-=cost;
    alph=255;
    if (s.h<=0) {
      enIndex=-11;
    }
  }
}

void menu() {
  background(0);
  textFont(PerfectDark);
  textSize(100);
  textAlign(CENTER);
  text("scrolling", width/2, 100);
  text("scrolling", width/2, 100);
  text("scrolling", width/2, 100);
  text("scrolling", width/2, 100);
  text("scrolling",width/2,100);
  textFont(Roboto);
  text("Play",width/2,250);
  text("About",width/2,325);
  
  if(mousePressed){
    if(mouseY>300){
      gamemode=2;
    }else if(mouseY>200){
      gamemode=1;
      textAlign(BASELINE);
    }
  }
}

void aboutmenu(){
  background(0);
  fill(255);
  textAlign(CENTER);
  translate(0,-75);
  text("Programmed and designed by DLILLARD.", width/2,250);
  text("Perfect Dark font by Brian Kent.", width/2,325);
  text("Roboto font by Google.", width/2, 400);
  text("Press any key for Back", width/2,475);
  if(keyPressed){
    gamemode=0;
  }
}
