
class Robot {

  float h, h1, targetH, easingH = 0.5;
  float e, e1, targetE, easingE = 0.034;
  float w, targetW, easingW = 0.02;
  float angle = 0.0;
  int x, currentTime, x1, z, y = 338;
  boolean jitter;
  float musicBotX, musicBotY, drinkBotX, drinkBotY, eyePos;
  float randompos = random(600, 900);

  // Constructor
  Robot() {
  }

  void easing() {
    targetH = h1;
    h = h + ((targetH - h) * easingH);
    targetE = e1;
    e = e + ((targetE - e) * easingE);
  }


  void display(int xpos, int ypos, float scaleRobot, int neckwidth, int neckpos, float antennaAngle, int musicBotPos, int antenna, boolean musicBot) {

    pushMatrix();
    translate(xpos, ypos);
    scale(scaleRobot);

    if(jitter == true) {
      translate(random(-5, 5), 0);
    }

    if(musicBot == true) {
      translate(musicBotX, musicBotY);
      currentTime = currentTime + 1;

      if(currentTime <= 65){
        h1 = 40;
        eyePos = 10;
        musicBotX = musicBotX + 18;
      }
      else if(currentTime <= 90){
        musicBotY = musicBotY + 14.5;
      }
      else if(currentTime <= 185){
        h1 = -40;
        eyePos = -10;
        musicBotX = musicBotX - 8;
      }
      else if(currentTime <= 210){
        musicBotY = musicBotY + 15;
      }
      else if(currentTime <= 275){
        h1 = 40;
        eyePos = 10;
        musicBotX = musicBotX + 11.8;
      }
      else if(currentTime <= 300){
        musicBotY = musicBotY + 15;
      }
      else if(currentTime <= 395){
        h1 = -40;
        eyePos = -10;
        musicBotX = musicBotX - 8;
      }
      else if(currentTime <= 420){
        musicBotY = musicBotY + 14.7;
      }
      else if(currentTime <= 485){
        h1 = 40;
        eyePos = 10;
        musicBotX = musicBotX + 11.8;
      }
      else if(currentTime <= 510){
        musicBotY = musicBotY + 15;
      }
      else if(currentTime > 635){
        currentTime = 0;
        musicBotX = 0;
        musicBotY = 0;
      }
    }

    if(musicBot == false){
      translate(drinkBotX, drinkBotY);
      currentTime = currentTime + 1;

      if(currentTime <= 75){
        h1 = 40;
        eyePos = 10;
        drinkBotX = drinkBotX + 13.5;
      }
      else if(currentTime <= 100){
        drinkBotY = drinkBotY + 14.5;
      }
      else if(currentTime <= 180){
        h1 = -40;
        eyePos = -10;
        drinkBotX = drinkBotX - 8;
      }
      else if(currentTime <= 205){
        drinkBotY = drinkBotY + 15;
      }
      else if(currentTime <= 285){
        h1 = 40;
        eyePos = 10;
        drinkBotX = drinkBotX + 8;
      }
      else if(currentTime <= 310){
        drinkBotY = drinkBotY + 14.5;
      }
      else if(currentTime <= 390){
        h1 = -40;
        eyePos = -10;
        drinkBotX = drinkBotX - 8;
      }
      else if(currentTime <= 415){
        drinkBotY = drinkBotY + 15;
      }
      else if(currentTime <= 495){
        h1 = 40;
        eyePos = 10;
        drinkBotX = drinkBotX + 8;
      }
      else if(currentTime <= 520){
        drinkBotY = drinkBotY + 14.5;
      }
      else if(currentTime > 635){
        currentTime = 0;
        drinkBotX = 0;
        drinkBotY = 0;
      }
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
    //h1 = map(mouseX, 0, 320, 0, 50);
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
    popMatrix();


    // MUSIC BOT
    if(musicBot == true) {

      // eyes
      strokeWeight(2);
      ellipse(h-42+eyePos, 220-musicBotPos, 17, 17);
      ellipse(h+45+eyePos, 220-musicBotPos, 17, 17);

      // eye shade
      noStroke();
      fill(255, 200);
      ellipse(h-39+eyePos, 219-musicBotPos, 7, 7);
      ellipse(h+48+eyePos, 219-musicBotPos, 7, 7);
      stroke(0);

      pushMatrix();
      x1 = x1 + 1;
      shapeMode(CENTER);
      rectMode(CENTER);
      if(x1 <= 90){
        translate(105, 20);
        rotate(PI/10);
      }
      else if(x1 <= 210){
        translate(-105, 20);
        rotate(-PI/10);
      }
      else if(x1 <= 300){
        translate(105, 20);
        rotate(PI/10);
      }
      else if(x1 <= 420){
        translate(-105, 20);
        rotate(-PI/10);
      }
      else if(x1 <= 510){
        translate(105, 20);
        rotate(PI/10);
      }
      else if(x1 > 635){
        x1 = 0;
        musicBotX = 0;
        musicBotY = 0;
      }

      // box
      strokeWeight(2);
      pushMatrix();
      translate(0, 275);
      fill(50);
      rect(0, 0, 60, 60);

      // cd
      strokeWeight(1);
      fill(200);
      if(mouseX < 300) {
        fill(random(0, 255), random(0, 255), random(0, 255));
      }
      rotate(angle);
      ellipse(0, 0, 50, 50);
      shape(cd, 0, 0, 50, 50);
      //angle = angle - map(mouseY, 0, 480, .01, .2);
      angle = angle - map(mouseX, 0, 320, .2, .01);
      fill(255);
      ellipse(8.5, 8.5, 17, 17);
      fill(50);
      ellipse(3.5, 3.5, 7, 7);
      noFill();
      popMatrix();
      shapeMode(CORNER);
      popMatrix();

      // speaker
      shapeMode(CENTER);
      pushMatrix();
      translate(0, y+musicBotPos); 
      //float r = map(mouseX, 0, 320, random(102, 120), random(83, 93));
      //float r = map(mouseY, 0, 480, random(83, 93), random(102, 120));
      shape(speaker, 0, 0, random(83, 93), random(83, 93));
      popMatrix();
      shapeMode(CORNER);

      // disco ball
      shapeMode(CENTER);
      strokeWeight(3);
      stroke(0);
      line(h, 140, h, 88);
      strokeWeight(2);
      fill(random(100, 200));
      z = z + 1;
      if(z > 0) {
        ellipse(h, 88, 50, 50);
        shape(ball, h, 88, 60, 60); 
      }  
      if(z > 3) {
        ellipse(h, 88, 50, 50);
        shape(ball1, h, 88, 60, 60); 
      }  
      if(z > 6) {
        ellipse(h, 88, 50, 50);
        shape(ball2, h, 88, 60, 60); 
      }  
      if(z > 9) {
        ellipse(h, 88, 50, 50);
        shape(ball3, h, 88, 60, 60); 
      }  
      if(z > 12) {
        z = 0;
      }
      shapeMode(CORNER);
    }
    else{

      // eyes
      strokeWeight(2);
      ellipse(h-42+eyePos, 220-musicBotPos, 17, 17);
      ellipse(h+45+eyePos, 220-musicBotPos, 17, 17);

      // eye shade
      noStroke();
      fill(255, 200);
      ellipse(h-39+eyePos, 219-musicBotPos, 7, 7);
      ellipse(h+48+eyePos, 219-musicBotPos, 7, 7);
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
      rotate(PI + angle);
      angle = angle - 3;
      shapeMode(CENTER);
      shape(wheel_, 0, 0); 
      popMatrix();
      shapeMode(CORNER);
    }

    popMatrix();
  }

} // end class


