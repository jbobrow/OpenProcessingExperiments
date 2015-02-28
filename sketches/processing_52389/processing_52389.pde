
/* Kriti Shrestha
 Assignment No. 3
 02.14.2012
 Music and colors
 Use of function to draw concentric circles, musical notation in circles, 
 and musical instruments. Also, use of function to draw CDs at the bottom 
 of the screen. Radius and color of the CDs are randomized. 
 Foreground circles are drawn when mouse is pressed, according to the position 
 of the mouse, and eventually cover up the screen if mouse is pressed, held 
 and moved*/
void draw() {

  noFill();
  if (mousePressed) {
    drawFground(mouseX, mouseY, 10);//function to draw foreground circles
  }
}
void setup() {
  size (650, 650);
  background (255, 255, 255);
  smooth();
  noFill();
  for (int i=1; i<100; i=i+2) {//concentric circles
    strokeWeight(0.5);
    stroke(random(50, 255), random(200), random(200), i*30);


    ellipse(width/2, height/2, i*15, i*15);
  }

  fill(255, 255, 0);


  stroke(255, 255, 0);
  strokeWeight(2);
  curve(0, 80, 0, 90, 20, 90, 30, 80 );//begin guitar
  curve(0, 50, 20, 90, 8, 120, 0, 50);
  line(8, 120, 8, 260);
  line(3, 120, 3, 260);
  curve(0, 240, 8, 260, 35, 270, 10, 300);
  curve(0, 310, 35, 270, 15, 310, 0, 300);
  curve(0, 350, 15, 310, 55, 330, 10, 400);
  curve(10, 350, 55, 330, 25, 380, 0, 300);
  curve(0, 350, 25, 380, 0, 382, 0, 380);
  ellipse(26, 97, 3, 3);
  ellipse(24, 105, 3, 3);
  ellipse(21, 112, 3, 3);

  fill(255, 255, 255);


  ellipse(0, 310, 22, 22);//end guitar

  noFill();
  for (int i=1; i<8; i++) {//concentric circles
    strokeWeight(i*0.5);
    stroke(255, 0, 0, i*30);

    ellipse(width/3.5, height/8, i*25, i*25);
  }


  for (int i=1; i<5; i++) {//concentric circles
    strokeWeight(i*0.5);
    stroke(255, 0, 0, i*30);

    ellipse(width/4.5, height/4, i*25, i*25);
  }
  stroke (255, 0, 0);

  for (int i=1; i<6; i++) {//strings
    line (300, 100+i*15, 640, 100+i*15);
  } 


  fill(255, 0, 0); 
  ellipse(320, 170, 22, 20);//notation on strings
  line(330, 170, 340, 130);
  line(340, 130, 375, 115);
  line(338, 142, 375, 130);
  line(375, 115, 366, 152);
  ellipse(355, 157, 22, 20);

  ellipse(450, 150, 22, 20);
  line(460, 150, 468, 110);
  line(468, 110, 482, 114);

  ellipse(540, 165, 22, 20);
  line(550, 160, 558, 128);
  line(558, 128, 575, 135);


  noFill();
  for (int i=1; i<8; i++) {
    strokeWeight(i*0.5);
    stroke(255, 0, 0, i*30);

    ellipse(width/3.18, height/1.5, i*20, i*20);
  }

  for (int i=1; i<8; i++) {
    strokeWeight(i*0.5);
    stroke(255, 0, 0, i*30);

    ellipse(width/1.94, height/2.02, i*20, i*20);
  }
  fill(255, 255, 0);
  stroke(255, 255, 0);
  strokeWeight(1.5);

  drawNotes(width/3.25, height/1.5, 50);//musical notation in a circle
  drawNotes2(width/3.21, height/1.5, 50);
  drawNotes3(width/3.15, height/1.5, 50);
  drawNotes4(width/2, height/2, 50);//musical notation in a circle again
  drawNotes5(width/2.01, height/2, 50);
  drawNotes6(width/1.98, height/2, 50);
  drawPianowkey(width/1.5, height/1.5, 15, 50);//white keys of piano keyboard
  drawPianobkey(width/1.445, height/1.5, 10, 25);//black keys of piano keyboard
  drawPipes(width/1.75, height/1.65, 5, 12);//pipes

  drawCds(width/14, height/1.11, 30);
}


void drawFground(int cx, int cy, float radi) {

  noFill();
  for (int i=1; i<100; i=i+2) {//concentric circles
    strokeWeight(0.25);
    stroke(random(50, 255), random(200), random(200), i*30);
    radi=radi+1*30;

    ellipse(cx, cy, radi, radi);
  }
}
void drawNotes(float centerx, float centery, float radius) {
  float steps = 6;

  float angle = 2*PI/steps;
  for (float i=0; i<steps; i++) {
    float x = cos(angle*i)*radius + centerx;
    float y = sin(angle*i)*radius + centery; 

    ellipse(x, y, 12, 10);
  }
}
void drawNotes2(float center2x, float center2y, float radius2) {
  float steps2 = 6;

  float angle2 = 2*PI/steps2;
  for (float i=0; i<steps2; i++) {
    float x2 = cos(angle2*i)*radius2 + center2x;
    float y2 = sin(angle2*i)*radius2 + center2y;
    float x2a = cos(angle2*i)*radius2 + center2x;
    float y2a = sin(angle2*i)*radius2 + center2y;

    line(x2*1.02, y2, x2a*1.07, y2a*0.95);
  }
}
void drawNotes3(float center3x, float center3y, float radius3) {
  float steps3 = 6;

  float angle3 = 2*PI/steps3;
  for (float i=0; i<steps3; i++) {
    float x3 = cos(angle3*i)*radius3 + center3x;
    float y3 = sin(angle3*i)*radius3 + center3y; 
    float x3a = cos(angle3*i)*radius3 + center3x;
    float y3a = sin(angle3*i)*radius3 + center3y; 

    line(x3*1.05, y3*0.95, x3a*1.07, y3a*0.98);
  }
}
void drawNotes4(float center4x, float center4y, float radius4) {
  float steps4 = 6;

  float angle4 = 2*PI/steps4;
  for (float i=0; i<steps4; i++) {
    float x4 = cos(angle4*i)*radius4 + center4x;
    float y4 = sin(angle4*i)*radius4 + center4y; 

    ellipse(x4, y4, 12, 10);
  }
}
void drawNotes5(float center5x, float center5y, float radius5) {
  float steps5 = 6;

  float angle5 = 2*PI/steps5;
  for (float i=0; i<steps5; i++) {
    float x5 = cos(angle5*i)*radius5 + center5x;
    float y5 = sin(angle5*i)*radius5 + center5y;
    float x5a = cos(angle5*i)*radius5 + center5x;
    float y5a = sin(angle5*i)*radius5 + center5y;

    line(x5*1.02, y5, x5a*1.07, y5a*0.95);
  }
}
void drawNotes6(float center6x, float center6y, float radius6) {
  float steps6 = 6;

  float angle6 = 2*PI/steps6;
  for (float i=0; i<steps6; i++) {
    float x6 = cos(angle6*i)*radius6 + center6x;
    float y6 = sin(angle6*i)*radius6 + center6y; 
    float x6a = cos(angle6*i)*radius6 + center6x;
    float y6a = sin(angle6*i)*radius6 + center6y; 

    line(x6*1.05, y6*0.95, x6a*1.06, y6a*0.98);
  }
}
void drawPianowkey(float cornerx, float cornery, float w, float h) {

  stroke(0, 0, 0); 
  fill(255, 255, 255);
  for (float i=5; i<200; i=i+18) {
    rect(cornerx+i, cornery, w, h);
  }
}
void drawPianobkey(float cornerx, float cornery, float w, float h) {

  stroke(0, 0, 0); 
  fill(0, 0, 0);
  for (float i=0; i<50; i=i+18) {
    rect(cornerx+i, cornery, w, h);
  }
  for (float i=72; i<100; i=i+18) {
    rect(cornerx+i, cornery, w, h);
  }
  for (float i=125; i<165; i=i+18) {
    rect(cornerx+i, cornery, w, h);
  }
}
void drawPipes(float cornerx1, float cornery1, float w1, float h1) {
  noStroke(); 
  fill(255, 0, 0);
  for (float i=0; i<50; i=i+8) {
    rect(cornerx1+i, cornery1, w1, h1+i);
  }
  fill(0, 0, 0);
  rect(cornerx1, cornery1+4, w1*10.5, h1/4);
}

void drawCds(float centx, float centy, float rad) {

  for (float i=0; i<width; i=i+100) {
    ellipse (centx+i, centy, rad*1.25, rad*1.25);
  }
  for (float i=0; i<width; i=i+100) {
    float rad2= rad+random(40, 40+i/5);
    noStroke();
    fill (random (50, 255), random (50, 255), random(150, 200));
    ellipse (centx+i, centy, rad2, rad2);
  }
  noFill();
  stroke (255, 255, 255);
  for (float i=0; i<width; i=i+100) {
    ellipse (centx+i, centy, rad, rad);
  }

  fill (255, 255, 255);
  for (float i=0; i<width; i=i+100) {
    ellipse (centx+i, centy, rad*0.68, rad*0.68);
  }
}


