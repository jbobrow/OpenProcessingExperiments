
void setup() { 
  size(400,350);
  background(173,216,230); 
  smooth();
}

void draw() { 

int x=30;
int y=50;
int a=100;
smoke(x,y);
building(a);
}
void smoke(int x,int y){
if(mouseX<100){
fill(110,90);
stroke(250);
ellipse(x,x,mouseX-10,mouseX-10);
ellipse(x+40,x+40,x*2,x*2);
ellipse(y,y+x,x,x);
ellipse(x,y*2.4,y,y);
}
}

void building(int a){
stroke(250);
fill(a+10);

rect(200,150,100,255);
fill(a+50);

rect(300,150,50,255);
rect(210,130,120,20);

rect(100,200,55,255);
fill(a+25);
rect(155,200,75,255);
triangle(100,200,230,200,160,170);

rect(10,160,45,10);
rect(5,170,55,250);
fill(a+50);
rect(60,170,35,250);
}


