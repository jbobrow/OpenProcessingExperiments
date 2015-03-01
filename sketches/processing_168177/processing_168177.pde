
int a=0;
int b=200;
int c=100;
int d=0;
int e=100;
int f=110;
int g=110;
int h=180;
int k=50;
int i=100;
int j=150;
float n;
float l;
float m;
float x;

void  setup() {
size(800,500);
}

void draw(){
background(#B6AAFF);
noStroke();


fill(255);
ellipse(600,50,50,50);
ellipse(630,30,50,50);
ellipse(630,80,50,50);
ellipse(660,30,50,50);
ellipse(680,50,50,50);
ellipse(650,40,50,50);
ellipse(660,70,50,50);
ellipse(670,50,50,50);
ellipse(700,30,50,50);
ellipse(700,80,50,50);
ellipse(730,30,50,50);
ellipse(750,50,50,50);
ellipse(720,40,50,50);
ellipse(730,70,50,50);

ellipse(100,50,50,50);
ellipse(130,30,50,50);
ellipse(130,80,50,50);
ellipse(160,30,50,50);
ellipse(180,50,50,50);
ellipse(150,40,50,50);
ellipse(160,70,50,50);
ellipse(170,50,50,50);
ellipse(200,30,50,50);
ellipse(200,80,50,50);
ellipse(230,30,50,50);
ellipse(250,50,50,50);
ellipse(220,40,50,50);
ellipse(230,70,50,50);

ellipse(400,50,50,50);
ellipse(430,30,50,50);
ellipse(430,80,50,50);
ellipse(460,30,50,50);
ellipse(480,50,50,50);
ellipse(450,40,50,50);
ellipse(460,70,50,50);
ellipse(470,50,50,50);

fill(#0A03FF);
rect(0,200,800,300);


fill(#B6AAFF);
frameRate(10);
ellipse(0,190,x,60);
ellipse(50,190,x,60);
ellipse(100,190,x,60);
ellipse(150,190,x,60);
ellipse(200,190,x,60);
ellipse(250,190,x,60);
ellipse(300,190,x,60);
ellipse(350,190,x,60);
ellipse(400,190,x,60);
ellipse(450,190,x,60);
ellipse(500,190,x,60);
ellipse(550,190,x,60);
ellipse(600,190,x,60);
ellipse(650,190,x,60);
ellipse(700,190,x,60);
ellipse(750,190,x,60);
ellipse(800,190,x,60);
x=random(50,200);

fill(#A51103);
triangle(a,180,b,180,c,300);
a=a+2;
b=b+2;
c=c+2;
rect(e,100,10,80);
e=e+2;

fill(#0A03FF);
rect(d,250,300,100);
d=d+2;

fill(0);
triangle(f,100,g,130,h,130);
f=f+2;
g=g+2;
h=h+2;

fill(100);
ellipse(k,200,20,20);
k=k+2;
ellipse(i,200,20,20);
i=i+2;
ellipse(j,200,20,20);
j=j+2;

fill(0);
ellipse(k,200,15,15);
ellipse(i,200,15,15);
ellipse(j,200,15,15);

fill(n,l,m);  
n=random(255);
l=random(255);
m=random(255);
ellipse(mouseX,400,90,60);
triangle(mouseX-40,400,mouseX-100,350,mouseX-100,450);

fill(0);
ellipse(mouseX+30,390,10,10);

stroke(0);
strokeWeight(2);
line(mouseX+10,400,mouseX,410);
line(mouseX-10,400,mouseX,410);




}

