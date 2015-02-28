
int numFrames = 64*8;

void setup() {
  size(400, 400, P3D);
  colorMode(HSB, 255);
  smooth(8);
  frameRate(60);
  background(51);

  w = 80;
  gridSize = 4;
  cColours = new float[4][2];
}

void draw() {
  sample();
}

int i, j, move, nField, gridSize;
float w, a, a2, dw, dh, colour, cColours[][], moveFrame, animFrame;

void sample() {  
  background(51);
  moveFrame = (frameCount%(numFrames/8))+1;
  dw = moveFrame/(numFrames/8)*w;
  a = moveFrame/(numFrames/8)*PI/2;
  animFrame = (frameCount%(numFrames)+1);
  a2 = animFrame/(numFrames)*TWO_PI;
  colour = map(sin(a2), -1, 1, 255*0.0, 255*0.54);
  dh = w/2 * (sin(a)+cos(a));

  rotateX(radians(-35));
  pushMatrix();
  translate(width/2, height/2, 0);
  rotateY(a2);
  stroke(127);
  fill(colour, 232, 231);
  switch(move%4) {
  case 0:  
    pushMatrix();
    translate(-w/2, -(dh-w/2), w/2-dw);
    rotateX(a);
    box(w);
    fill(0);
    sphere(10);
    popMatrix();
    nField = 1; 
    break;
  case 1:
    pushMatrix();
    translate(-w/2+dw, -(dh-w/2), w/2-w);
    rotateZ(a);
    box(w);
    fill(0);
    sphere(10);
    popMatrix();
    nField = 2; 
    break;
  case 2:
    pushMatrix();
    translate(w/2, -(dh-w/2), -w/2+dw);
    rotateX(-a);
    box(w);
    fill(0);
    sphere(10);
    popMatrix();
    nField = 3; 
    break;
  case 3:
    pushMatrix();
    translate(w/2-dw, -(dh-w/2), w/2);
    rotateZ(-a);
    box(w);
    fill(0);
    sphere(10);
    popMatrix();
    nField = 0; 
    break;
  }  
  if (a>=PI/2) {
    move++;
    cColours[nField][0] = colour;
    cColours[nField][1] = 255;
  }
  for (i=-gridSize/2; i<gridSize/2; i++) {
    for (j=-gridSize/2; j<gridSize/2; j++) {


      fill(204);
      if ((i == -1) && (j == 0))
        fill(cColours[0][0], 255, cColours[0][1]);
      if ((i == -1) && (j == -1))
        fill(cColours[1][0], 255, cColours[1][1]);
      if ((i == 0) && (j == -1))
        fill(cColours[2][0], 255, cColours[2][1]);
      if ((i == 0) && (j == 0))
        fill(cColours[3][0], 255, cColours[3][1]);

      pushMatrix();
      translate(0, w/2, 0);
      rotateX(PI/2);
      rect(i*w, j*w, w, w);
      popMatrix();
    }
  }

  for (i=0; i<4; i++){
    if (cColours[i][1]>5) cColours[i][1] -= 204/(numFrames/2);
  }
  popMatrix();

  lights();

  perspective();
}

