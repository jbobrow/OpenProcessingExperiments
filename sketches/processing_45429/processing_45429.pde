
boolean pressed=false, showorbs = false, showlines = true, showmids = true;
Orb orbs[] = {};
float dis;

void setup() {
  size(854, 480);
  background(200, 100, 0);
  noStroke();
  smooth();
  frameRate(24);
  text("created by ChristianGeick 2011", width-200, height-50);
}

void draw() {
  if(pressed) {
    fill(255,212,98, 50);
    rect(0,0,width,height);
    fill(252,125,73);
    rect(0,0,40,35);
    rect(0,40,40,35);
    rect(0,80,40,35);
    fill(0);
    if(showorbs) {
      text("hide", 5,15);
    } else {
      text("show", 5,15);
    }
    text("orbs", 7,30);
    if(showlines) {
      text("hide", 8,55);
    } else {
      text("show", 5,55);
    }
    text("lines", 7,70);
    if(showmids) {
      text("hide", 8,95);
    } else {
      text("show", 5,95);
    }
    text("mids", 7,110);
  }
  
  for (int i=0;i<orbs.length;i++) {
    orbs[i].mov();
    if(showorbs) {
      orbs[i].paint();
    }
    orbs[i].collide();
  }
}

class Orb {
  float x, y, xspeed, yspeed, rad, trans;
  boolean touch;

  Orb() {
    rad = random(35)+5;
    trans = 255;
    xspeed = random(10)-5;
    yspeed = random(10)-5;
    if(xspeed == 0) {
      xspeed++;
    }
    if(yspeed == 0) {
      yspeed++;
    }
    x = random(rad, width-rad);
    y = random(rad, height-rad);
  }
  
  void mov() {
    x += xspeed;
    y += yspeed;
    if(x-rad<0 || x+rad>width) {
      xspeed *= -1;
    }
    if(y-rad<0 || y+rad>height) {
      yspeed *= -1;
    }
  }

  void paint() {
    fill(63,22,27, trans);
    fill(122,22,49, trans);
    ellipse(x, y, rad*2, rad*2);
  }
  
  void collide() {
    touch = false;
    for (int i=0;i<orbs.length;i++) {
      Orb other = orbs[i];
      if(other!=this) {
        dis = dist(other.x, other.y, x, y)-other.rad-rad;
        if(showlines && dis < 75) {
          stroke(252,125,73, 200);
          line(other.x, other.y, x, y);
          noStroke();
        }
        if(showmids && dis < 0 && trans > 0) {
          touch = true;
          fill(207,66,60);
          ellipse((other.x+x)/2, (other.y+y)/2, dis, dis);
        }
      } 
    }
    if(touch && trans > 20) {
      trans-=2;
    }
    if(!touch && trans < 200) {
      trans+=5;
    }
  }
}

void mouseClicked() {
  if(!pressed) {
    background(255,212,98);
    pressed = true;
  }
  orbs = (Orb[])append(orbs, new Orb());
  orbs = (Orb[])append(orbs, new Orb());
  println(orbs.length);
  
  if(mouseX>=0 && mouseX<=40) {
    if (mouseY>=0 && mouseY<=35) {
      if(showorbs) {
        showorbs=false;
      } else {
        showorbs=true;
      }
    }
    if (mouseY>=40 && mouseY<=75) {
      if(showlines) {
        showlines=false;
      } else {
        showlines=true;
      }
    }
    if (mouseY>=80 && mouseY<=115) {
      if(showmids) {
        showmids=false;
      } else {
        showmids=true;
      }
    }
  }
}

