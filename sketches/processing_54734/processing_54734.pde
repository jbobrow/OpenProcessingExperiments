
class Robot {
  private float   xpos, ypos, eye;
  private int     orient, lspd, lcount;
  private color   rcolor;
  private boolean laser;
  Robot() {
    xpos = random(0, width);
    ypos = random(0, height);
    orient = int(random(0, 10))%2;
    rcolor = color(random(0, 255), random(0, 255), random(0, 255));
    laser = true;
    eye = random(10, 30);
    lspd = 0;
    lcount = 0;
  }

  Robot(float x, float y, int o, color rc, boolean lsr, float e) {
    xpos = x;
    ypos = y;
    orient = o;
    rcolor = rc;
    laser = lsr;
    eye = e;
  }

  void drawRobot() {
    pushMatrix();
    translate(xpos, ypos);
    if (orient==1)
      scale(-1, 1);

    //head
    stroke(0);
    strokeWeight(2);
    fill(rcolor);
    rect(-10, 0, 55, 55);
    rect(-20, 50, 90, 100);
    fill(255);
    ellipse(5, 20, eye, eye);

    //body
    fill(rcolor);
    stroke(0);
    strokeWeight(50);
    line(-10, 160, 60, 160);
    strokeWeight(40);
    stroke(255);
    line(-10, 160, 60, 160);
    fill(255);

    //wheels
    stroke(0);
    strokeWeight(2);
    fill(0);
    ellipse(0, 160, 40, 40);
    ellipse(50, 160, 40, 40);
    fill(255);
    ellipse(0, 160, 20, 20);
    ellipse(50, 160, 20, 20);

    //arms
    fill(rcolor);
    rect(-60, 80, 80, 20);
    ellipse(-60-10, 80+10, 20, 20); 
    fill(255);
    popMatrix();
  }

  void update() {
    if (orient == 0)
      xpos = xpos-1;
    if (orient == 1)
      xpos = xpos+1;
  }

  void wrapAround() {
    if (orient == 0 && xpos+100 < 0) {
      xpos = width;
    } 
    if (orient == 1 && xpos-100 > width) {
      xpos = 0;
    }
  }

  void shootLaser() {
    lcount++;
    
    if (orient == 0 && laser && lcount >= 120) {
      strokeWeight(15);
      line(xpos-60-lspd, ypos+20, xpos-10-lspd, ypos+20);
      strokeWeight(10);
      stroke(255);
      line(xpos-60-lspd, ypos+20, xpos-10-lspd, ypos+20);
      stroke(0);
      lspd += 2;
      strokeWeight(2);
      if (lcount == 240) {
        lcount = 0;
        lspd = 0;
      }
    }
    if (orient == 1 && laser && lcount >= 120) {
      pushMatrix();
      strokeWeight(15);
      line(xpos+60+lspd, ypos+20, xpos+10+lspd, ypos+20);
      strokeWeight(10);
      stroke(255);
      line(xpos+60+lspd, ypos+20, xpos+10+lspd, ypos+20);
      stroke(0);
      lspd += 2;
      popMatrix();
      strokeWeight(2);
      if (lcount == 240) {
        lcount = 0;
        lspd = 0;
      }
    }
  }
}

