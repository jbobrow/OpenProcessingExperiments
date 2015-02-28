
//import processing.funnel.*;
import ddf.minim.*;
import processing.opengl.*;

//Arduino arduino;
Minim minim;
AudioInput in;
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/179*@* */
/* !do not delete the line above, required for linking your tweak if you re-upload */
int Length=300;
int zoom;
float[] X=new float[Length];
float[] Y=new float[Length];
float[] Z=new float[Length];
float[] r=new float[Length];
float[] thetaX=new float[Length];
float[] thetaY=new float[Length];
float[] thetaZ=new float[Length];

void setup() {
//  Configuration config = Arduino.FIRMATA;
//  arduino = new Arduino(this, Arduino.FIRMATA);
  minim = new Minim(this);
  minim.debugOn();
  in = minim.getLineIn(Minim.STEREO, 512);
//  Scaler scaler = new Scaler(0.002, 0.49, 0, 650, Scaler.LINEAR, true);
//  Convolution convolution = new Convolution(Convolution.MOVING_AVERAGE);
  size(500, 500, P3D);
  colorMode(HSB,100);
  frameRate(30);
  noStroke();
  background(0);
  for (int i=0;i<Length;i++) {
    X[i]=random(width);
    Y[i]=random(-1000, 0);
    Z[i]=random(-1000, 1000);
//    r[i]=random(1, 10);
    thetaX[i]=random(0.001, 0.1);
    thetaY[i]=random(0.001, 0.1);
    thetaZ[i]=random(0.001, 0.1);
  }
}
void draw() {
//  arduino.analogPin(0).value
//  camera(0, 0, arduino.analogPin(0).value, // 視点X, 視点Y, 視点Z
//  0.0, 0.0, 0.0, // 中心点X, 中心点Y, 中心点Z
//  0.0, 1.0, 0.0); // 天地X, 天地Y, 天地Z
  PImage beforeImage = get();
  //環境光
  ambientLight(63, 31, 31); 
  //平行光
  directionalLight(255, 255, 255, -1, 0, 0); 
//  //点光源
  pointLight(63, 127, 255, 500, 500, 200); 
  //スポットライト
 spotLight(100, 100, 100, mouseX, mouseY, 200, 0, 0, -1, PI, 2);
  
  float level = in.mix.level()*200;
  background(0);
//  directionalLight(50, 102, 200, 0, height, 0);
//  directionalLight(10, 20, 30, 0, -height, 0);
  for (int i=0;i<Length;i++) {
    pushMatrix();
    translate(X[i], Y[i], Z[i]);
    rotateX(thetaX[i]);
    rotateY(thetaY[i]);
    rotateZ(thetaZ[i]);
    box(level);
    if (Y[i]>height+50) {
      Y[i]=random(-100, 0);
    }
    else {
      Y[i]+=random(1, 6);
    }
    thetaX[i]+=random(0.001, 0.1);
    thetaY[i]+=random(0.001, 0.1);
    popMatrix();
  }
  if(level>10){
    blend(beforeImage, 0,1, width, height, -0, -1, width, height, SCREEN);
  }
}


