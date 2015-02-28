
PVector mouse;
PVector des;
PVector desAI;
PVector bulletDes;
float speed = 2;
float AIspeed = 2;
float D;
int a=255;
int ff = 0;
int n;
int m;
int k;
int j;
PFont font; 
Killer killer;
eKiller ekiller;
Bullet[] bullet = new Bullet[10000];
Bullet[] ebullet = new Bullet[10000];


void setup() {
  size(600, 600, P2D);
  background(255);
  frameRate(60);
  smooth();

  killer = new Killer();
  ekiller = new eKiller(killer.loc);
  des=new PVector(width/2, height/2);
  desAI = new PVector(random(width), random(height));
  bulletDes = new PVector(width/2, height/2);


}

void draw() {
  //  background(255);
  noStroke();
  fill(255, a);
  rect(0, 0, width, height);
  mouse = new PVector(mouseX, mouseY);

  if (frameCount0 ==0) {
    AIspeed++;
  }
  if (frameCount` ==0) {
    ebullet[m] = new Bullet(ekiller.loc, killer.loc);
    m++;
  }
  ekiller.move();
  ekiller.face();
  ekiller.drawthis();
  killer.move();
  killer.face();
  killer.drawthis();


  for (int i=0;i<n;i++) {

    bullet[i].move();  
    bullet[i].drawthis();
    if (PVector.dist(bullet[i].loc, ekiller.loc)<=10) j=1;
  }
  for (int i=0;i<m;i++) {

    ebullet[i].move();  
    ebullet[i].drawthis();
    if (PVector.dist(ebullet[i].loc, killer.loc)<=10) k=1;
  }  
  
  println(AIspeed);
}

void mousePressed() {

  if (mouseButton == RIGHT) {
    des.set(mouseX, mouseY);
    desAI.set(random(width), random(height));
  }
  if (mouseButton == LEFT) {
    bulletDes.set(mouseX, mouseY);
    bullet[n] = new Bullet(killer.loc, bulletDes);
    desAI.set(random(width), random(height));
    n++;
  }
}

void keyPressed() {
  if (key =='q' || key=='Q') {
    killer.v.set(killer.f);
    speed = 10;
    a = 100;
  }
  if (key =='r' || key=='R') {
    k=0;
    j=0;
  }
} 
void keyReleased() {
  if (key =='q' || key=='Q') {
    speed = 2;
    a=255;
  }
} 
class Bullet {
  PVector loc;
  PVector Kloc;
  PVector Tloc;
  PVector killloc;
  PVector v;


  Bullet(PVector loc_, PVector Tloc_) {
    loc = new PVector(loc_.x, loc_.y);
    Kloc= new PVector(loc_.x, loc_.y);
    Tloc = new PVector(Tloc_.x, Tloc_.y);
    v = new PVector(0, 0);
  }

  void move() {
    v = PVector.sub(Tloc, Kloc);
    v.normalize();
    v.setMag(10);
    loc.add(v);
  }

  void drawthis() {
    pushMatrix();
    fill(255, 0, 0);
    ellipse(loc.x, loc.y, 5, 5);
    popMatrix();
  }

}
class eKiller {
  PVector loc;
  PVector v;
  PVector a;
  PVector f;
  PVector killerloc;

  eKiller(PVector killerloc_) {
    loc = new PVector(width/2, height-20);
    v = new PVector(width/2, height/2);
    f = new PVector(mouseX, mouseY);
    killerloc = killerloc_;
  }

  void move() {
    
    if (PVector.dist(desAI, loc)<=2) v.setMag(0);
    else {
      v = PVector.sub(desAI, loc);
      v.setMag(AIspeed);
    }
    loc.add(v);
  }

  void face() {
    f = PVector.sub(killerloc, loc);
    f.setMag(15);
  }


  void drawthis() {

    noFill();
    if (j == 1) {
      stroke(255, 0, 0);
    }
    else {
      stroke(0);
    }
    ellipse(loc.x, loc.y, 20, 20);
    pushMatrix();
    translate(loc.x, loc.y);
    line(0, 0, f.x, f.y);
    popMatrix();
  }
}
class Killer {
  PVector loc;
  PVector v;
  PVector a;
  PVector f;


  Killer() {
    loc = new PVector(width/2, height/2);
    v = new PVector(width/2, height/2);
    f = new PVector(mouseX, mouseY);
    
  }

  void move() {
    if (PVector.dist(des, loc)<=2) v.setMag(0);
    else {
      v = PVector.sub(des, loc);
      v.setMag(speed);
    }
    loc.add(v);
  }

  void face() {
    f = PVector.sub(mouse, loc);
    f.setMag(15);
  }


  void drawthis() {

    noFill();
     if(k == 1){
    stroke(255,0,0);
    
    }
    else{
    stroke(0);}
    ellipse(loc.x, loc.y, 20, 20);
    pushMatrix();
    translate(loc.x, loc.y);
    line(0, 0, f.x, f.y);
    popMatrix();
  }
}
