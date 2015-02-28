
PImage img;
float ballx = 15;
float bally = 15;
float movex = 7.5;
float movey = -4;
float colorval = 255;
boolean alternate = true;
int count = 0;
void setup(){
 size(1024,768);
background(0); 
img = loadImage("100x100.png");
int count = 0;
}
void draw(){

image(img,random(-100,1024),random(-100,768));
ballx += movex;
bally -= movey;
for(int count2 = 0; count2<1000;count2++){
fill(random(0,255),random(0,255),random(0,255));
stroke(random(0,255),random(0,255),random(0,255));
rect(random(0,1024),random(0,768),2,2);
}
if(ballx >= width){
 movex = -movex; 
}
if(bally >= height){
 movey = -movey; 
}
if(bally <= 0){
 movey = -movey; 
}
if(ballx <= 0){
 movex = -movex; 
}
count++;
 
}



