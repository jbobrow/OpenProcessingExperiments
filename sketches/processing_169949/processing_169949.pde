
int animationState = 0;
int STOPPED = 0;
int PLAY_FORWARD = 1;
int PLAY_BACKWARD = 2;
float progress = 0;
float[][] them = {
  {
    100, 100
  }
  , {
    700, 100
  }
  , {
    100, 500
  }
  , {
    700, 500
  }
};

void setup() {
  size(800, 600);
  smooth(); 

}

void draw() {
  background(202,200,200);
  colorMode(RGB);
  for(int a=0;a<800;a++){
    stroke(a/4-20,200,a/4);
    line(a,0,a,600);}
  noFill();
  strokeWeight(50);
  stroke(242, 204, 47);

  beginShape();
  for (int i=0; i<them.length; i++) {

    float thisX = them[i][0] + (width/2-them[i][0]) * progress;
    float thisY = them[i][1] + (i*200-them[i][1]) * progress;
    vertex(thisX, thisY);
   
  }
  endShape();

  stroke(246, 31, 160);

  for (int i=0; i<them.length; i++) {

    float thisX = them[i][0] + (width/2-them[i][0]) * progress;
    float thisY = them[i][1] + (i*200-them[i][1]) * progress;
    point(thisX, thisY);
  }

  if (animationState == PLAY_FORWARD) {
    progress += 0.01;
    progress = min(1, progress);
  }else if(animationState == PLAY_BACKWARD){
    progress -= 0.01;
    progress = max(0, progress);
  }
}

void mousePressed() {
  
  if (animationState==STOPPED) {
    animationState = PLAY_FORWARD;
  }else if (animationState==PLAY_FORWARD) {
    animationState = PLAY_BACKWARD;
  }else if(animationState==PLAY_BACKWARD){
     animationState = PLAY_FORWARD;
  }
  saveFrame();

}



