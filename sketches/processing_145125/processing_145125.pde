
int x, y;
int v = 2;
int vy = 3;

void setup(){
size(800,800);
x = width/2;
y = height/2;
}


void draw(){
background(51);
noStroke();
fill(183,39,39);
rect(x-90,y-70,10,160);//bras dret
rect(x+80,y-70,10,160);//bras esquerre 
rect(x-50,y-190,100,100);//Cap
rect(x-70,y-80,140,180);//cuerpo principal

rect(x-65,y+100,45,80);//fut
rect(x+20,y+100,45,80);//fut

fill(10,10,10);
stroke(255,252,252);
strokeWeight(3);
ellipse(x-25,y-160,30,30);//ull dret
ellipse(x+25,y-160,30,30);//ull esq

rect(x-30,y-120,60,20);//boca
triangle(x,y-145,x-5,y-130,x+5,y-130);//nas


fill(mouseX,mouseY,274);
rect(x-50,y-60,100,100);//quadro blanc
fill(255,252,252);
stroke(10,10,10);
line(x,y-30,x,y+20);

x = x+v;
if(x>width-90||x<0+90){
v=-v;
}
y = y+vy;
if(y>width-190||y<0+190){
vy=-vy;}
}


