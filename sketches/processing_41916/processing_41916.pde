
int a,z,x,y;
int b,c,d,e,f,g,h,i;
int velocitya,velocityz,velocityx,velocityy;

void setup(){
size(600,600);
a=150;
z=150;
x=250;
y=250;
b=97;
c=23;
d=80;
e=98;
f=23;
g=245;
h=25;
i=25;
velocitya=3;
velocityz=6;
velocityx=2;
velocityy=4;
smooth();
}

void draw(){
background(f);
fill(b);
for(int i = 0; i < 10; i++){
for(int j = 0; j < 10; j++){
ellipse(100*i, 100*j,h,i);

}
}
fill(d);
for(int i = 0; i < 50; i++){
for(int j = 0; j < 50; j++){
ellipse(100*i, 100*j,i,h);

}
}
fill(d,c,b,100);
ellipse(200,200,500,500);
fill(e,f,g,100);
ellipse(100,150,500,500);
fill(c,f,b,100);
ellipse(300,350,500,500);
fill(g,d,d,100);
ellipse(100,400,500,500);
fill(b,d,g,100);
ellipse(400,450,500,500);
fill(g,c,f,100);
ellipse(400,350,500,500);
fill(b,e,f,100);
ellipse(500,50,500,500);





fill(b,200,200);
ellipse(a,z,25,25);

fill(255);
ellipse(x,y,35,35);


a+=velocitya;
z+=velocityz;
x+=velocityx;
y+=velocityy;
if( a > width - 5 || a < 5 ) {
velocitya *=-1;
b=int(random(0, 255));
c=int(random(0, 255));
d=int(random(0, 255));
h=int(random(10, 100));
}

if( z > height - 5 || z < 5 ) {
velocityz *=-1;
b=int(random(0, 255));
c=int(random(0, 255));
d=int(random(0, 255));
i=int(random(10, 100));
}

if( y > width - 5 || y < 5 ) {
velocityy *=-1;
e=int(random(0, 255));
f=int(random(0, 255));
g=int(random(0, 255));
i=int(random(10, 100));
}

if( x > height - 5 || x < 5 ) {
velocityx *=-1;
e=int(random(0, 255));
f=int(random(0, 255));
g=int(random(0, 255));
h=int(random(10, 100));
}

}


