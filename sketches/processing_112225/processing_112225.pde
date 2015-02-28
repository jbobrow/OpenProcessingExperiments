
int j=0;
int m=0;
float cloudx=random(400,800);
float cloudy=random(200);
int hombrex=401;
void setup() {
  frameRate(60);
  int m=0;
  size(1100, 650);
}

void draw() {
  if (m==0) {
    sunnyDay();
  }
  else if (m==1) {
    meleeDay();
  }
  else if (m==2){
    thunderStorm();
  }
}

void sunnyDay() {
  sunnyBackground();
  drawLuckyHombre();
  drawHouse();
  drawFence();
  drawSun();
  drawRoad();
  driveCar();
}
void meleeDay() {
  cloudyBackground();
  drawUnluckyHombre();
  drawHouse();
  drawFence();
  drawSun();
  drawClouds(150);
  stroke(5);
  drawRoad();
  driveCar();
  drawRain();
  drawRain();
  drawRain();
}
void thunderStorm(){
  darkBackground();
  frameRate(1);
  drawLightning();
  frameRate(60);
  drawWetHombre();
  drawFence();
  drawHouse();
  drawClouds(40);
  stroke(5);
  drawRoad();
  driveCreepyCar();
  drawRain();
                             

}

void mousePressed() {
  m=(m+1)%3;
}



void drawUnluckyHombre() {
  int y= 330;
  fill(240, 180, 130);
  ellipse(hombrex+50, y+50, 80, 80);
  fill(255);
  ellipse(hombrex+65, y+35, 20, 10);
  ellipse(hombrex+35, y+35, 20, 10);
  line(hombrex+40, y+65, hombrex+60, y+65);
  line(hombrex+40, y+65, hombrex+25, y+75);
  line(hombrex+60, y+65, hombrex+75, y+75);
  ellipse(hombrex+45, y+55, 5, 5);
  ellipse(hombrex+55, y+55, 5, 5);
  ellipse(hombrex+65, y+35, 5, 5);
  ellipse(hombrex+35, y+35, 5, 5);
  line(hombrex+45, y+90, hombrex+41, y+105);
  line(hombrex+55, y+90, hombrex+59, y+105);
  fill(30, 44, 188);
  ellipse(hombrex+50, y+150, 60, 100);
  line(hombrex+74, y+120, hombrex+100, y+150);
  fill(0);
  hombrex=(hombrex-1);
  if (hombrex==400) {
    fill(240, 180, 130);
    ellipse(hombrex+50, y+50, 80, 80);
    fill(255);
    ellipse(hombrex+65, y+35, 20, 10);
    ellipse(hombrex+35, y+35, 20, 10);
    line(hombrex+40, y+75, hombrex+60, y+75);
    line(hombrex+40, y+75, hombrex+25, y+65);
    line(hombrex+60, y+75, hombrex+75, y+65);
    ellipse(hombrex+45, y+55, 5, 5);
    ellipse(hombrex+55, y+55, 5, 5);
    ellipse(hombrex+65, y+35, 5, 5);
    ellipse(hombrex+35, y+35, 5, 5);
    line(hombrex+45, y+90, hombrex+41, y+105);
    line(hombrex+55, y+90, hombrex+59, y+105);
    ellipse(hombrex+100, y+50, 10, 10);
    ellipse(hombrex+120, y+55, 15, 15);
    ellipse(hombrex+190, y+60, 110, 50);
    line(hombrex+150, y+70, hombrex+150, y+60);
    line(hombrex+150, y+60, hombrex+140, y+45);
    line(hombrex+150, y+60, hombrex+160, y+45);
    ellipse(hombrex+175, y+60, 30, 30);
    line(hombrex+193, y+70, hombrex+215, y+70);
    line(hombrex+193, y+70, hombrex+193, y+45);
    ellipse(hombrex+223, y+60, 30, 30);
    fill(0);
    ellipse(hombrex+50, y+150, 60, 100);
    line(hombrex+74, y+120, hombrex+100, y+150);
    fill(0);
    triangle(hombrex-10, y+25, hombrex+110, y+25, hombrex+50, y);
    hombrex=(hombrex+1);
  }
}
void drawClouds(int c) {
  fill(c);
  noStroke();
  ellipse(cloudx, cloudy, 40, 40);
  ellipse(cloudx+25, cloudy+25, 2*80, 4*40);
  ellipse(cloudx+20, cloudy-10, 2*80, 4*40);
  ellipse(cloudx+45, cloudy+10, 2*80, 4*40);
  ellipse(cloudx+100, cloudy-40, 2*80, 4*40);
  ellipse(cloudx+25+100, cloudy+25-40, 4*80, 2*40);
  ellipse(cloudx+20+100, cloudy-10-40, 4*80, 2*40);
  ellipse(cloudx+45+100, cloudy+10-40, 4*80, 2*40);
  ellipse(cloudx-150, cloudy+100, 2*80, 4*40);
  ellipse(cloudx+25-150, cloudy+25+100, 4*80, 2*40);
  ellipse(cloudx+20-150, cloudy-10+100, 4*80, 2*40);
  ellipse(cloudx+45-150, cloudy+10+100, 4*80, 2*40);
  ellipse(cloudx-400, cloudy-20, 2*80, 4*40);
  ellipse(cloudx+25-400, cloudy+25-20, 4*80, 2*40);
  ellipse(cloudx+20-400, cloudy-10-20, 4*80, 2*40);
  ellipse(cloudx+45-400, cloudy+10-20, 4*80, 2*40);
  ellipse(2*cloudx, cloudy, 40, 40);
  ellipse(2*cloudx+25, cloudy+25, 2*80, 4*40);
  ellipse(2*cloudx+20, cloudy-10, 2*80, 4*40);
  ellipse(2*cloudx+45, cloudy+10, 2*80, 4*40);
  ellipse(2*cloudx+100, cloudy-40, 2*80, 4*40);
  ellipse(2*cloudx+25+100, cloudy+25-40, 4*80, 2*40);
  ellipse(2*cloudx+20+100, cloudy-10-40, 4*80, 2*40);
  ellipse(2*cloudx+45+100, cloudy+10-40, 4*80, 2*40);
  ellipse(2*cloudx-150, cloudy+100, 2*80, 4*40);
  ellipse(2*cloudx+25-150, cloudy+25+100, 4*80, 2*40);
  ellipse(2*cloudx+20-150, cloudy-10+100, 4*80, 2*40);
  ellipse(2*cloudx+45-150, cloudy+10+100, 4*80, 2*40);
  ellipse(2*cloudx-400, cloudy-20, 2*80, 4*40);
  ellipse(2*cloudx+25-400, cloudy+25-20, 4*80, 2*40);
  ellipse(2*cloudx+20-400, cloudy-10-20, 4*80, 2*40);
  ellipse(2*cloudx+45-400, cloudy+10-20, 4*80, 2*40);
  cloudx--;
  if (cloudx<0) {
    cloudx=1500;
  }
}
void cloudyBackground() {
  fill(196, 198, 206);
  rect(0, 0, 1100, 450);
}
void drawRain() {
  float rainx=random(1100);
  float rainy=random(650);
  fill(24, 72, 240);
  noStroke();
  ellipse(rainx, rainy, 5, 5);
  triangle(rainx+1.25, rainy-1.25, rainx-1.25, rainy-1.25, rainx, rainy-6);
  stroke(5);
}

void drawLuckyHombre() {
  int y= 330;
  fill(255, 180, 130);
  ellipse(hombrex+50, y+50, 80, 80);
  fill(255);
  ellipse(hombrex+65, y+35, 20, 10);
  ellipse(hombrex+35, y+35, 20, 10);
  line(hombrex+40, y+75, hombrex+60, y+75);
  line(hombrex+40, y+75, hombrex+25, y+65);
  line(hombrex+60, y+75, hombrex+75, y+65);
  ellipse(hombrex+45, y+55, 5, 5);
  ellipse(hombrex+55, y+55, 5, 5);
  ellipse(hombrex+65, y+35, 5, 5);
  ellipse(hombrex+35, y+35, 5, 5);
  line(hombrex+45, y+90, hombrex+41, y+105);
  line(hombrex+55, y+90, hombrex+59, y+105);
  fill(30, 44, 188);
  ellipse(hombrex+50, y+150, 60, 100);
  line(hombrex+74, y+120, hombrex+100, y+150);
  hombrex=(hombrex+1);
  if (hombrex==600) {
    fill(255, 180, 130);
    ellipse(hombrex+50, y+50, 80, 80);
    fill(255);
    ellipse(hombrex+65, y+35, 20, 10);
    ellipse(hombrex+35, y+35, 20, 10);
    line(hombrex+40, y+75, hombrex+60, y+75);
    line(hombrex+40, y+75, hombrex+25, y+65);
    line(hombrex+60, y+75, hombrex+75, y+65);
    ellipse(hombrex+45, y+55, 5, 5);
    ellipse(hombrex+55, y+55, 5, 5);
    ellipse(hombrex+65, y+35, 5, 5);
    ellipse(hombrex+35, y+35, 5, 5);
    line(hombrex+45, y+90, hombrex+41, y+105);
    line(hombrex+55, y+90, hombrex+59, y+105);
    fill(30, 44, 188);
    ellipse(hombrex+50, y+150, 60, 100);
    line(hombrex+74, y+120, hombrex+100, y+150);
    hombrex=hombrex-1;
  }
}

void drawHouse() {
  float sidelenght =200;
  float x = 200;
  float y = 350;
  fill(255);
  rect(x, y, sidelenght, sidelenght);
  fill(77, 18, 18);
  triangle(x, y, x+sidelenght, y, (x+x+sidelenght)/2, y-0.5*sidelenght);
  fill(132, 229, 223);
  stroke(0);
  rect(x+(sidelenght/6), y+(sidelenght/3), (sidelenght/6), (sidelenght/6));
  fill(111, 22, 81);
  rect(x+(sidelenght/2), y+sidelenght/3+sidelenght/15, 4*sidelenght/15, 9*sidelenght/15);
}
void drawFence() {
  for (int i=10;i<100;i++) {
    fill(77, 18, 18);
    rect(200+20*i, 450, 20, 100);
  }
  for (int i=0;i<10;i++) {
    fill(77, 18, 18);
    rect(20*i, 450, 20, 100);
  }
}
void drawSun() {
  fill(247, 195, 5);
  ellipse(100, 100, 80, 80);
}

void sunnyBackground() {
  fill(151, 245, 231);
  ;
  rect(0, 0, 1100, 450);
}
void drawRoad() {
  fill(45, 49, 59);
  rect(0, 550, width, 100);
  for (int i=0;i<40;i++) {
    fill(247, 195, 5);
    quad(40*i, 610, 40*i+5, 590, 40*i+35, 590, 40*i+30, 610);
  }
}
void driveCar() { 
  if (keyPressed==true) {
    fill(0);
    ellipse(2*j, 620, 50, 50);
    ellipse(2*j+150, 620, 50, 50); 
    fill(70);
    ellipse(2*j, 620, 30, 30);
    ellipse(2*j+150, 620, 30, 30);
    fill(255, 0, 0);
    rect(2*j-40, 513, 230, 80);
    rect(2*j+90, 433, 100, 80);
    fill(151, 245, 231);
    rect(2*j+110, 443, 60, 60);
    fill(240, 180, 130);
    ellipse(2*j+140, 478, 50, 50);
    fill(255);
    ellipse(2*j+153, 473, 10, 5);
    line(2*j+163, 487, 2*j+158, 488);
    line(2*j+158, 488, 2*j+153, 487);
    j=(j+2)%600;
  }
  else {
    fill(0);
    ellipse(2*j, 620, 50, 50);
    ellipse(2*j+150, 620, 50, 50); 
    fill(70);
    ellipse(2*j, 620, 30, 30);
    ellipse(2*j+150, 620, 30, 30);
    fill(255, 0, 0);
    rect(2*j-40, 513, 230, 80);
    rect(2*j+90, 433, 100, 80);
    fill(151, 245, 231);
    rect(2*j+110, 443, 60, 60);
    fill(240, 180, 130);
    ellipse(2*j+140, 478, 50, 50);
    fill(255);
    ellipse(2*j+153, 473, 10, 5);
    line(2*j+163, 487, 2*j+158, 488);
    line(2*j+158, 488, 2*j+153, 487);
  }
}

void drawWetHombre() {
  int y=330;
  fill(240, 180, 130);
  ellipse(hombrex+50, y+50, 80, 80);
  fill(255);
  ellipse(hombrex+65, y+35, 20, 10);
  ellipse(hombrex+35, y+35, 20, 10);
  fill(255, 50, 50);
  ellipse(hombrex+50, y+70, 20, random(20));
  fill(255);
  ellipse(hombrex+45, y+55, 5, 5);
  ellipse(hombrex+55, y+55, 5, 5);
  ellipse(hombrex+65, y+35, 5, 5);
  ellipse(hombrex+35, y+35, 5, 5);
  line(hombrex+45, y+90, hombrex+41, y+105);
  line(hombrex+55, y+90, hombrex+59, y+105);
  fill(0);
  ellipse(hombrex+50, y+150, 60, 100);
  line(hombrex+74, y+120, hombrex+100, y+150);
  fill(0);
  triangle(hombrex-10, y+25, hombrex+110, y+25, hombrex+50, y);
  fill(255);
  ellipse(hombrex+100, y+50, 10, 10);
  ellipse(hombrex+120, y+55, 15, 15);
  ellipse(hombrex+190, y+60, 110, 50);
  strokeWeight(10);
  ellipse(hombrex+155, y+60, 25, 30);
  line(hombrex+175, y+75, hombrex+175, y+45);
  line(hombrex+175, y+45, hombrex+185, y+70);
  line(hombrex+185, y+70, hombrex+195, y+45);
  line(hombrex+195, y+45, hombrex+195, y+75);
  line(hombrex+205, y+45, hombrex+225, y+45);
  line(hombrex+205, y+45, hombrex+205, y+75);
  line(hombrex+205, y+75, hombrex+225, y+75);
  line(hombrex+225, y+75, hombrex+225, y+60);
  line(hombrex+225, y+60, hombrex+215, y+60);
  strokeWeight(1);
}
void darkBackground() {
  fill(65, 67, 75);
  rect(0, 0, 1100, 450);
}
void drawLightning() {
  float x1=random(1100);
  float x2=random(1100);
  float x3=random(1100);
  float x3b=random(1100);
  float x4=random(1100);
  float x4b=random(1100);
  float x4c=random(1100);
  float x4d=random(1100);
  fill(255, 227, 10);
  beginShape();
  vertex(x1, 30);
  vertex(x2, 190);
  vertex(x3, 400);
  vertex(x4, 500);
  vertex(x3+5, 400);
  vertex(x4b, 500);
  vertex(x3+10, 400);
  vertex(x2+10, 190);
  vertex(x3b, 440);
  vertex(x4c, 520);
  vertex(x3b+5, 440);
  vertex(x4d, 520);
  vertex(x3b+10, 440);
  vertex(x2+20, 190);
  vertex(x1, 30);
  endShape();
}
void driveCreepyCar() {
  if (keyPressed==true) {
    fill(0);
    ellipse(2*j, 620, 50, 50);
    ellipse(2*j+150, 620, 50, 50); 
    fill(70);
    ellipse(2*j, 620, 30, 30);
    ellipse(2*j+150, 620, 30, 30);
    fill(255, 0, 0);
    rect(2*j-40, 513, 230, 80);
    rect(2*j+90, 433, 100, 80);
    fill(151, 245, 231);
    rect(2*j+110, 443, 60, 60);
    fill(240, 180, 130);
    ellipse(2*j+140, 478, 50, 50);
    fill(255,0,0);
    ellipse(2*j+153, 473, 15, 10);
    line(2*j+163, 487, 2*j+150, 488);
    fill(255);
    triangle(2*j+150, 488,2*j+155,488,2*j+152 ,500);    
    j=(j+2)%600;
  }
  else {
    fill(0);
    ellipse(2*j, 620, 50, 50);
    ellipse(2*j+150, 620, 50, 50); 
    fill(70);
    ellipse(2*j, 620, 30, 30);
    ellipse(2*j+150, 620, 30, 30);
    fill(255, 0, 0);
    rect(2*j-40, 513, 230, 80);
    rect(2*j+90, 433, 100, 80);
    fill(151, 245, 231);
    rect(2*j+110, 443, 60, 60);
    fill(240, 180, 130);
    ellipse(2*j+140, 478, 50, 50);
    fill(255);
    ellipse(2*j+153, 473, 10, 5);
    line(2*j+163, 487, 2*j+158, 488);
    line(2*j+158, 488, 2*j+153, 487);
  }
}



