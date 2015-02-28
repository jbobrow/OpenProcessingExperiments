
//Complexity
//Fall, Falling, Fallen 
//Test 019 [Date:20131210] Wayne Lin
//e-mail:ration.Lin@gmail.com
//N76014045 æ��ç��å��
//Reference: Generative Art(Pearson2011), in-class practice from Nik Chien


int _num = 10;
float radius = 6;
Circle[] _circleArr = {
}; 

void setup() {
  size(600, 300);
  background(255);
  smooth();
  strokeWeight(1);
  fill(150, 50);
  drawCircles();
}

void draw() {
  background(255);
  for (int i=0; i<_circleArr.length; i++) {
    Circle thisCirc = _circleArr[i];
    thisCirc.updateMe();
  }
}

void mouseReleased() {
  drawCircles();
}

void drawCircles() {
  for (int i=0; i<_num; i++) { 
    Circle thisCirc = new Circle();
    thisCirc.drawMe();
    _circleArr =(Circle[])append(_circleArr, thisCirc);
  }
}

//==========Object==========================================

class Circle {
  float x, y;
  float radius;
  color linecol, fillcol;
  float alph;
  float xmove, ymove;

  Circle() {
    x = random(width);
    y = random(height);
    radius = random(50) + 10;
    linecol = color(random(255), random(255), random(255));
    fillcol = color(random(255), random(190), random(234));
    alph = random(255);
    xmove = random(10)-5;
    ymove = random(5);
  }
  float customNoise(float value) {
    int count=int (value%(random(10)));
    float retValue=pow(sin(value), count);
    return retValue;
  }

  void drawMe() {
    noStroke();
    fill(fillcol, alph);
    ellipse(x, y, radius*2, radius*2);
    stroke(linecol, alph);
    strokeWeight(2);
    ellipse(x, y, 20, 20);
  }

  void updateMe() {
    x += xmove;
    y += ymove;

    if (x > width-radius) { 
      x=width-radius;
      xmove = -xmove;
    }
    if (x <= radius) { 
      x=radius;
      xmove = -xmove;
    }
    if (y > height-radius) { 
      y=height-radius;
    }
    if (y <= radius) { 
      y=radius;
      ymove = -ymove;
    }

    boolean touching = false;
    for (int i=0; i<_circleArr.length; i++) {
      Circle otherCirc = _circleArr[i];
      if (otherCirc != this) {
        float dis = dist(x, y, otherCirc.x, otherCirc.y);
        float overlap = dis- radius- otherCirc.radius;
        if (overlap < 0) {
          float midx, midy;
          midx= (x+ otherCirc.x)/2;
          midy= (y + otherCirc.y)/2;
          noFill();
          overlap *= -1;
          stroke(linecol, alph);
          strokeWeight(1);
          ellipse(midx, midy, overlap, overlap);
          float x1, y1;
          float noiseval=random(25);
          float radVariance, thisRadius, rad;

          beginShape();     
          for (float ang=0; ang<=360; ang+=3) {
            radVariance = customNoise(noiseval);
            thisRadius = overlap+radVariance;           
            rad = radians(ang);                                 
            x1 = midx + (thisRadius * cos(rad));
            y1 = midy + (thisRadius * sin(rad));
            curveVertex(x1, y1);
          }
          endShape(CLOSE);
          
          touching = true;
          break;
        }
      }
    }
    if (touching) {
      if (alph > 0) { 
        alph--;
      }
    } 
    else {
      if (alph<255) { 
        alph += 10;
      }
    }
    drawMe();
  }
}


