
import krister.Ess.*;

int bufferSize;
int steps;
float limitDiff;
int numAverages=256;
float myDamp=.15f;
float maxLimit, minLimit;
float drawMax;
float drawEasing;
FFT myFFT;
AudioInput myInput;
import saito.objloader.*;
OBJModel model;
float xrot;
float rotX;
float rotY;


void setup () {
  size(600, 600, P3D);
  colorMode(HSB);
  background(0);

  Ess.start(this);  

  bufferSize=1024;
  myInput=new AudioInput(bufferSize);

  myFFT=new FFT(bufferSize*2);
  myFFT.equalizer(true);

  minLimit=.005;
  maxLimit=.5;
  myFFT.limits(minLimit, maxLimit);
  myFFT.damp(myDamp);
  myFFT.averages(numAverages);

  steps=bufferSize/numAverages;

  limitDiff=maxLimit-minLimit;


  myInput.start();



  model = new OBJModel(this, "cubic_sphere.obj", "relative", QUADS);

  model.enableDebug();

  model.scale(3); 

  noStroke();
}




void draw() {
  noStroke();
  fill(255, 128);

  for (int i=0; i<bufferSize; i++) {
    rect(10+i, 10, 1, myFFT.spectrum[i]*400);
  }




  float currentMax = 0;
  int currentMaxIndex = 0;

  for (int i=0; i<numAverages; i++) {

    if (myFFT.averages[i] > currentMax) {
      currentMax = myFFT.averages[i];
      currentMaxIndex = i;
    }

    fill(255, 128);
    rect(10+i*steps, 10, steps, myFFT.averages[i]*200);
    fill(255);
    rect(10+i*steps, (int)(10+myFFT.maxAverages[i]*100), steps, 1);
    rect(10+i*steps, 10, 1, 200);
  }
  float xMax = 10+currentMaxIndex*steps;
  if (xMax>211) {
    xMax = 211- xMax/5;
  }  



  ellipse(xMax, 100, 10, 10);
  drawMax += (xMax - drawMax) * .025;
  fill(0);
  ellipse(drawMax, 100, 5, 5);
  fill(drawMax*1.63-10, drawMax*1.63-10, drawMax*1.65*4-10); 
  rect(500, 500, 50, 50);


  float percent=max(0, (myFFT.max-minLimit)/(limitDiff));
  fill(255, 128);
  rect(600, (int)(11+198*percent), 50, 1);
  rect(560, 11, 50, (int)(198*percent));


  background(0, 0, 200);

  lights();
  xrot = xrot+0.004;
  pushMatrix();
  translate(width/2, height/2, 0);
  rotateX(xrot);
  rotateY(xrot);

  for (int j = 0; j < model.getSegmentCount(); j++) {
    Segment segment = model.getSegment(j);
    Face[] faces = segment.getFaces();
    noFill();
    noStroke();
    beginShape(QUADS);

    for (int i = 0; i < faces.length; i ++) {
      PVector[] vs = faces[i].getVertices();
      PVector[] ns = faces[i].getNormals();

      for (int k = 0; k < vs.length; k++) {
        normal(ns[k].x, ns[k].y, ns[k].z);
        vertex(vs[k].x, vs[k].y, vs[k].z);
      }
    }

    endShape();

//    fill(drawMax*1.63-10, drawMax*2-10, drawMax*1.65*4-10); 
       fill(mouseX/2, mouseX*2/3, mouseX/2);
    noStroke();    

    beginShape(QUADS);

    for (int i = 0; i < faces.length; i ++)
    {
      PVector[] v = faces[i].getVertices();
      PVector n = faces[i].getNormal();

//      float nor = abs(sin(radians((frameCount+i))) * (198*percent*4));

      float nor = abs(sin(radians((frameCount+i))) * mouseY);

      for (int k = 0; k < v.length; k++) {

        vertex(v[k].x + (n.x*nor), v[k].y + (n.y*nor), v[k].z + (n.z*nor));
      }
    }


    endShape();
  }

  popMatrix();
}

void mouseDragged()
{
  rotX += (mouseX - pmouseX) * 0.01;
  rotY -= (mouseY - pmouseY) * 0.01;
}

public void audioInputData(AudioInput theInput) {
  myFFT.getSpectrum(myInput);
}


