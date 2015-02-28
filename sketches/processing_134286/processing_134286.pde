
void setup(){  
size (500, 300);
smooth ();
}
int a=5;
int b=5;
int c=5;
int d=5;
int e=5;
int f=5;
int g=5;
int x=5;
int y=5;
int z=5;
int w=5;
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
background(204, 255, 255);

fill(102,102,102);
noStroke();
rect(0, 200, 500, 50);
rect(0, 100, 150, 150);

fill(0);
noStroke();
rect(0,190, 500, 10);

noFill();
stroke(0);
strokeWeight(3);
rect(30,120,100, 60);
rect(30,120,100, 40);
rect(30,120,100, 20);
rect(30,120,20, 60);
rect(30,120,40, 60);
rect(30,120,60, 60);
rect(30,120,80, 60);

fill(255,0,0);
strokeWeight(1);
ellipse(10, 120, 10, 10);
fill(0,255,0);
ellipse(10, 140, 10, 10);
fill(0,0,255);
ellipse(10, 160, 10, 10);

//animation
frameRate(30);
bun();
a=a+speed1;
if(a==500){
a=5;
}



buns();
b=b+speed2;
if(b==500){
b=5;
}

meat();
c=c+speed3;
if(c==500){
c=5;
}

meats();
d=d+speed4;
if(d==500){
d=5;
}


//lettuce
fill(0, 153, 0);
triangle(e+195,175,e+205, 175, e+200, 185);
e=e+speed5;
if(e==500){
e=5;
}


triangle(f+205,175,f+215, 175, f+210, 185);
f=f+speed6;
if(f==500){
f=5;
}

triangle(g+215,175,g+225, 175, g+220, 185);
g=g+speed7;
if(g==500){
g=5;
}

triangle(x+225,175,x+235, 175, x+230, 185);
x=x+speed8;
if(x==500){
x=5;
}

triangle(y+235,175,y+245, 175, y+240, 185);
y=y+speed9;
if(y==500){
y=5;
}


cheese();
z=z+speed10;
if(z==500){
z=5;
}


tomato();
w=w+speed11;
if(w==500){
w=5;
}

fill(102,102,102);
noStroke();
rect(150,120, 100, 70);

}

void bun(){
fill(204,153, 102);
noStroke();
ellipse(a+220, 160, 55, 15);
}

void buns(){
fill(204,153, 102);
noStroke();
rect(b+195, 180, 50, 10);
}

void meat(){
fill(102, 51,0);
noStroke();
rect(c+195, 175, 50, 5);
}

void meats(){
fill(102, 51,0);
noStroke();
rect(d+195, 167, 50, 5);
}

void cheese(){
fill(255, 204, 0);
noStroke();
rect(z+195,172,50,3);
}

void tomato(){
fill(255, 0,51);
noStroke();
rect(w+200,164, 40,3);
}
