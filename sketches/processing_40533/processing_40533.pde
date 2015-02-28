
size(500, 500);
background(255);

int segmentW = width/10;
int segmentH = height/10;

float r1 = random(1.0, 3.0);
float r2 = random(3.0, 5.0);
float r3 = random(5.0, 8.0);
float r4 = random(8.0, 10.0);



float xSpan1 = random(20, width-40);
float xSpan2 = random(20, width-40);
float xSpan3 = random(20, width-40);
float xSpan4 = random(20, width-40);

PImage hat = loadImage("hat.png");
PImage hatUp = loadImage("hat_up.png");

for (int i = 1; i<10; i++) {
  float rix = random(10, width);
  float riy = random(height/3, height);
  float rd = random(15, 90);
  image(hat, rix, riy, rd, rd);
}

for (int i = 1; i<10; i++) {
  float rix = random(10, width);
  float riy = random(10, height/3);
  float rd = random(15, 90);
  image(hatUp, rix, riy, rd, rd);
}


PImage fig1 = loadImage("fig1.png");
image(fig1, xSpan1, (2* height / 10) - (10 / r1), r1 * segmentW * .44, r1 * segmentH);
PImage fig2 = loadImage("fig2.png");
image(fig2, xSpan2, (2* height / 10) - (10 / r2), r2 * segmentW * .44, r2 * segmentH);
PImage fig3 = loadImage("fig3.png");
image(fig3, xSpan3, (2* height / 10) - (10 / r3), r3 * segmentW * .44, r3 * segmentH);
PImage fig4 = loadImage("fig4.png");
image(fig4, xSpan4, (2* height / 10) - (10 / r4), r4 * segmentW * .44, r4 * segmentH);

//------------text

PFont hoef = loadFont("hoef120.vlw");
PFont goth = loadFont("goth120.vlw");

fill(255, 0, 0, 250);
//float rt =  random(1, 9);
/*
for (float i = rt; i<9; i++) {
float rw =  random(0,10);
float ry =  random(0,10);

if (i%2==0) {
  textFont(hoef);
}
else {
  textFont(goth);
}*/
for(int f = 2; f<5; f++){
float rfs = random(f*25,120);
fill(100 + rfs,20,0,rfs);
textFont(hoef, rfs);
text("C", 40 + width/3, 40,120, 120);
text("H", 40 + 2*width/3, 40,120, 120);
text("A", 40, 40 + height/3,120, 120);
text("P", 40 + width/3, 40 + height/3,120, 120);
text("L", 40 + 2*width/3, 40 + height/3,120, 120);
text("I", 40, 40 + 2*height/3,120, 120);
text("N", 40 + width/3, 40 + 2*height/3,120, 120);
}
fill(10,210);

textFont(goth, 80);
text("C", 40 + width/3, 40,120, 120);
text("H", 40 + 2*width/3, 40,120, 120);
text("A", 40, 40 + height/3,120, 120);
text("R", 40 + width/3, 40 + height/3,120, 120);
text("L", 40 + 2*width/3, 40 + height/3,120, 120);
text("I", 40, 40 + 2*height/3,120, 120);
text("E", 40 + width/3, 40 + 2*height/3,120, 120);

