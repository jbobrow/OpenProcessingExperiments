
int counter;int amount =12;
int sl = 50;
boolean graph = true;

Punt[] puntje = new Punt[amount];

color[] goodcolor = {#000000, #FA9F29, #15CAB1, #2F3030, #0A633D, #FA9F29, #FA9F29, #FA9F29 };

void setup() {
  size(450,450,P2D);
  background(255);
  frameRate(15);
  smooth();
  noStroke();
  for (int i = 0; i < amount; i++) {
  puntje[i] = new Punt(random(width),random(height),i);
  }
}

void draw() {
  
  for (int i = 0; i < amount; i++) {
  puntje[i].move();
  }
  
  if (graph == true) {
 connections();
  }
  
  else {
  background(255);
 for (int i = 0; i < amount; i++) {
  puntje[i].render();
  }
  }
  

}

class Punt {
 float x, y;
 float lastx,lasty;
 float speedx;
 float speedy;
 color c;
 int id;
 float ddx,ddy;

Punt(float X,float Y, int ID) {
 x = X;
 y = Y;
 id = ID;
 c =  goodcolor[int(random(goodcolor.length))];
  speedx = random(-3,3);
  speedy = random(-3,3);
  
}


  // Move Sequence
  
  
  void move() {
   lastx = x;
   lasty = y;
   x += speedx;
   y += speedy;
   
 
 speedx += random(-0.1,0.1);
 speedy += random(-0.1,0.1);
 
 // Finding friends and moving towards them

if (id % 2 == 0) {ddx = puntje[id+1].x - x; ddy = puntje[id+1].y - y;}
else {ddx = puntje[id-1].x - x; ddy = puntje[id-1].y - y;}
if (ddx > 0) {speedx += 0.2;} else {speedx -= 0.2;}
if (ddy > 0) {speedy += 0.2;} else {speedy -= 0.2;}
 
//          Moving towards the centre.
  
  float dx = abs(width/2 - x);
  if ((width/2)-x >0 ) {
   speedx += dx/width/2; 
  }
  else {
   speedx -= dx/width/2; 
  }  
  
  float dy = abs(height/2 - y);
  if ((height/2)-y >0 ) {
   speedy += dy/height/2; 
  }
  else {
   speedy -= dy/height/2; 
  }

  
// Staying in the screen
  

   if (x<-10 || x>width+10 || y<-10 || y>height+10) {
    x = random(0,width);
    y = random(0,height);
 c =  goodcolor[int(random(goodcolor.length))];    
  speedx = random(-3,3);
  speedy = random(-3,3);
   }
   
  }
  
  void render() {
   fill(c,255);
   rectMode(CENTER);
   rect(x,y,5,5);
   stroke(c);
  line(x,y,x+ddx,y+ddy);
 
  }
}

// Change screen

void mouseClicked() {
if (graph == true) graph = false; 
else { graph = true; background(255);}
}

// graphics!

void connections() {
  for (int j=0;j<amount;j++) {
   float d = dist(puntje[j].x,puntje[j].y,puntje[j].ddx,puntje[j].ddy);
   for (int k=0;k<d;k++) {
     stroke(puntje[j].c,255/(d/2));
    point(puntje[j].x+((k/d)*(puntje[j].ddx)),puntje[j].y+((k/d)*(puntje[j].ddy))); 
   }
  }
}

