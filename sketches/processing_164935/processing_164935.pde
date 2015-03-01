
float uX = 0, uY=0, rad = 180, tX1=300, tY1=0, tX2=300, tY2=300;
boolean goRight = true;
float score = 0;
int count = 0;
void setup(){
size(600,600);
}
void randomLine(){
tX1 = width/2;
tY1 = 0;
tX2 = random(width);
tY2 = height/2;
}
void mousePressed(){
float tVecX = tX2 - tX1;
float tVecY = tY2 - tY1;
float tVecMag = sqrt(tVecX * tVecX + tVecY * tVecY);
float uVecX = uX - width/2;
float uVecY = height/2 - 0;
float uVecMag = sqrt(uVecX * uVecX + uVecY * uVecY);
float dot = tVecX * uVecX + tVecY * uVecY;
float cosine = dot / (tVecMag * uVecMag);
score = cosine * 100;
}
void draw(){
if (count < 12){
background(255);
stroke(255);
strokeWeight(10);
line(tX1, tY1, tX2, tY2);
uX = 350*cos(rad)+width/2;
uY = 350*sin(rad);
if (uX>width){
goRight = false;
count ++; 
}
else if (uX < 0) goRight = true;
if (goRight) rad -=0.07;
else rad += 0.07;
stroke(0);
line(width/2, 0, uX, uY);
textSize(30);
fill(255,0,0);
if (score > 99) {
background(255);
stroke(255);
fill(0);
text ( "Game Clear", width/2, height*2/3); 
count = 0;
randomLine();
}
else if(mousePressed) text("retry", width/2, height*2/3);
}
if (count >= 12){
background(0);
stroke(0);
fill(255);
text("Game Over\n click to restart ", width/2, height/2);
if (mousePressed) count = 0;
randomLine();
}
}
