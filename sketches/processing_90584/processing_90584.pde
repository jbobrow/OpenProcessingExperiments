
int myX;
int myY;
float bambooW ;
float bambooH ;
float i=0;
float h=0;
color[ ] bambooColor = {#74A025,#85D630,#3B6213};
color[ ] leafColor = {#74981A,#7BC614,#BAF267};
float x=0;
float y=0;
float pandaX,noiseA;
float pandaY,noiseB,increment;
int leafX;
int leafY;

Panda[] myPanda;

void setup() {
size(600,600);
background(#588629);
strokeWeight(2);
noiseA=1;
noiseB=100;
increment=0.005;
myPanda = new Panda[3];
for (int i=0; i< myPanda.length;i++) {
    myPanda[i]= new Panda(random(0,width/2),random(0,height/2));
  }
}

void draw() {

if(h<width) {
h=h+bambooW+5;
pushMatrix();
translate(0,0);
rotate(radians(random(-10,10)));
rect(h,600,bambooW,-bambooH);
fill(bambooColor[int(random(0,3))]);
bambooW = random(15,20);
bambooH = random(400,600);
popMatrix();
}
//draw random bamboo
for (int i=0; i<myPanda.length;i++) {
  myPanda[i].drawBamboo();
  myPanda[i].drawPanda();
  myPanda[i].drawLeaf();

 }
}

class Panda {
 float a; float b; 
 Panda(float a_, float b_) {
   a= a_;
   b= b_;

 }



void drawBamboo()
{ 

 //draw the right bamboo
 pushMatrix();
  translate(450,10);
  rotate(radians(10));
  stroke(71, 113, 39, 150);
  fill(104, 170, 52);
  rect(0, 0, 30, 1020);
  line(0, 100, 30, 100);
  line(0, 200, 30, 200);
  line(0, 300, 30, 300);
  line(0, 400, 30, 400);
  line(0, 500, 30, 500);
  line(0, 600, 30, 600);
  line(0, 700, 30, 700);
  line(0, 800, 30, 800);
  line(0, 900, 30, 900);
  popMatrix();

//draw the left bamboo
 pushMatrix();
  translate(50,-10);
  rotate(radians(-5));
  stroke(71, 113, 38, 150);
  fill(104, 170, 52);
  rect(0, 0, 30,800);
  line(0, 100, 30, 100);
  line(0, 200, 30, 200);
  line(0, 300, 30, 300);
  line(0, 400, 30, 400);
  line(0, 500, 30, 500);
  line(0, 600, 30, 600);
  line(0, 700, 30, 700);
  line(0, 800, 30, 800);
  line(0, 900, 30, 900);
  popMatrix();

}

//draw panda
void drawPanda() {
pushMatrix();
translate(a,b);
pandaX=pandaX-(0.5-noise(noiseA));
pandaY=pandaY-(0.5-noise(noiseB));
noiseA=noiseA+increment;
noiseB=noiseB+increment;
x=pandaX;
y=pandaY;
fill(0);//black
ellipse(114+x,60-y,24,24);//left ear
ellipse(183+x,60-y,24,24);//right ear
fill(255,255,255);//white
ellipse(150+x,150-y,75,120);//body
ellipse(150+x,90-y,75,75);//head
fill(0,0,0);//black
ellipse(135+x,90-y,12,18);//left eye
ellipse(165+x,90-y,12,18);//right eye
ellipse(150+x,108-y,9,6);//nose
ellipse(114+x,135-y,45,45);//left hand
ellipse(183+x,135-y,45,45);//right hand
ellipse(114+x,189-y,54,54);//left foot
ellipse(183+x,189-y,54,54);//right foot
noFill();
arc(150+x,114-y,18,15,radians(random(3,10)),radians(random(150,142)));//smile
popMatrix();
}

void drawLeaf() {
pushMatrix();
frameRate(15);
fill(leafColor[int(random(0,3))]);
rotate(radians(random(-180,180)));
leafX = int(random(0,width));
leafY = int(random(0,height));
triangle(195+leafX,120+leafY,50+204+leafX,20+99+leafY,216+leafX,111+leafY);
popMatrix();

}
}



