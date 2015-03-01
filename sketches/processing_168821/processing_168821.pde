
int eSize = 5;

size(400,400);
colorMode(RGB,400);
background(400);
noStroke();

for(int j = 0; j <=400; j += 10) {
for(int i = 0; i <= 400; i += 10) {
  fill(0,i,i,255);
  ellipse(i, j, eSize, eSize);
}
}

noStroke();
fill(0,150,255,180);
ellipse(200,200,30,30);

for(int i = 0; i < 400; i += 2) {
  fill(0,219,255);
  ellipse(i, i+40, eSize, eSize);
}

for(int i = 0; i < 400; i += 2) {
  fill(0,219,255);
  ellipse(i, i-40, eSize, eSize);
}

for(int i = 0; i < 400; i += 4) {
  fill(13,255,221,200);
  ellipse(i, i+120, eSize, eSize);
}

for(int i = 0; i < 400; i += 4) {
  fill(13,255,221,200);
  ellipse(i, i-120, eSize, eSize);
}

noStroke();
fill(255,0,200,220);
ellipse(120,280,80,80);

noStroke();
fill(150,0,255,220);
ellipse(160,240,60,60);

noStroke();
fill(25,0,255,200);
ellipse(190,210,50,50);

noStroke();
fill(25,0,255,200);
ellipse(210,190,50,50);

noStroke();
fill(150,0,255,200);
ellipse(240,160,60,60);

noStroke();
fill(255,0,200,190);
ellipse(280,120,80,80);

noStroke();
fill(255,0,0,250);
ellipse(70,330,100,100);

noStroke();
fill(255,0,0,180);
ellipse(330,70,100,100);

for(int i = 0; i < 400; i += 1) {
  fill(85,143,255);
  ellipse(i, i, eSize, eSize);
}

for(int i = 0; i < 400; i += 3) {
  fill(147,185,255);
  ellipse(i, i+80, eSize, eSize);
}

for(int i = 0; i < 400; i += 3) {
  fill(147,185,255);
  ellipse(i, i-80, eSize, eSize);
}

for(int i = 0; i < 400; i += 5) {
  fill(180,255,194,200);
  ellipse(i, i+160, eSize, eSize);
}

for(int i = 0; i < 400; i += 5) {
  fill(180,255,194,200);
  ellipse(i, i-160, eSize, eSize);
}


