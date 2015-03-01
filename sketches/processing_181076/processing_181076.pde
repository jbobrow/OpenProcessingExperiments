
int headX = 300;
int headY = 170;
int leyeX = 340;
int leyeY = 170;
int reyeX = 270;
int reyeY = 170;
int mouthX = 300;
int mouthY = 235;
int bodyX = 275;
int bodyY = 200;
int rarmX = 275;
int rarmY = 300;
int larmX = 325;
int larmY = 300;
int rlegX = 275;
int rlegY = 400;
int llegX = 325;
int llegY = 400;
int rlegX2 = 225;
int rlegY2 = 460;
int llegX2 = 375;
int llegY2 = 460;
int rarmX2 = 225;
int rarmY2 = 350;
int larmX2 = 375;
int larmY2 = 350;
int change = 2;
void setup(){
size(600,600);
background(0);
}
void draw() {
  background(0);
  fill(113,224,119);
  stroke(255);
rect(bodyX,bodyY,50,200);
ellipse(headX,headY,170,170);
fill(0,0,0,100);
stroke(113,224,119);
line(rlegX,rlegY,rlegX2,rlegY2);
line(llegX,llegY,llegX2,llegY2);
fill(255);
stroke(255);
ellipse(reyeX,reyeY,60,100);
ellipse(leyeX,leyeY,60,100);
stroke(113,224,119);
line(rarmX,rarmY,rarmX2,rarmY2);
line(larmX,larmY,larmX2,larmY2);
fill(0);
stroke(255);
ellipse(mouthX,mouthY,60,20);

headX = 300;
headY = headY -change;
leyeX = 340;
leyeY = leyeY -change;
reyeX = 270;
reyeY = reyeY -change;
mouthX = 300;
mouthY = mouthY -change;
bodyX = 275;
bodyY = bodyY -change;
rarmX = 275;
rarmY = rarmY -change;
larmX = 325;
larmY = larmY -change;
rlegX = 275;
rlegY = rlegY -change;
llegY = llegY -change;
rlegY2 = rlegY2 -change;
llegY2 = llegY2 -change;
rarmY2 = rarmY2 -change;
larmY2 = larmY2 -change;
}


