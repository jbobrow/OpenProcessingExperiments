
float headX = 300;
float headY = 170;
float leyeX = 340;
float leyeY = 170;
float reyeX = 270;
float reyeY = 170;
float mouthX = 300;
float mouthY = 235;
float bodyX = 275;
float bodyY = 200;
float rarmX = 275;
float rarmY = 300;
float larmX = 325;
float larmY = 300;
float rlegX = 275;
float rlegY = 400;
float llegX = 325;
float llegY = 400;
float rlegX2 = 225;
float rlegY2 = 460;
float llegX2 = 375;
float llegY2 = 460;
float rarmX2 = 225;
float rarmY2 = 350;
float larmX2 = 375;
float larmY2 = 350;
float change = 2;
float change2 =0.5;
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

if (mousePressed && (mouseButton ==LEFT)){
  println("clicked");
headX += change2;
headY = headY -change;
leyeX += change2;
leyeY = leyeY -change;
reyeX += change2;
reyeY = reyeY -change;
mouthX += change2;
mouthY = mouthY -change;
bodyX += change2;
bodyY = bodyY -change;
rarmX += change2;
rarmY = rarmY -change;
larmX += change2;
larmY = larmY -change;
rlegX += change2;
rlegY = rlegY -change;
llegX += change2;
llegY = llegY -change;
rlegY2 = rlegY2 -change;
llegY2 = llegY2 -change;
rarmY2 = rarmY2 -change;
larmY2 = larmY2 -change;
rlegX2 += change2;
llegX2 = llegX2 + change2;
rarmX2 += change2;
larmX2 += change2;
}

if(mousePressed && (mouseButton ==RIGHT)){
  println("clicked");
  headX += change2;
headY += change2;
leyeX += change2;
leyeY += change2;
reyeX += change2;
reyeY += change2;
mouthX += change2;
mouthY += change2;
bodyX += change2;
bodyY += change2;
rarmX += change2;
rarmY += change2;
larmX += change2;
larmY += change2;
rlegX += change2;
rlegY += change2;
llegX += change2;
llegY += change2;
rlegY2 += change2;
llegY2 += change2;
rarmY2 += change2;
larmY2 += change2;
rlegX2 += change2;
llegX2 = llegX2 + change2;
rarmX2 += change2;
larmX2 += change2;
}
}
  



