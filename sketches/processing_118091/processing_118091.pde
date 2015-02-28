
//Cantonese Pop Music Visualization
//Data from http://zh.wikipedia.org/wiki/%E5%8D%81%E5%A4%A7%E5%8B%81%E6%AD%8C%E9%87%91%E6%9B%B2%E9%A0%92%E7%8D%8E%E5%85%B8%E7%A6%AE

color[] blues = {#E9E9E8, #F4A81E, #F7E973, #DD4467, #2992AA};
color[] palette = blues;

PFont titleFont, labelFont;
PImage award;

String[] femaleSinger = {"Joey Yung", "Miriam Yeung", "Faye Wong", "Kelly Chan", "Anita Mui", "Sally Yeh", "Sammi Cheng"};
String[] maleSinger = {"Jacky Cheung", "Eason Chan", "Raymond Lam", "Andy Lau", "Alan Tam", "Leon Lai", "Leo Ku", "Aaron Kwok", "Hacken Lee", "Leslie Cheung"};


int[] femaleAward = {8, 3, 2, 2, 5, 4, 3};
int[] maleAward = {1, 2, 1, 6, 4, 2, 4, 3, 3, 2};

float circleX, circleY;
float circleSize = 200;
float singerSize = 20;
float singerSize2 = 20;
float singerSize3 = 20;
float singerSize4 = 20;
float singerSize5 = 20;
float singerSize6 = 20;
float singerSize7 = 20;
float singerSize8 = 20;
float singerSize9 = 20;
float singerSize10 = 20;
float singerSize11 = 20;
float singerSize12 = 20;
float singerSize13 = 20;
float singerSize14 = 20;
float singerSize15 = 20;
float singerSize16 = 20;
float singerSize17 = 20;

void setup(){
  size(600, 600);
  titleFont = loadFont("GillSans-24.vlw");
  labelFont = loadFont("GillSans-32.vlw");
  smooth();
  //singerSpeed = 0;
  circleX = width/2;
  circleY = height/2;
}

void draw(){
  background(palette[0]);
  noFill();
//  noStroke();
  
  fill(palette[1]);
  textFont(titleFont);
  textAlign(CENTER);
  text("Jade Solid Gold Most Favorite Singers", width/2, 50);

  // Draw a circle
  strokeWeight(10);
  ellipseMode(RADIUS);
  stroke(palette[2]);
  noFill();
  ellipse(circleX, circleY, circleSize, circleSize);
  
  //draw mini circles
  noStroke();
  textFont(labelFont);
  award = loadImage("award.png");
  
  //Female Singers
  fill(palette[3]);
  //singer1
  ellipse(100, 100, singerSize, singerSize);
  //makes circle larger and small when hover
  if(dist(100,100, mouseX, mouseY) < singerSize){
    text(femaleSinger[0], 300, 300);
    image(award, 200, 330, 50, 40);
    image(award, 250, 330, 50, 40);
    image(award, 300, 330, 50, 40);
    image(award, 350, 330, 50, 40);
    image(award, 200, 380, 50, 40);
    image(award, 250, 380, 50, 40);
    image(award, 300, 380, 50, 40);
    image(award, 350, 380, 50, 40);
    
    singerSize += .5;
    singerSize = constrain(singerSize, 0, 40);
  }else {
    singerSize -= .5;
    singerSize = constrain(singerSize, 20, 40);
  }
  
  //singer2
   ellipse(400, 100, singerSize2, singerSize2);
  //makes circle larger and small when hover
  if(dist(400,100, mouseX, mouseY) < singerSize2){
    text(femaleSinger[1], 300, 300);
    image(award, 200, 330, 50, 40);
    image(award, 250, 330, 50, 40);
    image(award, 300, 330, 50, 40);
    
    singerSize2 += .5;
    singerSize2 = constrain(singerSize2, 0, 40);
  }else {
    singerSize2 -= .5;
    singerSize2 = constrain(singerSize2, 20, 40);
  }
  
  
  //singer3
   ellipse(100, 200, singerSize3, singerSize3);
  //makes circle larger and small when hover
  if(dist(100,200, mouseX, mouseY) < singerSize3){
    text(femaleSinger[2], 300, 300);
    image(award, 200, 330, 50, 40);
    image(award, 250, 330, 50, 40);
    
    singerSize3 += .5;
    singerSize3 = constrain(singerSize3, 0, 40);
  }else {
    singerSize3 -= .5;
    singerSize3 = constrain(singerSize3, 20, 40);
  }
  
  //singer4
   ellipse(50, 300, singerSize4, singerSize4);
  //makes circle larger and small when hover
  if(dist(50,300, mouseX, mouseY) < singerSize4){
    text(femaleSinger[3], 300, 300);
    image(award, 200, 330, 50, 40);
    image(award, 250, 330, 50, 40);
    
    singerSize4 += .5;
    singerSize4 = constrain(singerSize4, 0, 40);
  }else {
    singerSize4 -= .5;
    singerSize4 = constrain(singerSize4, 20, 40);
  }
  
  
  //singer5
   ellipse(120, 500, singerSize5, singerSize5);
  //makes circle larger and small when hover
  if(dist(120,500, mouseX, mouseY) < singerSize5){
    text(femaleSinger[4], 300, 300);
    image(award, 200, 330, 50, 40);
    image(award, 250, 330, 50, 40);
    image(award, 300, 330, 50, 40);
    image(award, 350, 330, 50, 40);
    image(award, 200, 380, 50, 40);
    
    singerSize5 += .5;
    singerSize5 = constrain(singerSize5, 0, 40);
  }else {
    singerSize5 -= .5;
    singerSize5 = constrain(singerSize5, 20, 40);
  }
  
  //singer6
   ellipse(570, 200, singerSize6, singerSize6);
  //makes circle larger and small when hover
  if(dist(570,200, mouseX, mouseY) < singerSize6){
    text(femaleSinger[5], 300, 300);
    image(award, 200, 330, 50, 40);
    image(award, 250, 330, 50, 40);
    image(award, 300, 330, 50, 40);
    image(award, 350, 330, 50, 40);
    
    singerSize6 += .5;
    singerSize6 = constrain(singerSize6, 0, 40);
  }else {
    singerSize6 -= .5;
    singerSize6 = constrain(singerSize6, 20, 40);
  }
  
  //singer7
   ellipse(500, 500, singerSize7, singerSize7);
  //makes circle larger and small when hover
  if(dist(500,500, mouseX, mouseY) < singerSize7){
    text(femaleSinger[6], 300, 300);
    image(award, 200, 330, 50, 40);
    image(award, 250, 330, 50, 40);
    image(award, 300, 330, 50, 40);
    
    singerSize7 += .5;
    singerSize7 = constrain(singerSize7, 0, 40);
  }else {
    singerSize7 -= .5;
    singerSize7 = constrain(singerSize7, 20, 40);
  }
  
  //Male Singers
  fill(palette[4]);
  //singer1
   ellipse(350, 540, singerSize8, singerSize8);
  //makes circle larger and small when hover
  if(dist(350,540, mouseX, mouseY) < singerSize8){
    text(maleSinger[0], 300, 300);
    image(award, 200, 330, 50, 40);
    
    singerSize8 += .5;
    singerSize8 = constrain(singerSize8, 0, 40);
  }else {
    singerSize8 -= .5;
    singerSize8 = constrain(singerSize8, 20, 40);
  }
  
  //singer2
   ellipse(200, 70, singerSize9, singerSize9);
  //makes circle larger and small when hover
  if(dist(200,70, mouseX, mouseY) < singerSize9){
    text(maleSinger[1], 300, 300);
    image(award, 200, 330, 50, 40);
    image(award, 250, 330, 50, 40);
    
    singerSize9 += .5;
    singerSize9 = constrain(singerSize9, 0, 40);
  }else {
    singerSize9 -= .5;
    singerSize9 = constrain(singerSize9, 20, 40);
  }
  
  //singer3
   ellipse(560, 380, singerSize10, singerSize10);
  //makes circle larger and small when hover
  if(dist(560, 380, mouseX, mouseY) < singerSize10){
    text(maleSinger[2], 300, 300);
    image(award, 200, 330, 50, 40);
    
    singerSize10 += .5;
    singerSize10 = constrain(singerSize10, 0, 40);
  }else {
    singerSize10 -= .5;
    singerSize10 = constrain(singerSize10, 20, 40);
  }
  
  //singer4
   ellipse(540, 260, singerSize11, singerSize11);
  //makes circle larger and small when hover
  if(dist(540, 260, mouseX, mouseY) < singerSize11){
    text(maleSinger[3], 300, 300);
    image(award, 200, 330, 50, 40);
    image(award, 250, 330, 50, 40);
    image(award, 300, 330, 50, 40);
    image(award, 350, 330, 50, 40);
    image(award, 200, 380, 50, 40);
    image(award, 250, 380, 50, 40);
    
    singerSize11 += .5;
    singerSize11 = constrain(singerSize11, 0, 40);
  }else {
    singerSize11 -= .5;
    singerSize11 = constrain(singerSize11, 20, 40);
  }
  
  //singer5
   ellipse(520, 130, singerSize12, singerSize12);
  //makes circle larger and small when hover
  if(dist(520, 130, mouseX, mouseY) < singerSize12){
    text(maleSinger[4], 300, 300);
    image(award, 200, 330, 50, 40);
    image(award, 250, 330, 50, 40);
    image(award, 300, 330, 50, 40);
    image(award, 350, 330, 50, 40);
    
    singerSize12 += .5;
    singerSize12 = constrain(singerSize12, 0, 40);
  }else {
    singerSize12 -= .5;
    singerSize12 = constrain(singerSize12, 20, 40);
  }
  
  //singer6
   ellipse(90, 400, singerSize13, singerSize13);
  //makes circle larger and small when hover
  if(dist(90, 400, mouseX, mouseY) < singerSize13){
    text(maleSinger[5], 300, 300);
    image(award, 200, 330, 50, 40);
    image(award, 250, 330, 50, 40);
    
    singerSize13 += .5;
    singerSize13 = constrain(singerSize13, 0, 40);
  }else {
    singerSize13 -= .5;
    singerSize13 = constrain(singerSize13, 20, 40);
  }
  
  //singer7
   ellipse(260, 560, singerSize14, singerSize14);
  //makes circle larger and small when hover
  if(dist(260, 560, mouseX, mouseY) < singerSize14){
    text(maleSinger[6], 300, 300);
image(award, 200, 330, 50, 40);
    image(award, 250, 330, 50, 40);
    image(award, 300, 330, 50, 40);
    image(award, 350, 330, 50, 40);
    image(award, 200, 380, 50, 40);
    
    singerSize14 += .5;
    singerSize14 = constrain(singerSize14, 0, 40);
  }else {
    singerSize14 -= .5;
    singerSize14 = constrain(singerSize14, 20, 40);
  }
  
  //singer8
   ellipse(30, 380, singerSize15, singerSize15);
  //makes circle larger and small when hover
  if(dist(30, 380, mouseX, mouseY) < singerSize15){
    text(maleSinger[7], 300, 300);
    image(award, 200, 330, 50, 40);
    image(award, 250, 330, 50, 40);
    image(award, 300, 330, 50, 40);
    
    singerSize15 += .5;
    singerSize15 = constrain(singerSize15, 0, 40);
  }else {
    singerSize15 -= .5;
    singerSize15 = constrain(singerSize15, 20, 40);
  }
  
  //singer9
   ellipse(50, 120, singerSize16, singerSize16);
  //makes circle larger and small when hover
  if(dist(50, 120, mouseX, mouseY) < singerSize16){
    text(maleSinger[8], 300, 300);
    image(award, 200, 330, 50, 40);
    image(award, 250, 330, 50, 40);
    image(award, 300, 330, 50, 40);
    
    singerSize16 += .5;
    singerSize16 = constrain(singerSize16, 0, 40);
  }else {
    singerSize16 -= .5;
    singerSize16 = constrain(singerSize16, 20, 40);
  }
  
  //singer10
   ellipse(560, 500, singerSize17, singerSize17);
  //makes circle larger and small when hover
  if(dist(560, 500, mouseX, mouseY) < singerSize17){
    text(maleSinger[9], 300, 300);
    image(award, 200, 330, 50, 40);
    image(award, 250, 330, 50, 40);
    
    singerSize17 += .5;
    singerSize17 = constrain(singerSize17, 0, 40);
  }else {
    singerSize17 -= .5;
    singerSize17 = constrain(singerSize17, 20, 40);
  }
}


//Reference: 


