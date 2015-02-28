
int x;
int y;
int rx;
int ry;
void setup(){

size (700,700);
}

void draw(){
  background(220,300,300);
x=mouseX;
y=300;
rx=x;
ry=y+20;
noStroke();

//floor
fill(50,50,50);
rect(0,530,700,400);

//tracks
fill(100);
rect(10,520,680,20);
fill(120);
rect(14,524,672,14);

//body
fill(20,200,200);
ellipse(x+50,y,100,100);
rect(x,y,100,200);
fill(20,100,200);
rect(x,y+80,100,80);
fill(10,100,250);
rect(x+10,y+95,10,10);
rect(x+10,y+115,10,10);
rect(x+10,y+135,10,10);
fill(200);
ellipse(x+70,y+120,30,30);
fill(150);
rect(x+50,y+90,40,2);
rect(x+50,y+95,40,2);
rect(x+50,y+150,40,2);
fill(80);

//face
ellipse(x+70,y+20,15,15);
ellipse(x+30,y+20,15,15);
fill(150);
triangle(x+40,y+30,x+50,y+45,x+60,y+30);

//wheel
fill(150);
ellipse(x+5,y+200,50,50);
ellipse(x+90,y+200,50,50);
fill(200);
ellipse(x+5,y+200,10,10);
ellipse(x+90,y+200,10,10);
fill(80);
rect(x+5,y+198,85,4);


}

