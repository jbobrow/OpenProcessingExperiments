
/*
BUTTERFLY FALL
the butterfly effect, 
they fly from the left corner of the black box
lights will emerge when they are near to each other
------------------------------------------------------
click mouse to add butterfly
press H to hide butterfly & accelerate the moving
press P to pause, and press R to resume
press S to save png
*/

// by KokFu Lok


int _num = 5;      
Circle[] _circleArr = {
};  

void setup() { 
  size(800, 500); 
  background(0); 
  strokeWeight(2); 
  fill(150, 50); 
  frameRate(8);
  drawCircles();
} 

void draw() {    
  background(0, 10);
  for (int i=0; i<_circleArr.length; i++) {
    Circle thisCirc = _circleArr[i];
    thisCirc.updateMe();
  }
} 

void mouseReleased() { 
  drawCircles();
} 

void keyPressed() {
  if (key == 's' || key =='S') {
    saveFrame("falling_##.png");
  }
  if (key == 'p' || key =='P') {
    noLoop();
  }
  if (key == 'r' || key =='R') {
    loop();
  }
}

void drawCircles() { 
  for (int i=0; i<_num; i++) { 
    Circle thisCirc = new Circle();
    thisCirc.drawMe();
     _circleArr = (Circle[])append(_circleArr, thisCirc);
    }
  }



class Circle {
  float x, y;
  float radius;
  color linecol, fillcol;
  float alph; 
  float xmove, ymove;

  Circle() {
    x = sin(random(width));
    y = sqrt(random(height));
    radius = random(5, 30);
    linecol = color(random(105), random(255), random(255));
    fillcol = color(random(255), random(255), random(100));
    alph = random(30, 100);
    //speed
    xmove = random(-5, 5);// - 5;
    ymove = random(-2, 2); //- 5;
  }

  void drawMe() {

    int rnd=50;
    float rnd1=random(-rnd, rnd);
    float rnd2=random(-rnd, rnd);
    float rnd3=random(-rnd, rnd);
    float rnd4=random(-rnd, rnd);

    if (keyPressed== true) {
      alph=0;
    }
    else {
      noStroke();
      fill(fillcol, alph);
      triangle(x, y, x+rnd1, y+rnd2, x-rnd3, y-rnd4);
      triangle(x, y, x+rnd4, y+rnd3, x-rnd2, y-rnd1);
      stroke(linecol, alph);
      noFill();
      ellipse(x, y, random(radius), radius);
    }
  }
  void updateMe() {
    if (keyPressed== true) {
      x += xmove*2;
      y += ymove*2;
    }
    else {
      x += xmove;
      y += ymove;
    }

    if (x > (width+radius)) { 
      x=width+radius;
      xmove= -xmove;
    }
    if (x < (0-radius)) { 
      x=0-radius;
      xmove= -xmove;
    }
    if (y > (height+radius)) { 
      y=0-radius;
    }
    if (y < (0-radius)) { 
      y=height+radius ;
    }


    //collide
    boolean touching = false;
    for (int i=0; i<_circleArr.length; i++) {
      Circle otherCirc = _circleArr[i];
      if (otherCirc != this) {
        float dis = dist(x, y, otherCirc.x, otherCirc.y);
        float overlap=dis-radius*5-otherCirc.radius*5;
        float midx, midy;
        float rad2;
        midx=(x+otherCirc.x)/2;
        midy=(y+otherCirc.y)/2;
        rad2=sqrt(sq(x-midx)+sq(y-midy));
        if (overlap> 0) {
          stroke(1);
          if (keyPressed== true) {
            stroke(200, 30);
          }
          else {
            stroke(200, 5);
          }      
          line(x, y, otherCirc.x, otherCirc.y);

          alph=alph-10;
        }
        else {
          stroke(150, 30);
          fill(255, 255, 0, 20);
          ellipse( midx, midy, rad2, rad2);
          fill(255, 255, 0, 5);
          ellipse( midx, midy, rad2*3, rad2*3);
          touching = true;
          break;
        }
      }
    }
    if (touching) {

      if (alph > 0) { 
        alph++;
      }
    } 
    else {
      if (alph<150) { 
        alph --;
      }
    }

    drawMe();
  }
}



