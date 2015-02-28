
float speed1 = 1;
float speed2 = 2;
float drop1 = 15;
float drop2 = 16;
float drop3 = 17;
int rain1Y = 0;
int rain2Y = 0;
int rain3Y = 0;
int cloud1 = 100;
int cloud2 = 150;
int cloud3 = 200;
int cloud4 = 50;
int cloud5 = 250;
int cloud6 = 100;
int cloud7 = 150;
int cloud8 = 200;
int cloud9 = 50;
int cloud10 = 250;
int cloud11 = 350;
int cloud12 = 400;
int cloud13 = 450;
int cloud14 = 300;
int cloud15 = 500;
int x = 325;
int y = 310;
void setup() {
  size(500, 700);
  smooth();
  background(255);
}
void draw() {
  noStroke();
  if (mouseY > 0 && mouseY < 25) {
    fill(0, 175, 232);
    rect(0, 0, 500, 700);
  }
  if (mouseY > 25 && mouseY < 50) {
    fill(37, 169, 210, 50);
    rect(0, 0, 500, 700);
  }
  if (mouseY > 50 && mouseY < 75) {
    fill(36, 164, 202, 50);
    rect(0, 0, 500, 700);
  }
  if (mouseY > 75 && mouseY < 100) {
    fill(39, 161, 188, 50);
    rect(0, 0, 500, 700);
  }
  if (mouseY > 100 && mouseY < 125) {
    fill(75, 157, 172, 50);
    rect(0, 0, 500, 700);
  }
  if (mouseY > 125 && mouseY < 150) {
    fill(107, 151, 157, 50);
    rect(0, 0, 500, 700);
  }
  if (mouseY > 150 && mouseY < 175) {
    fill(127, 147, 144, 50);
    rect(0, 0, 500, 700);
  }
  if (mouseY > 175 && mouseY < 200) {
    fill(143, 142, 133, 50);
    rect(0, 0, 500, 700);
  }
  if (mouseY > 200 && mouseY < 225) {
    fill(159, 138, 122, 50);
    rect(0, 0, 500, 700);
  }
  if (mouseY > 225 && mouseY < 250) {
    fill(170, 132, 110, 50);
    rect(0, 0, 500, 700);
  }
  if (mouseY > 250 && mouseY < 275) {
    fill(183, 128, 100, 50);
    rect(0, 0, 500, 700);
  }
  if (mouseY > 275 && mouseY < 300) {
    fill(195, 121, 87, 50);
    rect(0, 0, 500, 700);
  }
  if (mouseY > 300 && mouseY < 325) {
    fill(208, 114, 75, 50);
    rect(0, 0, 500, 700);
  }
  if (mouseY > 350 && mouseY < 375) {
    fill(224, 104, 60, 50);
    rect(0, 0, 500, 700);
  }
  if (mouseY > 375 && mouseY < 400) {
    fill(238, 92, 45, 50);
    rect(0, 0, 500, 700);
  }
  if (mouseY > 400 && mouseY < 425) {
    fill(226, 85, 50, 50);
    rect(0, 0, 500, 700);
  }
  if (mouseY > 425 && mouseY < 450) {
    fill(208, 79, 58, 50);
    rect(0, 0, 500, 700);
  }
  if (mouseY > 450 && mouseY < 475) {
    fill(189, 74, 64, 50);
    rect(0, 0, 500, 700);
  }
  if (mouseY > 475 && mouseY < 500) {
    fill(173, 70, 71, 50);
    rect(0, 0, 500, 700);
  }
  if (mouseY > 500 && mouseY < 525) {
    fill(155, 63, 75, 50);
    rect(0, 0, 500, 700);
  }
  if (mouseY > 525 && mouseY < 550) {
    fill(141, 59, 80, 50);
    rect(0, 0, 500, 700);
  }
  if (mouseY > 550 && mouseY < 575) {
    fill(128, 55, 83, 50);
    rect(0, 0, 500, 700);
  }
  if (mouseY > 575 && mouseY < 600) {
    fill(101, 49, 89, 50);
    rect(0, 0, 500, 700);
  }
  if (mouseY > 600 && mouseY < 625) {
    fill(85, 45, 92, 50);
    rect(0, 0, 500, 700);
  }
  if (mouseY > 625 && mouseY < 650) {
    fill(73, 42, 93, 50);
    rect(0, 0, 500, 700);
  }
  if (mouseY > 650 && mouseY < 675) {
    fill(58, 38, 95, 50);
    rect(0, 0, 500, 700);
  }
  if (mouseY > 675 && mouseY < 700) {
    fill(43, 35, 97, 50);
    rect(0, 0, 500, 700);
  }
  if (mouseY > 0 && mouseY < 200) {
    fill(255, 255, 0);
  }
  if (mouseY > 200 && mouseY < 400) {
    fill(255, 198, 10);
  }
  if (mouseY > 400 && mouseY < 500) {
    fill(255, 51, 0);
  }
  if (mouseY > 500 && mouseY < 700) {
    fill(255, 255, 255);
  }
  ellipse(mouseX, mouseY, 150, 150);
  //lightning
  if (keyPressed) {
    if (key == 'l') {
      fill(255, 255, 255);
      beginShape();
      vertex(200, 0);
      vertex(250, 100);
      vertex(225, 150);
      vertex(200, 175);
      vertex(180, 200);
      vertex(150, 225);
      vertex(100, 250);
      vertex(0, 300);
      vertex(100, 255);
      vertex(150, 230);
      vertex(180, 205);
      vertex(200, 180);
      vertex(225, 200);
      vertex(250, 250);
      vertex(200, 300);
      vertex(200, 400);
      vertex(150, 450);
      vertex(125, 500);
      vertex(150, 460);
      vertex(200, 410);
      vertex(225, 450);
      vertex(250, 500);
      vertex(300, 525);
      vertex(350, 550);
      vertex(305, 525);
      vertex(255, 500);
      vertex(230, 450);
      vertex(205, 410);
      vertex(205, 300);
      vertex(255, 250);
      vertex(300, 300);
      vertex(400, 350);
      vertex(500, 450);
      vertex(400, 345);
      vertex(300, 295);
      vertex(260, 250);
      vertex(230, 200);
      vertex(205, 180);
      vertex(205, 175);
      vertex(230, 150);
      vertex(255, 100);
      vertex(205, 0);
      endShape();
    }
  }
  //cloud#1  
  if (mouseY < 350) {
    fill(255, 255, 255);
  }
  if (mouseY > 350) {
    fill(150, 150, 150);
  }
  ellipse(cloud1, 100, 75, 75);
  ellipse(cloud2, 100, 75, 75);
  ellipse(cloud3, 100, 75, 75);
  ellipse(cloud4, 125, 75, 75);
  ellipse(cloud5, 125, 75, 75);
  ellipse(cloud1, 150, 75, 75);
  ellipse(cloud2, 150, 75, 75);
  ellipse(cloud3, 150, 75, 75);
  cloud1 += speed1;
  cloud2 += speed1;
  cloud3 += speed1;
  cloud4 += speed1;
  cloud5 += speed1;
  if (cloud1 > width + 75) {
    cloud1 = -75;
  }
  if (cloud2 > width + 75) {
    cloud2 = -75;
  }
  if (cloud3 > width + 75) {
    cloud3 = -75;
  }
  if (cloud4 > width + 75) {
    cloud4 = -75;
  }
  if (cloud5 > width + 75) {
    cloud5 = -75;
  }
  //cloud#2
  ellipse(cloud6, 300, 75, 75);
  ellipse(cloud7, 300, 75, 75);
  ellipse(cloud8, 300, 75, 75);
  ellipse(cloud9, 325, 75, 75);
  ellipse(cloud10, 325, 75, 75);
  ellipse(cloud6, 350, 75, 75);
  ellipse(cloud7, 350, 75, 75);
  ellipse(cloud8, 350, 75, 75);
  cloud6 += speed2;
  cloud7 += speed2;
  cloud8 += speed2;
  cloud9 += speed2;
  cloud10 += speed2;
  if (cloud6 > width + 75) {
    cloud6 = -75;
  }
  if (cloud7 > width + 75) {
    cloud7 = -75;
  }
  if (cloud8 > width + 75) {
    cloud8 = -75;
  }
  if (cloud9 > width + 75) {
    cloud9 = -75;
  }
  if (cloud10 > width + 75) {
    cloud10 = -75;
  }
  //cloud#3
  ellipse(cloud11, 500, 75, 75);
  ellipse(cloud12, 500, 75, 75);
  ellipse(cloud13, 500, 75, 75);
  ellipse(cloud14, 525, 75, 75);
  ellipse(cloud15, 525, 75, 75);
  ellipse(cloud11, 550, 75, 75);
  ellipse(cloud12, 550, 75, 75);
  ellipse(cloud13, 550, 75, 75);
  cloud11 += speed1;
  cloud12 += speed1;
  cloud13 += speed1;
  cloud14 += speed1;
  cloud15 += speed1;
  if (cloud11 > width + 75) {
    cloud11 = -75;
  }
  if (cloud12 > width + 75) {
    cloud12 = -75;
  }
  if (cloud13 > width + 75) {
    cloud13 = -75;
  }
  if (cloud14 > width + 75) {
    cloud14 = -75;
  }
  if (cloud15 > width + 75) {
    cloud15 = -75;
  }
  //rain
  if(keyPressed){
    if(key == 'r'){
  fill(0, 190, 255);
  ellipse(0, rain1Y, 10, 10);
  ellipse(40, rain2Y, 10, 10);
  ellipse(80, rain3Y, 10, 10);
  ellipse(120, rain1Y, 10, 10);
  ellipse(160, rain2Y, 10, 10);
  ellipse(200, rain3Y, 10, 10);
  ellipse(240, rain1Y, 10, 10);
  ellipse(280, rain2Y, 10, 10);
  ellipse(320, rain3Y, 10, 10);
  ellipse(360, rain1Y, 10, 10);
  ellipse(400, rain3Y, 10, 10);
  ellipse(440, rain1Y, 10, 10);
  ellipse(480, rain2Y, 10, 10);
  rain1Y += drop1;
  if (rain1Y > height + 10){
    rain1Y = -10;
  }
  ellipse(20, rain3Y, 10, 10);
  ellipse(60, rain1Y, 10, 10);
  ellipse(100, rain2Y, 10, 10);
  ellipse(140, rain3Y, 10, 10);
  ellipse(180, rain1Y, 10, 10);
  ellipse(220, rain2Y, 10, 10);
  ellipse(260, rain3Y, 10, 10);
  ellipse(300, rain1Y, 10, 10);
  ellipse(340, rain2Y, 10, 10);
  ellipse(380, rain3Y, 10, 10);
  ellipse(420, rain1Y, 10, 10);
  ellipse(460, rain2Y, 10, 10);
  ellipse(500, rain3Y, 10, 10);
  rain2Y += drop2;
  if (rain2Y > height + 10){
    rain2Y = -10;
  }
  ellipse(10, rain1Y, 10, 10);
  ellipse(50, rain2Y, 10, 10);
  ellipse(90, rain3Y, 10, 10);
  ellipse(130, rain1Y, 10, 10);
  ellipse(170, rain2Y, 10, 10);
  ellipse(310, rain3Y, 10, 10);
  ellipse(250, rain1Y, 10, 10);
  ellipse(290, rain2Y, 10, 10);
  ellipse(330, rain3Y, 10, 10);
  ellipse(370, rain1Y, 10, 10);
  ellipse(410, rain3Y, 10, 10);
  ellipse(450, rain1Y, 10, 10);
  ellipse(490, rain2Y, 10, 10);
  rain3Y += drop3;
  if (rain1Y > height + 10){
    rain3Y = -10;
  }
    }
  }
  if(keyPressed){
   if(key == 'b'){   
fill(0);
beginShape();
vertex(300,300);
vertex(300,320);
vertex(325,310);
vertex(350,325);
vertex(375,310);
vertex(380,315);
vertex(385,310);
vertex(400,305);
vertex(385,300);
vertex(385,295);
vertex(370,300);
vertex(390,270);
vertex(425,290);
vertex(435,290);
vertex(390,250);
vertex(350,300);
vertex(350,250);
vertex(300,290);
vertex(310,290);
vertex(340,270);
vertex(340,300);
endShape();
   }
  }
}



