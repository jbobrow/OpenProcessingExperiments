
float zoogX = 200;
float zoogY = 200;

float eyeR;
float eyeG;
float eyeB;

float change = 1;

void setup() {
 size(700,700); 
}

void draw() {
 background(20,17,106);
 fill(30,126,29);
 stroke(255);
 rectMode(CORNERS);
 rect(zoogX+10,zoogY,zoogX+75,zoogY+200);
 ellipse(zoogX+42,zoogY-50,150,150);
 line(zoogX+75,zoogY+200,zoogX+110,zoogY+250);
 line(zoogX+10,zoogY+200,zoogX-25,zoogY+250);
 noStroke();
 fill(eyeR,eyeG,eyeB);
 ellipse(zoogX+10,zoogY-50,30,70);
 ellipse(zoogX+70,zoogY-50,30,70);
 stroke(255);
 line(zoogX+10,zoogY+100,zoogX-40,zoogY+90);
 line(zoogX+75,zoogY+100,zoogX+125,zoogY+90);
 fill(30,126,29); 
 
 zoogX = zoogX + change;
 zoogY = zoogY + change;
 
 eyeR = random(0,255);
 eyeG = random(0,255);
 eyeB = random(0,255);
}

