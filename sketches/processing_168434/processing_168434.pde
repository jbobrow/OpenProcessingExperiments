
int _initnum = 70;
int _addnum;
int _maxnum = 110;
color _linecol;
color _fillcol;
color _bgcol;
int _colorid = 1;
Circle[] _circleArr = {
};
void setup() {
  size(854, 480);
  colorMode(HSB, 360, 100, 100, 256);
  frameRate(30);
  smooth();
  makeCircles();
}

void draw() {
  background(_bgcol);
  for (int i=0; i<_circleArr.length; i++) {
    Circle thisCirc = _circleArr[i];
    thisCirc.updateMe(i);
  }
  colorset();
}

void mouseReleased() {
  switch(_colorid) {
  case 1:
    _colorid = 2;
    break;
  case 2:
    _colorid = 3;
    break;
  case 3:
    _colorid = 4;
    break;
  case 4:
    _colorid = 1;
    break;
  }
  _addnum = int(random(-50, 50));
  addCircles();
}

void colorset() {
  if (_colorid == 1) {
    _linecol = color(200, 30, 90);
    _fillcol = color(330, 60, 90, 220);
    _bgcol = color(200, 5, 100);
  }
  if (_colorid == 2) {
    _linecol = color(67, 12, 45);
    _fillcol = color(186, 51, 78, 220);
    _bgcol = color(10, 38, 35);
  }  
  if (_colorid == 3) {
    //_linecol = color(120, 5, 70);
    _linecol = color(60, 55, 78);
    _fillcol = color(100, 45, 80, 220);
    _bgcol = color(55, 7, 100);
  }
  if (_colorid == 4) {
    _linecol = color(152, 3, 80);
    _fillcol = color(315, 45, 66, 220);
    _bgcol = color(55, 24, 68);
  }
}

void makeCircles() {
  for (int i=0; i<_initnum; i++) {
    Circle thisCirc = new Circle();
    thisCirc.drawMe();
    _circleArr = (Circle[])append(_circleArr, thisCirc);
  }
}

void addCircles() {
  if (_addnum > 0) {
    if (_circleArr.length+_addnum < _maxnum) {
      for (int i=0; i<_addnum; i++) {
        Circle thisCirc = new Circle();
        thisCirc.drawMe();
        _circleArr = (Circle[])append(_circleArr, thisCirc);
      }
    }
    if(_circleArr.length > _addnum){
      for (int i=0; i<_addnum; i++) {
        _circleArr = (Circle[])shorten(_circleArr);
      }
    }
  }
  else {
    if ((_circleArr.length+_addnum)>3) {
      for (int i=0; i<(0-_addnum); i++) {
        _circleArr = (Circle[])shorten(_circleArr);
      }
    }
    else {
      for (int i=0; i<(0-_addnum); i++) {
        Circle thisCirc = new Circle();
        thisCirc.drawMe();
        _circleArr = (Circle[])append(_circleArr, thisCirc);
      }
    }
  }
}

class Circle {
  float x, y;
  float radius;
  float alph;
  float xmove, ymove;
  float lineweight;

  Circle() {
    x = random(200,width-200);
    y = random(height);
    radius = random(5, 80);
    lineweight = 1;
    alph = random(100, 255);
    xmove = random(-1, 1);
    ymove = random(0, 3)+sq(radius)/1500;
  }

  void drawMe() {
    strokeWeight(lineweight);
    stroke(_linecol);
    noFill();
    ellipse(x, y, radius*2, radius*2);
  }

  void updateMe(int me) {
    x += xmove;
    y += ymove;
    if (x > (width+radius)) {
      x=0-radius;
    }
    if (x < (0-radius)) {
      x = width+radius;
    }
    if (y > (height+radius)) {
      y = 0 - radius;
    }
    if (y < (0-radius)) {
      y = height+radius;
    }
    drawMe();
    for (int i=(me+1); i<_circleArr.length; i++) {
      Circle otherCirc = _circleArr[i];
      if (otherCirc != this) {
        float dis = dist(x, y, otherCirc.x, otherCirc.y);
        float overlap = radius + otherCirc.radius - dis;
        if (overlap > 0) {
          float midx, midy;
          midx = x + (otherCirc.x - x) * (radius - overlap / 2) / dis;
          midy = y + (otherCirc.y - y) * (radius - overlap / 2) / dis; 
          fill(color(_fillcol));
          noStroke();
          ellipse(midx, midy, overlap, overlap);
        }
      }
    }
  }
}



