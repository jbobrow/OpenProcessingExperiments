
//background
float r1=255;
float g1=177;
float b1=222;
float r2=97;
float g2=160;
float b2=255;

//boundcing duck 
float dx=400;
float dy=250;
float dx1=395;
float dy1=245;
float xspeed = 3;
float yspeed = 1;



//cheeks
float c1=255; 
float c2=118;
float c3=153;

//for background
float r;
float g;
float b;
float a;
float diam;
float x;
float y;
//animator 
int currentFrame = 0;
PImage[] frames = new PImage[24];
int lastTime = 0;




void setup(){
size(500,500);
smooth();


}

void draw(){
  smooth();
  
  
  
  //background color 

  if (mouseX<width/3){
 background(r1,g1,b1);
 
 
}else if (mouseX<2*width/3){
background(r2,g2,b2);


}else if (mouseX<3*width/3){
  background(r1,g2,b2);}

//random circles 
r = random(255);
g = random(255);
b = random(255);
a = random(255);
diam = random(100);
x = random(width);
y = random(height);
// Use values to draw an ellipse
noStroke();
fill(r,g,b,a);
ellipse(x,y,diam,diam);





//arms
stroke(182,234,247);
fill(182,234,247);
ellipse(170,280,50,70);
ellipse(330,280,50,70);
//body 
stroke(182,234,247);
fill(182,234,247);
ellipse(250,400,200,400);
//bed frame
stroke(191,108,0);
fill(191,108,0);
rect(250,320,500,30);
rect(0,430,30,200);
rect(100,430,30,200);
rect(200,430,30,200);
rect(300,430,30,200);
rect(400,430,30,200);
rect(500,430,30,200);

//hands
fill(247,223,171);
stroke(247,223,171);
ellipse(150,320,70,40);
ellipse(350,320,70,40);


//display baby's face 
fill(247,223,171);
stroke(247,223,171);
ellipse(250,150,170,150);
ellipse(250,200,190,150);
//eyes
fill(255);
stroke(255);
ellipse(200,150,40,50);
ellipse(300,150,40,50);
rectMode(CENTER);
rect (200,160,40,30);
rect(300,160,40,30);
//eyes2
fill(0,126,255);
stroke(0,126,255);
ellipse(200,150,32,38);
ellipse(300,150,32,38);
rect(200,165,34,23);
rect(300,165,34,23);
//eyes3
fill(4,87,171);
stroke(4,87,171);
ellipse(200,150,25,31);
ellipse(300,150,25,31);
rect(200,165,25,21);
rect(300,165,25,21);
//shiny eyes 
stroke(255,255,255,0);
fill(255,255,255,150);
ellipse(210,143,22,15);
ellipse(310,143,22,15);

//closed eyes 

if(mouseX>200 && mouseY>150) {
fill(247,223,171);
stroke(247,223,171);
ellipse(200,150,40,50);
ellipse(300,150,40,50);
rectMode(CENTER);
rect (200,160,40,30);
rect(300,160,40,30);
}


{
//nose
stroke(255,194,88);
fill(255,194,88);
ellipse(240,200,15,15);
//nose
stroke(247,223,171);
fill(247,223,171);
ellipse(244,202,15,15);

//mouth 
stroke(200,118,150);
line (240,230,250,230);
//cheek
stroke(c1,c2,c3,90);
fill(c1,c2,c3,90);

ellipse(180,210,50,50);
ellipse(320,210,50,50);
//cheek color change 

if (mouseX<180){
stroke(255,0,0,100);
fill(255,0,0,100);
 ellipse(180,210,50,50);
ellipse(320,210,50,50);

 
}
if (mouseY<210){
stroke(255,0,0,100);
fill(255,0,0,100);
 ellipse(180,210,50,50);
ellipse(320,210,50,50);
  
  
}else{
 stroke(c1,c2,c3,90);
fill(c1,c2,c3,90);
  ellipse(180,210,50,50);
ellipse(320,210,50,50);
}

//hair

stroke(255,253,103);
fill(255,253,103);
ellipse(250,90,90,60);
stroke(247,223,171);
fill(247,223,171);
ellipse(260,100,75,50);


//if mouth
//stroke(255,118,150);
//fill(255,118,150);
//ellipse(250,230,25,25);

///////////////////////////////
dx=dx+xspeed;
dy=dy+yspeed;
dx1=dx1+xspeed;
dy1=dy1+yspeed;
if ((dx > width) || (dx < 0)) {
xspeed = xspeed * -1;
}
if ((dy > height) || (dy < 0)) {
yspeed = yspeed * -1;
}
if ((dx1 > width) || (dx1 < 0)) {
xspeed = xspeed * -1;
}
if ((dy1 > height) || (dy1 < 0)) {
yspeed = yspeed * -1;
}
//duck
fill(255,215,0);
stroke(255,215,0);
ellipse(dx,dy,50,50);
ellipse(dx+20,dy+35,90,60);
//duck eyes 
fill(255);
stroke(109,207,246);
ellipse(dx1,dy1,15,15);
fill(0);
ellipse(dx1,dy1,10,10);

//////////////////////////////////





}}

