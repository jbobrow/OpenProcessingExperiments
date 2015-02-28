
class Firework {
  float x,y,s;
  float targetx, targety, dx, dy, dis, e;
  float fireworksize, scrolls, fireworkvalue, angle, value, fireworktail;
  boolean collected, readytocollect, scroll;


  Firework () {
    x = random (40, width-40);
    y = -5000;
    scrolls = random (1, 1.2);
    fireworksize = random (80,100);
    collected = false;
    readytocollect = false;
    scroll = false;

  }

  void display () {
    angle += random (0.008,0.08);
    value = map(cos(angle),-1,1,0,fireworksize);

    if (collected == false) {
      if (x <= width/2) {
        fireworktail = -width;
      }
      else {
        fireworktail = width;
      }
      beginShape();
      strokeWeight(0.5);
      stroke(100);
      noFill();
      vertex(x,y);
      bezierVertex(x+fireworktail,y,x+fireworktail,y+height*4,x+fireworktail,y+height*2);
      endShape();
      noStroke();
      for (float s = value; s > 0; s -= 10) {
        fill(245, 35, 172, 50);
        ellipse (x, y, s, s);
      }
    }
  }

  void scroll () {
    if (level == 1) {
      scroll = true;
      if (collected == false && scroll == true && level == 1) {
        y += scrolls;
      }
    }
  }

  void collect () {
    dis = dist(gobi.x,gobi.y,x,y);
    if (abs(dis) <= 20 && collected == false) {
      fireworkvalue = map (value, 0, fireworksize, 0, 325);
      collected = true;
      C ++;
      E += fireworkvalue;
    }
  }

  void reset () {
    if (start == true) {
      x = random (40, width-40);
      y = -5000;
      scrolls = random (1,1.2);
      fireworksize = random (70,80);
      collected = false;
      readytocollect = false;
      scroll = false;
      E = 150;
      C = 0;
      B1Y = -3000;
      B2Y = -6753;
      e1x = random(width/2,width);
      e1y = random(-11300,-11000);
      e2x = random(100,width-100);
      e2y = random(-11000,-10000);
      e3x = random(0,width/2);
      e3y = random(-10000,-9900);
    }
  }







}




