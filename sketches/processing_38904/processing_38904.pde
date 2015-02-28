
void setup(){
  size(900,450);
  
}
void draw(){
  background(255);
  smooth();

ellipseMode(CENTER);
rectMode(CENTER);

//Fantastic images
int a=480;
int b=150;
float R;
float G;
float B;
float A;

R=random(255);
G=random(255);
B=random(255);
A=random(255);

//if the mouse go to the white screen,balls are shining
if(mouseX<750){
stroke(R,G,B,A);
strokeWeight(8);
fill(240,24,24);
ellipse(a,b,30,30);
a=a+50;
b=b+10;
fill(13,164,255);
ellipse(a,b,20,20);
a=a+40;
b=b+30;
fill(255,244,13);
ellipse(a,b,10,10);
a=a-32;
b=b+30;
fill(225,8,250);
ellipse(a,b,20,20);
a=a+32;
b=b+30;
fill(240,24,24);
ellipse(a,b,15,15);
a=a-40;
b=b+10;
fill(13,164,255);
ellipse(a,b,20,20);
a=a+50;
b=b-30;
fill(13,164,255);
ellipse(a,b,13,13);
a=a+32;
b=b-30;
fill(225,8,250);
ellipse(a,b,30,30);
a=a+40;
b=b-30;
fill(255,244,13);
ellipse(a,b,20,20);
a=a+40;
b=b+50;
fill(240,24,24);
ellipse(a,b,20,20);
a=a+30;
b=b-30;
fill(13,164,255);
ellipse(a,b,30,30);
a=a-60;
b=b+70;
fill(255,244,13);
ellipse(a,b,30,30);
a=a+32;
b=b-10;
fill(225,8,250);
ellipse(a,b,10,10);
a=a-32;
b=b-50;
fill(240,24,24);
ellipse(a,b,10,10);



}
//otherwise stay normal 
else{
  fill(240,24,24);
ellipse(a,b,30,30);
a=a+50;
b=b+10;
fill(13,164,255);
ellipse(a,b,20,20);
a=a+40;
b=b+30;
fill(255,244,13);
ellipse(a,b,10,10);
a=a-32;
b=b+30;
fill(225,8,250);
ellipse(a,b,20,20);
a=a+32;
b=b+30;
fill(240,24,24);
ellipse(a,b,15,15);
a=a-40;
b=b+10;
fill(13,164,255);
ellipse(a,b,20,20);
a=a+50;
b=b-30;
fill(13,164,255);
ellipse(a,b,13,13);
a=a+32;
b=b-30;
fill(225,8,250);
ellipse(a,b,30,30);
a=a+40;
b=b-30;
fill(255,244,13);
ellipse(a,b,20,20);
a=a+40;
b=b+50;
fill(240,24,24);
ellipse(a,b,20,20);
a=a+30;
b=b-30;
fill(13,164,255);
ellipse(a,b,30,30);
a=a-60;
b=b+70;
fill(255,244,13);
ellipse(a,b,30,30);
a=a+32;
b=b-10;
fill(225,8,250);
ellipse(a,b,10,10);
a=a-32;
b=b-50;
fill(240,24,24);
ellipse(a,b,10,10);
}
  
//if the mouse go to the white screen, disappear jail
if(mouseX<750){
  //jail
int X=470;
int Y=120;
int SpacingX=20;

noFill();
rect(X,Y,15,400);
X=X+SpacingX;
noFill();
rect(X,Y,5,400);
X=X+SpacingX;
noFill();
rect(X,Y,5,400);
X=X+SpacingX;
noFill();
rect(X,Y,5,400);
X=X+SpacingX;
noFill();
rect(X,Y,5,400);
X=X+SpacingX;
noFill();
rect(X,Y,5,400);
X=X+SpacingX;
noFill();
rect(X,Y,5,400);
X=X+SpacingX;
noFill();
rect(X,Y,5,400);
X=X+SpacingX;
noFill();
rect(X,Y,5,400);
X=X+SpacingX;
noFill();
rect(X,Y,5,400);
X=X+SpacingX;
noFill();
rect(X,Y,5,400);
X=X+SpacingX;
noFill();
rect(X,Y,5,400);
X=X+SpacingX;
noFill();
rect(X,Y,5,400);
X=X+SpacingX;
noFill();
rect(X,Y,5,400);
X=X+SpacingX;
noFill();
rect(X,Y,15,400);
}
//otherwise normal
else{
//jail
int X=470;
int Y=120;
int SpacingX=20;

stroke(0);
strokeWeight(1);
fill(25);
rect(X,Y,15,400);
X=X+SpacingX;
fill(25);
rect(X,Y,5,400);
X=X+SpacingX;
fill(25);
rect(X,Y,5,400);
X=X+SpacingX;
fill(25);
rect(X,Y,5,400);
X=X+SpacingX;
fill(25);
rect(X,Y,5,400);
X=X+SpacingX;
fill(25);
rect(X,Y,5,400);
X=X+SpacingX;
fill(25);
rect(X,Y,5,400);
X=X+SpacingX;
fill(25);
rect(X,Y,5,400);
X=X+SpacingX;
fill(25);
rect(X,Y,5,400);
X=X+SpacingX;
fill(25);
rect(X,Y,5,400);
X=X+SpacingX;
fill(25);
rect(X,Y,5,400);
X=X+SpacingX;
fill(25);
rect(X,Y,5,400);
X=X+SpacingX;
fill(25);
rect(X,Y,5,400);
X=X+SpacingX;
fill(25);
rect(X,Y,5,400);
X=X+SpacingX;
fill(25);
rect(X,Y,15,400);
}

//If the jail disappear,space are shining
if(mouseX<750){
stroke(0);
strokeWeight(1.5);
fill(R,G,B,A);
quad(0,0,420,0,280,450,0,450);
triangle(800,450,900,450,900,0);

strokeWeight(1);
fill(50);
quad(420,0,470,120,463,270,280,450);
quad(420,0,900,0,750,124,470,120);
quad(750,124,900,0,800,450,745,304);
quad(463,270,745,304,800,450,280,450);

noStroke();
noFill();
quad(470,120,750,124,745,304,463,270);
}
//otherwise normal
else{

//seperate space
stroke(0);
strokeWeight(1.5);
fill(25);
quad(0,0,420,0,280,450,0,450);
triangle(800,450,900,450,900,0);

strokeWeight(1);
fill(50);
quad(420,0,470,120,463,270,280,450);
quad(420,0,900,0,750,124,470,120);
quad(750,124,900,0,800,450,745,304);
quad(463,270,745,304,800,450,280,450);

noStroke();
noFill();
quad(470,120,750,124,745,304,463,270);
}
//gradient(?)_the effect of lighting(?)

fill(0);
//people 
int x=480;
int y=210;
int z=15;
int o=79;
int spacingX=65;
int spacingY=-30;

ellipse(x,y,z,z);
ellipse(x,y+44,z,o);
rect(x,y+83,z+3,2);

x=x+spacingX-20;
y=y-spacingY;
ellipse(x,y,z,z);
ellipse(x,y+44,z,o);
rect(x,y+83,z+3,2);

x=x+spacingX+10;
y=y+spacingY+5;
ellipse(x,y,z,z);
ellipse(x,y+44,z,o);
rect(x,y+83,z+3,2);

x=x+spacingX+65;
y=y+spacingY+45;
ellipse(x,y,z,z);
ellipse(x,y+44,z,o);
rect(x,y+83,z+3,2);
}               
