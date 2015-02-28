
int prevHour;
int prevMinute;
int prevSecond;
int lastRolloverTime;

int sunriseHr = 7;
int sunsetHr = 19;

float bulbR = 40;
float petalL = 80;
float stemDisplacement = 10;
float sunTravelR;

Leaf leaf1 = new Leaf();
Leaf leaf2 = new Leaf();
Petal[] allPetals = new Petal[12];
Circle[] allCircles = new Circle[60];
Bulb bulb= new Bulb();
Sun sun = new Sun();
int nRays = 9;
Ray[] allRays = new Ray[nRays];

float currColor;

void setup() {
  colorMode(HSB, 60);
  size(300, 300);
  background(33, 20, 60);
  lastRolloverTime = 0;

  prevMinute = (minute()+59)%60;
  prevSecond = (second()+59)%60;

  //Initialize sun rays
  for (int k=0; k<nRays; k++) {
    Ray r = new Ray(map(k, 0, nRays, 0, TWO_PI));
    allRays[k] = r;
  }

  //Initialize petal objects
  for (int i=0; i<12; i++) {
    Petal p = new Petal();
    allPetals[i] = p;
  }

  //Initialize circle objects for bulb
  float prevX = prevMinute;
  for (int j=0; j<60; j++) {
    Circle c = new Circle(prevX, j, (40-(float(j)/60)*bulbR), j);
    allCircles[j] = c;
  }
  currColor = prevX;

  sunTravelR = 3*width/4; //sqrt(2*pow(0.25*height,2));
}


void draw() {
  //Draw background over previous image
  background(0, 60, 60);
  //Load current time variables
  int h = hour();
  int m = minute();
  int s = second();
  int ms = millis();

  //Estimate milliseconds
  if (s!=prevSecond) {
    lastRolloverTime = ms;
  }
  int mils = ms-lastRolloverTime;

  //Draw sun in background during daylight hours
  if (h>=sunriseHr && h<sunsetHr) {
    noStroke();
    fill(33, 20, 60);
    rect(0, 0, width, height);
    pushMatrix();
    translate(width/2, 2*height/3);
    float currTotMin = h*60+m;
    float sunriseMin = sunriseHr*60;
    float sunsetMin = sunsetHr*60;
    float r = map(sunsetMin-currTotMin, 0, sunsetMin-sunriseMin, 0, PI);
    rotate(r);   

    //Draw sun and its rays
    for (int j=0; j<nRays; j++) {
      float rotPlus = map((ms/1000.0), 0, 59, 0, TWO_PI);
      Ray ray = allRays[j];
      if (h==sunriseHr && m<30) {
        //during first half hr, gradually bring the sun in
        float colorChange = map(m, 0, 29, -5, 0);
        float alphaChange = map(m, 0, 29, -40, 0);
        ray.update(rotPlus, colorChange, alphaChange);
      }
      else if (h==sunsetHr-1 && m>=30) {
        //during last half hr, gradually take the sun out
        float colorChange = map(m, 30, 59, 0, -5);
        float alphaChange = map(m, 30, 59, 0, -40);
        ray.update(rotPlus, colorChange, alphaChange);
      }
      else {
        //draw sun rays normally
        ray.update(rotPlus);
      }
      ray.drawRay();
    }
    sun.drawSun();
    popMatrix();
  }
  else {
    noStroke();
    fill(35, 60, 30);  
    rect(0, 0, width, height);
  }

  //Draw stem
  float x = map(mils, 0, 1000, -stemDisplacement, stemDisplacement);
  if (s%2==0) x = -x;
  float stemSY = height/2;
  noFill();
  stroke(20, 30, 30);
  strokeWeight(4);
  bezier(width/2, stemSY, width/2+x, (height/6)+stemSY, width/2-x, (height/3)+stemSY, width/2, height);

  //Draw 2 leaves
  float leafX = bezierPoint(width/2, width/2+x, width/2-x, width/2, 3.0/4);
  float leafY = bezierPoint(stemSY, (height/6)+stemSY, (height/3)+stemSY, height, 3.0/4);
  leaf1.drawLeaf(mils, leafX, leafY, 1);
  leaf2.drawLeaf(mils, leafX, leafY, -1);

  //Draw flower petals
  fill(255);
  stroke(0, 0, 60);
  strokeWeight(1);
  translate(0, x/2);
  for (int i=1; i<=12; i++) {
    pushMatrix();
    translate(width/2, height/2);
    rotate(float(i)/12*TWO_PI);

    if ((h>12 && h%12>=i) || (h<=12 && i>h)) {
    }
    else {
      allPetals[i%12].drawPetal();
    }
    popMatrix();
  }

  //Draw bulb
  bulb.drawBulb(s, m);

  translate(0, -x/2);

  //Draw night cover during nighttime
  if (h>=sunriseHr && h<sunsetHr-1) {
  }
  else {
    float alpha;
    if (h==sunsetHr-1 && m>=30) {
      //last half hr before sunset, bring in night cover
      alpha = map(m, 30, 59, 0, 40);
    }
    else if (h==sunriseHr && m<10) {
      //first 10 minutes of sunrise, take out night cover
      alpha = map(m, 0, 9, 40, 0);
    }
    else {
      //regular night cover
      alpha = 40;
    }
    noStroke();
    fill(35, 60, 0, alpha);  
    rect(0, 0, width, height);
  }

  //Update prev vars
  prevSecond = s;
  prevMinute = m;
  prevHour = h;
}


//-------------------------------------------------------------------
//        Objects classes
//-------------------------------------------------------------------

class Sun {
  float r1 = 2*bulbR;
  float r2 = r1-10;

  void drawSun () {
    noStroke();
    fill(5, 40, 60);
    ellipse(-sunTravelR, 0, r1, r1);
    fill(10, 60, 60);
    ellipse(-sunTravelR, 0, r2, r2);
  }
}


class Ray {
  float maxLength = width+height;
  float w = width/4; //random(width/4,3*width/4);
  float rotation0 = 0;
  float rotation = 0;
  float color0 = 10;
  float currColor = color0;
  float alpha0 = 40;
  float currAlpha = alpha0;

  Ray (float r) {
    rotation0 = r;
  }

  void update(float r) {
    rotation = rotation0+r;
    if (rotation>TWO_PI) rotation-=TWO_PI;
    currColor = color0;
  }

  //Override above update, when color needs to be changed
  void update(float r, float c, float a) {
    rotation = rotation0+r;
    if (rotation>TWO_PI) rotation-=TWO_PI;
    currColor = color0+c;
    currAlpha = alpha0+a;
  }

  void drawRay() {
    pushMatrix();
    translate(-sunTravelR, 0);
    rotate(rotation);
    noStroke();
    fill(currColor, 60, 60, currAlpha);
    beginShape();
    vertex(0, 0);
    vertex(maxLength, -w);
    vertex(maxLength, w);
    endShape(CLOSE);
    popMatrix();
  }
}


class Petal {
  int nVeins = 30;
  void drawPetal() {
    float colorX = prevMinute;
    fill(0, 0, 60);
    stroke(colorX, 30, 60);
    bezier(0, 0, -bulbR, -petalL, bulbR, -petalL, 0, 0);

    for (int i=1; i<nVeins; i++) {
      for (int k=0; k<int(petalL); k++) {
        float x = map(k, 0, petalL, 0, bezierPoint(0, -bulbR, bulbR, 0, float(i)/nVeins));
        float y = map(k, 0, petalL, 0, bezierPoint(0, -petalL, -petalL, 0, float(i)/nVeins));
        //Alter the last parameter of colorY to change how much white is on the petal
        float colorY = map(k, 0, petalL, 60, -25);
        stroke(colorX, colorY, 60);
        point(x, y);
      }
    }

    noFill();
    stroke(colorX, 30, 60);
    bezier(0, 0, -bulbR, -petalL, bulbR, -petalL, 0, 0);
  }
}


class Leaf {
  float maxRot = (1.0/24)*TWO_PI;
  float maxLength = petalL/2.0;

  void drawLeaf (int mils, float x, float y, int flip) {
    float rotPercent = sin(float(mils)/1000.0*TWO_PI);
    float currRot = map(rotPercent, -1, 1, 0, maxRot);
    pushMatrix();
    translate(x, y);
    rotate(currRot*flip);
    scale(flip, 1);
    noStroke();
    fill(20, 60, 50);
    bezier(0, 0, 1*maxLength/4, -2*maxLength/3, 3*maxLength/4, -3*maxLength/3, maxLength, -maxLength);
    fill(25, 60, 40);
    bezier(0, 0, 1*maxLength/4, -0*maxLength/3, 3*maxLength/4, -1*maxLength/3, maxLength, -maxLength);
    popMatrix();
  }
}


class Bulb {
  void drawBulb (int s, int m) {
    noStroke();
    for (int i=0; i<60; i++) {
      allCircles[i].drawCircle(s, m);
    }
  }
}


class Circle {
  int index;
  float colorX;
  float colorY;
  float radius;

  Circle(float x, float y, float r, int i) {
    colorX = x;
    colorY = y;
    radius = r;
    index = i;
  }

  void drawCircle(int s, int m) {
    fill(colorX, colorY, 60);

    ellipse(width/2, height/2, radius, radius);

    if (prevSecond!=s) {
      colorY = (index+60-s)%60;
    }
    if (prevMinute!=m && s!=index) {
      colorX = m;
    }
  }
}



