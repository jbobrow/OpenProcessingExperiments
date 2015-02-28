
color lightBlue = color(66, 168, 237);
color darkBlue = color(0, 102, 153);
color orange = color(204, 102, 0);
int timer = 200;
int modVal = 1500;
int moveTime = 1475;
 
 
float x1=200;
float y1=200;
float randomX1 = width/2+10;
float randomY1 = height/2;
float size1=int(random(20/2,20*2*2));
float easing1 = 1/(size1*2);
 
float x2=200;
float y2=200;
float randomX2 = width/2;
float randomY2 = height/2;
float size2=int(random(20/2,20*2*2));
float easing2 = 1/(size2*2);
 
float x3=200;
float y3=200;
float randomX3 = width/2;
float randomY3 = height/2;
float size3=int(random(20/2,20*2*2));
float easing3 = 1/(size3*2);
 
float x4=200;
float y4=200;
float randomX4 = width/2;
float randomY4 = height/2;
float size4=int(random(20/2,20*2*2));
float easing4 = 1/(size4*2);
 
float x5=200;
float y5=200;
float randomX5 = width/2;
float randomY5 = height/2;
float size5=int(random(20/2,20*2*2));
float easing5 = 1/(size5*2);
 
float x6=200;
float y6=200;
float randomX6 = width/2;
float randomY6 = height/2;
float size6=int(random(20/2,20*2*2));
float easing6 = 1/(size6*2);
 
float x7=200;
float y7=200;
float randomX7 = width/2;
float randomY7 = height/2;
float size7=int(random(20/2,20*2*2));
float easing7 = 1/(size7*2);
 
float x8=200;
float y8=200;
float randomX8 = width/2;
float randomY8 = height/2;
float size8=int(random(20/2,20*2*2));
float easing8 = 1/(size8*2);
 
float x9=200;
float y9=200;
float randomX9 = width/2;
float randomY9 = height/2;
float size9=int(random(20/2,20*2*2));
float easing9 = 1/(size9*2);
 
float x10=200;
float y10=200;
float randomX10 = width/2;
float randomY10 = height/2;
float size10=int(random(20/2,20*2*2));
float easing10 = 1/(size10*2);
 
 
 
 
 
 
void setup() {
size(1000,400);
smooth();
fill(255,200);
}
 
void draw() {
background(255);
 
 
if (mousePressed){
    strokeWeight(10);
stroke(lightBlue,100);
 
  float m1 =(millis()%(1500+(timer*1)));
 
float targetX1 = mouseX;
float targetY1 = mouseY;
x1 += (targetX1 - x1) * easing1;
y1 += (targetY1 - y1) * easing1;
ellipse(x1, y1, size1, size1);
 if (m1>1475 +(timer*1)){
  randomX1 = random(width+(width/4));
  randomY1 = random(height+(height/4)); 
 }
 
 
   strokeWeight(10);
stroke(orange,100);
  float m2 =(millis()%(modVal +(timer*2)));
 
 
float targetX2 = mouseX;
float targetY2 = mouseY;
x2 += (targetX2 - x2) * easing2;
y2 += (targetY2 - y2) * easing2;
ellipse(x2, y2, size2, size2);
 if (m2>moveTime+(timer*2)){
  randomX2 = random(width+(width/4));
  randomY2 = random(height+(height/4)); 
 }
 
 
    strokeWeight(10);
stroke(lightBlue,100);
 
  float m3 =(millis()%(modVal +(timer*3)));
 
 
float targetX3 = mouseX;
float targetY3 = mouseY;
x3 += (targetX3 - x3) * easing3;
y3 += (targetY3 - y3) * easing3;
ellipse(x3, y3, size3, size3);
 if (m3>moveTime+(timer*3)){
  randomX3 = random(width+(width/4));
  randomY3 = random(height+(height/4)); 
 }
 
     strokeWeight(10);
stroke(darkBlue,100);
 
  float m4 =(millis()%(modVal +(timer*4)));
 
 
float targetX4 = mouseX;
float targetY4 = mouseY;
x4 += (targetX4 - x4) * easing4;
y4 += (targetY4 - y4) * easing4;
ellipse(x4, y4, size4, size4);
 if (m4>moveTime+(timer*4)){
  randomX4 = random(width+(width/4));
  randomY4 = random(height+(height/4)); 
 }
 
      strokeWeight(10);
stroke(orange,100);
 
  float m5 =(millis()%(modVal +(timer*5)));
 
 
float targetX5 = mouseX;
float targetY5 = mouseY;
x5 += (targetX5 - x5) * easing5;
y5 += (targetY5 - y5) * easing5;
ellipse(x5, y5, size5, size5);
 if (m5>moveTime+(timer*5)){
  randomX5 = random(width+(width/4));
  randomY5 = random(height+(height/4)); 
 }
     strokeWeight(10);
stroke(lightBlue,100);
 
  float m6 =(millis()%(modVal +(timer*6)));
 
 
float targetX6 = mouseX;
float targetY6 = mouseY;
x6 += (targetX6 - x6) * easing6;
y6 += (targetY6 - y6) * easing6;
ellipse(x6, y6, size6, size6);
 if (m6>moveTime+(timer*6)){
  randomX6 = random(width+(width/4));
  randomY6 = random(height+(height/4)); 
 }
     strokeWeight(10);
stroke(darkBlue,100);
 
  float m7 =(millis()%(modVal +(timer*7)));
 
 
float targetX7 = mouseX;
float targetY7 = mouseY;
x7 += (targetX7 - x7) * easing7;
y7 += (targetY7 - y7) * easing7;
ellipse(x7, y7, size7, size7);
 if (m7>moveTime+(timer*7)){
  randomX7 = random(width+(width/4));
  randomY7 = random(height+(height/4)); 
 }
     strokeWeight(10);
stroke(orange,100);
 
  float m8 =(millis()%(modVal +(timer*8)));
 
 
float targetX8 = mouseX;
float targetY8 = mouseY;
x8 += (targetX8 - x8) * easing8;
y8 += (targetY8 - y8) * easing8;
ellipse(x8, y8, size8, size8);
 if (m8>moveTime+(timer*8)){
  randomX8 = random(width+(width/4));
  randomY8 = random(height+(height/4)); 
 }
     strokeWeight(10);
stroke(lightBlue,100);
;
  float m9 =(millis()%(modVal +(timer*9)));
 
 
float targetX9 = mouseX;
float targetY9 = mouseY;
x9 += (targetX9 - x9) * easing9;
y9 += (targetY9 - y9) * easing9;
ellipse(x9, y9, size9, size9);
 if (m9>moveTime+(timer*9)){
  randomX9 = random(width+(width/4));
  randomY9 = random(height+(height/4)); 
 }
     strokeWeight(10);
stroke(orange,100);
 
  float m10 =(millis()%(modVal +(timer*10)));
 
 
float targetX10 = mouseX;
float targetY10 = mouseY;
x10 += (targetX10 - x10) * easing10;
y10 += (targetY10 - y10) * easing10;
ellipse(x10, y10, size10, size10);
 if (m10>moveTime+(timer*10)){
  randomX10 = random(width+(width/4));
  randomY10 = random(height+(height/4)); 
 }
 fill(255,200);

fill(lightBlue,200);
textSize(50);
text("Learn to program. ", width/2-(width/3), height/2); 
 fill(orange,200);
text("Creatively.", width/2+(width/10), height/2);
fill(255,200);
}
else {  strokeWeight(10);
stroke(lightBlue,100);
 
  float m1 =(millis()%(1500+(timer*1)));
 
float targetX1 = randomX1;
float targetY1 = randomY1;
x1 += (targetX1 - x1) * easing1;
y1 += (targetY1 - y1) * easing1;
ellipse(x1, y1, size1, size1);
 if (m1>1475 +(timer*1)){
  randomX1 = random(width+(width/4));
  randomY1 = random(height+(height/4)); 
 }
 
 
   strokeWeight(10);
stroke(orange,100);
  float m2 =(millis()%(modVal +(timer*2)));
 
 
float targetX2 = randomX2;
float targetY2 = randomY2;
x2 += (targetX2 - x2) * easing2;
y2 += (targetY2 - y2) * easing2;
ellipse(x2, y2, size2, size2);
 if (m2>moveTime+(timer*2)){
  randomX2 = random(width+(width/4));
  randomY2 = random(height+(height/4)); 
 }
 
 
    strokeWeight(10);
stroke(lightBlue,100);
 
  float m3 =(millis()%(modVal +(timer*3)));
 
 
float targetX3 = randomX3;
float targetY3 = randomY3;
x3 += (targetX3 - x3) * easing3;
y3 += (targetY3 - y3) * easing3;
ellipse(x3, y3, size3, size3);
 if (m3>moveTime+(timer*3)){
  randomX3 = random(width+(width/4));
  randomY3 = random(height+(height/4)); 
 }
 
     strokeWeight(10);
stroke(darkBlue,100);
 
  float m4 =(millis()%(modVal +(timer*4)));
 
 
float targetX4 = randomX4;
float targetY4 = randomY4;
x4 += (targetX4 - x4) * easing4;
y4 += (targetY4 - y4) * easing4;
ellipse(x4, y4, size4, size4);
 if (m4>moveTime+(timer*4)){
  randomX4 = random(width+(width/4));
  randomY4 = random(height+(height/4)); 
 }
 
      strokeWeight(10);
stroke(orange,100);
 
  float m5 =(millis()%(modVal +(timer*5)));
 
 
float targetX5 = randomX5;
float targetY5 = randomY5;
x5 += (targetX5 - x5) * easing5;
y5 += (targetY5 - y5) * easing5;
ellipse(x5, y5, size5, size5);
 if (m5>moveTime+(timer*5)){
  randomX5 = random(width+(width/4));
  randomY5 = random(height+(height/4)); 
 }
     strokeWeight(10);
stroke(lightBlue,100);
 
  float m6 =(millis()%(modVal +(timer*6)));
 
 
float targetX6 = randomX6;
float targetY6 = randomY6;
x6 += (targetX6 - x6) * easing6;
y6 += (targetY6 - y6) * easing6;
ellipse(x6, y6, size6, size6);
 if (m6>moveTime+(timer*6)){
  randomX6 = random(width+(width/4));
  randomY6 = random(height+(height/4)); 
 }
     strokeWeight(10);
stroke(darkBlue,100);
 
  float m7 =(millis()%(modVal +(timer*7)));
 
 
float targetX7 = randomX7;
float targetY7 = randomY7;
x7 += (targetX7 - x7) * easing7;
y7 += (targetY7 - y7) * easing7;
ellipse(x7, y7, size7, size7);
 if (m7>moveTime+(timer*7)){
  randomX7 = random(width+(width/4));
  randomY7 = random(height+(height/4)); 
 }
     strokeWeight(10);
stroke(orange,100);
 
  float m8 =(millis()%(modVal +(timer*8)));
 
 
float targetX8 = randomX8;
float targetY8 = randomY8;
x8 += (targetX8 - x8) * easing8;
y8 += (targetY8 - y8) * easing8;
ellipse(x8, y8, size8, size8);
 if (m8>moveTime+(timer*8)){
  randomX8 = random(width+(width/4));
  randomY8 = random(height+(height/4)); 
 }
     strokeWeight(10);
stroke(lightBlue,100);
;
  float m9 =(millis()%(modVal +(timer*9)));
 
 
float targetX9 = randomX9;
float targetY9 = randomY9;
x9 += (targetX9 - x9) * easing9;
y9 += (targetY9 - y9) * easing9;
ellipse(x9, y9, size9, size9);
 if (m9>moveTime+(timer*9)){
  randomX9 = random(width+(width/4));
  randomY9 = random(height+(height/4)); 
 }
     strokeWeight(10);
stroke(orange,100);
 
  float m10 =(millis()%(modVal +(timer*10)));
 
 
float targetX10 = randomX10;
float targetY10 = randomY10;
x10 += (targetX10 - x10) * easing10;
y10 += (targetY10 - y10) * easing10;
ellipse(x10, y10, size10, size10);
 if (m10>moveTime+(timer*10)){
  randomX10 = random(width+(width/4));
  randomY10 = random(height+(height/4)); 
 }
 fill(255,200);
fill(lightBlue,200);
textSize(50);
text("Learn to program. ", width/2-(width/3), height/2); 
 fill(orange,200);
text("Creatively.", width/2+(width/10), height/2);
fill(255,200);
}
}

