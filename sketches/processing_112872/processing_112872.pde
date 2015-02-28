
float xPos;
float yPos;
float zPos;
float cPos; //declares the positons 

float a = 10; //causes the changes to happen

void setup(){
size(600,600);
background(70,160,220);
xPos = width/2;
yPos = height/2;
zPos = width/2;
cPos = height/2; // controlls starting sizes of the circles

}// background setup

void draw(){
background(70,160,220);
quad(xPos,xPos,yPos,yPos,zPos,zPos,cPos,cPos);
{
ellipse(xPos,zPos,cPos,yPos);
fill(24,240,200);
}

{
ellipse(yPos,cPos,xPos,zPos);
fill(70,220,155);
}

{
ellipse(zPos,cPos,xPos,yPos);
fill(100,70,240);
}

{
ellipse(xPos,zPos,yPos,cPos);
fill(220,70,100);
}// they all have diffrent a diffrent order when it comes to positions
a=a+1; //uses the A variable and increces the sizes and such

float xchange = cos(radians(a));
float ychange = sin(radians(a));
float zchange = cos(radians(a));
float cchange = sin(radians(a));//controlls the ellipses stretching qualities

xPos -= xchange*4.5;
yPos += ychange*2.5;
zPos += zchange*1.5;
cPos -= cchange*2.5; //changes their positions and how drastically the ellipses move and change

}
