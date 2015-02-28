
/*
*  Corona, code by kof 12
*/


ArrayList dirs;
PGraphics maska;

void setup() {

  size(600, 300, P2D);


  noiseSeed(19);
  loadPixels();


  stroke(255, 40);

  maska = createGraphics(width, height, P2D);


  // noiseDetail(20);

  dirs = new ArrayList();
  for (int i = 0 ; i < pixels.length;i+=10) {
    dirs.add(new PVector(i%width, i/width, 5));
  }

  background(0);
}


void draw() {
  //background(0);

  fill(0, 150);
  rect(0, 0, width, height);

  for (int i = 0 ; i < dirs.size();i++) {
    PVector tmp = (PVector)dirs.get(i);
    pushMatrix();
    translate(tmp.x, tmp.y);
    rotate(tmp.z);
    tmp.z += 0.1*(noise((i%width)/((sin(frameCount/200.3)+1.1)*200.0), (i/width)/((cos(frameCount/300.3)+1.1)*200.0), frameCount/300.0)*TWO_PI*10-tmp.z);
    // tmp.z = (atan2(mouseY-i%width,mouseX-i/width));
    stroke(lerpColor(#ffccaa, #000000, noise(i/30.0, frameCount/20.0)), 10);
    line(0, 0, noise(i/30.0, frameCount/20.0, tmp.z)*100.0, 0);
    popMatrix();
  }

  int sx = (int)((noise(0, frameCount/4.1)-0.5)*8.0);
  int sy = (int)((noise(frameCount/4.1, 0)-0.5)*8.0);


  maska.beginDraw();
  maska.fill(0, tan(noise(frameCount/4.0)*TWO_PI+1.0)*127);
  maska.rect(0, 0, width, height);
  maska.fill(#ffccaa, 100);
  maska.noStroke();
  for (int i = 0 ; i < 10 ; i++) {

    float w = noise((frameCount+i)/30.0)*400;
    maska.ellipse(random(noise(i+frameCount/30.0), 0)*width, 
    noise(0, i+frameCount/30.0)*height, w, w);
  }
  fastblur(maska, 30);
  maska.endDraw();

  blend(g, 0, 0, width, height, sx, sy, width+sx, height+sy, ADD);
  //blend(maska,0,0,width,height,-sx,-sy,width-sx,height-sy,ADD);
  blend(maska, 0, 0, width, height, -sx, -sy, width-sx, height-sy, OVERLAY);

  pushStyle();
  noFill();
  stroke(0);
  strokeWeight(30);
  rect(0, 0, width, height);
  popStyle();


  smooth();
  fill(0);
  noStroke();
  ellipse(width/2+(noise(frameCount/30.0, 0)-0.5)*5, height/2+(noise(0, frameCount/30.0)-0.5)*5, 200, 200);
  noSmooth();
}


