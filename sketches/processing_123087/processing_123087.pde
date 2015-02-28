
//Chun Yi Wu 
// concept is rainy day 
// If you knock your mouse , it will increase rain & umbrella .


int _num = 10;      
Circle[] _circleArr = {
};  

void setup() { 
  size(800, 400); 
  strokeWeight(1); 
  fill(150, 50); 
  drawCircles();
} 

void draw() {    
  background(0,11,25);
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
  float x, y;
  float radius;
  color linecol, fillcol;
  float alph; 
  float xmove, ymove;


  Circle() {
    x = random(width);
    y = random(height);
    radius = random(100) + 10;
    linecol = color(random(255));
    fillcol = color(random(100,210));
    alph = random(255);

    xmove = random(10) - 5;
    ymove = random(10) - 5;
  }

  void drawMe() {
    
    fill(fillcol, alph);
    stroke(linecol, alph);   
    triangle(x, y, x+radius+10, y, x+radius/2+5, y-radius/2);
    line(x+radius/2+5, y, x+radius/2+5, y+40);
    noFill();
    arc(x+radius/2+15, y+40, 20, 20, 0, PI);
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

    boolean touching = false;
    for (int i=0; i<_circleArr.length; i++) {
      Circle otherCirc = _circleArr[i];
      if (otherCirc != this) {
        float dis = dist(x, y, otherCirc.x, otherCirc.y);

        float limit = dis - radius - otherCirc.radius;  
        if ( limit < 0) {
          float midx, midy;
          midx = (x + otherCirc.x)/2;
          midy = (y + otherCirc.y)/2;
          stroke(255, random(60));
          noFill();
          limit *= -1;
          line(midx, midy, midx+3, midy+3);
          line(midx+5, midy+5, midx+8, midy+8);
          line(midx+10, midy+10, midx+13, midy+13);
          line(midx+16, midy+16,midx+18, midy+18);
          line(midx+20, midy+20,midx+24, midy+24);
          line(midx+27, midy+27,midx+35, midy+35);
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
        alph += 4;
      }
    }
    drawMe();
  }
}



