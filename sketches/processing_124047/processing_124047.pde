
//earthquiake fish can not run
//then they fall fell fallen
//by XinhanYen,Email:archi730@hotmail.com
int _num = 15;
reTang[] _reTangArr = {
};
void setup() {
  size(500, 700);
  background(255);
  strokeWeight(1);
  fill(150, 50);
  drawCircles();
}
void draw() {
  background(37, 78, 144, 98);
  for (int i=0; i<_reTangArr.length; i++) {
    reTang thisreTang = _reTangArr[i];
    thisreTang.updateMe();
  }
}
void mouseReleased() {
  drawCircles();
}
void drawCircles() {
  for (int i=0; i<_num; i++) {
    reTang thisreTang = new reTang();
    thisreTang.drawMe();
    _reTangArr =(reTang[])append(_reTangArr, 
    thisreTang);
  }
}

//

class reTang {
  float x, y;
  float edge;
  color linecol, fillcol;
  float alph;
  float xmove, ymove;
  reTang() {
    x = random(width);
    y = random(height);
    edge = random(60) + 10;
    linecol = color(random(255), random(255), random(255));
    fillcol = color(random(255)+50/*, random(255), random(255)*/);
    alph = random(100)+50;
    xmove = random(6) - 3;
    ymove = random(8) - 4;
  }
  void drawMe() {
    noStroke();
    fill(fillcol, alph);
    rect(x+random(5), y, edge/2, edge*2.5);
    rotate(random(PI/180)-0.5);
    stroke(50,78,144,random(50));
    strokeWeight(random(5));
    /*noFill();
     rect(x, y, 10+random(20), 10+random(10));*/
  }
  void updateMe() {
    x += xmove;
    y += ymove;
    if (x > (width-edge)) { 
      x =width-edge;
      xmove= -(xmove);
    }
    if (x < (edge)) { 
      x = edge;
      xmove= -(xmove);
    }
    if (y > (height-edge)) { 
      y = height-edge;
      /*ymove= -(ymove+10);*/
    }
    if (y < (edge)) { 
      y = edge-5;
      ymove= -(ymove/2-10);
    }

    boolean touching = false;
    for (int i=0; i<_reTangArr.length; i++) {
      reTang otherreTang = _reTangArr[i];
      if (otherreTang != this) {
        float dis = dist(x, y, otherreTang.x, otherreTang.y);
        float overlap = dis - edge - otherreTang.edge;
        if (overlap < 0) {
          float midx, midy;
          midx = (x + otherreTang.x)/2;
          midy = (y + otherreTang.y)/2;

          stroke(linecol, 80);
          fill(fillcol);
          overlap *= -1;
          ellipse(midx, midy, overlap+random(10), overlap+random(10));
        }
      }
    }
    drawMe();
  }
}



