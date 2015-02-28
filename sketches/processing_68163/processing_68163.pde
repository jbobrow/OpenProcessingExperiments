
float eyeR;
float eyeG;
float eyeB;
float zoogX=225;
float zoogY=110;
void setup() {
  size(500,500);
}

void draw() {
background (0);
fill(255,255,0);
stroke (255,255,0);
ellipse(zoogX-175,zoogY+10,10,10);
ellipse(zoogX-150, zoogY-90, 10,10);
ellipse(zoogX-125, zoogY+190, 10,10);
ellipse (zoogX-75, zoogY-40, 10,10);
ellipse(zoogX-75, zoogY+165,10,10);
ellipse(zoogX+175, zoogY-10, 10,10);
ellipse(zoogX-175,zoogY+240,10,10);
ellipse (zoogX+150, zoogY+140,10,10);
ellipse(zoogX+225, zoogY+190,10,10);
ellipse(zoogX+175,zoogY+265,10,10);
ellipse(zoogX-25,zoogY-80,10,10);
ellipse(zoogX-125,zoogY-80,10,10);
ellipse(zoogX+95, zoogY+190,10,10);
ellipse(zoogX+250,zoogY-80,10,10);
ellipse(zoogX+115, zoogY+280,10,10);
fill(124,96, 17);
rect(zoogX-225,zoogY+290,500,500);
fill(0,255,0);
stroke(0,255,0);
line(200,400, 250,350);
line(300,400,250,350);
stroke(0);
rect(225,140,50,230);
ellipse(250,150,120,160);
fill(eyeR, eyeG, eyeB);
stroke(0);
ellipse(225, 140, 40, 60);
ellipse(275, 140, 40, 60);


eyeR = random(0,255);
eyeG = random(0,255);
eyeB = random(0,255);

zoogY = zoogY + 1;
}

