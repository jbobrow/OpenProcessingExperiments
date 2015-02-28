
float space = 2;
float gray = 0;

//int xPos = 328;
//int yPos = 65;
int xPos = mouseX;
int yPos = mouseY;
int xPosWolke = 0;
int xPosWolke2 = width;
int xPosWolke5 = 0;


PImage no1;
PImage no2;
PImage no3;

PImage no6;
PImage no7;
PImage no8;
PImage no9;
PImage no10;

void setup(){
size(1200,770);  
colorMode(RGB, 300);
noStroke();
no1 = loadImage("himmel2.jpg");
no2 = loadImage("wolke1.png");
no3 = loadImage("wolke2.png");


no6 = loadImage("berg.png");
no7 = loadImage("berg2.png");
no8 = loadImage("wald2.png");
no9 = loadImage("wolke5.png");
no10 = loadImage("alien.png");

}
 
/* 
void draw (){ 
for(float x = 0; x < width;x = x + space){
  for(float y = 0; y < height; y = y + space){
    fill(gray);
    rect(x,y,space, space);
    gray = gray + random(255);
    if(gray > 255)gray = 0;
  }
}
} 
*/
void draw (){
image(no1,0,0);

image(no2,xPosWolke,250);
if(xPosWolke > width){
xPosWolke = 0;} 
xPosWolke = xPosWolke +1;

image(no3,xPosWolke2,260);
if(xPosWolke2 < -150){
xPosWolke2 = width;} 
xPosWolke2 = xPosWolke2 -3;
  
for (float x = 0; x < width; x = x + space) {
  gray = 0;
  for (float y = 450; y < height;y = y + space) {
    fill(gray + random(-255, 255));
    rect(x, y, space, space);
    gray = gray + random(3);
    if (gray > 255)gray = 0;
}}

image(no6,mouseX-51,mouseY-50);

image(no7,173,164);

image(no9,xPosWolke5,260);
if(xPosWolke5 > width){
xPosWolke5 = 0;} 
xPosWolke5 = xPosWolke5 +3;

image(no8,0,0);

if (mousePressed) {
image(no10,0,0);
} 
}



