
int xPos = 0;
int yPos = 0;
int m=1;

void setup(){
size(600,600);
xPos = width/2;
yPos = height/2;
}

void draw(){
background(255);
strokeWeight(20);
ellipse(xPos, yPos,40,40);

if(xPos>=width){
m=m*(-1);
}
if(xPos<0){
m=m*(-1);
}
xPos += m;


}
