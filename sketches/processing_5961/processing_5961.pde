

 
ArrayList bolas; 
 
void setup() { 
  size(600,600); 
  bolas = new ArrayList(); 
  bolas.add(new Ball(width/3,height/2,random(-3,3),random(-3,5))); 
  smooth(); 
  background(255); 
} 
 
void draw() { 
  background(1250); 
  for (int i = bolas.size()-1; i >= 0; i--) {  
    Ball bola = (Ball) bolas.get(i); 
    bola.drawBall(); 
    bola.moveBall(); 
    if (bola.finished()) { 
      bolas.remove(i); 
    } 
  } 
  println(bolas.size()); 
} 
 
void mousePressed() { 
  bolas.add(new Ball(width/1,height/5,random(-6,6),random(-3,3))); 
} 
 
class Ball { 
  float pox; 
  float poy; 
  float speedx; 
  float speedy; 
  int life = 2000; 
  int lifeinit = life; 
 
  Ball(float tempX,float tempY,float tempSpeedX,float tempSpeedY) { 
    pox = tempX; 
    poy = tempY; 
    speedx = tempSpeedX; 
    speedy = tempSpeedY; 
  } 
 
  void drawBall() { 
    ellipseMode(CENTER); 
    fill(map(life,0,lifeinit,0,255),map(life,0,lifeinit,0,255));; 
    noStroke(); 
    strokeWeight(1); 
    for(int i = bolas.size()-1; i >= 0; i --){ 
      ellipse(pox,poy,40,40); 
    } 
  } 
 
  void moveBall() { 
    pox = constrain(pox, 0, width); 
    pox = pox + speedx; 
    if (pox > width || pox < 0) { 
      speedx = speedx * -1; 
    } 
    poy = constrain(poy, 0, height); 
    poy = poy + speedy; 
    if (poy > height || poy < 0) { 
      speedy = speedy * -1; 
      speedx = speedx * 1; 
    } 
     
 
  } 
 
  Boolean finished() { 
    life --; 
    if (life <= 0) { 
      return true; 
    } 
    else { 
      return false; 
    } 
  } 
} 

