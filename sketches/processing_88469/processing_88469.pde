
//moving fireworks
int circleSize = 10;
int trans = 100;
int strokeTrans = 200;

//mouse button
boolean button = false;

//background color

float r = 63;
float g = 16;
float b = 113;
float colorChange =1;

//moon
float moonX = 650;
float moonY = 85;
float w = 78;
float change = 0.03;

// stars
float strokeStar = 1;
float strokeStarChange = .2;


void setup()  {
  frameRate(30);
  size(800, 600);

}



void draw() {
  
  moonX = constrain(mouseX, 550, 650);
  //vary the background color
  background(r,g,b);
  r = r - colorChange;
  r = constrain(r, 16,70);
  g= g + colorChange;
  g = constrain(g, 10, 78);
  if((g == 78) || (g == 16)) {
    colorChange = colorChange * -1;
  }
  if((r == 70) || (r == 16)) {
    colorChange = colorChange * -1;
  }



  //middle fireworks

  if(button) {
    fill(0);
    stroke(232, 250, 0, strokeTrans);
    strokeWeight(4);
    fill(63,16, 113);
    line(260, 200, 320, 260);
    line(290, 190, 290, 270);
    line(320, 200, 260, 260);
    line(250, 230, 330, 230);

    noStroke();

    fill(63,16,113, trans);
    ellipse(290, 230, circleSize, circleSize);
    circleSize=circleSize + 3;
    trans = trans - 1;
    strokeTrans = strokeTrans - 1;



    stroke(250, 0, 104, strokeTrans);
    strokeWeight(3);
    line(275, 200, 305, 260);
    line(305, 200, 275, 260);
    line(320, 215, 260, 245);
    line(320, 245, 260, 215);
    fill(63, 16, 113, trans);
    noStroke();
    ellipse(290, 230, circleSize, circleSize);
    fill(255, trans);
    ellipse(290, 230,circleSize, circleSize);
    circleSize=circleSize + 3;
    trans = trans - 1;
    strokeTrans = strokeTrans - 1;
  }

  //left fireworks


  if(button) {
    fill(239, 144, 250, trans);
    ellipse(150, 83, circleSize, circleSize);
    circleSize=circleSize + 3;
    trans= trans - 1;
    noFill();
    noStroke();
    bezier(155, 95, 165, 85, 185, 35, 200, 65);
    fill(197, 76, 222, trans);
    int steps = 10;
    for (int i = 0; i <= steps; i++) {
      float t = i / float(steps);
      float x = bezierPoint(155, 165, 185, 200, t);
      float y = bezierPoint(95, 85, 35, 65, t);
      ellipse(x, y, 2, 2);
    }



    fill(197, 76, 222, trans);
    ellipse(150, 90, 10, 10);

    stroke(197, 76, 222, strokeTrans);
    strokeWeight(1);
    line(195,60, 205,70);
    line(205,60, 195,70);
    line(200, 60, 200, 70);
    line(195, 65, 205, 65);
    noFill();
    bezier(150, 95, 160, 85, 180, 25, 200, 60);

    noFill();
    noStroke();
    bezier(145, 95, 135, 85, 115, 35, 105, 65);
    fill(197, 76, 222, strokeTrans);

    for (int i = 0; i <= steps; i++) {
      float t = i / float(steps);
      float x = bezierPoint(145, 135, 115, 105, t);
      float y = bezierPoint(95, 85, 35, 65, t);
      ellipse(x, y, 3, 3);
    }

    stroke(197, 76, 222, strokeTrans);
    strokeWeight(1);
    line(95, 60, 105, 70);
    line(105, 60, 95, 70);
    line(100, 60, 100, 70);
    line(95, 65, 105, 65);
    noFill();
    bezier(155, 95, 140, 85, 120, 25, 100, 60);





    noFill();
    noStroke();
    bezier(155, 95, 160, 85, 165, 20, 175, 40);
    fill(197, 76, 222, strokeTrans);

    for (int i = 0; i <= steps; i++) {
      float t = i / float(steps);
      float x = bezierPoint(155, 160, 165, 175, t);
      float y = bezierPoint(95, 85, 20, 40, t);
      ellipse(x, y, 3, 3);
    }
    strokeWeight(1);
    noFill();
    stroke(197, 76, 222, strokeTrans);
    bezier(150, 95, 155, 75, 165, 15, 180, 30);


    strokeWeight(1);
    line(170, 25, 180, 35);
    line(180, 25, 170, 35);
    line(175, 25, 175, 35);
    line(170, 30, 180, 30);

    strokeWeight(1);
    line(150, 95, 160, 65);
    line(150, 95, 150, 65);
    line(150, 95, 140, 65);
    line(150, 95, 130, 65);
    line(150, 95, 170, 75);

    line(150, 95, 160, 105);
    line(150, 95, 150, 105);
    line(150, 95, 140, 105);
    line(150, 95, 135, 95);
    line(150, 95, 160, 95);



    noFill();
    noStroke();
    bezier(155, 95, 150, 75, 140, 15, 115, 30);
    fill(197, 76, 222, strokeTrans);

    for (int i = 0; i <= steps; i++) {
      float t = i / float(steps);
      float x = bezierPoint(155, 150, 140, 115, t);
      float y = bezierPoint(95, 75, 15, 30, t);
      ellipse(x, y, 3, 3);
    }

    stroke(197, 76, 222, strokeTrans);
    strokeWeight(1);
    line(105, 35, 115, 45);
    line(115, 35, 105, 45);
    line(110, 35, 110, 45);
    line(105, 40, 115, 40);
    noFill();
    bezier(150, 95, 145, 75, 130, 15, 110, 40);


    noFill();
    noStroke();
    bezier(155, 95, 160, 90, 180, 50, 195, 85);
    fill(197, 76, 222, strokeTrans);

    for (int i = 0; i <= steps; i++) {
      float t = i / float(steps);
      float x = bezierPoint(155, 160, 180, 195, t);
      float y = bezierPoint(95, 90, 50, 85, t);
      ellipse(x, y, 3, 3);
    }

    stroke(197, 76, 222, strokeTrans);
    strokeWeight(1);
    line(185, 70, 195, 80);
    line(195, 70, 185, 80);
    line(190, 70, 190, 80);
    line(185, 75, 195, 75);
    noFill();
    bezier(150, 95, 155, 85, 165, 45, 190, 75);
  }

  //right fireworks

  if(button) {
     fill(171, 219, 53, trans);
     stroke(171, 219, 53, trans);
    ellipse(450, 133, circleSize, circleSize);
    circleSize=circleSize + 3;
    trans= trans - 1;
    fill(171, 219, 53, trans);
    ellipse(450, 140, circleSize, circleSize);
    circleSize=circleSize + 3;
    trans= trans - 1;
    
    
    noFill();
    noStroke();
    bezier(455, 345, 465, 335, 485, 85, 300, 115);
    fill(171, 219, 53, strokeTrans);
    int steps = 10;

    for (int i = 0; i <= steps; i++) {
      float t = i / float(steps);
      float x = bezierPoint(455, 465, 485, 500, t);
      float y = bezierPoint(145, 135, 85, 115, t);
      ellipse(x, y, 2, 2);
    }

   

    stroke(171, 219, 53, strokeTrans);
    strokeWeight(1);
    line(495, 110, 505, 120);
    line(505, 110, 495, 120);
    line(500, 110, 500, 120);
    line(495, 115, 505, 115);
    noFill();
    bezier(450, 145, 460, 135, 480, 75, 500, 110);

    noFill();
    noStroke();
    bezier(445, 145, 435, 135, 415, 85, 405, 115);
    fill(171, 219, 53, strokeTrans);

    for (int i = 0; i <= steps; i++) {
      float t = i / float(steps);
      float x = bezierPoint(445, 435, 415, 405, t);
      float y = bezierPoint(145, 135, 85, 115, t);
      ellipse(x, y, 3, 3);
    }

    stroke(171, 219, 53, strokeTrans);
    strokeWeight(1);
    line(395, 110, 405, 120);
    line(405, 110, 395, 120);
    line(400, 110, 400, 120);
    line(395, 115, 405, 115);
    noFill();
    bezier(455, 145, 440, 135, 420, 75, 400, 110);


    strokeWeight(1);
    line(450, 145, 460, 115);
    line(450, 145, 450, 115);
    line(450, 145, 440, 115);
    line(450, 145, 430, 115);
    line(450, 145, 470, 125);

    line(450, 145, 460, 155);
    line(450, 145, 450, 155);
    line(450, 145, 440, 155);
    line(450, 145, 435, 145);
    line(450, 145, 465, 145);


    noFill();
    noStroke();
    bezier(455, 145, 460, 135, 565, 70, 475, 90);
    fill(171, 219, 53, trans);

    for (int i = 0; i <= steps; i++) {
      float t = i / float(steps);
      float x = bezierPoint(455, 460, 465, 475, t);
      float y = bezierPoint(145, 135, 70, 90, t);
      ellipse(x, y, 3, 3);
    }
    strokeWeight(1);
    noFill();
    stroke(171,219,53, strokeTrans);
    bezier(450, 145, 455, 125, 465, 65, 480, 80);


    strokeWeight(1);
    line(470, 75, 480, 85);
    line(480, 75, 470, 85);
    line(475, 75, 475, 85);
    line(470, 80, 480, 80);



    noFill();
    noStroke();
    bezier(455, 145, 450, 125, 440, 65, 415, 80);
    fill(171, 219, 53, strokeTrans);

    for (int i = 0; i <= steps; i++) {
      float t = i / float(steps);
      float x = bezierPoint(455, 450, 440, 415, t);
      float y = bezierPoint(145, 125, 65, 80, t);
      ellipse(x, y, 3, 3);
    }

    stroke(171, 219, 53, strokeTrans);
    strokeWeight(1);
    line(405, 85, 415, 95);
    line(415, 85, 405, 95);
    line(410, 85, 410, 95);
    line(405, 90, 415, 90);
    noFill();
    bezier(450, 145, 445, 125, 430, 65, 410, 90);


    noFill();
    noStroke();
    bezier(455, 145, 460, 140, 480, 90, 495, 135);
    fill(171, 219, 53, strokeTrans);

    for (int i = 0; i <= steps; i++) {
      float t = i / float(steps);
      float x = bezierPoint(455, 460, 480, 495, t);
      float y = bezierPoint(145, 140, 100, 135, t);
      ellipse(x, y, 3, 3);
    }

    stroke(171, 219, 53, strokeTrans);
    strokeWeight(1);
    line(485, 120, 495, 130);
    line(495, 120, 485, 130);
    line(490, 120, 490, 130);
    line(485, 125, 495, 125);
    noFill();
    bezier(450, 145, 455, 135, 465, 85, 490, 125);
  }

  //stars
  randomSeed(0);
  for (float i = random(0); i < 800; i += 4) {

    strokeWeight(strokeStar);
    stroke(250, 224, 25);
    point(i, random(600));

    strokeStar = strokeStar + strokeStarChange;
    if((strokeStar>3) || (strokeStar<1)) {
      strokeStarChange = strokeStarChange * -1;
    }
  }


  //1st Building
  fill(0);
  stroke(0); 
  strokeWeight(2); 
  smooth(); 
  rect(0,300,100,300);
  rect(10, 280, 80, 20);
  triangle(30, 280, 50, 150, 70, 280);
  //windows
  fill(255);
  stroke(100);
  rect(10, 320, 20, 40);
  rect(10, 380, 20, 40);
  rect(10, 440, 20, 40);
  rect(10, 500, 20, 40);
  rect(10, 560, 20, 40);
  rect(70, 320, 20, 40);
  rect(70, 380, 20, 40);
  rect(70, 440, 20, 40);
  rect(70, 500, 20, 40);
  rect(70, 560, 20, 40);

  //2nd Building
  fill(0);
  stroke(0);
  rect(100, 400, 300, 200);

  //windows
  fill(255);
  stroke(100);
  rect(120, 425, 25, 75);
  rect(200, 425, 25, 75);
  rect(280, 425, 25, 75);
  rect(360, 425, 25, 75);

  //window paneling
  strokeWeight(3);
  stroke(0);
  line(133, 425, 133, 500);
  line(120, 465, 145, 465);
  line(213, 425, 213, 500);
  line(200, 465, 225, 465);
  line(293, 425, 293, 500);
  line(280, 465, 305, 465);
  line(373, 425, 373, 500);
  line(360, 465, 385, 465);

  //3rd Building
  stroke(0); 
  strokeWeight(2); 
  smooth(); 
  fill(0);
  rect(400,250,80,350);

  //windows
  fill(255);
  stroke(100);
  rect(410, 270, 20, 40);
  rect(410, 330, 20, 40);
  rect(410, 390, 20, 40);
  rect(410, 450, 20, 40);
  rect(410, 510, 20, 40);
  rect(450, 270, 20, 40);
  rect(450, 330, 20, 40);
  rect(450, 390, 20, 40);
  rect(450, 450, 20, 40);
  rect(450, 510, 20, 40);

  //4th Building
  fill(0);
  stroke(0);
  rect(480,250,80,350);

  //windows
  fill(255);
  stroke(100);
  rect(490, 270, 20, 40);
  rect(490, 330, 20, 40);
  rect(490, 390, 20, 40);
  rect(490, 450, 20, 40);
  rect(490, 510, 20, 40);
  rect(530, 270, 20, 40);
  rect(530, 330, 20, 40);
  rect(530, 390, 20, 40);
  rect(530, 450, 20, 40);
  rect(530, 510, 20, 40);



  //6th Building
  fill(0);
  stroke(0);
  rect(660, 450, 140, 150);
  rect(680, 430, 100, 20);

  //5th Building
  stroke(100); 
  strokeWeight(2); 
  smooth(); 
  fill(0);
  rect(560, 300, 100, 300);
  line(565, 300, 565, 600);
  line(570, 300, 570, 600);
  line(575, 300, 575, 600);
  line(580, 300, 580, 600);
  line(585, 300, 585, 600);
  line(590, 300, 590, 600);
  line(595, 300, 595, 600);
  line(600, 300, 600, 600);
  line(605, 300, 605, 600);
  line(610, 300, 610, 600);
  line(615, 300, 615, 600);
  line(620, 300, 620, 600);
  line(625, 300, 625, 600);
  line(630, 300, 630, 600);
  line(635, 300, 635, 600);
  line(640, 300, 640, 600);
  line(645, 300, 645, 600);
  line(650, 300, 650, 600);
  line(655, 300, 655, 600);
  line(660, 300, 660, 600);
  fill(255);
  rect(560, 375, 100, 30);
  rect(560, 460, 100, 30);
  stroke(255);
  fill(255);
  triangle(560, 300, 610, 260, 660, 300);


  //windows
  fill(255);
  stroke(100);
  rect(675, 470, 20, 40);
  rect(705, 470, 20, 40);
  rect(735, 470, 20, 40);
  rect(765, 470, 20, 40);
  rect(675, 520, 20, 40);
  rect(705, 520, 20, 40);
  rect(735, 520, 20, 40);
  rect(765, 520, 20, 40);

  //1st Person
  line(200, 340, 200, 380);
  smooth();
  ellipse(200, 340, 20, 20);
  line(200, 380, 210, 400);
  line(200, 380, 190, 400);
  line(200, 365, 215, 355);
  line(200, 365, 185, 355);
  line(230, 340, 230, 380);

  //2nd Person
  smooth();
  ellipse(230, 340, 20, 20);
  line(230, 380, 240, 400);
  line(230, 380, 220, 400);
  line(230, 365, 245, 355);
  line(230, 365, 215, 355);
  stroke(250, 224, 25);



  fill(250, 224, 25);
  noStroke();
  ellipse(moonX, moonY, w, w);
  w = w + change;

  if ((w > 80) || (w < 77)) {
    change = change * -1;
  }

  fill(255);
  ellipse(moonX, moonY, 75,75);



}

void mousePressed() {
  button = !button;
}





