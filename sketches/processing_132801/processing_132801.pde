
void setup(){
size (500, 500);
smooth();
}

int x=5;
int y=65;
int z=40;
int w=113;
int speed1=3;
int speed2=3;
int speed3=3;
int speed4=3;
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
ellipse(y, 370,90, 80);
y=y+speed1;
if((y<65)||(y>=400)){
speed1=speed1*-1;
}

fill(204,0,0);
rect(x,370, 130, 40);
x=x+speed2;
if((x<5)||(x>=500)){
speed2=speed2*-1;
}

fill(153, 153, 153);
ellipse(w, 420,40, 40);
w=w+speed3;
if((w<113)||(w>=400)){
speed3=speed3*-1;
}

fill(153, 153, 153);
ellipse(z, 420,40, 40);
z=z+speed4;
if((z<40)||(z>=400)){
speed4=speed4*-1;
}
}
