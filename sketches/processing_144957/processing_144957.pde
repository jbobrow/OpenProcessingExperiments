
// Konkuk University
 // Department of Dynamic Media
 // SOS iDesign
// Name: JANG jin seon
 // ID : 201420105
 
 int _num = 10;     
Circle[] _circleArr = {
}; 

void setup() {
  size(600, 600);
  background(255);
  strokeWeight(1);
  fill(150, 50);
  drawCircles();
}

void draw() {   
  background(100,100,100);
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
    _circleArr = (Circle[])append(_circleArr, thisCirc);
  }
}


class Circle {
  float x, y, x1, y1, x2, y2,x3,y3;
  float radius;
  color linecol, fillcol;
  float alph;
  float xmove, ymove;
  float rot;

  Circle() {
    x = random(width);
    y = random(height);
    x1 = random(width)-random(100);
    y1 = random(height)-random(50,200);
    x2 = random(width)+random(100);
    y2 = random(height)-random(50,200);
    x3 = random(width)-random(100);
    y3 = random(height)-random(50,200);
    radius = random(5, 300);
    linecol = color(random(255), random(255), random(255));
    fillcol = color(random(255), random(255), random(255));
    alph = random(30,150);

    xmove = random(-10,10);// - 5;
    ymove = random(-10,10); //- 5;
    rot=radians(x*6);
  }

  void drawMe() {
    noStroke();
    fill(fillcol, alph);
    rect(x, y, x1, y1, x2, y2,x3,y3);

   
  }

  void updateMe() {
    x += xmove;
    y += ymove;
    x1 += xmove*0.1;
    y1 += ymove*0.2;
    x2 += xmove*0.3;
    y2 += ymove*0.4;

    if (x > (width+radius)) {
      x=width+radius;
      xmove= -xmove;
    }
    if (x < (0-radius)) {
      x=0-radius;
      xmove= -xmove;
    }
    if (y > (height+radius)) {
      y=height+radius;
      ymove= -ymove;
    }
    if (y < (0-radius)) {
      y=0-radius;
      ymove= -ymove;
    }

    if (x2 > (width+radius)) {
      x2=width+radius;
      xmove= -xmove;
    }
    if (x2 < (0-radius)) {
      x2=0-radius;
      xmove= -xmove;
      
    }
    if (y2 > (height+radius)) {
      y2=height+radius;
      ymove= -ymove;
    }
    if (y2 < (0-radius)) {
      y2=0-radius;
      ymove= -ymove;
      
    
    }
    if (x3 > (width+radius)) {
      x3=width+radius;
      xmove= -xmove;
    }
    if (x3 < (0-radius)) {
      x3=0-radius;
      xmove= -xmove;
      
    }
    if (y3 > (height+radius)) {
      y3=height+radius;
      ymove= -ymove;
    }
    if (y3 < (0-radius)) {
      y3=0-radius;
      ymove= -ymove;
      
    
    }
    drawMe();
  }
}
