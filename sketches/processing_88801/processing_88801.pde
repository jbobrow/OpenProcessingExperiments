
int bubblesY;
float waveX;
float waveY;
int blueValue=color(4,81,140);
int myTime;
float xx;
float yy;

void setup() {
  size(800,800);
  fill(255);
  noStroke();
}

void draw() {
 background(blueValue);
drawBubbles();
drawMoonrise();
drawWaves();
  
//make noise for the frog//
pushMatrix();
xx=xx+(0.5-noise(frameCount/300));
yy=yy+(0.5-noise(frameCount/300));
translate(xx+200,yy+180);

drawFrog();

popMatrix();

}


void drawWaves() {
  stroke(255);
strokeWeight(12);
fill(0,161,217);
for (float waveX=0;waveX<width;waveX=waveX+100) {
  for (float waveY=0;waveY<height/3;waveY=waveY+50) {
    frameRate(3);
    ellipse(waveX,waveY+height,random(200,300),random(200,300));
  }
}

}

void drawMoonrise() {
  pushMatrix();
noStroke();
translate(300,500);
//draw Moonrise
  fill(255,250,151);
  rotate(radians(frameCount*3));
  ellipse(width/6,height/4,100,100);
popMatrix();

}

void drawBubbles() {
  frameRate(20);
 
  noStroke();
  bubblesSize=int(random(0,30));
  bubblesColor=int(random(#EFF7AF,255));
  bubblesX=int(random(0,width));
  bubblesY=int(random(0,height));
  fill(bubblesColor);
  ellipse(bubblesX,bubblesY,bubblesSize,bubblesSize);
  
}

void drawFrog() {
  fill(50,205,50);
stroke(0);
strokeWeight(2);
ellipse(150,height/2-74,70,50);//head//
fill(50,205,50);
ellipse(150,height/2,70,100);//body//
fill(50,205,50);
ellipse(134,height/2-112,16,35);
ellipse(166,height/2-112,16,35);//eyes//
fill(0,100,0);
ellipse(112,height/2+48,40,10);//lef feet//
ellipse(188,height/2+48,40,10);//right feet//
fill(50,205,50);
arc(150,height/2-64,20,12,radians(5),radians(175));//smile//

//moving eyeballs//
fill(32);
int myTime=0;//start 
int nTime=second()-myTime;//measuring time
if (nTime>=0 && nTime%2==0) {
 ellipse(131,height/2-103,14,14);
 ellipse(163,height/2-103,14,14); //lef//
}
if (nTime>=0 && nTime%2==1) {
 ellipse(137,height/2-103,14,14);
 ellipse(169,height/2-103,14,14); //right//
  
}

//legs//
pushMatrix();
translate(120,420);
rotate(radians(-30));
fill(0,100,0);
ellipse(0,0,32,65);
popMatrix();//left leg//
pushMatrix();
translate(130,390);
rotate(radians(30));
ellipse(60,0,32,65);//right leg//
popMatrix();

}
