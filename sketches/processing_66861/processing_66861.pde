
import netscape.javascript.*;

int x = 640;
int d = 6;
boolean sw1, sw2, sw3, sw4, sw5 = false;
PFont f;
boolean blinkSwitch = false;
float blinkFrame = 0;

void setup() {
  size(640, 480); 
  background(0);
  frameRate(30);
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
    stroke(0);
    rect(0, 0, 640, 350);
    pushStyle();
    stroke(255);
    strokeWeight(4);
    smooth();
    pushStyle();
    ellipse(280, 220, 80, 80);
    popStyle();

    fill(255);
    ellipse(x, 220, 8, 6);

    if (x > 370) {
      x -=5;
    }
    else {
      fill(0);
      strokeWeight(0);
      stroke(0);
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
    stroke(0);
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
      else {
        sw5 = false;
        x = 640;
        d = 6;
        f = createFont("Arial", 40, true);
        fill (247, 4, 84);
        textFont (f);
        text ("Winner 2012", 220, 350);
        blinkFrame = frameCount + 25;
      }
    }
  }

  if (!sw1 && !sw2 && !sw3 && !sw4 && !sw5) {
    println(blinkFrame + ":" + frameCount + ":" + blinkSwitch);
    if (blinkFrame < frameCount) {
      blinkSwitch = !blinkSwitch;
      blinkFrame = frameCount + 20;
    }

    pushStyle();
    for (int i=0; i < 20; i++) {
      noFill();
      //Yellow
      if (blinkSwitch) {
        stroke(255, 198, 0, 20-(i));
      }
      else {
        stroke(0);
      }
      strokeWeight(1);
      ellipse(280, 220, 85+i, 85+i);
      
      noFill();
      //Green
      if (blinkSwitch) {
        stroke(90, 255, 0, 20-(i));
      }
      else {
        stroke(0);
      }
      strokeWeight(1);
      ellipse(370, 220, 85+i, 85+i);
      
      noFill();
      //Blue
      if (blinkSwitch) {
        stroke(0, 180, 255, 20-(i));
      }
      else {
        stroke(0);
      }
      strokeWeight(1);
      ellipse(240, 165, 85+i, 85+i);
      
      noFill();
      //White
      if (blinkSwitch) {
        stroke(255, 255, 255, 20-(i));
      }
      else {
        stroke(0);
      }
      strokeWeight(1);
      ellipse(325, 165, 85+i, 85+i);
      
      noFill();
      //Red
      if (blinkSwitch) {
        stroke(255, 0, 36, 20-(i));
      }
      else {
        stroke(0);
      }
      strokeWeight(1);
      ellipse(410, 165, 85+i, 85+i);
      
      strokeWeight(4);
      stroke(255);
      ellipse(280, 220, 80, 80);
      ellipse(370, 220, 80, 80);
      ellipse(240, 165, 80, 80);
      ellipse(325, 165, 80, 80);
      ellipse(410, 165, 80, 80);
    }
    popStyle();
  }
}


