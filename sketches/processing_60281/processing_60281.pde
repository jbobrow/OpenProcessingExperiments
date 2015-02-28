
float x,y,vx,vy,xx,yy,ax,vxx,vyy,x1,y1,xx1,yy1,r1,r2,r3,mass,rad,targetx,targety,targetxx,targetyy;
float xbound,ybound,xbound1,ybound1,xxbound,yybound,xxbound1,yybound1,lift;
float q4,w4,e4,r4,t4,y4,u4,i4,o4,p4,a4,s4,d4,f4,g4,h4,z;
float s1,s2;
int numShapes = 20;
int numShapes2 = 10;
int numCoins = 10;
int gameStart,gameTime,gg,gb;
int state;
float xbh,ybh,grow,speedh,angleh;
float coins = 30;
float angle;
float ptran,pptran,psize,ppsize,tsize1,zsize1;
float rotation = 30;
float speed, speed2, angle2;
float easing = 0.02;
float friction = 0.9;
float gravity = 0.4;
int zpoints, tpoints,ztemp,ttemp,gsize,gsize1;
int back,pr,pg,pb,pr1,pg1,pb1,zp,tp,lastCoin,pcount;
PFont futura;
PImage Zuma;
PImage Tesla;
PImage setting;
PImage setting2;
PImage setting3;
PImage setting4;
PImage setting5;
PImage setting6;
PImage setting7;
PImage setting8;
PImage setting9;
PImage setting10;
PImage setting11;
PImage setting12;
PImage setting13;
PImage setting14;
PImage setting15;
PImage setting16;
PImage setting17;
PImage setting18;
PImage setting19;
PImage setting20;
PImage setting21;
PImage setting22;
PImage setting23;
PImage setting24;
PImage setting25;
PImage setting26;
PImage setting27;
PImage setting28;
PImage setting29;
PImage setting30;
Human player = new Human();
Human2 player2 = new Human2();
Polygon[] polygon =  new Polygon[numShapes];
Polygon2[] polygon2 =  new Polygon2[numShapes2];
Coin[] coin =  new Coin[numCoins];
ParticleSystem ps;
ParticleSystem2 ps2;
boolean[] keys = new boolean[8];
boolean hasChanged;
boolean mc;
final int w = 0;
final int a = 1;
final int s = 2;
final int d = 3;
final int i = 4;
final int j = 5;
final int k = 6;
final int l = 7;
ArrayList psystems;

void setup() {
  size(850,550);
  smooth();
  colorMode(RGB, 255, 255, 255, 100);
  futura = createFont("Futura", 35);
  ps = new ParticleSystem(1, new PVector(width/2,height/2,0));
  ps2 = new ParticleSystem2(1, new PVector(width/2,height/2,0));
  psystems = new ArrayList();
  mc = false;
  zp = 0;
  tp = 0;
  q4 = 300;
  w4 = 300;
  e4 = 800;
  r4 = 600;
  t4 = 1000;
  y4 = 200;
  u4 = 200;
  i4 = 700;
  o4 = 600;
  p4 = 100;
  a4 = 700;
  s4 = 250;
  d4 = 150;
  f4 = 150;
  g4 = 1100;
  h4 = 500;
  
  
  
  Zuma = loadImage("Zuma.png");
  Tesla = loadImage("Tesla.png");
  
  
  //backgrounds off Google Images
  setting2 = loadImage("setting2.jpeg");
  setting = loadImage("setting.jpeg");
  setting3 = loadImage("setting3.jpeg");
  setting4 = loadImage("setting4.jpeg");
  setting5 = loadImage("setting5.jpeg");
  setting6 = loadImage("setting6.jpeg");
  setting7 = loadImage("setting7.jpeg");
  setting8 = loadImage("setting8.jpeg");
  setting9 = loadImage("setting9.jpeg");
  setting10 = loadImage("setting10.jpeg");
  setting11 = loadImage("setting11.jpeg");
  setting12 = loadImage("setting12.jpeg");
  setting13 = loadImage("setting13.jpeg");
  setting14 = loadImage("setting14.jpeg");
  setting15 = loadImage("setting15.jpeg");
  setting16 = loadImage("setting16.jpeg");
  setting17 = loadImage("setting17.jpeg");
  setting18 = loadImage("setting18.jpeg");
  setting19 = loadImage("setting19.jpeg");
  setting20 = loadImage("setting20.jpeg");
  setting21 = loadImage("setting21.jpeg");
  setting22 = loadImage("setting22.jpeg");
  setting23 = loadImage("setting23.jpeg");
  setting24 = loadImage("setting24.jpeg");
  setting25 = loadImage("setting25.jpeg");
  setting26 = loadImage("setting26.jpeg");
  setting27 = loadImage("setting27.jpeg");
  setting28 = loadImage("setting28.jpeg");
  setting29 = loadImage("setting29.jpeg");
  setting30 = loadImage("setting30.jpeg");
  
  
   for(int i = 0; i < numShapes2; i++){
    polygon2[i] = new Polygon2();
    }
  for(int i = 0; i < numShapes; i++){
    polygon[i] = new Polygon();
    }
  for(int i = 0; i < numCoins; i++){
    coin[i] = new Coin();
    }
  for (int i = 0; i< 8; i++) {
   keys[i] = false;
  }
}


void restart() {
  gameStart = millis();
  pcount = 0;
  state = 1;
  back = int(random(1,30));
  zpoints = 0;
  speedh = 3;
  xbh = 1400;
  ybh = random(50,850);
  state = 0;
  tpoints = 0;
  ztemp = 0;
  hasChanged = false;
  ttemp = 0;
  ptran = 0;
  pptran = 0;
  psize = 20;
  ppsize = 20;
  zsize1 = 37;
  tsize1 = 37;
  gsize = 40;
  gsize1 = 42;
  lift = 5;
  x = 300;
  y = 300;
  s1 = 0;
  s2 = 0;
  vx = 5;
  vy = 5;
  ax = .3;
  z = 255;
  xx = 700;
  yy = 300;
  vxx = 5;
  vyy = 5;
  rad = 30;
  pr = 254;
  pg = 255;
  pb = 185;
  pr1 = 254;
  pg1 = 255;
  pb1 = 185;
  gg = 200;
  gb = 200;
}


void draw() {
  
  if (state == 0) {
  gameTime = millis();
  menu();
  }
  if (state == 1) {
    
  gameTime = (60000 - millis() + gameStart)/1000;
  pcount++;
  xbound = x;
  ybound = y + 5;
  xxbound = xx;
  yybound = yy + 5;
  xbound1 = x + 50;
  ybound1 = y + 100;
  xxbound1 = xx + 50;
  yybound1 = yy + 100;
  
  if (dist(xbound,ybound,xbound1,ybound1) > 50) {
    xbound1 = 118;
    ybound1 = 190;
  }
  if (dist(xxbound,yybound,xxbound1,yybound1) > 50) {
    xxbound1 = 118;
    yybound1 = 190;
  }
  
  rect(xbound,ybound,xbound1,ybound1);
  rect(xxbound,yybound,xxbound1,yybound1);
 
    
  if (back == 1) {
  image(setting,s1,s2);
  }
  if (back == 2) {
  image(setting2,s1,s2);
  }
  if (back == 3) {
  image(setting3,s1,s2);
  }
  if (back == 4) {
  image(setting4,s1,s2);
  }
  if (back == 5) {
  image(setting5,s1,s2);
  }
  if (back == 6) {
  image(setting6,s1,s2);
  }
  if (back == 7) {
  image(setting7,s1,s2);
  }
  if (back == 8) {
  image(setting8,s1,s2);
  }
  if (back == 9) {
  image(setting9,s1,s2);
  }
  if (back == 10) {
  image(setting10,s1,s2);
  }
  if (back == 11) {
  image(setting11,s1,s2);
  }
  if (back == 12) {
  image(setting12,s1,s2);
  }
  if (back == 13) {
  image(setting13,s1,s2);
  }
  if (back == 14) {
  image(setting14,s1,s2);
  }
  if (back == 15) {
  image(setting15,s1,s2);
  }
  if (back == 16) {
  image(setting16,s1,s2);
  }
  if (back == 17) {
  image(setting17,s1,s2);
  }
   if (back == 18) {
  image(setting18,s1,s2);
  }
  if (back == 19) {
  image(setting19,s1,s2);
  }
  if (back == 20) {
  image(setting20,s1,s2);
  }
  if (back == 21) {
  image(setting21,s1,s2);
  }
  if (back == 22) {
  image(setting22,s1,s2);
  }
  if (back == 23) {
  image(setting23,s1,s2);
  }
  if (back == 24) {
  image(setting24,s1,s2);
  }
  if (back == 25) {
  image(setting25,s1,s2);
  }
  if (back == 26) {
  image(setting26,s1,s2);
  }
  if (back == 27) {
  image(setting27,s1,s2);
  }
   if (back == 28) {
  image(setting28,s1,s2);
  }
  if (back == 29) {
  image(setting29,s1,s2);
  }
  if (back == 30) {
  image(setting30,s1,s2);
  }
  
  for(int i = 0; i < numShapes2; i++){
  polygon2[i].spawn();
  polygon2[i].rush();
  }
  
  controller();
  player.display();
  player.go();
  ps.run();
  ps.addParticle(x + 60,y + 235);
  player2.display();
  player2.go();
  ps2.run();
  ps2.addParticle2(xx + 60,yy + 235);
  for(int i = 0; i < numCoins; i++){
  coin[i].spawn();
  coin[i].rush();
  }
  for(int i = 0; i < numShapes; i++){
  polygon[i].spawn();
  polygon[i].rush();
  }
  bound();
  
  for (int i = psystems.size()-1; i >= 0; i--) {
    ParticleSystem1 psys = (ParticleSystem1) psystems.get(i);
    psys.run();
    if (psys.dead()) {
      psystems.remove(i);
    }
  }
  playPoints();
  }

if (state == 2) {
  winner();
}
  
  
  if (pcount == 2800) {
        if (zpoints > tpoints) {
        zp = zp + 1;
      }
      
      if (tpoints > zpoints) {
        tp = tp + 1;
      }
      }
      
  
 
  
}



void keyPressed() {
 if(key == 'a') {
   keys[a] = true;
 } else if(key == 'w') {
   keys[w] = true;
 } else if(key == 's') {
   keys[s] = true;
 } else if (key == 'd') {
   keys[d] = true;
 }
 
 if(key == CODED) {
 if(keyCode == LEFT) {
   keys[j] = true;
 } else if(keyCode == UP) {
   keys[i] = true;
 } else if(keyCode == DOWN) {
   keys[k] = true;
 } else if (keyCode == RIGHT) {
   keys[l] = true;
 }
 }
}

void keyReleased() {
  
 if(key == 'a') {
   keys[a] = false;
 } else if(key == 'w') {
   keys[w] = false;
 } else if(key == 's') {
   keys[s] = false;
 } else if (key == 'd') {
   keys[d] = false;
 }
 
 if (key == CODED) {
 if(keyCode == LEFT) {
   keys[j] = false;
 } else if(keyCode == UP) {
   keys[i] = false;
 } else if(keyCode== DOWN) {
   keys[k] = false;
 } else if (keyCode == RIGHT) {
   keys[l] = false;
 }
 }
 
}


void controller() {

  
    if(keys[a] == true) {
      vx -= ax;
      vx -= .6;
   }
   if(keys[w] == true) {
     vy -= ax;
     vy -= 2.0;
   }
   if(keys[s] == true) {
     vy += ax;
     vy += 1.5;
   }
   if(keys[d] == true) {
     vx += ax;
     vx += .6;
    }
   
    if(keys[j] == true) {
      vxx -= ax;
      vxx -= .6;
     }
    if(keys[i] == true) {
      vyy -= ax;
      vyy -= 2.0;
     }
    if(keys[k] == true) {
      vyy += ax;
      vyy += 1.5;
     }
    if(keys[l] == true) {
      vxx += ax;        
      vxx += .6;
    }
}

void mouseClicked() {
  
  if (state == 0) {
  restart();
  state = 1;
  }
  
  if (state == 2) {
    restart();
    state = 1;
  }
}

void menu() {
  
  float vq4,vw4,ve4,vr4,vt4,vy4,vu4,vi4,vo4,vp4,va4,vs4,vd4,vf4,vg4,vh4;
  
  vq4 = .03;
  vw4 = .05;
  ve4 = .08;
  vr4 = .2;
  vt4 = .06;
  vy4 = .09;
  vu4 = .07;
  vi4 = .2;
  vo4 = .04;
  vp4 = .1;
  va4 = .03;
  vs4 = .07;
  vd4 = .2;
  vf4 = .08;
  vg4 = .06;
  vh4 = .06;
  
  q4 -= vq4;
  w4 -= vw4;
  e4 += ve4;
  r4 += vr4;
  q4 -= vq4;
  t4 += vt4;
  y4 += vy4;
  u4 += vu4;
  i4 -= vi4;
  o4 += vo4;
  p4 += vp4;
  a4 -= va4;
  s4 += vs4;
  d4 += vd4;
  f4 += vf4;
  g4 += vg4;
  h4 -= vh4;
  
  fill(0);
  rect(0,0,width,height);
  fill(255);
  textFont(futura, 100);
  text("ZUMA", width/2 - 140, height/2 - 30);
  textFont(futura, 25);
  text("Journey Through Space & Time", width/2 - 165, height/2 + 20);
  
  if (millis() > 7000) {
    textFont(futura, 25);
    text("c", width/2 - 109 + 35, height/2 + 80);
  }
  
  if (millis() > 7070) {
    textFont(futura, 25);
    text("l", width/2 - 98 + 35, height/2 + 80);
  }
  
  if (millis() > 7140) {
    textFont(futura, 25);
    text("i", width/2 - 94 + 35, height/2 + 80);
  }
  
  if (millis() > 7210) {
    textFont(futura, 25);
    text("c", width/2 - 89 + 35, height/2 + 80);
  }
  
   if (millis() > 7280) {
    textFont(futura, 25);
    text("k", width/2 - 79 + 35, height/2 + 80);
  }
  
  if (millis() > 7350) {
    textFont(futura, 25);
    text("t", width/2 - 60 + 35, height/2 + 80);
  }
  
  if (millis() > 7420) {
    textFont(futura, 25);
    text("o", width/2 - 54 + 35, height/2 + 80);
  }
  
  if (millis() > 7490) {
    textFont(futura, 25);
    text("b", width/2 - 32 + 35, height/2 + 80);
  }
  
  if (millis() > 7560) {
    textFont(futura, 25);
    text("e", width/2 - 19 + 35, height/2 + 80);
  }
  
  if (millis() > 7630) {
    textFont(futura, 25);
    text("g", width/2 - 7 + 35, height/2 + 80);
  }
  
   if (millis() > 7630) {
    textFont(futura, 25);
    text("i", width/2 + 5 + 35, height/2 + 80);
  }
  
    if (millis() > 7700) {
    textFont(futura, 25);
    text("n", width/2 + 10 + 35, height/2 + 80);
  }
  
  ellipse(q4,w4,10,10);
  ellipse(e4,r4,5,5);
  ellipse(t4,y4,5,5);
  ellipse(u4,i4,8,8);
  ellipse(o4,p4,3,3);
  ellipse(a4,s4,2,2);
  ellipse(d4,f4,2,2);
  ellipse(g4,h4,2,2);
  
  
  if (mc != false) {
    state = 1;
    }
}

void playPoints() {
      textAlign(CENTER);
      if (gameTime < 10) {
        gsize = 50;
        gsize1 = 52;
        gg = 0;
        gb = 50;
        }
        
      fill(120,gg - 120,gb - 120);
      textFont(futura, gsize1);
      text(gameTime, width/2 - 20, 71);
      noFill();
      textFont(futura, gsize);
      fill(200,gg,gb);
      text(gameTime, width/2 - 20, 70);
  
  
      fill(8,48,155);
      textFont(futura, zsize1);
      text(zpoints,149, 50);
      noFill();
      fill(23,164,255);
      textFont(futura);
      text(zpoints, 150,50);
      
      fill(100,3,3);
      textFont(futura, tsize1);
      text(tpoints,659, 50);
      noFill();
      fill(255,28,3);
      textFont(futura);
      text(tpoints, 660,50);
      noFill();
      
      textAlign(CENTER);
      textFont(futura, psize);
      fill(pr,pg,pb,ptran);
      text(ztemp, x + 40,y - lift);
      
      textFont(futura, ppsize);
      fill(pr1,pg1,pb1,pptran);
      text(ttemp, xx + 40,yy - lift);
      
       if (ptran < 10) {
      ptran = 0;
      psize = 20;
      zpoints += ztemp;
      ztemp = 0;
      }
      
    
    if (psize > 30) {
      psize = 30;
      }
      
      if (pptran < 10) {
      pptran = 0;
      ppsize = 20;
      tpoints += ttemp;
      ttemp = 0;
    }
    
    if (ppsize > 30) {
      ppsize = 30;
      }
      
      if (psize < 20) {
      psize = 20;
      }
      
      if (ppsize < 20) {
      ppsize = 20;
      }
      noFill();
      noStroke();    
 
      
      if (gameTime < 0) {
        state = 2;
        hasChanged = false;
      }
      if (gameTime < 26) {
        blackHole();
      }
    }
    
  void blackHole() {
  noStroke();
  xbh -= speedh;
  angleh += speedh;
  grow = cos(radians(angleh)) * 100 + 80;
  ybh = sin(radians(angleh)) * 300 + height/2;
  fill(0);
  ellipse(xbh,ybh,grow,grow);
   boolean hit = rectCircleIntersect(xbound, ybound, xbound1, ybound1, xbh, ybh, grow/2);
   boolean thit = rectCircleIntersect(xxbound, yybound, xxbound1, yybound1, xbh, ybh, grow/2);
   if (hit && !hasChanged) {
     hasChanged = true;
     back = int(random(1,30));
    }
    
    if (thit && !hasChanged) {
     hasChanged = true;
     back = int(random(1,30));
    }
}

    
void winner() {
  background(0);
       fill(23,164,255);
       textFont(futura);
       text(zpoints, 150,50);
       fill(255,28,3);
       textFont(futura);
       text(tpoints, 1050,50);
       
        if (zpoints > tpoints) {
          image(Zuma,width/2 - 158, height/2 - 230);
          fill(23,164,255);
          textFont(futura, 35);
          text(zp, 540, 80);
          textFont(futura, 50);
          text("ZUMA WINS", width/2 - 15, 150);
          fill(255,28,3);
          textFont(futura, 35);
          text(tp, 615, 80);
          noFill();
      }
      
      if (tpoints > zpoints) {
          image(Tesla,width/2 - 158, height/2 - 230);
          fill(255,28,3);
          textFont(futura, 35);
          text(tp, 615, 80);
          textFont(futura, 50);
          text("TESLA WINS", width/2 - 15, 150);
          fill(23,164,255);
          textFont(futura, 35);
          text(zp, 540, 80);
          noFill();
        }
  
}

class Human {
  
  Human() {
    
  }
  
  void display() {
    image(Zuma, x, y, Zuma.width/2.3, Zuma.height/2.3);
  }
  
  void go() {
    angle = atan2(vy,vx);
    speed = sqrt(vx*vx + vy*vy);
 
    vx = cos(angle) * speed;
    vy = sin(angle) * speed; 
 
   if (speed > friction) {
      speed -= friction;
    }
   else {
      speed = 0;
    }
     x += vx;
     y += vy;
     vy += gravity;
     
      targetx = x1;
  float dx = targetx - x;
  if(abs(dx) > 1) {
    x += dx * easing;
  }
  
  targety = y1;
  float dy = targety - y;
  if(abs(dy) > 1) {
    y += dy * easing;
  }
  }
}

class Human2 {
  
  Human2() {
    
  }
  
  void display() {
    image(Tesla, xx, yy, Tesla.width/2.3, Tesla.height/2.3);
  }
  
  void go() {
    angle2 = atan2(vyy,vxx);
    speed2 = sqrt(vxx*vxx + vyy*vyy);
 
    vxx = cos(angle2) * speed2;
    vyy = sin(angle2) * speed2; 
 
   if (speed2 > friction) {
      speed2 -= friction;
    }
   else {
      speed2 = 0;
    }
     xx += vxx;
     yy += vyy;
     vyy += gravity;
     
  targetxx = xx1;
  float dx = targetxx - xx;
  if(abs(dx) > 1) {
    xx += dx * easing;
  }
  
  targetyy = yy1;
  float dy = targetyy - yy;
  if(abs(dy) > 1) {
    yy += dy * easing;
  }
  }
}


class Coin {
    float xpos, ypos, xspeed, boundary, tr;

    Coin(){
    xpos = width + 400;
    ypos = random(90, height/2 + 200);
    xspeed = random(-5, -1);
    tr = 255;
    }

  void spawn(){
    noFill();
    noStroke();
    stroke(color(random(240,255),random(200,240),random(0,50), tr));
    strokeWeight(5);
    ellipse (xpos,ypos,coins,coins);
    noStroke();
    
    if (rectCircleIntersect(xbound, ybound, xbound1, ybound1, xpos, ypos, coins/2)) {
         psystems.add(new ParticleSystem1(int(random(5,25)),new PVector(xpos,ypos)));
         ztemp = ztemp + 5;
         ptran = 255;
         psize += .08;
    }
    
    else {
      ptran -= .5;
    }
    
    
    
    if (rectCircleIntersect(xxbound, yybound, xxbound1, yybound1, xpos, ypos, coins/2) == true) {
         psystems.add(new ParticleSystem1(int(random(5,25)),new PVector(xpos,ypos)));
         ttemp = ttemp + 5;
         pptran = 255;
         ppsize += .08;
    }
    
     else {
      pptran -= .5;
    }
    
    
    if (xpos < -200) {
      xpos = width + 200;
    }
    
    if (xpos > width + 100) {
      ypos = random(90, height/2 + 200);
    }
  }

    void rush(){
    xpos += xspeed;
    
    if (gameTime < 1) {
      ypos += gravity * 25;
    }
    }
}


class Polygon {
    float xp, yp, xp1,yp1, xspeed;

    Polygon(){
    xp1 = random(30,80);
    yp1 = xp1;
    xp = width + 400;
    yp = random(90, height/2 + 200);
    xspeed = random(-5, -1);
    }

  void spawn(){
    noStroke();
    fill(random(0,5),random(0,55),random(100,255));
    rect (xp,yp,xp1,xp1);
    if (xp < -200) {
      xp = width + 200;
    }
    
    if (xp > width + 100) {
      yp = random(90, height/2 + 200);
    }
  }
  void rush(){
    xp += xspeed;
    if (rectRectIntersect(xbound, ybound, xbound+xbound1, ybound+ybound1,xp, yp, xp+xp1, yp+yp1)) {
      pg = 0;
      pb = 0;
      z = 0;
      if (ptran > 11) {
        ztemp = ztemp - 2;
        psize += -.08;
      }
    }
    
    else {
      pg = 255;
      pb = 185;
      z = 255;
    }
    
    if (rectRectIntersect(xxbound, yybound, xxbound+xxbound1, yybound+yybound1,xp, yp, xp+xp1, yp+yp1)) {
       pg1 = 0;
       pb1 = 0;
      if(pptran > 11) {
      ttemp = ttemp - 2;
      ppsize += -.08;
      }
    }
    
    else {
      pg1 = 255;
      pb1 = 185;
    }
    
    if (ttemp < 0) {
      ttemp = 0;
    }
    if (ztemp < 0) {
      ztemp = 0;
    }
    
    if (gameTime < 1) {
      yp += gravity * 25;
    }
  }
}



class Polygon2 {
    float xp, yp, xp1,yp1, xspeed;

    Polygon2(){
    xp1 = random(10,40);
    yp1 = xp1;
    xp = width + 400;
    yp = random(90, height/2 + 200);
    xspeed = random(-5, -1);
    }

  void spawn(){
    noStroke();
    fill(random(0,5),random(0,55),random(100,255));
    rect (xp,yp,xp1,xp1);
    if (xp < -200) {
      xp = width + 200;
    }
    
    if (xp > width + 100) {
      yp = random(90, height/2 + 200);
    }
  }
  void rush(){
    xp += xspeed; 
    
     if (gameTime < 1) {
      yp -= gravity * 25;
    }
  }
}


void bound() {
  if (y > height) {
    y = -200;
    vy += -5;
  }
  
  if (x  + rad/2 > width) {
    x = width - rad/2;
    vx += -5;
  }
   if (y < -220) {
    y = height;
    vy += 5;
  }
  
  if (x < 0) {
    x = 0;
    vx += 5;
  }
  
  if (yy > height) {
    yy = -200;
    vyy += -5;
  }
  
  if (xx  + rad/2 > width) {
    xx = width - rad/2;
    vxx += -5;
  }
   if (yy < -220) {
    yy = height;
    vyy += 5;
  }
  
  if (xx < 0) {
    xx = 0;
    vxx += 5;
  }
}


//rectangle collision code from openprocessing
boolean rectCircleIntersect(float rx, float ry, float rw, float rh, float cx, float cy, float cr) {
 
  float circleDistanceX = abs(cx - rx - rw/2);
  float circleDistanceY = abs(cy - ry - rh/2);
 
  if (circleDistanceX > (rw/2 + cr)) { return false; }
  if (circleDistanceY > (rh/2 + cr)) { return false; }
  if (circleDistanceX <= rw/2) { return true; }
  if (circleDistanceY <= rh/2) { return true; }
 
  float cornerDistance = pow(circleDistanceX - rw/2, 2) + pow(circleDistanceY - rh/2, 2);
  return cornerDistance <= pow(cr, 2);
}

boolean rectRectIntersect(float left, float top, float right, float bottom,
                          float otherLeft, float otherTop, float otherRight, float otherBottom) {
  return !(left > otherRight || right < otherLeft || top > otherBottom || bottom < otherTop);
}



//particle systems are pulled from Processing example
//Multiple Particle Systems
//by Daniel Shiffman
class ParticleSystem {

  ArrayList particles;
  PVector origin;
  ParticleSystem(int num, PVector v) {
    particles = new ArrayList();
    origin = v.get();
    for (int i = 0; i < num; i++) {
      particles.add(new Particle(origin));
    }
    for (int i = 0; i < num; i++) {
      particles.add(new Particle(origin));
    }
  }

  void run() {
    for (int i = particles.size()-1; i >= 0; i--) {
      Particle p = (Particle) particles.get(i);
      p.run();
      if (p.dead()) {
        particles.remove(i);
      }
    }
  }

  void addParticle() {
    particles.add(new Particle(origin));
  }
  
    void addParticle(float x, float y) {
    particles.add(new Particle(new PVector(x,y)));
  }

  void addParticle(Particle p) {
    particles.add(p);
  }
  
  
   void addParticle2() {
    particles.add(new Particle(origin));
  }
  
    void addParticle2(float x, float y) {
    particles.add(new Particle(new PVector(x,y)));
  }

  void addParticle2(Particle p) {
    particles.add(p);
  }

  boolean dead() {
    if (particles.isEmpty()) {
      return true;
    } else {
      return false;
    }
  }

}


class Particle {
  PVector loc;
  PVector vel;
  PVector acc;
  float r;
  float timer;
  
  Particle(PVector l) {
    acc = new PVector(0,0.05,0);
    vel = new PVector(random(-1,1),random(-2,0),0);
    loc = l.get();
    r = 5.0;
    timer = 150.0;
  }

  void run() {
    update();
    render();
  }

  void update() {
    vel.add(acc);
    loc.add(vel);
    timer -= 1.0;
  }

  void render() {
    ellipseMode(CENTER);
    fill(23,164,255,timer);
    ellipse(loc.x,loc.y,r,r);
  }
  
  boolean dead() {
    if (timer <= 0.0) {
      return true;
    } else {
      return false;
    }
  }
}

class ParticleSystem2 {

  ArrayList particles2;
  PVector origin2;

  ParticleSystem2(int num, PVector v) {
    particles2 = new ArrayList();
    origin2 = v.get();
    for (int i = 0; i < num; i++) {
      particles2.add(new Particle2(origin2));
    }
  }

  void run() {
    for (int i = particles2.size()-1; i >= 0; i--) {
      Particle2 p2 = (Particle2) particles2.get(i);
      p2.run();
      if (p2.dead()) {
        particles2.remove(i);
      }
    }
  }

  void addParticle2() {
    particles2.add(new Particle2(origin2));
  }
  
    void addParticle2(float x, float y) {
    particles2.add(new Particle2(new PVector(x,y)));
  }

  void addParticle2(Particle2 p2) {
    particles2.add(p2);
  }

  boolean dead() {
    if (particles2.isEmpty()) {
      return true;
    } else {
      return false;
    }
  }

}

class Particle2 {
  PVector loc;
  PVector vel;
  PVector acc;
  float r;
  float timer;
  
  Particle2(PVector l) {
    acc = new PVector(0,0.05,0);
    vel = new PVector(random(-1,1),random(-2,0),0);
    loc = l.get();
    r = 5.0;
    timer = 100.0;
  }

  void run() {
    update();
    render();
  }

  void update() {
    vel.add(acc);
    loc.add(vel);
    timer -= 1.0;
  }

  void render() {
    ellipseMode(CENTER);
    fill(255,28,3,timer);
    ellipse(loc.x,loc.y,r,r);
  }
  
  boolean dead() {
    if (timer <= 0.0) {
      return true;
    } else {
      return false;
    }
  }
}



class Particle3 {
  PVector loc;
  PVector vel;
  PVector acc;
  float r;
  float timer;

  Particle3(PVector a, PVector v, PVector l, float r_) {
    acc = a.get();
    vel = v.get();
    loc = l.get();
    r = r_;
    timer = 100.0;
  }
  
 Particle3(PVector l) {
    acc = new PVector(0,0.05,0);
    vel = new PVector(random(-1,1),random(-2,0),0);
    loc = l.get();
    r = 20.0;
    timer = 100.0;
  }


  void run() {
    update();
    render();
  }
 
  void update() {
    vel.add(acc);
    loc.add(vel);
    timer -= 1.0;
  }
    void render() {
    ellipseMode(CENTER);
    noFill();
    strokeWeight(2);
    stroke(color(254,255,185,timer));
    ellipse(loc.x,loc.y,r,r);
  }
   boolean dead() {
    if (timer <= 0.0) {
      return true;
    } else {
      return false;
    }
  }
}

class ParticleSystem1 {

  ArrayList particles;
  PVector origin;

  ParticleSystem1(int num, PVector v) {
    num = 1;
    particles = new ArrayList();
    origin = v.get();
    for (int i = 0; i < num; i++) {
        particles.add(new Particle3(origin)); 
      }
    }

  void run() {
     
      for (int i = particles.size()-1; i >= 0; i--) {
      Particle3 p = (Particle3) particles.get(i);
      p.run();
      if (p.dead()) {
        particles.remove(i);
      }
    }
  }

  void addParticle3() {
    particles.add(new Particle3(origin));
  }
 void addParticle3(Particle3 p) {
    particles.add(p);
  }
  boolean dead() {
    if (particles.isEmpty()) {
      return true;
    } 
    else {
      return false;
    }
  }

}



