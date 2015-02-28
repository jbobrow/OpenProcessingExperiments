
import netscape.javascript.*;

int x = 640;
int d = 6;
boolean sw1, sw2, sw3, sw4, sw5 = false;
PFont f;
void setup() {
  size(640, 480); 
  background(0);
  sw1 = true;
}

void draw () {
  if (sw1) {
    fill(0, 0, 0, 50);
    strokeWeight(0);
    rect(0, 0, 640, 350);

    fill(255);
    ellipse(x, 220, 8, 6);

    if (x > 280) {
      x -=5;
    }
    else {
      fill(0);
      strokeWeight(0);
      rect(0, 0, 640, 350);
      pushStyle();
      stroke(255);
      strokeWeight(4);
      smooth();
      noFill();
      ellipse(280, 220, d, d);
      popStyle();

      if (d < 80) {
        d = d+2;
      }
      else {
        pushStyle();
        for (int i=0; i < 20; i++) {
          noFill();
          stroke(255, 0, 0, 40-(2*i));
          strokeWeight(1);
          ellipse(280, 220, 85+i, 85+i);
          strokeWeight(4);
          stroke(255);
          ellipse(280, 220, 80, 80);
        }
        popStyle();
        sw1 = false;
        sw2 = true;
        x = 640;
        d = 6;
      }
    }
  }

  if (sw2) {
    fill(0, 0, 0, 50);
    strokeWeight(0);
    rect(0, 0, 640, 350);
    pushStyle();
    stroke(255);
    strokeWeight(4);
    smooth();
    for (int i=0; i < 20; i++) {
      noFill();
      stroke(255, 0, 0, 40-(2*i));
      strokeWeight(1);
      ellipse(280, 220, 85+i, 85+i);
      strokeWeight(4);
      stroke(255);
      ellipse(280, 220, 80, 80);
    }
    popStyle();

    fill(255);
    ellipse(x, 220, 8, 6);

    if (x > 370) {
      x -=5;
    }
    else {
      fill(0);
      strokeWeight(0);
      rect(0, 0, 640, 350);
      pushStyle();
      stroke(255);
      strokeWeight(4);
      smooth();
      noFill();
      ellipse(280, 220, 80, 80);
      strokeWeight(4);
      smooth();
      ellipse(370, 220, d, d);
      popStyle();
      if (d < 80) {
        d = d+2;
      }
      else {
        pushStyle();

        popStyle();
        sw2 = false;
        sw3 = true;
        x = 640;
        d = 6;
      }
    }
  }
  if (sw3) {
    fill(0, 0, 0, 50);
    strokeWeight(0);
    rect(0, 0, 640, 350);
    pushStyle();
    stroke(255);
    strokeWeight(4);
    smooth();
    ellipse(280, 220, 80, 80);
    ellipse(370, 220, 80, 80);
    popStyle();

    fill(255);
    ellipse(x, 165, 8, 6);

    if (x > 240) {
      x -=5;
    }
    else {
      fill(0);
      strokeWeight(0);
      rect(0, 0, 640, 350);
      pushStyle();
      stroke(255);
      strokeWeight(4);
      smooth();
      noFill();
      ellipse(280, 220, 80, 80);
      ellipse(370, 220, 80, 80);
      strokeWeight(4);
      smooth();
      ellipse(240, 165, d, d);
      popStyle();
      if (d < 80) {
        d = d+2;
      }
      else {
        pushStyle();

        popStyle();
        sw3 = false;
        sw4 = true;
        x = 640;
        d = 6;
      }
    }
  }
  if (sw4) {
    fill(0, 0, 0, 50);
    strokeWeight(0);
    rect(0, 0, 640, 350);
    pushStyle();
    stroke(255);
    strokeWeight(4);
    smooth();
    ellipse(280, 220, 80, 80);
    ellipse(370, 220, 80, 80);
    ellipse(240, 165, 80, 80);
    popStyle();

    fill(255);
    ellipse(x, 165, 8, 6);

    if (x > 325) {
      x -=5;
    }
    else {
      fill(0);
      strokeWeight(0);
      rect(0, 0, 640, 350);
      pushStyle();
      stroke(255);
      strokeWeight(4);
      smooth();
      noFill();
      ellipse(280, 220, 80, 80);
      ellipse(370, 220, 80, 80);
      ellipse(240, 165, 80, 80);
      strokeWeight(4);
      smooth();
      ellipse(325, 165, d, d);
      popStyle();
      if (d < 80) {
        d = d+2;
      }

      else {
        pushStyle();

        popStyle();
        sw4 = false;
        sw5 = true;
        x = 640;
        d = 6;
      }
    }
  }


  if (sw5) {
    fill(0, 0, 0, 50);
    strokeWeight(0);
    rect(0, 0, 640, 350);
    pushStyle();
    stroke(255);
    strokeWeight(4);
    smooth();
    ellipse(280, 220, 80, 80);
    ellipse(370, 220, 80, 80);
    ellipse(240, 165, 80, 80);
    ellipse(325, 165, 80, 80);
    popStyle();

    fill(255);
    ellipse(x, 165, 8, 6);

    if (x > 410) {
      x -=5;
    }
    else {
      fill(0);
      strokeWeight(0);
      rect(0, 0, 640, 350);
      pushStyle();
      stroke(255);
      strokeWeight(4);
      smooth();
      noFill();
      ellipse(280, 220, 80, 80);
      ellipse(370, 220, 80, 80);
      ellipse(240, 165, 80, 80);
      ellipse(325, 165, 80, 80);
      strokeWeight(4);
      smooth();
      ellipse(410, 165, d, d);
      popStyle();
      if (d < 80) {
        d = d+2;
      }
      f = createFont("Arial", 40, true);
      fill (247, 4, 84);
      textFont (f);
      text ("Winner 2012", 220, 350);
    }
  }
}


