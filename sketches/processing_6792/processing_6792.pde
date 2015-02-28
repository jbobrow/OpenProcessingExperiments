
void setup() {
size (900, 500);
smooth();
PFont font;
font = loadFont("OCRAStd-48.vlw"); 
textFont(font, 22);
strokeWeight (1);
frameRate (10);
}

void draw() {
background (110);
//frameRate(40);

  PImage img;
  img = loadImage("full_moon_02_20001.jpg");
  image(img, 0, 0);
  
  text("hello_world", 684, 465);
 
  if (mouseX < width/2) {
pushMatrix();
translate(width/14.0, -270);
rotate(PI/3.4);

rectMode (CENTER);
fill(255);
// legs
rect (width/2-15, 260, 10, 110);
rect (width/2+15, 260, 10, 110);
//rectMode (CENTER);
// arms
rect (width/2, 130, 180, 40);

for (int i=0; i < 40; i+=4) {
  fill(0, 10);
  rect(width/2, 130, 180,i);
}

fill(255);
rectMode (CENTER);
//body
rect (width/2, 180, 80, 130);

for (int xrect=0; xrect<80; xrect+=4) {
  for(int yrect=0; yrect<160; yrect+=4) {
  rectMode (CORNER);
  float r = random(0, 255);
  float g = random(0, 255);
  float b = random(0, 255);
  float t = random(0, 255);
  fill(r, g, b, t);
  rect(width/2-40+xrect, 110+yrect, 4, 4);
  //noLoop();
}
}
fill(255);
// head
ellipse (width/2, 100, 60, 60);
//fill (255, 0, 0);
triangle (width/2-10, 98, width/2+10, 98, width/2, 116); // nose
fill (0);
ellipse (width/2-10, 98, 20, 20); // left eye
ellipse (width/2+10, 98, 20, 20); // right eye
fill (255);
noStroke();
ellipse (width/2-10, 98, 4, 4); // pupil
ellipse (width/2+10, 98, 4, 4); //pupil
stroke(0);
strokeWeight(1);
line(width/2-6, 120, width/2+6, 120); // mouth

popMatrix();
for(int xellipse=0; xellipse<40; xellipse+=10) {
  ellipse(random(0, 900), random(0, 600), xellipse, xellipse);
}
for(int xellipse=5; xellipse<20; xellipse+=2) {
  ellipse(random(0, 900), random(0, 600), xellipse, xellipse);
}
for(int xellipse=7; xellipse<20; xellipse+=1) {
  ellipse(random(0, 900), random(0, 600), xellipse, xellipse);
}
}

else {
pushMatrix();
translate(width/14.0, -270);
rotate(PI/3.4);

rectMode (CENTER);
fill(255);
// legs
rect (width/2-15, 260, 10, 110);
rect (width/2+15, 260, 10, 110);
//rectMode (CENTER);
// arms
rect (width/2, 130, 180, 40);

for (int i=0; i < 40; i+=4) {
  fill(0, 10);
  rect(width/2, 130, 180,i);
}

fill(255);
rectMode (CENTER);
//body
rect (width/2, 180, 80, 130);

for (int xrect=0; xrect<80; xrect+=4) {
  for(int yrect=0; yrect<160; yrect+=4) {
  rectMode (CORNER);
  float r = random(0, 255);
  float g = random(0, 255);
  float b = random(0, 255);
  float t = random(0, 255);
  fill(r, g, b, t);
  rect(width/2-40+xrect, 110+yrect, 4, 4);
  //noLoop();
}
}
fill(255);
// head
ellipse (width/2, 100, 60, 60);
//fill (255, 0, 0);
triangle (width/2-10, 98, width/2+10, 98, width/2, 116); // nose
fill (0);
ellipse (width/2-10, 98, 20, 20); // left eye
ellipse (width/2+10, 98, 20, 20); // right eye
fill (255);
noStroke();
ellipse (width/2-10, 98, 4, 4); // pupil
ellipse (width/2+10, 98, 4, 4); //pupil
stroke(0);
strokeWeight(1);
line(width/2-6, 120, width/2+6, 120); // mouth

popMatrix();
for(int xellipse=0; xellipse<90; xellipse+=10) {
  ellipse(random(0, 900), random(0, 600), xellipse, xellipse);
}
for(int xellipse=5; xellipse<90; xellipse+=2) {
  ellipse(random(0, 900), random(0, 600), xellipse, xellipse);
}
for(int xellipse=7; xellipse<90; xellipse+=1) {
  ellipse(random(0, 900), random(0, 600), xellipse, xellipse);
}
}
}

