
float[] pao;
float[] and;
float[] par;
float[] diz;
float[] par2;
float[] diz2;

int pts = 9;
color controlPtCol = #222222;
color anchorPtCol = #BBBBBB;
void setup(){
size(800, 550);
smooth();
setSally(pts, 130, 130);
}

void draw(){
background(#021027,70);
drawSally();
}

void drawSally(){
strokeWeight(1.125);
stroke(#2CACD1,80);
fill(mouseX, mouseY,random(100,255),80);
for (int i=0; i<pts; i++){
if (i==pts-1) {
bezier(mouseX, mouseY, par[i], diz[i], par2[i], diz2[i], pao[0], and[0]);
}
else{
bezier(mouseX, mouseY, par[i], diz[i], par2[i], diz2[i], pao[i+1], and[i+1]);
}
}
strokeWeight(.75);
stroke(random(0,12),random(150,240),random(100,238),80);
rectMode(CENTER);
for (int i=0; i<pts; i++){
if (i==pts-1){ 
line(mouseX,mouseY, par2[i], diz2[i]);
}
if (i>0){
line(mouseX,mouseY, par2[i-1], diz2[i-1]);
}
line(mouseX,mouseY, par[i], diz[i]);
}
for (int i=0; i<pts; i++){
fill(controlPtCol);
noStroke();
ellipse(mouseX,mouseY, 4, 4);
ellipse(mouseX,mouseY, 4, 4);
fill(anchorPtCol);
stroke(0);
rect(mouseX,mouseY, 5, 5);
}
}

void setSally(int points, float radius, float controlRadius){
pts = points;
pao = new float[points];
and = new float[points];
par = new float[points];
diz = new float[points];
par2 = new float[points];
diz2 = new float[points];
float angle = 360.0/points;
float controlAngle1 = angle/3.0;
float controlAngle2 = controlAngle1*2.0;
for (int i=0; i<points; i++){
pao[i] = width/2+cos(radians(angle))*radius;
and[i] = height/2+sin(radians(angle))*radius;
par[i] = width/2+cos(radians(angle+controlAngle1))* controlRadius/cos(radians(controlAngle1));
diz[i] = height/2+sin(radians(angle+controlAngle1))* controlRadius/cos(radians(controlAngle1));
par2[i] = width/2+cos(radians(angle+controlAngle2))* controlRadius/cos(radians(controlAngle1));
diz2[i] = height/2+sin(radians(angle+controlAngle2))* controlRadius/cos(radians(controlAngle1));
angle+=360.0/points;
}
}

void keyPressed(){
setSally(int(random(3, 36)), mouseX, random(-200, 300));
}
