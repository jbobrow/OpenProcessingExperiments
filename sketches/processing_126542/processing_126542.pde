
//Assignment_6_Fall_Falling_Fallen
//N76014087 TePangChiang
//Falling lines combine together

int _num = 5;
Square[] _SquareArr = {
};

void setup() {
  size(500, 500);
  smooth();
  strokeWeight(2);
  fill(150, 50);
  drawSquare();
}

void draw() {
  background(0);
  for (int i=0; i<_SquareArr.length; i++) {
    Square thisSquare = _SquareArr[i];
    thisSquare.updateMe();
  }
}

void mouseReleased() {
  drawSquare();
}

void drawSquare() {
  for (int i=0; i<_num; i++) {
    Square thisSquare = new Square();
    thisSquare.drawMe();
    _SquareArr =(Square[])append(_SquareArr, 
    thisSquare);
  }
}

class Square {
  float x, y;
  float Length;
  color linecol, fillcol;
  float alph;
  float xmove, ymove;

  Square() {
    x = random(80, width-80);
    y = random(80, height-80);
    Length = random(70) + 10;
    linecol = color(random(255), random(255), random(255));
    fillcol = color(random(35, 50), random(80, 100), random(90, 115));
    alph = random(10, 30);
    xmove = random(8, 12)-5;
    ymove = random(8, 12)-5;
  }
  void drawMe() {
    rectMode(CENTER);
    noStroke();
    fill(fillcol, alph);
    rect(x, y, Length*2, Length*2);
    stroke(linecol, 150);
    noFill();
    //ellipse(x, y, 10, 10);
  }
  void updateMe() {
    x += xmove;
    y += ymove;
    if (x > (width-Length)) { 
      xmove = -xmove;
    }
    if (x < (Length)) { 
      xmove = -xmove;
    }
    if (y > (height-Length)) { 
      ymove = -ymove;
    }
    if (y < (Length)) { 
      ymove = -ymove;
    }
    boolean touching = false;
    for (int i=0; i<_SquareArr.length; i++) {
      Square otherSquare = _SquareArr[i];
      if (otherSquare != this) {
        float dis = dist(x, y, otherSquare.x, otherSquare.y);
        float overlap = dis - Length - otherSquare.Length;
        if (overlap < 0) {
          float midx, midy;
          midx = (x + otherSquare.x)/2;
          midy = (y + otherSquare.y)/2;
          stroke(random(150, 250), 0, 0, random(50, 100));
          strokeWeight(random(2,4));
          line(midx, 0, midx, otherSquare.y);
          line(midx, midy, otherSquare.x, otherSquare.y);
          overlap *= -1;
          stroke(random(150, 250), random(50, 100));
          strokeWeight(random(1,2));
          noFill();
          rect(midx, midy, overlap, overlap);
        }
      }
    }
    drawMe();
  }
}



