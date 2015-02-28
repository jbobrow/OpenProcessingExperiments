
void setup() {
  size(1000, 1000);
  smooth();

  ellipseMode(CENTER);
  rectMode(CENTER);
}

//int numObjects = 6;
//int distance = 300;
//int angle = 0;
//int angleObject = 360/numObjects;

void draw() {
  background(212,250,247);
  stroke(186, 216, 222, 100);
  noFill();
  strokeWeight(2);
  ellipse(width/2, height/2, 1250, 1250);
  ellipse(width/2, height/2, 1270, 1270);



  //CRAZY
  if (mousePressed ==true) {
    for (float i=random(PI/6,5+PI/6);i<6;i++) {
      pushMatrix();
      translate(width/2, height/2);
      rotate(radians(i*60));
      kroppFyra(370, 0);
      popMatrix();
    }
    for (float i=random(0,2);i<6;i++) {
      pushMatrix();
      translate(width/2, height/2);
      rotate(radians(i*60));
      kroppEn(300, 0);
      popMatrix();
    }
    for (float i=random(PI,PI+5)/6;i<6;i++) {
      pushMatrix();
      translate(width/2, height/2);
      rotate(radians(i*60));
      kroppTva(190, 0);
      popMatrix();
    }
    for (float m=random(radians(15),radians(15)+5);m<12;m++) {
      pushMatrix();
      translate(width/2, height/2);
      rotate(radians(m*60));
      kroppFem(500, 0);
      popMatrix();
    }
    for (float m= random(PI/4,5+PI/4);m<6;m++) {
      pushMatrix();
      translate(width/2, height/2);
      rotate(radians(m*60));
      kroppFem(500, 0);
      popMatrix();
    }
    for (float m= random(0,5);m<6;m++) {
      pushMatrix();
      translate(width/2, height/2);
      rotate(radians(m*60));
      kroppSex(100, 0);
      popMatrix();
    }
    for (float m= random(0,5);m<6;m++) {
      pushMatrix();
      translate(width/2, height/2);
      rotate(radians(m*60));
      kroppSyv(500, 0);
      popMatrix();
    }
    for (float i=random(PI/6,5+PI/6);i<6;i++) {
      pushMatrix();
      translate(width/2, height/2);
      rotate(radians(i*60));
      kroppAtta(600, 0);
      popMatrix();
    }
    for (float i=random(PI/6,15+PI/6);i<6;i++) {
      pushMatrix();
      translate(width/2, height/2);
      rotate(radians(i*60));
      noStroke();
      fill(255, 121, 132, 200);
      ellipse(40, 0, 8, 8);
      popMatrix();
    }
    for (float i=random(PI/6,15+PI/6);i<48;i++) {
      pushMatrix();
      translate(width/2, height/2);
      rotate(radians(i*30));
      noStroke();
      fill(255, 121, 132, 100);
      ellipse(420, 0, 8, 8);
      popMatrix();
    }
  }

if (keyPressed == false){
  //NOT SO
  for (float i=random(PI/6,.005+PI/6);i<6;i++) {
    pushMatrix();
    translate(width/2, height/2);
    rotate(radians(i*60));
    kroppFyra(370, 0);
    popMatrix();
  }
  for (float i=random(0,.002);i<6;i++) {
    pushMatrix();
    translate(width/2, height/2);
    rotate(radians(i*60));
    kroppEn(300, 0);
    popMatrix();
  }
  for (float i=random(PI,PI+.05)/6;i<6;i++) {
    pushMatrix();
    translate(width/2, height/2);
    rotate(radians(i*60));
    kroppTva(190, 0);
    popMatrix();
  }
  for (float m=random(radians(15),radians(15)+.005);m<12;m++) {
    pushMatrix();
    translate(width/2, height/2);
    rotate(radians(m*60));
    kroppFem(500, 0);
    popMatrix();
  }
  for (float m= random(PI/4,.005+PI/4);m<6;m++) {
    pushMatrix();
    translate(width/2, height/2);
    rotate(radians(m*60));
    kroppFem(500, 0);
    popMatrix();
  }
  for (float m= random(0,.05);m<6;m++) {
    pushMatrix();
    translate(width/2, height/2);
    rotate(radians(m*60));
    kroppSex(100, 0);
    popMatrix();
  }
  for (float m= random(0,.005);m<6;m++) {
    pushMatrix();
    translate(width/2, height/2);
    rotate(radians(m*60));
    kroppSyv(500, 0);
    popMatrix();
  }
  for (float i=random(PI/6,.005+PI/6);i<6;i++) {
    pushMatrix();
    translate(width/2, height/2);
    rotate(radians(i*60));
    kroppAtta(600, 0);
    popMatrix();
  }
  for (float i=random(PI/6,.5+PI/6);i<6;i++) {
    pushMatrix();
    translate(width/2, height/2);
    rotate(radians(i*60));
    noStroke();
    fill(255, 121, 132, 200);
    ellipse(40, 0, 8, 8);
    popMatrix();
  }
  for (float i=random(PI/6,.5+PI/6);i<48;i++) {
    pushMatrix();
    translate(width/2, height/2);
    rotate(radians(i*30));
    noStroke();
    fill(255, 121, 132, 100);
    ellipse(420, 0, 8, 8);
    popMatrix();
  }
}
}





//FORMER FORMER FORMER FORMER

void kroppEn (int xPos, int yPos) { 
  fill(255, 255, 255, 150);
  strokeWeight(3);
  stroke(97, 17,126, 200);
  ellipse(xPos, yPos, 200, 200);
  strokeWeight(20);
  stroke(105,252,137, 150);
  noFill();
  ellipse(xPos, yPos, 190, 190);
  strokeWeight(1);
  stroke(13, 55, 179);
  ellipse(xPos, yPos, 204, 204);
  strokeWeight(1);
  stroke(140, 125, 150, 100);
  ellipse(xPos, yPos, 217, 217);
  for (int a=70; a<175; a+=40) {
    strokeWeight(1);
    stroke(144, 64, 112, 100);
    ellipse(xPos, yPos, a, a);
  }
  stroke(193, 88, 90);
  fill(135, 203, 247);
  ellipse(xPos+91, yPos, 10, 10);
  translate(-91, 91);
  ellipse(xPos+91, yPos, 10, 10);
  translate(0, -182);
  ellipse(xPos+91, yPos, 10, 10);
  translate(-91, 91);
  ellipse(xPos+91, yPos, 10, 10);
  translate(25, -63);
  ellipse(xPos+91, yPos, 10, 10);
  translate(132, 0);
  ellipse(xPos+91, yPos, 10, 10);
  translate(0, 126);
  ellipse(xPos+91, yPos, 10, 10);
  translate(-132, 0);
  ellipse(xPos+91, yPos, 10, 10);
  translate(-18, -29);
  ellipse(xPos+91, yPos, 10, 10);
  translate(0, -68);
  ellipse(xPos+91, yPos, 10, 10);
  translate(168, 0);
  ellipse(xPos+91, yPos, 10, 10);
  translate(0, 68);
  ellipse(xPos+91, yPos, 10, 10);
  translate(-45, 49);
  ellipse(xPos+91, yPos, 10, 10);
  translate(-78, 0);
  ellipse(xPos+91, yPos, 10, 10);
  translate(0, -165);
  ellipse(xPos+91, yPos, 10, 10);
  translate(78, 0);
  ellipse(xPos+91, yPos, 10, 10);
}

void kroppTva(int xPos, int yPos) {
  fill(226, 172, 250, 100);
  stroke(110, 54, 134, 100);
  strokeWeight(1);
  beginShape();
  //ovreHoger
  vertex(xPos, yPos-112);
  vertex(xPos+6, yPos-106);
  vertex(xPos+9, yPos-104);
  vertex(xPos+10, yPos-103);
  vertex(xPos+12, yPos-93);
  vertex(xPos+14, yPos-93);
  vertex(xPos+15, yPos-80);
  vertex(xPos+17, yPos-72);
  vertex(xPos+22, yPos-67);
  vertex(xPos+30, yPos-67);
  vertex(xPos+37, yPos-57);
  vertex(xPos+40, yPos-50);
  vertex(xPos+42, yPos-27);
  vertex(xPos+50, yPos-20);
  vertex(xPos+55, yPos-12);
  vertex(xPos+57, yPos-7);
  //bottenHoger
  vertex(xPos+57, yPos+7);
  vertex(xPos+55, yPos+12);
  vertex(xPos+50, yPos+20);
  vertex(xPos+42, yPos+27);
  vertex(xPos+40, yPos+50);
  vertex(xPos+37, yPos+57);
  vertex(xPos+30, yPos+67);
  vertex(xPos+22, yPos+67);
  vertex(xPos+17, yPos+72);
  vertex(xPos+15, yPos+80);
  vertex(xPos+14, yPos+93);
  vertex(xPos+12, yPos+93);
  vertex(xPos+10, yPos+103);
  vertex(xPos+9, yPos+104);
  vertex(xPos+6, yPos+106);
  vertex(xPos, yPos+112);
  //bottenVanster
  vertex(xPos, yPos+112);
  vertex(xPos-6, yPos+106);
  vertex(xPos-9, yPos+104);
  vertex(xPos-10, yPos+103);
  vertex(xPos-12, yPos+93);
  vertex(xPos-14, yPos+93);
  vertex(xPos-15, yPos+80);
  vertex(xPos-17, yPos+72);
  vertex(xPos-22, yPos+67);
  vertex(xPos-30, yPos+67);
  vertex(xPos-37, yPos+57);
  vertex(xPos-40, yPos+50);
  vertex(xPos-42, yPos+27);
  vertex(xPos-50, yPos+20);
  vertex(xPos-55, yPos+12);
  vertex(xPos-57, yPos+7);
  //ovreVanster
  vertex(xPos-57, yPos-7);
  vertex(xPos-55, yPos-12);
  vertex(xPos-50, yPos-20);
  vertex(xPos-42, yPos-27);
  vertex(xPos-40, yPos-50);
  vertex(xPos-37, yPos-57);
  vertex(xPos-30, yPos-67);
  vertex(xPos-22, yPos-67);
  vertex(xPos-17, yPos-72);
  vertex(xPos-15, yPos-80);
  vertex(xPos-14, yPos-93);
  vertex(xPos-12, yPos-93);
  vertex(xPos-10, yPos-103);
  vertex(xPos-9, yPos-104);
  vertex(xPos-6, yPos-106);
  vertex(xPos, yPos-112);
  endShape();
  //cirklar
  fill(139, 20, 64, 20);
  noStroke();
  ellipse(xPos, yPos+80, 8, 30);
  ellipse(xPos, yPos-80, 8, 20);
  ellipse(xPos+45, yPos, 10, 13);
  ellipse(xPos-45, yPos, 10, 13);
  ellipse(xPos, yPos-40, 12, 43);
  ellipse(xPos, yPos+40, 12, 43);
  fill(55, 153, 227, 100);
  ellipse(xPos-25, yPos-52, 10, 10);
  ellipse(xPos+25, yPos-52, 10, 10);
  ellipse(xPos-25, yPos+52, 10, 10);
  ellipse(xPos+25, yPos+52, 10, 10);
  ellipse(xPos, yPos+100, 5, 5);
  ellipse(xPos, yPos-100, 5, 5);
  fill(153, 81, 167, 50);
  ellipse(xPos+35, yPos+15, 5, 5);
  ellipse(xPos-35, yPos+15, 5, 5);
  ellipse(xPos+35, yPos-15, 5, 5);
  ellipse(xPos-35, yPos-15, 5, 5);
  ellipse(xPos+30, yPos, 5, 5);
  ellipse(xPos-30, yPos, 5, 5);
  ellipse(xPos-15, yPos-36, 5, 5);
  ellipse(xPos-15, yPos+36, 5, 5);
  ellipse(xPos+15, yPos+36, 5, 5);
  ellipse(xPos+15, yPos-36, 5, 5);
}

void kroppTre(int xPos, int yPos) {
  fill(183, 252, 64, 100);
  stroke(10, 201, 100, 200);
  strokeWeight(4);
  triangle(xPos, yPos-35, xPos+50, yPos+50, xPos-50, yPos+50);
  //cirklar
  noStroke();
  fill(10, 201, 100, 200);
  ellipse(xPos-65, yPos+62, 9, 9);
  ellipse(xPos+65, yPos+62, 9, 9);
  ellipse(xPos, yPos-54, 9, 9);
  fill(10, 201, 100, 50);
  ellipse(xPos, yPos+22, 60, 60);
  fill(10, 201, 100, 100);
  ellipse(xPos+25, yPos+35, 16, 16);
  ellipse(xPos-25, yPos+35, 16, 16);
  ellipse(xPos, yPos-6, 16, 16);
}

void kroppFyra(int xPos, int yPos) {

  strokeWeight(6);
  stroke(232, 255, 255, 200);
  line(xPos+75, yPos, xPos+202, yPos);
  line(xPos-75, yPos, xPos-202, yPos);
  noStroke();
  fill(232, 255, 255, 200);
  ellipse(xPos, yPos, 158, 28);
  strokeWeight(2);
  stroke(17, 70, 90, 200);
  ellipse(xPos, yPos, 150, 20);
  line(xPos+75, yPos, xPos+200, yPos);
  line(xPos-75, yPos, xPos-200, yPos);
  stroke(133, 252, 8, 200);
  strokeWeight(1);
  fill(6, 103, 78, 200);
  ellipse(xPos, yPos, 100, 10);
  fill(232, 255, 255, 255);
  stroke(255);
  ellipse(xPos, yPos, 10, 10);
}

void kroppFem(int xPos, int yPos) {
  fill(201, 252, 239, 150);
  stroke(132, 250, 56, 200);
  strokeWeight(7);
  ellipse(xPos, yPos, 200, 80);
  noFill();
  strokeWeight(3);
  stroke(17, 149, 93, 200);
  ellipse(xPos, yPos, 206, 86);
  noStroke();
  fill(30, 250, 93, 200);
  ellipse(xPos, yPos, 160, 50);
  stroke(145, 30, 247, 120);
  fill(255, 255, 255, 100);
  strokeWeight(4);
  ellipse(xPos+30, yPos, 80, 30);
  ellipse(xPos-30, yPos, 80, 30);
  stroke(14, 29, 178, 100);
  noFill();
  ellipse(xPos+30, yPos, 76, 26);
  ellipse(xPos-30, yPos, 76, 26);
  noStroke();
  fill(190, 250, 255);
  ellipse(xPos, yPos, 30, 30);
  strokeWeight(3);
  stroke(104, 7, 137, 150);
  line(xPos+70, yPos, xPos-70, yPos);
  noStroke();
  fill(104, 7, 137, 250);
  ellipse(xPos, yPos, 15, 15);
}

void kroppSex(int xPos, int yPos) {
  noFill();
  stroke(18,250,55, 150);
  strokeWeight(2);
  ellipse(xPos, yPos, 75, 75); 
  ellipse(xPos, yPos, 60, 60);
}

void kroppSyv(int xPos, int yPos) {
  fill(3, 7, 52, 73);
  stroke(16, 19, 134, 100);
  strokeWeight(7);
  rect(xPos, yPos, 100, 100);
  noFill();
  stroke(142, 216, 255);
  strokeWeight(3);
  rect(xPos, yPos, 100, 100);
  stroke(30, 245, 114, 40);
  strokeWeight(7);
  line(xPos-57, yPos-45, xPos-57, yPos+45);
  line(xPos-45, yPos+57, xPos+45, yPos+57);
  line(xPos-45, yPos-57, xPos+45, yPos-57);
  line(xPos+57, yPos-45, xPos+57, yPos+45);
  stroke(203, 255, 155);
  strokeWeight(1);
  line(xPos-54, yPos-45, xPos-54, yPos+45);
  line(xPos-45, yPos+54, xPos+45, yPos+54);
  line(xPos-45, yPos-54, xPos+45, yPos-54);
  line(xPos+54, yPos-45, xPos+54, yPos+45);
  noStroke();
  fill(164, 28, 185, 75);
  ellipse(xPos, yPos, 90, 90);
  fill(143, 67, 245, 50);
  ellipse(xPos+3, yPos-10, 60, 60);
  for (int n=xPos-40;n<xPos+40;n+=13) {
    for (int s=yPos-40;s<yPos+40;s+=13) {
      fill(0, 0, 0, 70);
      ellipse(n, s, 2, 2);
    }
  }
}

void kroppAtta(int xPos, int yPos) {
  stroke(13, 255, 39, 200);
  fill(157, 255, 13, 100);
  strokeWeight(3);
  beginShape();
  //btmrt
  vertex(xPos+105, yPos);
  vertex(xPos+115, yPos+8);
  vertex(xPos+125, yPos+15);
  vertex(xPos+135, yPos+18);
  vertex(xPos+145, yPos+19);
  vertex(xPos+155, yPos+28);
  vertex(xPos+160, yPos+42);
  vertex(xPos+160, yPos+55);
  vertex(xPos+155, yPos+60);
  vertex(xPos+145, yPos+55);
  vertex(xPos+125, yPos+45);
  vertex(xPos+70, yPos+30);
  vertex(xPos+30, yPos+25);
  vertex(xPos, yPos+25);
  //btmlf
  vertex(xPos, yPos+25);
  vertex(xPos-30, yPos+25);
  vertex(xPos-70, yPos+30);
  vertex(xPos-125, yPos+45);
  vertex(xPos-145, yPos+55);
  vertex(xPos-155, yPos+60);
  vertex(xPos-160, yPos+55);
  vertex(xPos-160, yPos+42);
  vertex(xPos-155, yPos+28);
  vertex(xPos-145, yPos+19);
  vertex(xPos-135, yPos+18);
  vertex(xPos-125, yPos+15);
  vertex(xPos-115, yPos+8);
  vertex(xPos-105, yPos);
  //toplf
  vertex(xPos-105, yPos);
  vertex(xPos-115, yPos-8);
  vertex(xPos-125, yPos-15);
  vertex(xPos-135, yPos-18);
  vertex(xPos-145, yPos-19);
  vertex(xPos-155, yPos-28);
  vertex(xPos-160, yPos-42);
  vertex(xPos-160, yPos-55);
  vertex(xPos-155, yPos-60);
  vertex(xPos-145, yPos-55);
  vertex(xPos-125, yPos-45);
  vertex(xPos-70, yPos-30);
  vertex(xPos-30, yPos-25);
  vertex(xPos, yPos-25);
  //tprt
  vertex(xPos, yPos-25);
  vertex(xPos+30, yPos-25);
  vertex(xPos+70, yPos-30);
  vertex(xPos+125, yPos-45);
  vertex(xPos+145, yPos-55);
  vertex(xPos+155, yPos-60);
  vertex(xPos+160, yPos-55);
  vertex(xPos+160, yPos-42);
  vertex(xPos+155, yPos-28);
  vertex(xPos+145, yPos-19);
  vertex(xPos+135, yPos-18);
  vertex(xPos+125, yPos-15);
  vertex(xPos+115, yPos-8);
  vertex(xPos+105, yPos);
  endShape();
  for (int d=yPos-18;d<yPos+18;d+=7) {
    strokeWeight(1);
    line(xPos-100, d, xPos+100, d);
  }
  noStroke();
  fill(195,18,250, 100);
  ellipse(xPos, yPos, 130, 20);
}
