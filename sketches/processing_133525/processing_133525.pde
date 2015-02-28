
void setup(){
size (500, 500);
smooth();
}
 
int x=5;
int y=5;
int z=5;
int w=5;
int a=5;
int b=5;
int c=5;
int d=5;
int e=5;
int f=5;
int g=5;
int speed1=3;
int speed2=3;
int speed3=3;
int speed4=3;
int speed5=3;
int speed6=3;
int speed7=3;
int speed8=3;
int speed9=3;
int speed10=3;
int speed11=3;
void draw(){
background (153, 204,255);
 
noStroke();
fill( 102,102,102);
rect(0,400, 500, 100);
 
fill(255, 255, 51);
rect(50,440, 50, 10);
rect(150, 440, 50, 10);
rect (250, 440, 50, 10);
rect (350, 440, 50, 10);
rect(450, 440, 50, 10);
 
fill (240,240, 240);
ellipse (50,100, 50, 50);
ellipse (70,90, 50, 50);
ellipse (80,110, 50, 50);
ellipse (90,100, 50, 50);
ellipse (100,100, 50, 50);
ellipse (250,110, 50, 50);
ellipse (270,120, 50, 50);
ellipse (270,100, 50, 50);
ellipse (300,110, 50, 50);
ellipse (470,100, 50, 50);
ellipse (450,90, 50, 50);
ellipse (470,110, 50, 50);
ellipse (440,110, 50, 50);
ellipse (430,100, 50, 50);
 
 
//animation;
fill(204,0,0);
frameRate(30);
ellipse(y+65, 370,90, 80);
y=y+speed1;
if((y<5)||(y>=600)){
speed1=speed1*-1;
}
//window
fill(0);
ellipse(e+65, 370,70, 60);
e=e+speed9;
if((e<5)||(e>=600)){
speed9=speed9*-1;
}
 //doorline
fill(204,0,0);
rect(f+65,340, 2, 50);
f=f+speed10;
if((f<5)||(f>=600)){
speed10=speed10*-1;
}
 //body
fill(204,0,0);
rect(x,370, 130, 40);
x=x+speed2;
if((x<5)||(x>=600)){
speed2=speed2*-1;
}
 //wheel2
fill(0);
ellipse(w+105, 420,40, 40);
w=w+speed3;
if((w<5)||(w>=600)){
speed3=speed3*-1;
}
 //wheel1
fill(0);
ellipse(z+30, 420,40, 40);
z=z+speed4;
if((z<5)||(z>=600)){
speed4=speed4*-1;
}
 //light1
fill(255, 255, 102);
ellipse(a+10, 380,10, 10);
a=a+speed5;
if((a<5)||(a>=600)){
speed5=speed5*-1;
}
 //rim1
fill(153, 153, 153);
ellipse(b+105, 420,20, 20);
b=b+speed6;
if((b<5)||(b>=600)){
speed6=speed6*-1;
}
 //rim2
fill(153, 153, 153);
ellipse(c+30, 420,20, 20);
c=c+speed7;
if((c<5)||(c>=600)){
speed7=speed7*-1;
}
 //light2
fill(255, 255, 102);
ellipse(d+120, 385,10, 10);
d=d+speed8;
if((d<5)||(d>=600)){
speed8=speed8*-1;
}
 //doorhandle
fill(0);
rect(g+70,377, 7, 5);
g=g+speed11;
if((g<5)||(g>=600)){
speed11=speed11*-1;
}
}

