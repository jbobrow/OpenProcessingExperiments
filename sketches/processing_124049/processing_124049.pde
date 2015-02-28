
// Starring: Althought the falling stars are disapperring, the cores still exsist and connect to each other.
// Chang,Kuo Ping, department of ID

int num=20;
flower[] flowerArr= {
};
PImage img;

void setup() {
  size(500, 700);
  background(0);
  smooth();
  strokeWeight(1);
  fill(150, 50);
  drawFlowers();
  frameRate(20);
  img=loadImage("back.jpg");
}
void draw() { 
  background(0);
  image(img, 0, 0);
  for (int i=0;i<flowerArr.length;i++) {
    flower thisflo= flowerArr[i];
    thisflo.updateMe();
  }
}
void mouseReleased() {
  drawFlowers();
}

void drawFlowers() {
  for (int i=0;i<num;i++) {
    flower thisflo=new flower();
    thisflo.drawMe();
    flowerArr=(flower[])append(flowerArr, thisflo);
  }
}

class flower {
  float centX, centY;
  float noiseval;
  float radius;
  float xmove, ymove;
  color fillcol;
  float alph;
  float customNoise(float value) {
    int count=int(value%5); // original one is %12
    float retValue=pow(sin(value), count);
    return retValue;
  }
  flower() {
    centX=random(width);
    centY=random(height/2); //original one is height
    fillcol=color(200, random(210, 250), 255);
    alph=random(150, 255);
    noiseval=random(10);  // original one is 10
    radius=random(100); 
    xmove=random(10)-5;
    ymove=random(10)-5;  //original one is random(10)-5;
  }
  void drawMe() {
    fill(255);
    ellipse(centX, centY, random(10, 15), random(10, 15));
    noStroke();
    stroke(0, 50);  // original one is 20,50,70,50
    beginShape();
    fill(fillcol, alph); // original one is 20,50,70,50
    for (float ang=0;ang<=360;ang+=1) {
      float radVariance, thisRadius, rad;
      float x, y;
      noiseval+=1;  //original one is 0.1
      radVariance=20*customNoise(noiseval);   //original one is 30
      thisRadius=radius+radVariance;
      rad=radians(ang);
      x=centX+(thisRadius*cos(rad));
      y=centY+(thisRadius*sin(rad));
      curveVertex(x, y);
    }
    endShape();
  }

  void updateMe() {
    centX += xmove;
    centY -= ymove;
    if (centX > (width+radius)) { 
      centX=0-radius;
    }
    if (centX < (0-radius)) { 
      centX=width+radius;
    }
    if (centY > (height+radius)) { 
      centY=0-radius;
    }
    if (centY < (0-radius)) { 
      centY=height+radius;
    }
    boolean touching =false;
    for (int i=0;i<flowerArr.length;i++) {
      flower otherflo=flowerArr[i];
      if (otherflo!=this) {
        float dis=dist(centX, centY, otherflo.centX, otherflo.centY);
        float overlap=dis-radius-otherflo.radius;
        if (overlap<0) {   // touch successfully     
          float midx, midy;
          midx = (centX + otherflo.centX)/2;
          midy = (centY + otherflo.centY)/2;
          stroke(255, random(220, 250), random(255));                   
          //line(centX,centY,otherflo.centX,otherflo.centY);
          triangle(centX, centY, midx, midy, otherflo.centX, otherflo.centY);

          if (alph>0) {
            alph=alph-0.8;
          }
        }
      }
    }

    drawMe();
  }
}



