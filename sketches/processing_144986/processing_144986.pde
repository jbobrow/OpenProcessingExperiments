
int x = 0;
int y = 0;
int xspeed = 1;
int yspeed = 2;

int _num = 10;     
Circle[] _circleArr = {
}; 
 
void setup() {
  size(800, 800);
  background(255);
  strokeWeight(1);
  fill(200, 150);
  drawCircles();
  
  ellipseMode(CENTER);
  smooth();
  noStroke();
  frameRate(50);
}

  


void draw () {
   background(255);
  // Add the current speed to the x location.
  x = x + xspeed;
  y = y + yspeed;
  
  if ((x > width-80) || (x < 0)) {
    // If the object reaches either edge, multiply speed by -1 to turn it around.
    xspeed = xspeed * -1;
  }
   if ((y > height-80) || (y < 0)) {
    // If the object reaches either edge, multiply speed by -1 to turn it around.
    yspeed = yspeed * -1;
  }
 
 
  // Display circle at x location
  stroke(0);
  fill(175);
  quad(x,y,width-x,0,0,height-y,width-x,height-y);
  fill(y,0,x,100);
  quad(x,y,0,height-y,width-x,0,x,y);
  
  
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
    _circleArr = (Circle[])append(_circleArr, thisCirc);
  }
}
 
 
class Circle {
  float x, y, x1, y1, x2, y2;
  float radius;
  color linecol, fillcol;
  float alph;
  float xmove, ymove;
  float rot;
 
  Circle() {
    x = random(width);
    y = random(height);
    x1 = random(width)-random(20);
    y1 = random(height)-random(10, 3);
    x2 = random(width)+random(15);
    y2 = random(height)-random(2, 5);
    radius = random(20, 50);
    linecol = color(random(255), random(255), random(255));
    fillcol = color(random(255), random(255), random(255));
    alph = random(50, 100);
 
    xmove = random(-1, 20);// - 5;
    ymove = random(-6, 10); //- 5;
    rot=radians(x*4);
  }
 
  void drawMe() {
    noStroke();
    fill(fillcol, alph);
    //  pushMatrix();
    //  translate(-x,-y);
    //  rotate(rot);
    ellipse(x, y, random(radius), radius);
    //ellipse(x, y, radius*2, radius*2);
    //  popMatrix();
    stroke(linecol, 150);
    noFill();
    rect(x, y, random(radius), radius);
    rect(x1, y1, radius, random(radius));
    rect(x2, y2, random(radius), random(radius));
  }
 
  void updateMe() {
    x += xmove;
    y += ymove;
    x1 += xmove*0.8;
    y1 += ymove*0.6;
    x2 += xmove*0.1;
    y2 += ymove*0.2;
    
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
    /*
     if (x1 > (width+radius)) {
      x1=width+radius;
      xmove= -xmove;
    }
    if (x1 < (0-radius)) {
      x1=0-radius;
      xmove= -xmove;
    }
    if (y1 > (height+radius)) {
      y1=height+radius;
      ymove= -ymove;
    }
    if (y1 < (0-radius)) {
      y1=0-radius;
      ymove= -ymove;
    }
    */
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
    drawMe();
  }
}
