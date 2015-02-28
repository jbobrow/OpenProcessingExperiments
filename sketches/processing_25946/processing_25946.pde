
int speedXA= 10;
int speedXB=10;
int speedXC=10;
int speedXD=10;
int speedXE=10;
int speedXF=10;
int speedXG=10;
int posA= 51;
int posB=220;
int posC=80;
int posD=160;
int posE=150;
int posF=300;
void setup() {
size(500,500);
smooth();
frameRate(15);
}
void draw() {
background(100, 250,0 );
//top
fill(random(100, 255), random(0,255), random(200, 255));
ellipse(posA,200,140,60); 
posA += speedXA;
if (posA >= 450 || posA<= 50){
 speedXA *=-1;
}
fill(random(200, 255), random(0,255), random(200, 255));
ellipse(posF,140,140,40); 
posF += speedXB;
if (posF >= 450 || posF<= 50){
 speedXB *=-1;
}
fill(random(100, 255), random(0,255), random(200, 255));
ellipse(posE,70,140,40); 
posE+= speedXC;
if (posE >= 450 || posE<= 50){
 speedXC *=-1;
}
fill(random(0, 255), random(80,255), random(200,255));
ellipse(posB,400,40,40); 
posB += speedXD;
if (posB >= 450 || posB<= 10){
 speedXD *=-1;
}
fill(random(100, 255), random(0,255), random(110,255));
ellipse(19,480,40,40); 
fill(random(0,255), random(200,255), random(110,255));
ellipse(19,20,40,40);
fill(random(0,255), random(200,255), random(110,255));
ellipse(476,20,40,40);
fill(random(100, 255), random(0,255), random(110,255));
ellipse(476,480,40,40);
rect(0,250,500,30);
//bottom
fill(random(0, 255), random(80,255), random(200,255));
ellipse(posC,435,40,40); 
posC += speedXE;
if (posC >= 450 || posC<=0){
 speedXE *=-1;
}
fill(random(0, 255), random(80,255), random(200,255));
ellipse(posD,350,40,40); 
posD += speedXG;
if (posD >=445 || posD<=0){
 speedXG *=-1;
}
//topmid
rect(39,0,415,40);
rect(39,460,415,40);
ellipse(mouseX,mouseY,20,20);
}                
