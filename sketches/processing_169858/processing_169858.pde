
int animationState = 0;

int STOPPED = 0;
int PLAY_FORWARD = 1;
int PLAY_BACKWARD = 2;
float thisY;
float progress = 0;
float[][] them = {
  {
    350, 250
  }
  , {
    400, 200
  }
  , {
    300, 130
  }
  , {
    200, 220
  }
  , {
    400, 370
  }
  , {
    300, 470
  }
  , {
    200, 400
  }
  , {
    250, 350
  }
};

void setup() {
  size(600, 700);
}


void draw() {
  background(0);
  noFill();
  strokeWeight(45);
  translate(0,50);
  stroke(255, 255, 55, 110);
  
  beginShape();
    for (int i=0; i<them.length; i++) {

      float thisX = them[i][0] + (width/2-them[i][0]) * progress-80;
      float thisY = them[i][1] + (i*70-them[i][1]) * progress-80;
      curveVertex(thisX, thisY);
    }
  endShape();
  
  stroke(55, 255, 255, 80);
  
  beginShape();
    for (int i=0; i<them.length; i++) {

      float thisX = them[i][0] + (width/2-them[i][0]) * progress-60;
      float thisY = them[i][1] + (i*70-them[i][1]) * progress-60;
      curveVertex(thisX, thisY);
    }
  endShape();
  
    stroke(255, 55, 255, 100);
  
  beginShape();
    for (int i=0; i<them.length; i++) {

      float thisX = them[i][0] + (width/2-them[i][0]) * progress-40;
      thisY = them[i][1] + (i*70-them[i][1]) * progress-40;
      curveVertex(thisX, thisY);
    }
  endShape();
  
  stroke(128, 255, 0, 100);
  
  beginShape();
    for (int i=0; i<them.length; i++) {

      float thisX = them[i][0] + (width/2-them[i][0]) * progress+20;
      float thisY = them[i][1] + (i*70-them[i][1]) * progress+20;
      curveVertex(thisX, thisY);
    }
  endShape();
  
  stroke(200,100,20,120);
  
  beginShape();
    for (int i=0; i<them.length; i++) {

      float thisX = them[i][0] + (width/2-them[i][0]) * progress-20;
      float thisY = them[i][1] + (i*70-them[i][1]) * progress-20;
      curveVertex(thisX, thisY);
    }
  endShape();
  
  stroke(25, 128, 200, 124);
  
  beginShape();
    for (int i=0; i<them.length; i++) {

      float thisX = them[i][0] + (width/2-them[i][0]) * progress;
      float thisY = them[i][1] + (i*70-them[i][1]) * progress;
      curveVertex(thisX, thisY);
    }
  endShape();
  
  stroke(255, 55, 255, 120);
  
  beginShape();
    for (int i=0; i<them.length; i++) {

      float thisX = them[i][0] + (width/2-them[i][0]) * progress+40;
      float thisY = them[i][1] + (i*70-them[i][1]) * progress+40;
      curveVertex(thisX, thisY);
    }
  endShape();

stroke(55, 255, 255, 120);
  
  beginShape();
    for (int i=0; i<them.length; i++) {

      float thisX = them[i][0] + (width/2-them[i][0]) * progress+60;
      float thisY = them[i][1] + (i*70-them[i][1]) * progress+60;
      curveVertex(thisX, thisY);
    }
  endShape();

stroke(255, 255, 55, 160);
  
  beginShape();
    for (int i=0; i<them.length; i++) {

      float thisX = them[i][0] + (width/2-them[i][0]) * progress+80;
      float thisY = them[i][1] + (i*70-them[i][1]) * progress+80;
      curveVertex(thisX, thisY);
    }
  endShape();
  

  if (animationState == PLAY_FORWARD) {
    progress += 0.01;
    progress = min(1, progress);
  }else if(animationState == PLAY_BACKWARD){

    progress -= 0.01;
    progress = max(0, progress);
  }
//  text("click",50,50);
}

void mousePressed() {

  if (animationState==STOPPED) {
    animationState = PLAY_FORWARD;
  }else if (animationState==PLAY_FORWARD) {
    animationState = PLAY_BACKWARD;
  }else if(animationState==PLAY_BACKWARD){
     animationState = PLAY_FORWARD;
  }
//  saveFrame();
}


