
void setup() {
  
size(300,300);
smooth();
background(8,250,25);

xPos=20;
xVelocity=1;
yPos=27;
yVelocity=2;
}

int xPos;
int xVelocity;
int yPos;
int yVelocity;

void draw(){
  background(8,250,25);
 xPos=xPos+xVelocity;
 yPos=yPos+yVelocity;
 noStroke();
 fill(247,20,225);
 ellipse(xPos, yPos, 26, 26);


if(xPos<13==true||xPos>287==true){
///xVelocity+1=true;  
 xVelocity=xVelocity*(-1);//=true;
}

if(yPos<13==true||yPos>287==true){
  yVelocity=yVelocity*(-1);//=true;
//xPos=5&&yPos=7=true;
}}




