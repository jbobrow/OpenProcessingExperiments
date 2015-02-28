
int amount = 5;

Punt[] puntje = new Punt[amount];

color[] goodcolor = {#000000, #FA9F29, #15CAB1, #2F3030, #0A633D, #FA9F29, #FA9F29, #FA9F29 };

void setup() {
  size(250,250,P2D);
  background(255);
  //smooth();
  noStroke();
  for (int i = 0; i < amount; i++) {
  puntje[i] = new Punt(random(width),random(height));
  }
}

void draw() {
  for (int i = 0; i < amount; i++) {
  puntje[i].move();
  }
}

class Punt {
 float x, y;
 float lastx,lasty;
 float speed;
 float theta;
 float speedD;
 float thetaD;
 float thetaDD;
 int c;

Punt(float X,float Y) {
 x = X;
 y = Y;
 c =  goodcolor[int(random(goodcolor.length))];
  x += random(-50,50);
  y += random(-50,50);
  speed = random(2,32);
  speedD = random(0.0001,0.0005);
  theta = random(0,2*PI);
  thetaD = 0;
  thetaDD = random(-0.1,0.1);
}
  
  void move() {
   stroke(c,42);
   point(x,y); 
   lastx = x;
   lasty = y;
   x += speed*sin(theta);
   y += speed*cos(theta);
  // theta += thetaD;
  // thetaD += thetaDD;
   theta += dist(x,y,width/2,height/2)/(random((width/2)-10,(width/2)+10));
 speed -= speedD;
  //line(lastx,lasty,x,y);
   for(int j = 0; j<amount; j++) {
     if (dist(x,y,puntje[j].x,puntje[j].y) < 25 ) {
       speedD = (speedD+puntje[j].speedD)/2;
     }
   }
   
  }
  
}

void mouseClicked() {
 setup(); 
}
