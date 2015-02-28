
colorSelect[] _colorArr = {};
circleMemoly[] _memoArr = {};

void setup() { 
  size(1000, 600);
  background(255);
  smooth();
  colorMode(HSB);
  frameRate(30);
  translate(width/2, height/2);
  rectMode(CENTER);
  textSize(40);
  textAlign(CENTER);
  strokeWeight(5);
  drawCircle();
}

void draw() {
  background(255);
  translate(width/2, height/2);
  _colorArr[0].drawH(0, 0);
  _colorArr[0].drawS(-220, 40);
  _colorArr[0].drawB(220, 40);
  _colorArr[0].circle();
}

void drawCircle() {
  colorSelect thiscolor = new colorSelect(100);
  noStroke();
  _colorArr = (colorSelect[])append(_colorArr, thiscolor);
}

class colorSelect {
  float H, S, B;
  int count=0;
  boolean check1;
  float diameter;
  colorSelect(float dia) {
    H=0;
    S=255;
    B=255;
    check1=false;
    diameter = dia;
  }

  void colorChange(float a, float b, float c) {
    H=a;
    S=b;
    B=c;
  }

  void drawH(float x, float y) {
    translate(x, y);
    float distance= dist(width/2+x, height/2+y, mouseX, mouseY);
    if (check1==false) {
      if (mousePressed==true) {
        if (distance>diameter*0.425 && distance<diameter*1.2) {
          colorChange((180/PI*atan2( -mouseY + height/2+y, -mouseX+width/2+x )+180)/360*255, S, B);
        }
      }
    }
    stroke(H, S, B);
    line(0, 0, 0-x, height/3-y);
    line(0, 0, diameter*cos(radians(H*360/255)), diameter*sin(radians(H*360/255)));
    fill(0, 0, 255);
    ellipse(0, 0, diameter*0.85, diameter*0.85);
    fill(0, 255, 0);
    textSize(diameter*0.4);
    text(int(H), 0, diameter*0.15);
    noStroke();
    for (int i=0; i<360; i++) {
      fill(255*i/360, S, B);
      pushMatrix();
      rotate(radians(i));
      rect(diameter, 0, diameter/5, 3);
      popMatrix();
    }
    fill(H, S, B);
    pushMatrix();
    rotate(radians(H/255*360));
    // ellipse(diameter,0,diameter*0.4,diameter*0.4);
    popMatrix();
    translate(-x, -y);
  }

  void drawS(float x, float y) {
    translate(x, y);
    float distance= dist(width/2+x, height/2+y, mouseX, mouseY);
    if (check1==false) {
      if (mousePressed==true) {
        if (distance>diameter*0.425 && distance<diameter*1.2) {
          colorChange(H, (180/PI*atan2( -mouseY + height/2+y, -mouseX+width/2+x )+180)/360*255, B);
        }
      }
    }
    stroke(H, S, B);
    line(0, 0, 0-x, height/3-y);
    line(0, 0, diameter*cos(radians(S*360/255)), diameter*sin(radians(S*360/255)));
    fill(0, 0, 255);
    ellipse(0, 0, diameter*0.85, diameter*0.85);
    fill(0, 255, 0);
    textSize(diameter*0.4);
    text(int(S), 0, diameter*0.15);
    noStroke();
    for (int i=0; i<360; i++) {
      fill(H, 255*i/360, B);
      pushMatrix();
      rotate(radians(i));
      rect(diameter, 0, diameter/5, 3);
      popMatrix();
    }
    fill(H, S, B);
    pushMatrix();
    rotate(radians(S/255*360));
    // ellipse(diameter,0,diameter*0.4,diameter*0.4);
    popMatrix();
    translate(-x, -y);
  }

  void drawB(float x, float y) {
    translate(x, y);
    float distance= dist(width/2+x, height/2+y, mouseX, mouseY);
    if (check1==false) {
      if (mousePressed==true) {
        if (distance>diameter*0.425 && distance<diameter*1.2) {
          colorChange(H, S, (180/PI*atan2( -mouseY + height/2+y, -mouseX+width/2+x )+180)/360*255);
        }
      }
    }
    stroke(H, S, B);
    line(0, 0, 0-x, height/3-y);
    line(0, 0, diameter*cos(radians(B*360/255)), diameter*sin(radians(B*360/255)));
    fill(0, 0, 255);
    ellipse(0, 0, diameter*0.85, diameter*0.85);
    fill(0, 255, 0);
    textSize(diameter*0.4);
    text(int(B), 0, diameter*0.15);
    noStroke();
    for (int i=0; i<360; i++) {
      fill(H, S, 255*i/360);
      pushMatrix();
      rotate(radians(i));
      rect(diameter, 0, diameter/5, 3);
      popMatrix();
    }
    fill(H, S, B);
    pushMatrix();
    rotate(radians(B/255*360));
    // ellipse(diameter,0,diameter*0.4,diameter*0.4);
    popMatrix();
    translate(-x, -y);
  }

  void circle() {
    fill(H, S, B);
    ellipse(0, height/3, 80, 80);
    float distance=dist(width/2, height*5/6, mouseX, mouseY);
    if (mousePressed==true) {
      if (distance<40) {
        check1 = true;
      }
      if (check1 == true) {
        fill(H, S, B, 140);
        ellipse(mouseX-width/2, mouseY-height/2, 80, 80);
      }
    }
    else {
      if (check1==true && mouseY<200) {
        count++;
        circleMemoly thisMemo = new circleMemoly(H, S, B, count);
        _memoArr = (circleMemoly[])append(_memoArr, thisMemo);
      }
      check1 = false;
    }
    if (count>0) {
      for (int i=0;i<_memoArr.length;i++) {
        _memoArr[i].memoDraw();
      }
    }
  }
}

class circleMemoly {
  float h, s, b, count;
  circleMemoly(float H, float S, float B, int Count) {
    h=H;
    s=S;
    b=B;
    count=Count;
  }
  void memoDraw() {
    fill(h, s, b);
    float memoX=25+(1+count)*50-width/2;
    float memoY=25-height/2;
    ellipse(memoX, memoY, 50, 50);
    if (dist(memoX, memoY, mouseX-width/2, mouseY-height/2)<25) {
      fill(0, 255, 0);
      text(int(h), memoX, memoY+60);
      text(int(s), memoX, memoY+100);
      text(int(b), memoX, memoY+140);
      text("H:", memoX - 60,memoY+60);
      text("S:", memoX - 60,memoY+100);
      text("B:" ,memoX - 60,memoY+140);
    }
  }
}

