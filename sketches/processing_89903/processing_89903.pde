
//Rafi Alam
//Creative Computing
//Homework 3

void setup() {

  size(850, 450);
}

void draw() {
  background(map(mouseY, 0, height, 255, 0)); 

  fill(255);
  stroke(255);
  strokeWeight(8);

  //box 2
  rect(220, 10, 200, 200);
  if ((mouseX>220) && (mouseY>10) && (mouseX<420) && (mouseY<210)) {

    fill(map(mouseY, 0, height, 0, 255), map(mouseX, 0, width, 0, 255), 80);
    rect(220, 10, 200, 200);
    stroke(255);
    strokeWeight(4);
    fill(250);
    ellipse(mouseX, mouseY, 100, 100);
    if (mousePressed) {
      fill(255);
      rect(220, 10, 200, 200);
      fill(0);
      ellipse(mouseX, mouseY, 100, 100);
    }
    strokeWeight(8);
  }

  fill(255);

  //box 1
  rect(10, 10, 200, 200);
  if ((mouseX>10) && (mouseY>10) && (mouseX<210) && (mouseY<210)) {

    fill(map(mouseY, 0, height, 0, 255), map(mouseX, 0, width, 0, 255), 80);
    rect(10, 10, 200, 200);
    stroke(255);
    strokeWeight(4);
    line(105, 10, mouseX, mouseY);
    line(105, 210, mouseX, mouseY);
    line(10, 105, mouseX, mouseY);
    line(210, 105, mouseX, mouseY);

    line(105, 10, 10, 105);
    line(105, 210, 210, 105);
    line(105, 10, 210, 105);
    line(105, 210, 10, 105);

    if (mousePressed) {
      fill(255);
      rect(10, 10, 200, 200);
      stroke(0);
      line(105, 10, mouseX, mouseY);
      line(105, 210, mouseX, mouseY);
      line(10, 105, mouseX, mouseY);
      line(210, 105, mouseX, mouseY);

      line(105, 10, 10, 105);
      line(105, 210, 210, 105);
      line(105, 10, 210, 105);
      line(105, 210, 10, 105);
      stroke(255);
    }
    strokeWeight(8);
  }

  fill(255);



  //box 3
  rect(430, 10, 200, 200); 
  if ((mouseX>430) && (mouseY>10) && (mouseX<630) && (mouseY<210)) {

    fill(255, map(mouseX, 0, width, 0, 255), map(mouseY, 0, height, 0, 255));
    rect(430, 10, 200, 200);
    fill(0);
    noStroke();
    rect(mouseX-10, mouseY-10, 20, 20);
    stroke(255);
    strokeWeight(8);
    if (mousePressed) {
      fill(0);
      rect(430, 10, 200, 200);
      //      fill(map(mouseY, 0, height, 0, 255), 80, map(mouseX, 0, width, 0, 255), 100);
      noStroke();
      //      rect(440, 20, 180, 180);
      fill(0);
      rect(455, 35, 150, 150);
      fill(255);
      rect(mouseX-10, mouseY-10, 20, 20);
      stroke(255);
      strokeWeight(8);
    }
    strokeWeight(8);
  }

  fill(255);

  //box 4
  rect(640, 10, 200, 200);
  if ((mouseX>630) && (mouseY>10) && (mouseX<840) && (mouseY<210)) {

    fill(map(mouseY, 0, height, 255, 0), map(mouseX, 0, width, 255, 0), 80);
    rect(640, 10, 200, 200);
    stroke(255);
    strokeWeight(4);

    line(720, 90, 760, 90);
    line(720, 130, 760, 130);
    line(720, 90, 720, 130);
    line(760, 130, 760, 90);

    line(720, 90, mouseX-50, mouseY-50);
    line(760, 90, mouseX+50, mouseY-50);
    line(720, 130, mouseX-50, mouseY+50);
    line(760, 130, mouseX+50, mouseY+50);

    line(mouseX-50, mouseY-50, mouseX+50, mouseY-50);
    line(mouseX-50, mouseY+50, mouseX+50, mouseY+50);
    line(mouseX-50, mouseY-50, mouseX-50, mouseY+50);
    line(mouseX+50, mouseY+50, mouseX+50, mouseY-50);


    if (mousePressed) {

      fill(255);
      rect(640, 10, 200, 200);
      stroke(0);
      line(720, 90, 760, 90);
      line(720, 130, 760, 130);
      line(720, 90, 720, 130);
      line(760, 130, 760, 90);

      line(720, 90, mouseX-50, mouseY-50);
      line(760, 90, mouseX+50, mouseY-50);
      line(720, 130, mouseX-50, mouseY+50);
      line(760, 130, mouseX+50, mouseY+50);

      line(mouseX-50, mouseY-50, mouseX+50, mouseY-50);
      line(mouseX-50, mouseY+50, mouseX+50, mouseY+50);
      line(mouseX-50, mouseY-50, mouseX-50, mouseY+50);
      line(mouseX+50, mouseY+50, mouseX+50, mouseY-50);
      stroke(255);
    }
    strokeWeight(8);
  }

  fill(255);



  //row 2

  //box6
  rect(220, 220, 200, 200);
  if ((mouseX>220) && (mouseY>220) && (mouseX<420) && (mouseY<420)) {

    fill(100, map(mouseY, 0, height, 0, 255), map(mouseX, 0, width, 0, 255), 80);
    rect(220, 220, 200, 200);
    noStroke();

    fill(0);
    rect(mouseX-2, mouseY-50, 4, 30);
    rect(mouseX-2, mouseY+20, 4, 30);
    rect(mouseX-50, mouseY-2, 30, 4);
    rect(mouseX+20, mouseY-2, 30, 4);
    fill(map(mouseY, 0, height, 0, 255), map(mouseX, 0, width, 0, 255), 80);

    ellipse(mouseX, mouseY, 10, 10);
    fill(255);

    if (mousePressed) {
      fill(0);
      rect(220, 220, 200, 200);
      noStroke();
      fill(255);
      rect(mouseX-2, mouseY-40, 4, 30);
      rect(mouseX-2, mouseY+10, 4, 30);
      rect(mouseX-40, mouseY-2, 30, 4);
      rect(mouseX+10, mouseY-2, 30, 4);
    }
    stroke(255);
    strokeWeight(8);
  }

  fill(255);


  //box 5 
  rect(10, 220, 200, 200);
  if ((mouseX>10) && (mouseY>220) && (mouseX<210) && (mouseY<430)) {

    fill(255, map(mouseY, 0, height, 0, 255), map(mouseX, 0, width, 0, 255), 80);
    rect(10, 220, 200, 200);
    noStroke();
    fill(map(mouseY, 0, height, 0, 255), map(mouseX, 0, width, 0, 255), 80);

    ellipse(mouseX, mouseY, map(mouseX, 10, 210, 0, 100), map(mouseY, 210, 430, 0, 100));

    if (mousePressed) {
      fill(255);
      rect(10, 220, 200, 200);
      noStroke();
      fill(0);

      ellipse(mouseX, mouseY, map(mouseX, 10, 210, 0, 100), map(mouseY, 210, 430, 0, 100));
    }
    stroke(255);
    strokeWeight(8);
  }

  fill(255);

  //box 7
  rect(430, 220, 200, 200);
  if ((mouseX>420) && (mouseY>220) && (mouseX<630) && (mouseY<420)) {

    fill(map(mouseY, 0, height, 255, 0), map(mouseX, 0, width, 255, 0), 80);
    rect(430, 220, 200, 200);
    stroke(255);
    strokeWeight(4);

    beginShape();
    curveVertex(430, 220);
    curveVertex(430, 220);
    curveVertex(mouseX-10, mouseY);
    curveVertex(430, 420);
    curveVertex(430, 420);
    endShape();

    beginShape();
    curveVertex(630, 220);
    curveVertex(630, 220);
    curveVertex(mouseX+10, mouseY);
    curveVertex(630, 420);
    curveVertex(630, 420);
    endShape();



    if (mousePressed) {

      fill(255);
      rect(430, 220, 200, 200);
      stroke(0);
      beginShape();
      curveVertex(430, 220);
      curveVertex(430, 220);
      curveVertex(mouseX-10, mouseY);
      curveVertex(430, 420);
      curveVertex(430, 420);
      endShape();

      beginShape();
      curveVertex(630, 220);
      curveVertex(630, 220);
      curveVertex(mouseX+10, mouseY);
      curveVertex(630, 420);
      curveVertex(630, 420);
      endShape();
      stroke(255);
    }
    strokeWeight(8);
  }

  fill(255);


  //box 8
  rect(640, 220, 200, 200);
  if ((mouseX>630) && (mouseY>220) && (mouseX<840) && (mouseY<420)) {
    fill(255, 0, 0, map(mouseY, 220, 420, 0, 255));
    rect(640, 220, 200, 200);
    fill(255);
    rect(660, 380, 20, 20);

    if (mousePressed) {
      fill(map(mouseY, 220, 420, 255, 0));
      rect(640, 220, 200, 200);
      fill(255);
      strokeWeight(8);
      rect(660, 380, 20, 20);
      strokeWeight(4);
      line(660, 380, mouseX-50, mouseY-50);
      line(680, 380, mouseX+50, mouseY-50);
      line(660, 400, mouseX-50, mouseY+50);
      line(680, 400, mouseX+50, mouseY+50);
      ellipse(mouseX-50, mouseY-50, 20, 20);
      ellipse(mouseX-50, mouseY+50, 20, 20);
      ellipse(mouseX+50, mouseY-50, 20, 20);
      ellipse(mouseX+50, mouseY+50, 20, 20);
      strokeWeight(8);
    }
  }



  //box 4
  rect(640, 10, 200, 200);
  if ((mouseX>630) && (mouseY>10) && (mouseX<840) && (mouseY<210)) {

    fill(map(mouseY, 0, height, 255, 0), map(mouseX, 0, width, 255, 0), 80);
    rect(640, 10, 200, 200);
    stroke(255);
    strokeWeight(4);

    line(720, 90, 760, 90);
    line(720, 130, 760, 130);
    line(720, 90, 720, 130);
    line(760, 130, 760, 90);

    line(720, 90, mouseX-50, mouseY-50);
    line(760, 90, mouseX+50, mouseY-50);
    line(720, 130, mouseX-50, mouseY+50);
    line(760, 130, mouseX+50, mouseY+50);

    line(mouseX-50, mouseY-50, mouseX+50, mouseY-50);
    line(mouseX-50, mouseY+50, mouseX+50, mouseY+50);
    line(mouseX-50, mouseY-50, mouseX-50, mouseY+50);
    line(mouseX+50, mouseY+50, mouseX+50, mouseY-50);


    if (mousePressed) {

      fill(255);
      rect(640, 10, 200, 200);
      stroke(0);
      line(720, 90, 760, 90);
      line(720, 130, 760, 130);
      line(720, 90, 720, 130);
      line(760, 130, 760, 90);

      line(720, 90, mouseX-50, mouseY-50);
      line(760, 90, mouseX+50, mouseY-50);
      line(720, 130, mouseX-50, mouseY+50);
      line(760, 130, mouseX+50, mouseY+50);

      line(mouseX-50, mouseY-50, mouseX+50, mouseY-50);
      line(mouseX-50, mouseY+50, mouseX+50, mouseY+50);
      line(mouseX-50, mouseY-50, mouseX-50, mouseY+50);
      line(mouseX+50, mouseY+50, mouseX+50, mouseY-50);
      stroke(255);
    }
    strokeWeight(8);
  }

  fill(255);
}
