
import processing.opengl.*;
import peasy.*;
PeasyCam cam;

boolean outLook = false;

Player player;
int worldSize = 500;
float maxSpeed = 30;

ArrayList enemies;
ArrayList bullets;

int lastDrawMillis;
int fps = 0;
int dt;

void setup() {
  size(600, 600, P3D);
  //  lights();

    directionalLight(51, 102, 126, -1, 0, 0);
  player = new Player();

  enemies = new ArrayList();
  for (int li=0; li<150; li++) {
    float px = random(20*worldSize)-10
    *worldSize;
    float py = random(20*worldSize)-10*worldSize;
    float pz = random(20*worldSize)-10*worldSize;
    enemies.add(new Enemy(px, py, pz, 40));
  }
  
  bullets = new ArrayList();
  
}

void draw() {
  dt = millis()-lastDrawMillis;
  lastDrawMillis=millis();
  fps = 1000/dt;
  println(fps+" "+dt);
  lights();
  ambientLight(50,50,50);
  background(0);
  PVector forw = new PVector(0, 0, 0);
  player.v.normalize(forw);
  camera(player.pos.x, player.pos.y, player.pos.z, forw.x+player.pos.x, forw.y+player.pos.y, forw.z+player.pos.z, player.top.x, player.top.y, player.top.z);
  if(outLook) {
    camera(-7000,-5000,-5000,0,1000,0,0,1,0);
    scale(0.8);
  }
  noFill();
  stroke(10, 10, 10);
  box(5000);
  for (int li=0; li<enemies.size(); li++) {
    Enemy enemy = (Enemy) enemies.get(li);
    enemy.update();
    enemy.show();
  }
  
  for (int li=bullets.size()-1; li>=0; li--) {
    Bullet bullet = (Bullet) bullets.get(li);
    bullet.update();
    bullet.show();
    if(bullet.isDied) {
      bullets.remove(li);
    }
  }

  player.update();
  if(outLook) {
    player.show();
  }
  cocpitDraw();
}

PVector rot(PVector query, PVector u, float a) {
  PVector response = new PVector(0, 0, 0);

  //wooooooho! We play with a rotation matrix!
  //http://en.wikipedia.org/wiki/Rotation_matrix#Rotation_matrix_from_axis_and_angle
  //now take a deep breath and pray for that thing to be working!

  //            .--------------X----------------------.  .---------------Y---------------------.   .---------------Z----------------------.
  response.x = (cos(a)+pow(u.x, 2)*(1-cos(a)))*query.x + (u.x*u.y*(1-cos(a))-u.z*sin(a))*query.y + (u.x*u.z*(1-cos(a))+u.y*sin(a))*query.z;
  response.y = (u.y*u.x*(1-cos(a))+u.z*sin(a))*query.x + (cos(a)+pow(u.y, 2)*(1-cos(a)))*query.y + (u.y*u.z*(1-cos(a))-u.x*sin(a))*query.z;
  response.z = (u.z*u.x*(1-cos(a))-u.y*sin(a))*query.x + (u.z*u.y*(1-cos(a))+u.x*sin(a))*query.y + (cos(a)+pow(u.z, 2)*(1-cos(a)))*query.z;

  //whooooho! It worked!

  return(response);
}

void keyPressed() {
  PVector i = new PVector(0, 0, 0);
  PVector dv = new PVector(0, 0, 0);
  PVector maxV = new PVector(maxSpeed,0,0);
  switch(keyCode) {
    case(LEFT):
      player.volantLeft=true;
    break;
    case(RIGHT):
      player.volantRight=true;
    break;
    case(UP):
      player.volantUp=true;
    break;
    case(DOWN):
      player.volantDown=true;
    break;
    case(RETURN):
    case(ENTER):
      outLook=!outLook;
    break;
  }

  switch(key) {    
    case('w'):
    case('W'):
    player.volantSpeedUp = true;
    break;

    case('s'):
    case('S'):
    player.volantSpeedDown = true;
    break;
    case(' '):
    player.isShooting=true;
    break;
  }
}

void keyReleased() {
  switch(key) {
    case(' '):
      player.isShooting=false;
    break;
    case('s'):
    case('S'):
    player.volantSpeedDown = false;
    break;
    case('w'):
    case('W'):
    player.volantSpeedUp = false;
    break;
  }
  switch(keyCode) {    
    case(LEFT):
      player.volantLeft=false;
    break;
    case(RIGHT):
      player.volantRight=false;
    break;
    case(UP):
      player.volantUp=false;
    break;
    case(DOWN):
      player.volantDown=false;
    break;
  }
}

class Bullet {
  PVector pos;
  PVector v;
  float s;
  final int lifeTime;
  int startMillis;
  boolean isDied;
  float parent;
  
  Bullet(PVector posT, PVector vT, float parentT, float sT) {
    pos = new PVector(posT.x, posT.y, posT.z);
    v =   new PVector(vT.x, vT.y, vT.z);
    s   = sT;
    lifeTime = 2000;
    startMillis = millis();
    isDied = false;
    parent = parentT;
  }
  
  void show() {
    int[] c = {255,200,0};
    if(parent==0) {
      c[0]=0;
      c[1]=255;
      c[2]=0;
    }
    fill(c[0],c[1],c[2]);
    noStroke();
    sphereDetail(5);
    pushMatrix();
    translate(pos.x, pos.y, pos.z);
    sphere(s);
    popMatrix();
    //println("v:"+v+" t:"+top+" n:"+n);
  }
  void update() {
//    PVector dv = new PVector( random(10)-5,random(10)-5,random(10)-5);
    pos.add(v);
    isDied = millis()-startMillis>lifeTime? true : false;
    
    //enemy killer!
    for (int li=enemies.size()-1; li>=0; li--) {
      Enemy enemy = (Enemy) enemies.get(li);
      float distance=dist(pos.x,pos.y,enemy.pos.x,enemy.pos.y);
      if(distance<enemy.s/2 && parent==0 && !isDied) {
        enemies.remove(li);
        player.score+=50;
        isDied = true;
      }
    }
    
    float distance=dist(pos.x,pos.y,player.pos.x,player.pos.y);
    if(distance<20 && parent!=0) {
        player.health-=10;
        player.hit = true;
        isDied = true;
        println(player.health);
    }
  }
}
class Enemy {
  PVector pos;
  PVector v;
  float s;
  final int shootDelay;
  int lastShootMillis;
  final float shootProb;
  final float id;
  float agility;

  Enemy(float xT, float yT, float zT, float sT) {
    pos = new PVector(xT, yT, zT);
    v = new PVector(random(1)-0.5,random(1)-0.5,random(1)-0.5);
    v.normalize();
    v.mult(maxSpeed/5);
    id = random(1);
    s   = sT;
    shootDelay = 200;
    shootProb = 0.01;
    lastShootMillis = int(random(shootDelay));
    agility = random(0.0025)+0.0005;
  }

  void show() {
    fill(255);
    noStroke();
    sphereDetail(1);
    pushMatrix();
    translate(pos.x, pos.y, pos.z);
    sphere(s);
    popMatrix();
    //println("v:"+v+" t:"+top+" n:"+n);
  }
  void update() {
    //v = new PVector( random(10)-5,random(10)-5,random(10)-5);
    PVector dv = new PVector(player.pos.x-pos.x,
                             player.pos.y-pos.y, 
                             player.pos.z-pos.z);
    dv.normalize();
    dv.mult(maxSpeed*agility);
    v.add(dv);
    v.normalize();
    v.mult(maxSpeed/5);
    pos.add(v);

    if (millis()-lastShootMillis>shootDelay && random(1)<shootProb) {
      PVector nv = new PVector(v.x, v.y, v.z);
      nv.normalize();
      nv.mult(1.1*maxSpeed);
      PVector npos= new PVector(pos.x, pos.y, pos.z);
      npos.add(nv);
      bullets.add(new Bullet(npos, nv, id, 10));
      lastShootMillis = millis();
    }
  }
}

class Player {
  PVector pos;
  PVector v;
  PVector top;
  PVector n;
  
  boolean volantDown;
  boolean volantUp;
  boolean volantLeft;
  boolean volantRight;
  boolean volantSpeedUp;
  boolean volantSpeedDown;
  boolean isShooting;
  boolean hit;
  
  final int shootDelay;
  final float id;
  int lastShootMillis;
  int health;
  int score;

  Player() {
    pos = new PVector(0,0, 10*worldSize);
    v =   new PVector(0, 0, -5);
    top = new PVector(0, -1, 0);
    n   = new PVector(0,0,0);
    id = 0;
    hit = false;
    isShooting = false;
    volantDown = false;
    volantUp = false;
    volantLeft = false;
    volantRight = false;
    volantSpeedUp = false;
    volantSpeedDown = false;
    lastShootMillis = 0;
    shootDelay      = 100;
    health = 1000;
    score = 0;
  }

  void show() { //TODO: delete this stuff!
    fill(255);
    noFill();
    stroke(100);
    sphereDetail(10);
    pushMatrix();
    translate(pos.x, pos.y, pos.z);
    sphere(20);
    
    //top vector
    stroke(255, 0, 0);
    line(0, 0, 0, 25*top.x, 25*top.y, 25*top.z);
    
    //v vector
    stroke(0, 255, 0);
    line(0, 0, 0, 50*v.x, 50*v.y, 50*v.z);
    
    //side vector (normal to top and v)
    stroke(0, 0, 255);
    line(0, 0, 0, 250*n.x, 250*n.y, 250*n.z);
    stroke(100, 100, 255);
    line(0, 0, 0, -250*n.x, -250*n.y, -250*n.z);
    
    popMatrix();
  }

  void update() {
    PVector i = new PVector(0, 0, 0);
    PVector dv = new PVector(0, 0, 0);
    PVector maxV = new PVector(maxSpeed,0,0);
    
    if(volantLeft) {
      player.v.normalize(i);
      player.top=rot(player.top, i, 0.03);
//      player.zA += 0.1;
    }
    
    if(volantRight) {
      player.v.normalize(i);
      i.mult(-1);
      player.top=rot(player.top, i, 0.03);
    }
    
    if(volantUp) {
      player.v=rot(player.v, player.n, -0.02);
      player.top=rot(player.top, player.n, -0.02);
    }
    
    if(volantDown) {
      player.v=rot(player.v, player.n, +0.02);
      player.top=rot(player.top, player.n, +0.02);
    }
    
    if(volantSpeedUp) {
      player.v.normalize(dv);
      dv.mult(0.3);
      if(player.v.mag()<maxV.mag()) {
        player.v.add(dv);
      }
    }
    
    if(volantSpeedDown) {
      player.v.normalize(dv);
      dv.mult(0.3);
      if (dv.mag()<player.v.mag()) {
        player.v.sub(dv);
      }
    }
    
    pos.add(v);
    v.normalize(i);
    n=rot(v, top, PI/2);
    n.normalize();
    
    //shooting
    
    if(isShooting && millis()-lastShootMillis > shootDelay) {
      PVector nv = new PVector(v.x, v.y, v.z);
      nv.normalize();
      nv.mult(1.1*maxSpeed);
      bullets.add(new Bullet(pos, nv, 0, 3));
      lastShootMillis = millis();
    }
    for (int li=enemies.size()-1; li>=0; li--) {
      Enemy enemy = (Enemy) enemies.get(li);
      float distance=dist(pos.x,pos.y,enemy.pos.x,enemy.pos.y);
      if(distance<(enemy.s/2+20)) {
        enemies.remove(li);
        health-=20;
        hit = true;
      }
    }
  }
}
void cocpitDraw() {
  int c;
  camera();
  //pointer
  if(!outLook) {
    pushMatrix();
    rectMode(CENTER);
    fill(0,255,0,20);
    stroke(100, 200, 100);
    strokeWeight(2);
    translate(width/2, height/2);
    rect(0, 0, 20, 20);
    line(-20, 0, -5, 0);
    line(5, 0, 20, 0);
    line(0, -20, 0, -5);
    line(0, 5, 0, 20);
    popMatrix();
  }
  
  if(player.hit) {
    pushMatrix();
    rectMode(CENTER);
    fill(255,0,0,100);
    noStroke();
    translate(width/2, height/2);
    rect(0, 0, width, height);
    popMatrix();
    player.hit = false;
  }

  //panel down
  translate(0,height-80);
  rectMode(CORNER);
  fill(20);
  stroke(200);
  rect(0,0,width,80);
  float v = player.v.mag();
  
  pushMatrix();
  translate(70,60);
  meter(v,maxSpeed);
  popMatrix();
  
  pushMatrix();
  translate(170,30);
  c = player.isShooting ? 255 : 0;
  fill(c,255-c,0);
  ellipse(0,0,10,10);

  c = player.volantLeft ? 255 : 0;
  fill(c,255-c,0);
  triangle(-20,0,-10,-10,-10,10);

  c = player.volantDown ? 255 : 0;
  fill(c,255-c,0);
  triangle(-10,-10, 0, -20, 10,-10);

  c = player.volantRight ? 255 : 0;
  fill(c,255-c,0);
  triangle(20,0,10,-10,10,10);

  c = player.volantUp ? 255 : 0;
  fill(c,255-c,0);
  triangle(-10,10, 0, 20, 10,10);
  popMatrix();
  
  pushMatrix();
  translate(width-100,0);
  textSize(20);
  fill(0,255,0);
  text("E: "+enemies.size(),0,20);
//  rect(10,10,10,10);
  popMatrix();
  
  pushMatrix();
  translate(width-100,0);
  textSize(20);
  fill(0,255,0);
  text(player.score+"$",0,60);
  popMatrix();
  
  //health
  pushMatrix();
  translate(170,60);
  rectMode(CENTER);
  c = 255*player.health/1000;
  fill(255-c,c,0);
  rect(0,0,player.health/10,10);
  noFill();
  stroke(255-c,c,0);
  rect(0,0,100,10);
  popMatrix();
  
  rectMode(CORNER);
  fill(20);
  noStroke();
  rect(0,70,width,80);
}
void meter(float value, float valueMax) {
  fill(255);
  noStroke();
  ellipse(0,0,80,80);
  fill(250,0,0);
  ellipse(0,0,7,7);
  rotate(PI+PI*value/valueMax);
  rectMode(CENTER);
  rect(20,0,37,3);
}


