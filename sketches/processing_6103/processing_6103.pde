
class Robot {

  float h, h1, targetH, easingH = 0.5;
  float e, e1, targetE, easingE = 0.034;
  float angle = 0.0;
  int x, z, y = 338;
  int xpos, ypos;
  boolean jitter;
  int eyePos;

  // Constructor
  Robot(int xpos1, int ypos1) {
    xpos = xpos1;
    ypos = ypos1;
  }

  void easing() {
    targetH = h1;
    h = h + ((targetH - h) * easingH);
    targetE = e1;
    e = e + ((targetE - e) * easingE);
  }

  void scared() {
    if(dist(r1.h, 0, r2.h, 0) > 47) {
      jitter = true;
    }
    else {
      jitter = false;
    }
  }

  void display(int neckwidth, int neckpos, float antennaAngle, int musicBotPos, int eyePos, int antenna, boolean musicBot) {

    pushMatrix();
    translate(xpos, ypos);

    if(jitter == true) {
      translate(random(-2, 2), 0);
    }

    // neck
    strokeWeight(neckwidth);
    stroke(80);
    line(h, 202, 0, y);
    strokeWeight(4);
    stroke(0);
    line(h+neckpos, 202, neckpos, y+musicBotPos);
    line(h-neckpos, 202, -neckpos, y+musicBotPos);

    // head
    h1 = map(mouseX, 0, 320, 0, 50);
    shape(head_, h-72.5, 142-musicBotPos); 

    // head opening
    shape(cupholder, h-24.5, 107-musicBotPos); 

    // buttons
    pushMatrix();
    noStroke();
    if(musicBot == true && mouseX < 200) {
      float q = map(mouseX, 0, constrain(mouseX, 200, 320), 255, 0);
      fill(random(0, 255), random(0, 255), random(0, 255), q);
      rect(h-9+eyePos, 226-musicBotPos, 5, 5);
      fill(random(0, 255), random(0, 255), random(0, 255), q);
      rect(h-0+eyePos, 226-musicBotPos, 5, 5);
      fill(random(0, 255), random(0, 255), random(0, 255), q);
      rect(h+9+eyePos, 226-musicBotPos, 5, 5);
      fill(random(0, 255), random(0, 255), random(0, 255), q);
      rect(h-9+eyePos, 235-musicBotPos, 5, 5);
      fill(random(0, 255), random(0, 255), random(0, 255), q);
      rect(h-0+eyePos, 235-musicBotPos, 5, 5);
      fill(random(0, 255), random(0, 255), random(0, 255), q);
      rect(h+9+eyePos, 235-musicBotPos, 5, 5);
      fill(random(0, 255), random(0, 255), random(0, 255), q);
      rect(h-9+eyePos, 244-musicBotPos, 5, 5);
      fill(random(0, 255), random(0, 255), random(0, 255), q);
      rect(h-0+eyePos, 244-musicBotPos, 5, 5);
      fill(random(0, 255), random(0, 255), random(0, 255), q);
      rect(h+9+eyePos, 244-musicBotPos, 5, 5);
    }
    else if(musicBot == false && mouseX > 200) {
      float q = map(mouseX, constrain(mouseX, 0, 200), 320, 0, 255);
      fill(random(0, 255), random(0, 255), random(0, 255), q);
      rect(h-9+eyePos, 226-musicBotPos, 5, 5);
      fill(random(0, 255), random(0, 255), random(0, 255), q);
      rect(h-0+eyePos, 226-musicBotPos, 5, 5);
      fill(random(0, 255), random(0, 255), random(0, 255), q);
      rect(h+9+eyePos, 226-musicBotPos, 5, 5);
      fill(random(0, 255), random(0, 255), random(0, 255), q);
      rect(h-9+eyePos, 235-musicBotPos, 5, 5);
      fill(random(0, 255), random(0, 255), random(0, 255), q);
      rect(h-0+eyePos, 235-musicBotPos, 5, 5);
      fill(random(0, 255), random(0, 255), random(0, 255), q);
      rect(h+9+eyePos, 235-musicBotPos, 5, 5);
      fill(random(0, 255), random(0, 255), random(0, 255), q);
      rect(h-9+eyePos, 244-musicBotPos, 5, 5);
      fill(random(0, 255), random(0, 255), random(0, 255), q);
      rect(h-0+eyePos, 244-musicBotPos, 5, 5);
      fill(random(0, 255), random(0, 255), random(0, 255), q);
      rect(h+9+eyePos, 244-musicBotPos, 5, 5);
    }

    shapeMode(CENTER);
    shape(buttons, h-0+eyePos, 235-musicBotPos);
    shapeMode(CORNER);
    popMatrix();
    stroke(0);

    // antenna
    pushMatrix();
    strokeWeight(5);
    translate(h+antenna, 161-musicBotPos);
    rotate((PI - antennaAngle/5) - antennaAngle * mouseY / 3000);
    line(0, 0, 0, 60);

    // red light
    translate(0, 60);
    strokeWeight(2);
    fill(237, 34, 36);
    ellipse(0, 0, 10, 10);
    if(musicBot == true && mouseX < 100){
      fill(0, 255, 0, map(mouseX, 0, constrain(mouseX, 100, 320), 255, 0));
    }
    else if(musicBot == false && mouseX > 300){
      fill(0, 255, 0, map(mouseX, constrain(mouseX, 0, 300), 320, 0, 255));
    }
    ellipse(0, 0, 10, 10);
    popMatrix();


    // MUSIC BOT
    if(musicBot == true) {

      // eyes
      if(mouseX < 20) {
        fill(255, 0, 0);
      }
      else if(mouseX > 300) {
        fill(0, random(0, 255));
      }
      else {
        fill(246, 235, 22);
      }
      strokeWeight(2);
      ellipse(h-42+eyePos, 220-musicBotPos, 17, map(mouseX, 0, 320, 10, 17));
      ellipse(h+45+eyePos, 220-musicBotPos, 17, map(mouseX, 0, 320, 10, 17));

      // eye shade
      noStroke();
      fill(255, 200);
      ellipse(h-39+eyePos, 219-musicBotPos, map(mouseX, 0, 320, 3, 7), map(mouseX, 0, 320, 3, 7));
      ellipse(h+48+eyePos, 219-musicBotPos, map(mouseX, 0, 320, 3, 7), map(mouseX, 0, 320, 3, 7));
      stroke(0);

      // box
      strokeWeight(2);
      pushMatrix();
      translate(0, 275);
      fill(50);
      rectMode(CENTER);
      rect(0, 0, 60, 60);

      // cd
      strokeWeight(1);
      fill(200);
      shapeMode(CENTER);
      if(mouseX < 300) {
        fill(random(0, 255), random(0, 255), random(0, 255));
      }
      rotate(angle);
      ellipse(0, 0, 50, 50);
      shape(cd, 0, 0, 50, 50);
      //angle = angle - map(mouseY, 0, 480, .01, .2);
      angle = angle - map(mouseX, 0, 320, .2, .01);
      shapeMode(CORNER);
      fill(255);
      ellipse(0, 0, 17, 17);
      fill(50);
      ellipse(0, 0, 7, 7);
      noFill();
      ellipse(0, 0, 50, 50);
      popMatrix();

      // speaker
      shapeMode(CENTER);
      pushMatrix();
      translate(0, y+musicBotPos); 
      float r = map(mouseX, 0, 320, random(102, 120), random(83, 93));
      //float r = map(mouseY, 0, 480, random(83, 93), random(102, 120));
      shape(speaker, 0, 0, r, r);
      popMatrix();
      shapeMode(CORNER);

      // disco ball
      shapeMode(CENTER);
      strokeWeight(3);
      stroke(0);
      line(0, 140, 0, 88);
      strokeWeight(2);
      fill(random(100, 200));
      z = z + 1;
      if(z > 0) {
        ellipse(0, 88, 50, 50);
        shape(ball, 0, 88, 60, 60); 
      }  
      if(z > 3) {
        ellipse(0, 88, 50, 50);
        shape(ball1, 0, 88, 60, 60); 
      }  
      if(z > 6) {
        ellipse(0, 88, 50, 50);
        shape(ball2, 0, 88, 60, 60); 
      }  
      if(z > 9) {
        ellipse(0, 88, 50, 50);
        shape(ball3, 0, 88, 60, 60); 
      }  
      if(z > 12) {
        z = 0;
      }
      shapeMode(CORNER);

      if(mouseX < 100) {
        shape(music1, random(220, 225)-175, random(265, 266));
        shape(music2, random(50, 55)-130, random(248, 249));
        shape(music3, random(80, 85)-145, random(282, 285));
      }
    }
    else{

      // eyes
      if(mouseX > 300) {
        fill(255, 0, 0);
      }
      else{
        fill(246, 235, 22);
      }
      strokeWeight(2);
      ellipse(h-42+eyePos, 220-musicBotPos, 17, map(mouseX, 0, 320, 17, 10));
      ellipse(h+45+eyePos, 220-musicBotPos, 17, map(mouseX, 0, 320, 17, 10));

      // eye shade
      noStroke();
      fill(255, 200);
      ellipse(h-39+eyePos, 219-musicBotPos, map(mouseX, 0, 320, 7, 3), map(mouseX, 0, 320, 7, 3));
      ellipse(h+48+eyePos, 219-musicBotPos, map(mouseX, 0, 320, 7, 3), map(mouseX, 0, 320, 7, 3));
      stroke(0);

      // drink
      stroke(0);
      strokeWeight(0);

      color water = color (200, 255, 255, 150);
      fill(water);
      noStroke();
      beginShape();
      vertex(h-19, 128);
      bezierVertex(h-19, 128, h-8, 124, h-1, 125);
      bezierVertex(h+6, 126, h+8, 128, h+12, 126);
      bezierVertex(h+16, 125, h+20, 126, h+19, 128);
      bezierVertex(h+19, 128, h+14, 162, h+14, 162);
      bezierVertex(h+10, 163, h-5, 164, h-14, 162);
      bezierVertex(h-14, 162, h-19, 128, h-19, 128);
      endShape();

      beginShape();
      vertex(h-19, 128);
      bezierVertex(h-19, 128, h-8, 124, h-1, 125);
      bezierVertex(h+6, 126, h+8, 128, h+12, 126);
      bezierVertex(h+16, 125, h+20, 126, h+19, 128);
      bezierVertex(h+19, 128, h+20, 131, h+12, 131);
      bezierVertex(h+4, 131, h-1, 130, h-7, 132);
      bezierVertex(h-14, 134, h-19, 128, h-19, 128);
      endShape();
      stroke(0);

      // cup
      shape(cup_, h-24, 107); 

      // wheel
      pushMatrix();
      translate(0, y+musicBotPos); 
      rotate(-mouseX / 5);
      shapeMode(CENTER);
      shape(wheel_, 0, 0); 
      popMatrix();
      shapeMode(CORNER);
    }

    popMatrix();
  }

} // end class



































