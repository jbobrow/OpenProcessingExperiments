
//Buddding flowers

PImage bee , sun , flo; 
float y = 300,s1 = -20,yes=0,x ;
void setup(){
  size(600,400);
  background(255);
  smooth();
  noStroke();
  frameRate(30);
  bee = loadImage("bumble_bee.png");
  sun = loadImage("sun.png");
  flo = loadImage("flpo.png");
  
}
void draw(){

fill(255);
rect(0,0,s1+50,100);
fill(255,0,0);
pushMatrix();
imageMode(CENTER);
translate(s1,40);
rotate(radians(frameCount/2%360));
image(sun,0,0,50,50);
popMatrix();

imageMode(CORNER);
fill(255);
rect(width-s1,100,width,70);
pushMatrix();
image(bee,2*(width-s1),120+random(-5,10),20,20);
popMatrix();
s1 = s1 + 0.366;
if(frameCount % 60 ==0){
if(frameCount % 180==0){
buildplant2();}
else if(frameCount % 120==0){
buildplant3();}
else
buildplant3();}

if(frameCount % 1800==0){background(255);}
if(s1>width+25)s1 = -30;

}


void buildplant2(){
  yes=0;
 float size = random(11,15);
 if(size>14){yes=1;}
 y = height;
 x = int(random(30,570));
 float y1 = 0.1;
 while(size>1){
 y1 = y1+0.02;
 noStroke();
 fill(30,255-size*size,30);
 ellipse(x,y,size,size);
 size = size - 0.25;
 y = y - random(0,2) - size/random(2.5,3.5) ;
 //x = x + random(-2,2);
 noiseDetail(int(random(-15,15)),random(-1,1));
 noiseSeed(int(random(-6,6)));
 x = x + noise(-y1);
 }
 if(yes==1){
 imageMode(CENTER);
 image(flo,x,y,30,30);
 imageMode(CORNER);}
}

void buildplant3(){
 float size = random(10,12);
 y = height;
 x = int(random(30,570));
 float y1 = 0.1;
 while(size>1){
 y1 = y1+0.02;
 noStroke();
 fill(10,255-size*9,10);
 ellipse(x,y,size,size);
 size = size -0.3;
 y = y - random(0,2) - size/random(2.5,3.5) ;
 x = x + random(-2,2);
 
 }
}


