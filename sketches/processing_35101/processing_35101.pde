
void setup(){
size(300,300);
}
int x=0;
int y=0;
int z=0;
void draw(){
background(230);
ellipse(50,50,x,x);
ellipse(100,100,x,x);
ellipse(150,150,x,x);
ellipse(200,200,x,x);
ellipse(250,250,x,x);
x++;
stroke(255,0,0);
line(50,50,50,y);
line(100,100,100,y);
line(150,150,150,y);
line(200,200,200,y);
line(250,250,250,y);
y++;
line(50,50,z,50);
line(100,100,z,100);
line(150,150,z,150);
line(200,200,z,200);
line(250,250,z,250);
z++;
}


