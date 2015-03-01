
int   state = 0;
int   statu = 0;
float rectX = 354;
float rectY = 60;
float rectYY = 50;
void setup() {
  size (450, 350); 
}
void draw() {
  strokeWeight(1);
  smooth(2);
  fill (0);
  noStroke();
  rect (0, 0, width, height);
  fill (200, 200, 100);
  rect (10, 10, width-20, height-20, 20);
  button();
  tacho();
  testa();
  slider();
  battery();
}
void button() {
  fill (170, 170, 60);
  rect (29, 154, 225, 86, 18);
  for (int i=0; i<35; i++) {
    fill(42, 42, 0, 27-i);
    rect (29, 154, 225, i+36, 18);
  } 
  fill (0);
  rect (51, 164, 182, 67, 11);
  if (state==2) {
    textSize(33);
    fill (172, 0, 0);
    rect (59, 170, 168, 56, 6);
    fill(255, 255, 255);
    text ("PUSH", 103, 210);
    fill(255, 115, 119);
    text ("PUSH", 104, 210);
    for (int i=0; i<18; i++) {
      fill (255, 26-i);
      rect (60, 172, 165, 2*i, 6);
    }

    for (int i=0; i<17; i++) {
      fill(42, 42, 0, 34-i);
      rect (59, 232, 168, i-11, 19);
    }
  }
  if (state==3) {
    fill (172, 0, 0);
    textSize(31);
    rect (62, 171, 162, 52, 6);
    fill(255, 255, 255);
    text ("PUSH", 105, 207);
    fill(255, 115, 119);
    text ("PUSH", 106, 207);
    for (int i=0; i<30;i++) {
      fill (255, 23-i);
      rect (63, 172, 159, 2*i, 5);
    }
  }
  if (state==1) {
    fill (172, 0, 0);
    textSize(31);
    rect (62, 171, 162, 52, 6);
    fill(255, 255, 255);
    text ("PUSH", 105, 207);
    fill(255, 115, 119);
    text ("PUSH", 106, 207);
    for (int i=0; i<30; i++) {
      fill (255, 23-i);
      rect (63, 172, 159, 2*i, 5);
    }
    //  statu =1;
  }
  if (state==0) {
    textSize(35);
    fill (172, 0, 0);
    rect (53, 167, 178, 61, 7);
    fill(255, 255, 255);
    text ("PUSH", 100, 212);
    fill(255, 115, 119);
    text ("PUSH", 101, 212);
    for (int i=0; i<11; i++) {
      fill (255, 40-i);
      rect (56, 171, 172, 2*i, 5);
    }
    for (int i =0; i<30;i++) {
      fill(22, 22, 0, 27-i);
      rect (52, 232, 181, i-10, 18);
    }
  } 
  if (mouseX> 55 && mouseX< 225 && mouseY> 170 && mouseY<230 && state==0 && statu==0 && mousePressed  ) {
    state =1;
  }
  else if (mouseX> 55 && mouseX< 225 && mouseY> 170 && mouseY<230   && state==2 && mousePressed  ) {
    state =3;
  }
}
void mouseReleased() {
  if (state==1) {
    state=2;
  }
  else if (state==3)
  {
    state=0;
  }
}


void tacho() {
  fill(0);
  rect (93, 83, 100, 50, 27, 27, 1, 1);
  fill(255, 0, 0);
  arc (143, 133, 100, 80, PI+PI/12, 2*PI-(PI/1.4));
  fill (200, 200, 100);
  fill(255, 255, 0);
  arc (143, 133, 100, 80, PI+PI/4, 2*PI-(PI/2.0));
  fill (200, 200, 100);
  fill(0, 255, 0);
  arc (143, 133, 100, 80, PI+PI/2, 2*PI-(PI/10.6));
  fill (0);
  arc (143, 132, 70, 70, PI, 2*(PI));
  fill (49, 49, 49);
  pushMatrix();
  stroke(255);
  translate (143, 132);
  rotate (radians(-(rectYY/1.1)+19));
  line (22, 0, 36, 0);
  noStroke();
  fill(160, 181, 250, 255);
  triangle (16, -4, 34, 0, 16, 4);
  popMatrix();
  if (state!=2) {
    fill (29, 155);
    rect (93, 83, 100, 50, 27, 27, 0, 0);
  }
  fill(18, 15, 15, 255);
  arc (143, 133, 50, 48, PI+PI/72, 2*PI-(PI/87.9));
  for (int i=0; i<30; i++) {
    fill (255, 255, 255, 4);
    rect (90, 143, 106, -i, 20);
    fill (64, 2);
    rect (89, 75, 108, 69, 20, 20, 0, 0);
    stroke (255, 23);
    noFill();
    arc (108, 93, 36, 36, PI+PI/4.3, PI+PI/2.0);
    line (167, 74, 180, 74);
    noStroke();
  }
  if (state==2) {
    fill(18, 15, 15, 155);
    arc (144, 133, 50, 48, PI+PI/72, 2*PI-(PI/87.9));

    fill(194, 218, 254, 74);
    for (int a = 0; a<7; a++) {
      arc (143, 133, 0+13*a, 0+3*a, PI+PI/72, 2*PI-(PI/87.9));
    }
    fill (255);
    ellipse (143, 132, 56, 3);
  }
}

void testa() {
  fill (0);
  rect (66, 25, 155, 37, 6);
  fill (192, 177, 154);
  rect (67, 27, 152, 32, 5);
  textSize(24);
  fill(255, 255, 255);
  text ("LEVEL", 110, 52);
  fill(69, 64, 53);
  text ("LEVEL", 112, 52);
  for (int i=0; i<14; i++) {
    fill (255, 27-i);
    rect (69, 28, 148, 1*i, 5);
  }
}

void slider() {
  update(mouseX, mouseY);
  pushMatrix();
  for (int i=0; i<25; i++) {
    fill(71, 71, 0, 25-i);
    rect (353, 27, +i, 209, 13);
  }
  for (int i=0; i<10; i++) {
    fill(90, 90, 0, 38-i);
    rect (380+i, 27, 5, 209, 0);
  }
  fill(90, 90, 0, 182 );
  arc (373, 27, 41, 17, 0, PI);
  fill(180, 181, 97, 251 );
  arc (373, 236, 41, 12, PI, 2*PI);
  fill(100, 100, 0, 152 );
  arc (373, rectYY+14, 38, 16+rectYY/2.0, 0, PI);
  fill(199, 207, 100, 46 );
  arc (373, rectYY+0, 21, -9+rectYY/2.0, 0, PI);
  fill (34, 33, 34);
  rect (369, 29, 8, 200, 0);
  fill (143, 33, 64);
  rect (rectX, rectYY, 39, 20, 8);
  for (int i=0; i<11; i++) {
    fill (255, 14-i);
    rect (356, rectYY+18, 34, -1*i-2, 22);
  }
  fill (200, 200, 100);
  rect (353, 235, 40, 61);
  stroke (255, 106);
  line (361, rectYY, 384, rectYY);
  noStroke();
  fill(213, 79, 9, 47 );
  arc (373, rectYY+1, 40, 20, PI, 2*PI);
  stroke (255, 128);
  noFill();
  arc (361, rectYY+13, 18, 26, PI+PI/3.6, PI+PI/2.0);
  line (377, rectYY, 383, rectYY);
  popMatrix();
  stroke (164, 255);
  line (353, 28, 353, 233);
  line (393, 28, 393, 233);
}
void update(int x, int y) {
  if ( (overRect(rectX, rectY-30, 41, 60))&& mousePressed ) {
    rectY = mouseY-7;
    if (rectYY<rectY) {
      rectYY=rectYY+7;
    } 
    if (rectYY > rectY) {
      rectYY = rectYY-7;
    }
    if (rectY <  35) {
      rectYY = 36;
    }
    if (rectY >  205) {
      rectYY = 204;
    }
  }
}
boolean overRect(float x, float y, float width, float height) {
  if (mouseX >= x && mouseX <= x+width &&
    mouseY >= y && mouseY <= y+height) {
    return true;
  }
  else {
    return false;
  }
}
void battery() {
  pushMatrix();
  translate(-5, -157);
  noStroke();
  for (int i=0; i<11; i++) {
    fill(60, 60, 60, 10);
    arc(299, 405+2*i, 128, 153, 0, PI);
  }
  stroke(117, 69, 34);
  fill(117, 69, 34);
  strokeWeight(11);
  line (238, 416, 357, 416);
  arc(299, 419, 121, 38, 0, PI);
  fill(178, 112, 46);
  arc(299, 415, 120, 38, 0, PI);
  noFill();
  strokeWeight(3);
  stroke(190, 140, 110);
  arc(299, 412, 124, 38, 0, PI);
  stroke(190, 140, 100, 118);
  arc(299, 415, 124, 38, 0, PI);
  stroke(60, 40, 30, 152);
  arc(299, 422, 128, 38, 0, PI);
  noStroke();
  for (int i=0; i<12; i++) {
    fill(60, 60, 60, 10);
    arc (312, 425, 59, 16, PI+PI/2, PI+PI+PI/1);
  }
  popMatrix(); 
  strokeWeight(1);  
  translate(2, -135);
  fill(255, 255); 
  rect (275, 316, 50, 81, 0, 0, 0, 0);
  arc (300, 397, 50, 16, 0, PI);
  fill(109, 108, 108, 25); 
  for (int i=0; i <8; i++) {
    rect (275, 314, 6+i, 87, 0, 0, 0, 0);
  }
  for (int i=0; i <19; i++) {
    rect (290+i, 314, 18, 89, 0, 0, 0, 0);
  }
  fill(125, 125, 144, 183);
  ellipse (300, 398, 48, 16);
  fill(254, 0, 0, 143);
  int s = mouseX/6;
  ellipse(300, 397-s, 49, 16);
  fill(254, 0, 0, 16);
  for (int i =0; i<s; i++) {
    ellipse(300, 397+1*-i, 49, 16);
  }
  fill(0, 0, 0, 21); 
  for (int i=0; i <9; i++) {
    rect (313+i, 314, 6, 88, 0, 0, 7, -4);////
  }  
  fill(182, 159, 219, 255); 
  arc (300, 315, 50, 16, 0, PI); 
  stroke (100, 100); 
  noFill();
  arc (300, 315, 48, 16, 0, PI); 
  stroke (254, 136); 
  arc (300, 316, 49, 12, PI/1.2, PI+PI/43); 
  stroke (14, 60); 
  arc (300, 395, 49, 17, PI/41.3, PI+PI/47);  
  noStroke();
  fill(126, 126, 145, 255);
  ellipse (300, 314, 50, 15);
  fill(0, 0, 0, 254);
  ellipse (300, 313, 33, 11);
  fill(255, 255, 255, 221);
  ellipse (300, 313, 22, 7);
  fill(253, 253, 250, 227);
  ellipse (300, 311, 21, 7);
  fill(236, 235, 236, 253);
  stroke(17, 36);
  ellipse (300, 310, 18, 4);
  noStroke();
  fill(109, 108, 108, 50); 
  for (int i=0; i <5; i++) {
    rect (298+i, 311, 10, 5, 16, 8, 0, 0); 
    rect (289, 310, 1+i, 5, 16, 8, 0, 0);
  } 
  pushMatrix(); 
  textSize(11);
  translate(303, 395); 
  rotate(PI+PI/2);
  fill(1, 254);
  text ("L I T H I U M", 0, 0);
  fill(199, 254);
  text ("L I T H I U M", -2, 0);
  popMatrix();
}

