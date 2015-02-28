
class Anemone {
  int numChasers;
  float spread, ease;
  Chaser[] chaser;

  Anemone(int nC, float sP,float e) {
    numChasers = nC;
    spread = sP;
    ease = e;
    chaser = new Chaser[numChasers];
    for(int i=0;i<numChasers;i++) {
      chaser[i] = new Chaser(random(ease/2)+ease/2);
    }
  }

  void update() {
    for(int i=0;i<numChasers;i++) {
      if(i>0) {
        stroke(10,random(100)+100,200,random(50)+20);
        noFill();
        strokeWeight(1);
        line(chaser[i].posX,chaser[i].posY,chaser[i-1].posX,chaser[i-1].posY);
        stroke(10,random(100)+100,200,random(100));
        line(chaser[i].posX,chaser[i].posY,chaser[i].spineX,chaser[i].spineY);
        if(diceHandler(1,0.05)) {
          float q = 0.2*abs(255-dist(chaser[i].posX,chaser[i].posY,target.oldPosX,target.oldPosY));
          println(q);
          stroke(10,random(100)+100,200,random(q));
          line(chaser[i].posX,chaser[i].posY,target.oldPosX,target.oldPosY);
        }
        if(hitDetect(chaser[i].posX,chaser[i].posY,chaser[i].sizeChaser,chaser[i].sizeChaser,chaser[i-1].posX,chaser[i-1].posY,chaser[i-1].sizeChaser,chaser[i-1].sizeChaser)) {
          chaser[i].posX += random(spread) - random(spread);
          chaser[i].posY += random(spread) - random(spread);
        }
      }
      chaser[i].update();
    }
  }
}


