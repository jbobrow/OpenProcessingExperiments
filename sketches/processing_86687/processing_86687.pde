
int x1,y1,x2,y2,x3,y3;
int a1,b1,c1,a2,b2,c2;
x1=random(300);
y1=random(300);
x2=random(300);
y2=random(300);
x3=(x1+x2)/2;
y3=(y1+y2)/2;
a1=random(255);
b1=random(255);
c1=random(255);
a2=random(255);
b2=random(255);
c2=random(255);

void setup(){
size(300,300);
background(0,0,0);
}

void draw(){

noStroke();
fill(a1,b1,c1,100);
ellipse(x1,y1,150,150);
fill(a2,b2,c2,100);
ellipse(x2,y2,150,150);
fill((a1+a2)/2,(b1+b2)/2,(c1+c2)/2,100);
ellipse(x3,y3,150,150);
}
