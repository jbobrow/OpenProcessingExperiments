
import netscape.javascript.*;

int sw = 500;
int sh = 500;
PVector sc = new PVector();

int colourSpace = 255;

int inkNum = 1500;
float amp = 0;
int ampMax = 100;
float[] ampScale = new float[inkNum];
float ampNoise = 0;
float ampAmount = 0;
float thetaNoise = 0;
float noiseInc = 0;
float initialInkSize = 10;
float sizeInc = 0;
float alphaInc = 0;

int effectNum = 1500;
PVector[] effectPoints = new PVector[effectNum];
int effectMax = 200;
float[] effectScale = new float[effectNum];
PVector effect = new PVector(0, 0);
PVector effectFirst;
float effectNoiseInc = 0;
float effectMaxMag = 0;
float ampGradient = 0;

void setup() {  
  size(sw, sh);
  background(colourSpace);
  
  sc.x = sw / 2;
  sc.y = sh / 2;

  for (int i = 0; i < inkNum; i += 1) {
    effectNoiseInc += 0.005;
    ampScale[i] = noise(effectNoiseInc); // * random(2, 3);
  }
  
  
  for (int i = 0; i < effectNum; i += 1) {
    effectNoiseInc += 0.005;
    effectScale[i] = noise(effectNoiseInc); //random(0.75, 1.25);
    
    float theta = (i / (float)effectNum) * 2 * PI;
    float ampAmount = effectScale[i] * effectMax;

    effectPoints[i] = new PVector(sin(theta) * ampAmount, cos(theta) * ampAmount);
    
    effectMaxMag = max(effectMaxMag, effectPoints[i].mag());
  }
}

void draw() {
  noStroke();
  fill(colourSpace, random(0, random(1, 5)));
  rect(0, 0, sw, sh);

  translate(sc.x, sc.y);
  
  
  if (ampAmount < ampMax) {
    amp += 1 * 0.5;
    ampGradient = amp / (float)effectMaxMag;
  }
  else {
    //noLoop();
  }

  for (int i = 0; i < inkNum; i += 1) {
    effectNoiseInc += 0.0005;
    
    float theta = (i / (float)effectNum) * 2 * PI;
    float ampAmount = (effectScale[i] * effectMax + effectNoiseInc) * ampGradient;

    effectPoints[i] = new PVector(sin(theta) * ampAmount, cos(theta) * ampAmount);
  }

  for (int i = 0; i < inkNum; i += 1) {
    float theta = (i / (float)inkNum) * 2 * PI;
    noiseInc += 0.00001;
    thetaNoise = noise(i + noiseInc) * 0.1;
    ampNoise = noise(i + noiseInc);
    

    //ampAmount = ((amp + ampNoise) * ampScale[i]) * (effectMaxMag / effectPoints[i].mag());
    ampAmount = (amp + ampNoise) + (effectPoints[i].mag()) * ampGradient;
    PVector ink = new PVector(sin(theta + thetaNoise) * ampAmount, cos(theta + thetaNoise) * ampAmount);

    float normDist = ampAmount * ampScale[i] / ampMax;
    float invNormDist = 1 - normDist;
    float inkSize = pow(abs(initialInkSize * invNormDist) + (5 * ampNoise), 1.1);
    float inkAlpha = 1 * normDist + (colourSpace * ampNoise);
    
    if(alphaInc < inkAlpha){
      alphaInc += 0.5;
    }else{
      alphaInc = 0; 
    }
    stroke(0, alphaInc);
  
//    if(sizeInc < inkSize){
//      sizeInc += 0.1;
//    }else{
//      sizeInc = 0; 
//    }
//    strokeWeight(sizeInc);
    
    strokeWeight(inkSize);
    point(ink.x, ink.y);
  }

  
 /*
  noFill();
  stroke(colourSpace, alphaInc);
  strokeWeight(1);

  beginShape();
  for (int i = effectNum - 3; i < effectNum; i += 1) {
    curveVertex(effectPoints[i].x, effectPoints[i].y);
  }
  for (int i = 0; i < effectNum; i += 1) {
    curveVertex(effectPoints[i].x, effectPoints[i].y);
  }
  endShape();
  */
  
  
  for (int i = 0; i < effectNum; i += 1) {
    noiseInc += 0.1;
    stroke(255, 5); 
    strokeWeight((noise(noiseInc) + 5) * ampGradient);
    effectPoints[i].mult(noise(noiseInc));
    point(effectPoints[i].x, effectPoints[i].y);
  }
  
  
  //  for (int i = 0; i < effectNum; i += 1) {
  //
  //    stroke(colourSpace, 0, 0);
  //    strokeWeight(5);
  //    point(effectPoints[i].x, effectPoints[i].y);
  //
  //    stroke(colourSpace, 0, 0);
  //    strokeWeight(1);
  //
  //    if (i > 0) {
  //      line(effectPoints[i - 1].x, effectPoints[i - 1].y, effectPoints[i].x, effectPoints[i].y);
  //    }
  //    if (i == effectNum - 1) {
  //      line(effectPoints[0].x, effectPoints[0].y, effectPoints[i].x, effectPoints[i].y);
  //    }
  //  }
}


