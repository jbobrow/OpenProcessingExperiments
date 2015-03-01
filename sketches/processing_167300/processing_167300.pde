
float a;
float b;
float c;
float d;
float e;
float f;
float g;
int h=#50F75C;
int i=#00E9FC;
int j=#FC00F0;
int k=0;
int l=400;
void setup()
{
background(#1429DE);
  size(600,400);
  
}
void draw()
{
 background(#1429DE);

 fill(#D3D3D3);
 rect(mouseX+180,mouseY+5,300,220); 
 rect(mouseX+440,mouseY+225,40,80);
 rect(mouseX+400,mouseY+225,40,80);
 rect(mouseX+220,mouseY+225,40,80);
 rect(mouseX+180,mouseY+225,40,80);
 ellipse(mouseX+100,mouseY+80,160,160);
 ellipse(mouseX+60,mouseY+180,60,60);
 ellipse(mouseX+88,mouseY+225,45,45);
 ellipse(mouseX+75,mouseY+265,37,37);
 ellipse(mouseX+46,mouseY+283,30,30);
 ellipse(mouseX+30,mouseY+261,25,25);
 ellipse(mouseX+23,mouseY+241,18,18);
 ellipse(mouseX+9,mouseY+236,13,13);
 fill(#EBAFF7);
 triangle(mouseX+85,mouseY+55,mouseX+175,mouseY+55,mouseX+125,mouseY+100);
 fill(#000000);
 ellipse(mouseX+76,mouseY+123,12,15);
fill(h);
h=h+j;
frameRate(10); 
triangle(a=random(0,100),380,b=random(0,100),380,c=random(0,100),400); 
triangle(a=random(100,200),380,b=random(100,200),380,c=random(100,200),400);
triangle(a=random(200,300),380,b=random(200,300),380,c=random(200,300),400);
triangle(a=random(300,400),380,b=random(300,400),380,c=random(300,400),400);
triangle(a=random(400,500),380,b=random(400,500),380,c=random(400,500),400);
triangle(a=random(500,600),380,b=random(500,600),380,c=random(500,600),400);

}
void mousePressed()
{
frameRate(1); 
  rect(0,k,20,80);
k=k+10;
frameRate(2); 
rect(20,l,20,80);
l=l-10;
frameRate(3); 
rect(40,k,20,80);
k=k+10;
frameRate(4); 
rect(60,l,20,80);
l=l-10;
frameRate(5); 
rect(80,k,20,80);
k=k+10;
frameRate(6); 
rect(100,l,20,80);
l=l-10;
frameRate(7); 
rect(120,k,20,80);
k=k+10;
frameRate(8); 
rect(140,l,20,80);
l=l-10;
frameRate(9); 
rect(160,k,20,80);
k=k+10;
frameRate(10); 
rect(180,l,20,80);
l=l-10;
frameRate(9); 
rect(200,k,20,80);
k=k+10;
frameRate(8); 
rect(220,l,20,80);
l=l-10;
frameRate(7); 
rect(240,k,20,80);
k=k+10;
frameRate(6); 
rect(260,l,20,80);
l=l-10;
frameRate(5); 
rect(280,k,20,80);
k=k+10;
frameRate(4); 
rect(300,l,20,80);
l=l-10;
frameRate(3); 
rect(320,k,20,80);
k=k+10;
frameRate(2); 
rect(340,l,20,80);
l=l-10;
frameRate(1); 
rect(360,k,20,80);
k=k+10;
rect(380,l,20,80);
l=l-10;
rect(400,k,20,80);
k=k+10;
rect(420,l,20,80);
l=l-10;
rect(440,k,20,80);
k=k+10;
rect(480,l,20,80);
l=l-10;
rect(500,k,20,80);
k=k+10;
rect(520,l,20,80);
l=l-10;
rect(540,k,20,80);
k=k+10;
rect(560,l,20,80);
l=l-10;
rect(580,k,20,80);
k=k+10;
rect(600,l,20,80);
l=l-10;
frameRate(3); 
}
