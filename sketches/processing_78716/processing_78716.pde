
PImage pic;
PImage pic2;
float eyesize;
float eyesize2;
int eyedir;
int eyedir2;
float angle1, angle2;
float redV;
float sinY;
int trailNum = 80;
int prevx[];
int prevy[];
void setup(){
size(800,800);
sinY = 15.0;
//pic = loadImage("cbalebottom.jpg");
pic2 = loadImage("cbale.jpeg");
//image(pic,0,464);
eyesize =100;
eyedir =6;
eyedir2 =1;
prevx = new int[trailNum];
prevy = new int[trailNum];

//redV = mouseX/3;
}
void draw(){
image(pic2,0,0);
redV = mouseX/3;
tint(redV,0,0);
//noFill();
noFill();
strokeWeight(1);
fill(255);
ellipse(244,300,eyesize,eyesize);
ellipse(244,300, eyesize + 25, eyesize + 25);
ellipse(244,300, eyesize + 100, eyesize + 10);
ellipse(244,300, eyesize + 90, eyesize + 10);
ellipse(244,300, eyesize + 80, eyesize + 10);
ellipse(244,300, eyesize + 70, eyesize + 10);
ellipse(244,300, eyesize + 60, eyesize + 10);
ellipse(244,300, eyesize + 50, eyesize + 10);
ellipse(244,300, eyesize + 40, eyesize + 10);
ellipse(244,300, eyesize + 30, eyesize + 10);
ellipse(244,300, eyesize + 20, eyesize + 10);
ellipse(244,300, eyesize + 10, eyesize + 10);
fill(4,50,random(196));
ellipse(244,300, eyesize + 5, eyesize + 5);
fill(255);
ellipse(483,300, eyesize + 10, eyesize2 + 10);
ellipse(483,300, eyesize2 + 10 , eyesize + 99);
ellipse(483,300, eyesize + 7 , eyesize2 + 96);
ellipse(483,300, eyesize2 + 4 , eyesize + 93);
ellipse(483,300, eyesize + 1 , eyesize2 + 90);
ellipse(483,300, eyesize2 + -2 , eyesize + 87);
ellipse(483,300, eyesize + -5, eyesize2 + 84);
ellipse(483,300, eyesize2 + -8 , eyesize + 81);
ellipse(483,300, eyesize + -11 , eyesize2 + 78);
ellipse(483,300, eyesize2 + -14 , eyesize + 75);
ellipse(483,300, eyesize + -17, eyesize2 + 72);
ellipse(483,300, eyesize2 + -20 , eyesize + 69);
fill(30,random(165),23);
ellipse(483,300, eyesize + -30, eyesize + 30);
strokeWeight(50);
fill(85);
ellipse(483,300, eyesize2, eyesize2);
strokeWeight(50);
fill(85);
ellipse(244,300, eyesize2, eyesize2);
//////////////////////////////////////////////////
float ang1 = radians(angle1);
float ang2 = radians(angle2);
//
float x = 370 + (cos(ang1) * 9.0);
float y = 575 + (sin(ang2) * sinY);
fill(134,10,7);
smooth();
strokeWeight(0);
ellipse(x, y, 130,35);
//noStroke();
//fill(random(200), 0, 0);
angle1 += 200;
angle2 += 4;
/////////////////////////////////////////////////
eyesize +=eyedir;
eyesize2 += eyedir2;
if (eyesize > 100){
eyedir = -eyedir;
}
if (eyesize <=0){
eyedir = -eyedir;
}
if (eyesize2 > 60){
eyedir2 = -eyedir2;
}
if (eyesize2 <=0){
eyedir2 = -eyedir2;
}
//push back loop
for(int i = 1; i < trailNum; i++){
prevx[i - 1] = prevx[i];
prevy[i - 1] = prevy[i];
}
prevx[trailNum - 1] = (int)(x);
prevy[trailNum - 1] = (int)(y);
for(int i = 0; i < trailNum; i ++){
ellipse(prevx[i], prevy[i], 130, 35);
}

if(dist(mouseX, mouseY, x, y) < 75){
sinY += 50.0;


}
else{
sinY = 15.0;
}


}

