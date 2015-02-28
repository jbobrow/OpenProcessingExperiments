
//praticeM,by chen, wu-zhi

//OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/47706*@* 
//the drawing is so beautiful...

int _num = 15;
Circle[] cArray = {
};

void setup() {
  size(900, 900);
  background(255);
  //smooth();
  //strokeWeight(1);
  //fill(150, 50);
  //frameRate(24);
  //noLoop();
  drawCircles();
}

void draw() {
  //drawCircles();
  //drawStarflower();
  background(255);
  for (int i=0; i< cArray.length; i++) {
    Circle thisCirc = cArray[i];
    thisCirc.updateMe();
  }
}

void drawCircles() {
  for (int i=0; i<_num; i++) {
    Circle thisCirc = new Circle();
     thisCirc.drawMe(); 
    cArray = (Circle[])append(cArray, thisCirc);
  }
}

//----------------------------------

class Circle {
  float x, y;
  float radius;
  color linecol, fillcol;
  float alph;
  float xmove, ymove;
  Circle() {
    x = random(width);
    y = random(height);
    radius = random(20) + random(20);
    linecol = color(255);
    fillcol = color(random(5), random(60, 140), random(120, 255));
    //alph = random(30);
    xmove = random(7) - 5;
    ymove = random(7) - 5;
  }
  void drawMe() {
    stroke(fillcol, alph);
    fill(fillcol, random(20));
    ellipse(x, y, radius*2, radius*2);
    stroke(linecol, 150);
    strokeWeight(3);
    noFill();
    ellipse(x, y, 30, 30);
  }
  void updateMe() {
    x += xmove;
    y += ymove;
    if (x > (width+radius)) { 
      x=0-radius;
    }
    if (x < (0-radius)) { 
      x=width+radius;
    }
    if (y > (height+radius)) { 
      y=0-radius;
    }
    if (y < (0-radius)) { 
      y=height+radius;
    }
    drawMe();
  }
}


void mouseReleased() {
  drawCircles();
}
/*
 void keyPressed(){
 saveFrame("bubbles-###.jpg");
 }
 */


