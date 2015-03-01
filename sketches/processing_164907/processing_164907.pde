
float uX = 0, tX1=300, tY1=0, tX2=300, tY2=300;
boolean goRight = true;
float score = 0;

void setup()
{
size(1000,1000);
}

void mousePressed()
{
float tVecX = tX2 - tX1;
float tVecY = tY2 - tY1;

float tVecMag = sqrt(tVecX * tVecX + tVecY * tVecY);

float uVecX = uX - width/2;
float uVecY = height/2 - 0;

float uVecMag = sqrt(uVecX * uVecX + uVecY * uVecY);

float dot = tVecX * uVecX + tVecY * uVecY;

float cosine = dot / (tVecMag * uVecMag);

score = cosine * 100;
noStroke();
fill(255,255,120);
ellipse(width/2,height/2,100,100);
fill(255,0,0);
ellipse(width/2,height/4,60,60);
textSize(100);
text ( "Pow!", width/2+140, height/5);
}
void draw()
{
background(255);
noStroke();
fill(0);
fill(0);
ellipse(width/2,height/2,20,20);
fill(0);
triangle(width*1/5,height,width/2-10,height,width/2-10,height/2);
triangle(width*4/5,height,width/2+10,height,width/2+10,height/2);
fill(103,36,41);
rectMode(CENTER);
rect(width/2,height,20,1000);

triangle(width*1/5,height,width*2/5,height,width/2-10,height/2);
triangle(width*4/5,height,width*3/5,height,width/2+10,height/2);
fill(0);

rect(width/2,height,10,300);

stroke(0);
fill(0);
rectMode(CENTER);
rect(width*1/5,height,100,350);
rect(width*4/5,height,100,350);
stroke(255,255,255);
strokeWeight(3);
//line(tX1, tY1, tX2, tY2);
stroke(0);
//line(width/2,height/2,width/2,height);

if (uX>width) goRight = false;
else if (uX < 0) goRight = true;
if (goRight) uX += 15;
else uX -= 15;
stroke(255);
line(width/2,0,uX,height/4);
stroke(0,0,0);
fill(255,255,255);
ellipse(uX,height/4,200,200);
fill(0,0,0);
ellipse(uX,height/4,160,160);
fill(0,0,255);
ellipse(uX,height/4,120,120);
fill(255,0,0);

ellipse(uX,height/4,80,80);
fill(255,255,0);
ellipse(uX,height/4,40,40);

textSize(60);
fill(255,0,0);
if (score > 99.9) {
text ( "PERFECT!", width/2-140, height/5);
}
else if (score > 98) {
text("EXCELLLENT!", width/2-140, height/5);
} 
else if(score > 96) {
  text("GOOD!", width/2-140, height/5);
} 
else if(score > 92) {
text("HIT!", width/2-140, height/5);
} 
else {
text("", width/2-140, height/5);
}
}
