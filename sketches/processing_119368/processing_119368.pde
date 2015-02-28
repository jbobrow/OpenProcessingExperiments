
//Flowering Flowers
//Homework:2013-11-06
//Echo Chen (puyce7244@yahoo.com.tw)
//concept:Flowers and ribbons fluttering in the wind.
void setup() {
  size(700, 300);
  background(255);
  frameRate(2);
}


void draw() {
  Daisy01();
  Daisy02();
  Daisy03();
  yellowfl01();
  yellowfl02();
  yellowfl03();
  /*Rose01();*/
  
  if (mousePressed) {
    pushMatrix();
    translate(random(50), random(20));
    yellowfl03();
    popMatrix();
  }

  
  float a = 0.0;
  float inc = TWO_PI/50.0;
  for (int i=0; i<700; i=i+10) {

    //background -Ribbon
    //using two curve (point to point)
    
    //group a
    stroke(255,120,73,10);
    strokeWeight(3); 
    point(i, 150+cos(a)*20-10);
    stroke(255,120,73,20);
    strokeWeight(3);
    point(i, sin(a)*40+150);
    
    stroke(255,120,73,5);
    strokeWeight(1);
    line(i, 150+cos(a)*20-10,i, sin(a)*40+150);
    
    //group b
    stroke(255,203,185,20);
    strokeWeight(3); 
    point(i, 200+cos(a)*40-10);
    stroke(255,203,185,20);
    strokeWeight(3);
    point(i, sin(a)*40+80);
    
    stroke(255,203,185,10);
    strokeWeight(1);
    line(i, 200+cos(a)*20-10,i, sin(a)*40+80);
    
    //group c
    //i want to make the image is like "Robins fly with wind ",but not good :(
    /* 
    float ynoise=random(100,300);
    float rny= noise(ynoise)*200;
    
    stroke(255,203,185,70);
    strokeWeight(3); 
    point(i, rny+sin(a)*20.0);
    point(i, 100+rny+sin(a)*20.0);
    
    stroke(255,203,185,70);
    strokeWeight(1);
    line (i, rny+sin(a)*20.0,i, 100+rny+sin(a)*20.0);*/
    
    //small green point 
    float ynoise=random(100,300);
    float rny= noise(ynoise)*200;
    
    stroke(218,255,185,80);
    strokeWeight(3); 
    point(i, rny+sin(a)*20.0);
    point(i, 100+rny+sin(a)*20.0);
    
    a = a + inc;
  }
  
}

  void Daisy01() {
    float radius =random(70);
    int centX =150;
    int centY =150;
    float x, y;
    float noiseval = random(1);
    float radVariance, thisRadius, rad;
    beginShape();
    strokeWeight(1);
    stroke(255,random(114, 200), random(0, 200),20);
    fill(255,114,0,20);
    for (float ang=0; ang<=360; ang+=1) {
    noiseval += 0.1;
    radVariance=15*customNoise(noiseval);
    thisRadius = radius+radVariance;
    rad = radians(ang);
    x = centX + (thisRadius * cos(rad));
    y = centY + (thisRadius * sin(rad));
    curveVertex(x, y);
    }
    endShape();
  }
  
  void Daisy02() {
    float radius =random(50);
    int centX =250;
    int centY =200;
    stroke(255);
    float x, y;
    float noiseval = random(1);
    float radVariance, thisRadius, rad;
    beginShape();
    strokeWeight(1);
    stroke(255,random(114, 250), random(0, 200),30);
    fill(255,114,0, 10);
    for (float ang=0; ang<=360; ang+=1) {
    noiseval += 0.1;
    radVariance=15*customNoise(noiseval);
    thisRadius = radius+radVariance;
    rad = radians(ang);
    x = centX + (thisRadius * cos(rad));
    y = centY + (thisRadius * sin(rad));
    curveVertex(x, y);
    }
    endShape();
  }
  
  void Daisy03() {
    float radius =random(30);
    int centX =400;
    int centY =200;
    stroke(255);
    float x, y;
    float noiseval = random(1);
    float radVariance, thisRadius, rad;
    beginShape();
    strokeWeight(1);
    stroke(255,random(114, 200), random(0, 200),20);
    fill(255,random(114,200), random(0, 200), 20);
    for (float ang=0; ang<=360; ang+=1) {
    noiseval += 0.1;
    radVariance=15*customNoise(noiseval);
    thisRadius = radius+radVariance;
    rad = radians(ang);
    x = centX + (thisRadius * cos(rad));
    y = centY + (thisRadius * sin(rad));
    curveVertex(x, y);
    }
    endShape();
  }
  
  void yellowfl01() {
    float radius =random(70);
    int centX =300;
    int centY =100;
    stroke(255);
    float x, y;
    float noiseval = random(5);
    float radVariance, thisRadius, rad;
    beginShape();
    strokeWeight(1);
    stroke(255,random(114, 200), random(0, 200),50);
    fill(255,220, 0, 10);
    for (float ang=0; ang<=360; ang+=1) {
    noiseval += 0.1;
    radVariance=15*customNoise2(noiseval);
    thisRadius = radius+radVariance;
    rad = radians(ang);
    x = centX + (thisRadius * cos(rad));
    y = centY + (thisRadius * sin(rad));
    curveVertex(x, y);
    }
    endShape();
  }
  
  
  
  void yellowfl02() {
    float radius =random(50);
    int centX =600;
    int centY =150;
    stroke(255);
    float x, y;
    float noiseval = random(5);
    float radVariance, thisRadius, rad;
    beginShape();
    strokeWeight(1);
    stroke(255,random(114, 200), random(0, 200),50);
    fill(255,220, 0, 10);
    for (float ang=0; ang<=360; ang+=1) {
    noiseval += 0.1;
    radVariance=15*customNoise2(noiseval);
    thisRadius = radius+radVariance;
    rad = radians(ang);
    x = centX + (thisRadius * cos(rad));
    y = centY + (thisRadius * sin(rad));
    curveVertex(x, y);
    }
    endShape();
  }
  
   // set by mouse
    void yellowfl03() {
    float radius =random(20);
    int centX =mouseX;
    int centY =mouseY;
    stroke(255);
    float x, y;
    float noiseval = random(5);
    float radVariance, thisRadius, rad;
    beginShape();
    strokeWeight(1);
    stroke(255,random(114, 200), random(0, 200),90);
    fill(255,220, 0, 10);
    for (float ang=0; ang<=360; ang+=1) {
    noiseval += 0.1;
    radVariance=15*customNoise2(noiseval);
    thisRadius = radius+radVariance;
    rad = radians(ang);
    x = centX + (thisRadius * cos(rad));
    y = centY + (thisRadius * sin(rad));
      curveVertex(x, y);
    }
    endShape();
  }
  
   /*void Rose01() {
    float radius =10;
    float lastx=-999;
    float lasty=-999;
    float radiusNoise=random(10);
    int centX =60;
    int centY =250;
    float radVariance, thisRadius, rad;
    beginShape();
    strokeWeight(1);
    stroke(255,0,0,50);
    fill(255,220, 0, 10);
     for (float ang=0; ang<=360; ang+=1) {
      radiusNoise += 0.05;
      radius += 0.5;
      float thisRadius=radius+(noise(noiseval)*200)-100;
      rad = radians(ang);
      x = centX + (thisRadius * cos(rad));
      y = centY + (thisRadius * sin(rad));
      if (lastx>-999){
        line(x,y,lastx,lasty);
      curveVertex(x, y);
    }
    endShape();}*/
 
  
//Noise 01 for Daisy01,02,03
  float customNoise(float value) {
  int count=int(value%12);
  float retValue=pow(sin(value), count);
  return retValue;
  }
//Noise 02 for yellowfl 01,02,03
 float customNoise2(float value) {
 float retValue=pow(sin(value),1);
 return retValue;
 }




