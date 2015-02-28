
// Konkuk University
// Department of Dynamic Media
// SOS iDesign
// Name:CHOI Joo Hee
// ID: 201420114

float x, y, z;

void setup() {
  size (600, 600);
  smooth();
  //setupAudio();
}

void draw() {

  fill(#FFB2C4, 120);
  int s = second();  
  int m = minute(); 
  int h = hour();
  float x= 300;
  float y =30;
  float z =15;
  background(255);


  //getVolume();
  //float Y = map(volume, 0, 200, 2, 100); 
  //float X = map(volume, 0, 200, 2, 200);



  //minute
  stroke(#FF9D9D);
  noFill();
  if (m>=5) {
    ellipse(x, x, 100+Y, 100+Y);
  }
  if (m>=10) {
    ellipse(x, x, 120+Y, 120+Y);
  }
  if (m>=15) {
    ellipse(x, x, 140+Y, 140+Y);
  }
  if (m>=20) {
    ellipse(x, x, 160+Y, 160+Y);
  }
  if (m>=25) {
    ellipse(x, x, 180+Y, 180+Y);
  }
  if (m>=30) {
    ellipse(x, x, 200+Y, 200+Y);
  }
  if (m>=35) {
    ellipse(x, x, 220+Y, 220+Y);
  }
  if (m>=40) {
    ellipse(x, x, 240+Y, 240+Y);
  }
  if (m>=45) {
    ellipse(x, x, 260+Y, 260+Y);
  }
  if (m>=50) {
    ellipse(x, x, 280+Y, 280+Y);
  }
  if (m>=55) {
    ellipse(x, x, 300+Y, 300+Y);
  }

  //hour ellipses
  stroke(#FFC25F);
  strokeWeight(5);
  noFill();
  if (h>=1) {
    ellipse(x, y, 100+X, 100+X);
  }
  if (h>=2) {
    ellipse(x, y, 120+X, 120+X);
  }
  if (h>=3) {
    ellipse(x, y, 140+X, 140+X);
  }
  if (h>=4) {
    ellipse(560, 305, 100+X, 100+X);
  }
  if (h>=5) {
    ellipse(560, 305, 120+X, 120+X);
  }
  if (h>=6) {
    ellipse(560, 305, 140+X, 140+X);
  }
  if (h>=7) {
    ellipse(300, 564, 100+X, 100+X);
  }
  if (h>=8) {
    ellipse(300, 564, 120+X, 120+X);
  }
  if (h>=9) {
    ellipse(300, 564, 140+X, 140+X);
  }
  if (h>=10) {
    ellipse(29, 314, 100+X, 100+X);
  }
  if (h>=11) {
    ellipse(29, 314, 120+X, 120+X);
  }
  if (h>=12) {
    ellipse(29, 314, 140+X, 140+X);
  }

  //time
  fill(#FFBE6F);
  String counter = h+" hr "+m+" min "+s+" sec";
  textAlign(CENTER);
  text(counter, 519, 570);

  //second petal 1
  fill(#FF8BA2+mouseX);
  noStroke();
  if (s>=1) { 
    ellipse(x, y, z, z);
    ellipse(x-z, y+z, z, z);
    ellipse(x, y+z+15, z, z);
    ellipse(x+z, y+z, z, z);
  }
  if (s>=2) {
    ellipse(375, 65, z, z);
  if (s>=5) { 
    ellipse(x+140, y+60, z, z);
    ellipse(x+140-z, y+60+z, z, z);
    ellipse(x+140, y+60+z+15, z, z);
    ellipse(x+140+z, y+60+z, z, z);
  }
  if (s>=6) {
    ellipse(480, 154, z, z);
  }  
  if (s>=10) { 
    ellipse(x+220, y+160, z, z);
    ellipse(x+220-z, y+160+z, z, z);
    ellipse(x+220, y+160+z+15, z, z);
    ellipse(x+220+z, y+160+z, z, z);
  }
  if (s>=11) {
    ellipse(543, 251, z, z);
    }

  //second petal 2
  if (s>=15) {
    ellipse(x+260, y+260, z, z);
    ellipse(x+260+z, y+260+z, z, z);
    ellipse(x+260-z, y+260+z, z, z);
    ellipse(x+260, y+260+z+15, z, z);
  }
  if (s>=16) {
    ellipse(542, 355, z, z);
  }
  if (s>=20) { 
    ellipse(x+220, y+350, z, z);
    ellipse(x+220-z, y+350+z, z, z);
    ellipse(x+220, y+350+z+15, z, z);
    ellipse(x+220+z, y+350+z, z, z);
  }
  if (s>=21) {
    ellipse(482, 461, z, z);
  }
  if (s>=25) { 
    ellipse(x+140, y+470, z, z);
    ellipse(x+140-z, y+470+z, z, z);
    ellipse(x+140, y+470+z+15, z, z);
    ellipse(x+140+z, y+470+z, z, z);
  }
  if (s>=26) {
    ellipse(365, 538, z, z);
  }

  //second petal 3
  if (s>=30) {
    ellipse(x, y+520, z, z);
    ellipse(x+z, y+520+z, z, z);
    ellipse(x-z, y+520+z, z, z);
    ellipse(x, y+z+520+15, z, z);
  }
  if (s>=31) {
    ellipse(234, 539, z, z);
  }
  if (s>=35) { 
    ellipse(x-120, y+470, z, z);
    ellipse(x-120-z, y+470+z, z, z);
    ellipse(x-120, y+470+z+15, z, z);
    ellipse(x-120+z, y+470+z, z, z);
  }
  if (s>=36) {
    ellipse(128, 450, z, z);
  }
  if (s>=40) { 
    ellipse(x-210, y+350, z, z);
    ellipse(x-210-z, y+350+z, z, z);
    ellipse(x-210, y+350+z+15, z, z);
    ellipse(x-210+z, y+350+z, z, z);
  }
  if (s>=41) {
    ellipse(55, 357, z, z);
  }

  //second petal 4
  if (s>=45) {
    ellipse(y, x, z, z);
    ellipse(y+z, x+z, z, z);
    ellipse(y-z, x+z, z, z);
    ellipse(y, x+z+15, z, z);
  }
  if (s>=46) {
    ellipse(40, 256, z, z);
  }
  if (s>=50) { 
    ellipse(x-250, y+160, z, z);
    ellipse(x-250-z, y+160+z, z, z);
    ellipse(x-250, y+160+z+15, z, z);
    ellipse(x-250+z, y+160+z, z, z);
  }
  if (s>=51) {
    ellipse(89, 159, z, z);
  }
  if (s>=55) { 
    ellipse(x-160, y+60, z, z);
    ellipse(x-160-z, y+60+z, z, z);
    ellipse(x-160, y+60+z+15, z, z);
    ellipse(x-160+z, y+60+z, z, z);
  }
  if (s>=56) {
    ellipse(211, 62, z, z);
  }
  if (s==60) {
    s=0;
  }
  if (s==59) {
    m = m + 1;
  }
  if (m==59) {
    h = h + 1;
    m = 0;
  }
  if (h>12) {
    h=1;
  }
 }
}

