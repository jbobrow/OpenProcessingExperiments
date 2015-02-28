
// Author: Weiyuh Li
//Vase with 12 sunflowers
//concept:色塊堆疊的方式及效果跟油畫的置圖方式相似，因此把van Gogh的畫
//        視為未完成，剩下部分由觀看者完成!! 
//anyone can be Vincent van Goah!!!
//move mouse on these pistils then the flower will begin to growth
//reference:http://www.openprocessing.org/visuals/?visualID=44778 by Sheng-Fen Nik Chien

int centX1 =150;
int centY1 = 170;
int centX2 =385;
int centY2 =120;
int centX3 =480;
int centY3 =150;
int centX4 =280;
int centY4 =140;

void setup() {
  PImage F;
  size(600, 792);
  F=loadImage("vicent.jpg");
  background(F);
  smooth();
  frameRate(4);
  // noLoop();
  strokeWeight(10);
  stroke(50, 100, 10);
  noFill();
}

void draw() {
  //flower 1
  noStroke();
  float t=second();
  float radius = random(t+5);
  float x, y;
  float noiseval = random(10);
  float radVariance, thisRadius, rad;
  if (mouseX>=130 && mouseX<=170 && mouseY>=150 && mouseY<=190) {
    //layer1
    beginShape();
    strokeWeight(1);
    stroke(100, 30, 30, 50);
    fill(random(160, 255), random(50, 150), random(20), 80);
    for (float ang=0; ang<=360; ang+=5) {
      noiseval += 0.1;
      radVariance = 50*customNoiseB(noiseval);
      thisRadius = radius+radVariance;
      rad = radians(ang);                                  
      x = centX1 + (thisRadius * cos(rad));
      y = centY1 + (thisRadius * sin(rad));
      curveVertex(x, y);
    }
    endShape(CLOSE);
  //layer2  
       beginShape();
    strokeWeight(1);
    stroke(100, 30, 30, 50);
    fill(random(200, 255), random(100, 150), 0, 100);
    for (float ang=0; ang<=360; ang+=5) {
      noiseval += 0.1;
      radVariance = 40*customNoiseB(noiseval);
      thisRadius = radius+radVariance-30;
      rad = radians(ang);                                  
      x = centX1 + (thisRadius * cos(rad));
      y = centY1 + (thisRadius * sin(rad));
      curveVertex(x, y);
    }
    endShape(CLOSE);
  }

  //pistil1
  float radius2 = 10;
  float x2, y2;
  float noiseval2 = random(10);
  float radVariance2, thisRadius2, rad2;
  beginShape();
  noFill();
  strokeWeight(2);
  fill(random(60, 100), random(50, 80), 0, 20);
  for (float ang=0; ang<=360; ang+=5) {
    noiseval2 += 0.1;
    radVariance2= 20*customNoiseB(noiseval);
    thisRadius2 = radius2+radVariance2;
    rad = radians(ang);                                  
    x = centX1 + (thisRadius2 * cos(rad));
    y = centY1 + (thisRadius2 * sin(rad));
    curveVertex(x, y);
  }
  endShape(CLOSE);

  //flower 2 
  float radius3 = random(t)+20;
  float x3, y3;
  float noiseval3 = random(15);
  float radVariance3, thisRadius3, rad3;
   if (mouseX>=365 && mouseX<=405 && mouseY>=100 && mouseY<=140) {
  //layer1
     beginShape();
  strokeWeight(1);
  stroke(random(100, 150), random(80, 120), 25, 50);
    fill(random(150, 255), random(150, 255), random(20), 80);
    for (float ang=0; ang<=360; ang+=5) {
      noiseval += 0.1;
      radVariance3 = 30*customNoiseB(noiseval);
      thisRadius3 = radius3+radVariance3+20;
      rad = radians(ang);                                  
      x = centX2 + (thisRadius3 * cos(rad));
      y = centY2 + (thisRadius3 * sin(rad));
      curveVertex(x, y);
    }
    endShape(CLOSE);
    //layer2
        beginShape();
  strokeWeight(1);
  stroke(random(100, 150), random(80, 120), 25, 50);
    fill(random(200, 255), random(200, 255), random(20), 100);
    for (float ang=0; ang<=360; ang+=5) {
      noiseval += 0.1;
      radVariance3 = 20*customNoiseB(noiseval);
      thisRadius3 = radius3+radVariance3-20;
      rad = radians(ang);                                  
      x = centX2 + (thisRadius3 * cos(rad));
      y = centY2 + (thisRadius3 * sin(rad));
      curveVertex(x, y);
    }
    endShape(CLOSE);
  }

  //pistil12
  float radius4 = 5;
  float x4, y4;
  float noiseval4 = random(8);
  float radVariance4, thisRadius4, rad4;
  beginShape();
  noFill();
  strokeWeight(2);
  fill(random(50, 100), random(20, 50), 10, 30);
  for (float ang=0; ang<=360; ang+=5) {
    noiseval4 += 0.1;
    radVariance4= 20*customNoiseB(noiseval);
    thisRadius4 = radius4+radVariance4;
    rad = radians(ang);                                  
    x = centX2 + (thisRadius4 * cos(rad));
    y = centY2 + (thisRadius4 * sin(rad));
    curveVertex(x, y);
  }
  endShape(CLOSE);

  //flower3
  float radius5 = random(t)-5/2;
  float x5, y5;
  float noiseval5 = random(5);
  float radVariance5, thisRadius5, rad5;
    if (mouseX>=460 && mouseX<=500 && mouseY>=130 && mouseY<=170) {
  //layer1
      beginShape(); 
  strokeWeight(1);
  stroke(random(50, 80), random(50, 80), 25, 50);
    fill(random(150, 200), random(150, 200), random(50, 100), 150);
    for (float ang=50; ang<=280; ang+=3) {
      noiseval += 0.1;
      radVariance5 = 25*customNoise(noiseval)-20;
      thisRadius5 = radius5+radVariance5/2;
      rad = radians(ang);                                  
      x = centX3 + (thisRadius5 * cos(rad));
      y = centY3 + 2*(thisRadius5 * sin(rad));
      curveVertex(x, y);
    }
    endShape();
    //layer2
      beginShape(); 
  strokeWeight(1);
  stroke(random(50, 80), random(50, 80), 25, 50);
    fill(random(200, 230), random(180, 230), random(70, 120), 100);
    for (float ang=50; ang<=280; ang+=3) {
      noiseval += 0.1;
      radVariance5 = 25*customNoise(noiseval)-20;
      thisRadius5 = radius5+radVariance5/2-20;
      rad = radians(ang);                                  
      x = centX3 + (thisRadius5 * cos(rad));
      y = centY3 + 2*(thisRadius5 * sin(rad));
      curveVertex(x, y);
    }
    endShape();
  }

  //pistil13
  float radius6 = 5;
  float x6, y6;
  float noiseval6 = random(10);
  float radVariance6, thisRadius6, rad6;
  beginShape();
  noFill();
  strokeWeight(2);
  fill(random(60, 100), random(50, 80), 0, 20);
  for (float ang=0; ang<=360; ang+=10) {
    noiseval6 += 0.1;
    radVariance6= 30*customNoise(noiseval);
    thisRadius6 = radius6+radVariance6;
    rad = radians(ang);                                  
    x = centX3 + (thisRadius6 * cos(rad)/2);
    y = centY3 + (thisRadius6 * sin(rad));
    curveVertex(x, y);
  }
  endShape(CLOSE);

  //flower 4
  float radius7= random(t)*0.8;
 
  float x7, y7;
  float noiseval7 = random(5);
  float radVariance7, thisRadius7, rad7;
 //layer1
  if (mouseX>=260 && mouseX<=300 && mouseY>=120 && mouseY<=160) {
  beginShape();
  strokeWeight(1);
  stroke(100, 30, 30, 50);
    fill(random(200, 255), random(100, 150), random(20), 50);
    for (float ang=140; ang<=380; ang+=3) {
      noiseval += 0.1;
      radVariance = 40*customNoise(noiseval)-30;
      thisRadius = radius+radVariance;
      rad = radians(ang);                                  
      x = centX4 + (thisRadius * cos(rad)*0.7);
      y = centY4 + (thisRadius * sin(rad));
      curveVertex(x, y);
    }
    endShape(CLOSE);
    //layer2
      beginShape();
  strokeWeight(1);
  stroke(100, 30, 30, 50);
    fill(random(230, 255), random(130, 180), random(20), 60);
    for (float ang=140; ang<=380; ang+=3) {
      noiseval += 0.1;
      radVariance = 40*customNoise(noiseval)-30;
      thisRadius = radius+radVariance-20;
      rad = radians(ang);                                  
      x = centX4 + (thisRadius * cos(rad)*0.7);
      y = centY4 + (thisRadius * sin(rad));
      curveVertex(x, y);
    }
    endShape(CLOSE);
  }
  //pistil4
  float radius8 = 5;
  float x8, y8;
  float noiseval8 = random(10);
  float radVariance8, thisRadius8, rad8;
  beginShape();
  noFill();
  strokeWeight(2);
  fill(random(50, 100), random(20, 50), 10, 30);
  for (float ang=0; ang<=360; ang+=1) {
    noiseval2 += 0.1;
    radVariance8= 10*customNoiseB(noiseval);
    thisRadius8 = radius8+radVariance8;
    rad = radians(ang);                                  
    x = centX4 + (thisRadius8 * cos(rad));
    y = centY4 + (thisRadius8 * sin(rad)*2);
    curveVertex(x, y);
  }
  endShape(CLOSE);
}
float customNoise(float value) {
  float retValue = pow(sin(value), 3);
  return retValue;
}
float customNoiseB(float value) {
  int count = int(value%6);
  float retValue = pow(cos(value), count);
  return retValue;
}

void keyPressed() {

  saveFrame("sunflower####.png");
}


