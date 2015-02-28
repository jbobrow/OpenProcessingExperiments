
//dancing shapes.

int numParticles = 25;
float damp = .9;
Particle[] myParticle = new Particle[numParticles];
void setup() {
 size(500, 500);
 background(255);
 fill(0);
 stroke(0, 50);
 for(int i = 0; i < numParticles; i++){
   myParticle[i] = new Particle(random(width), random(height), random(-1, 1), random(-1, 1), i);
 }
}
void draw(){
 fill(255, 50);
 rect(-1, -1, 501, 501);
//  background(255);
 fill(0);
 for(int i = 0; i < numParticles; i++){
   myParticle[i].move();
 }
}
class Particle {
 float x;
 float y;
 float velx;
 float vely;
 float accx;
 float accy;
 int[] distances;
 int myNum;
 int nearest;
 float nearestDist;
 int nearest2;
 float nearestDist2;
Particle(float x_, float y_, float velx_, float vely_, int myNum_){
   x = x_;
   y = y_;
   myNum = myNum_;
   velx = velx_;
   vely = vely_;
 }
 void move(){
   if(myNum != 0){
     nearestDist = dist(myParticle[0].x, myParticle[0].y, myParticle[myNum].x, myParticle[myNum].y);
   }
   if(myNum == 0){
     nearestDist = dist(myParticle[1].x, myParticle[1].y, myParticle[myNum].x, myParticle[myNum].y);
   }
   for(int i = 0; i < numParticles; i++){
     if(i != myNum){
       if(dist(myParticle[i].x, myParticle[i].y, myParticle[myNum].x, myParticle[myNum].y) < nearestDist){
         nearest = i;
         nearestDist = dist(myParticle[i].x, myParticle[i].y, myParticle[myNum].x, myParticle[myNum].y);
       }
     }
   }
   if(nearest != 0 && myNum != 0){
     nearestDist2 = dist(myParticle[0].x, myParticle[0].y, myParticle[myNum].x, myParticle[myNum].y);
   } else if(nearest != 1 && myNum != 1){
     nearestDist2 = dist(myParticle[1].x, myParticle[1].y, myParticle[myNum].x, myParticle[myNum].y);
   } else if(nearest != 2 && myNum != 2){
     nearestDist2 = dist(myParticle[2].x, myParticle[2].y, myParticle[myNum].x, myParticle[myNum].y);
   }
   for(int i = 0; i < numParticles; i++){
     if(i != myNum && i != nearest){
       if(dist(myParticle[i].x, myParticle[i].y, myParticle[myNum].x, myParticle[myNum].y) < nearestDist2){
         nearest2 = i;
         nearestDist2 = dist(myParticle[i].x, myParticle[i].y, myParticle[myNum].x, myParticle[myNum].y);
       }
     }
   }
   accx = (myParticle[myNum].x - myParticle[nearest].x)/dist(myParticle[myNum].x, myParticle[myNum].y, myParticle[nearest].x, myParticle[nearest].y) - 1*(myParticle[myNum].x - myParticle[nearest2].x)/dist(myParticle[myNum].x, myParticle[myNum].y, myParticle[nearest2].x, myParticle[nearest2].y);
   accy = (myParticle[myNum].y - myParticle[nearest].y)/dist(myParticle[myNum].x, myParticle[myNum].y, myParticle[nearest].x, myParticle[nearest].y) - 1*(myParticle[myNum].y - myParticle[nearest2].y)/dist(myParticle[myNum].x, myParticle[myNum].y, myParticle[nearest2].x, myParticle[nearest2].y);
   velx += accx;
   vely += accy;
   velx *= damp;
   vely *= damp;
   if(x > 500){
     x = 499;
     velx *= -1;
   
   }
   if(y < 0){
     y = 1;
     vely *= -1;
   
   }
   if(y > 500){
     y = 499;
     vely *= -1;
   
   }
   if(x < 0){
     x = 1;
     velx *= -1;
   
   }
   x += velx;
   y += vely;
   stroke(0, 255-nearestDist*2.7);
   line(x, y, myParticle[nearest].x, myParticle[nearest].y);
   stroke(0, 255-nearestDist2*2.7);
   line(x, y, myParticle[nearest2].x, myParticle[nearest2].y);
//    ellipse(round(x), round(y), 6, 6);
 }
}

