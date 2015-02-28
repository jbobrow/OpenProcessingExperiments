
float X=150; 
float Y=100; 
float depX=3; 
float depY=3; 
float posY=100; 
float SCORE; 

void setup() { 
size(300, 200); 
frameRate(30); 
noStroke(); 
noSmooth(); 
noCursor(); 
rectMode(CENTER); 
} 

void draw() { 

background(0); 

rect(10,mouseY,5,30); 
rect(290,posY,5,30); 
rect(X,Y,5,5); 

X=X+depX; 
Y=Y+depY; 

if(Y>height-5 || Y<5) {depY=-depY;} 
if(X<=13 && X>= 8 && Y<mouseY+15 && Y>mouseY-15) {depX=-depX; depX=depX*1.1;} 
if(X>=287 && X<=292 && Y<posY+15 && Y>posY-15) {depX=-depX; depX=depX*1.1;} 
if(keyPressed && keyCode==UP){posY=posY-10;} 
if(keyPressed && keyCode==DOWN){posY=posY+10;} 
} 

