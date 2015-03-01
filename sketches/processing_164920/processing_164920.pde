
float x=0;
float y=400;
float speed;
 
boolean goRight;
 
 
void setup(){
size(600,600);
frameRate(30);
 
speed=4.0; 
}
 
void draw(){
 
background(255);
 
line(0,100,250,100);
line(300,100,600,100);
 
x+=speed;
 
if(x>width) goRight =false;
else if (x<0) goRight=true;
if(goRight) x+=20;
else x-=20;
 
ellipse(x,y,30,30);
translate(500,500);
ellipse(0,0,90,90);
float vecX=mouseX-500;
float vecY=mouseY-500;
float Dist=sqrt(vecX*vecX+vecY*vecY);
float costheta=vecX/Dist;
float sintheta=vecY/Dist;

if(Dist<45) line(0,0,45/Dist*vecX,45/Dist*vecY);

if(mousePressed){
x+=45/Dist*vecX;
y+=45/Dist*vecY;
}
