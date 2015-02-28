
float currentx;
float currenty;
float damp = .9997;
boolean press = false;
int numParticles = 0;
Particle[] myParticle = new Particle[numParticles];
Line[] myLine = new Line[0];
void setup(){
  background(255);
  fill(255, 0, 0, 255);
  size(500, 500);
}
void draw(){
//  background(255);
fill(255, 50);
rect(-1, -1, 501, 501);
fill(255, 0, 0, 200);

  for(int i = 0; i < myLine.length; i++){
    myLine[i].drawLine();
    for(int j = 0; j < myParticle.length; j++){
    bounce(myLine[i].point1, myLine[i].point2, myParticle[j]);
    }
  }
  noStroke();
  for(int i = 0; i < myParticle.length; i++){
    myParticle[i].move();
    myParticle[i].display();
    myParticle[i].vel.y += .07;
    myParticle[i].vel.mult(damp);
  }
  stroke(0);
  if(press == true){
    line(currentx, currenty, mouseX, mouseY);
  }

}

class Particle{
  PVector pos;
  PVector vel;
  PVector tempvel;
  int myNum;
  float nearestDist;
  int nearest;
  float nearestDist2;
  int nearest2;
  Particle(float posx, float posy, float velx, float vely, int myNum_){
    pos = new PVector(posx, posy);
    vel = new PVector(velx, vely);
    myNum = myNum_;
    tempvel = new PVector(velx, vely);
  }
  void move(){
    pos.add(vel);
  }
  void display(){
    ellipse(pos.x, pos.y, 10, 10);
  }
}
  
float detCol(PVector a, PVector b, PVector c){
  PVector ab, ac;
  ab = new PVector(0, 0);
  ac = new PVector(0, 0);
  ab = PVector.sub(a, b);
  ac = PVector.sub(a, c);
  float distance = sqrt(sq(ac.mag())-sq(ac.dot(ab)/ab.mag()));
return distance;
}

PVector calcCol(PVector a, PVector b, PVector c){
  PVector ba, ac, col;
  ba = new PVector(0, 0);
  ac = new PVector(0, 0);
  col = new PVector(0, 0);
  ba = PVector.sub(b, a);
  ac = PVector.sub(a, c);
  float beta = (ac.dot(PVector.sub(a, b))/ba.mag());
  ba.normalize();
  col = PVector.add(a, (PVector.mult(ba, beta)));
  return col;
}

PVector newVel(PVector norma, PVector velocity, Particle thatParticle){
  float normAngle = atan2(norma.x, norma.y);
  float newAngle = 2*normAngle-PI-atan2(thatParticle.vel.x, thatParticle.vel.y);
  PVector newVel, dir;
  dir = new PVector((float)Math.sin(newAngle), (float)Math.cos(newAngle));
  newVel = new PVector(0, 0);
  newVel = PVector.mult(dir, velocity.mag());
  return newVel;
}

void bounce(PVector c, PVector d, Particle thisParticle) {
  if(abs(dist(c.x, c.y, thisParticle.pos.x, thisParticle.pos.y)+dist(d.x, d.y, thisParticle.pos.x, thisParticle.pos.y)-dist(c.x, c.y, d.x, d.y)) < 1){
    if(detCol(c, d, thisParticle.pos) <= 5){
    thisParticle.vel = newVel(PVector.sub(thisParticle.pos, calcCol(c, d, thisParticle.pos)), thisParticle.vel, thisParticle);
    PVector vela;
    vela = new PVector(0, 0);
    vela.set(thisParticle.vel);
    vela.normalize();
    thisParticle.pos.add(PVector.mult(vela, 5-detCol(c, d, thisParticle.pos)));
  }
}
}
class Line{
  PVector point1, point2;
  Line(float point1x, float point1y, float point2x, float point2y){
    point1 = new PVector(point1x, point1y);
    point2 = new PVector(point2x, point2y);
  }
  void drawLine(){
    stroke(0);
    line(point1.x, point1.y, point2.x, point2.y);
  }
}

void mousePressed(){
      myLine = (Line[]) expand(myLine, myLine.length + 1);
  myLine[myLine.length-1] = new Line(mouseX, mouseY, mouseX, mouseY);
  press = true;
  currentx = mouseX;
  currenty = mouseY;
}
void mouseReleased(){
  myLine[myLine.length-1].point2.x = mouseX;
  myLine[myLine.length-1].point2.y = mouseY;
  press = false;
}

          void keyPressed(){
          if(key == 'n'){
              myParticle = (Particle[]) expand(myParticle, myParticle.length+1);
              myParticle[myParticle.length-1] = new Particle(mouseX, mouseY, 0, 0, myParticle.length-1);
              
            }
            if(key == 'c'){
            myParticle = (Particle[]) expand(myParticle, 0);
            myLine = (Line[]) expand(myLine, 0);
          }
        }

