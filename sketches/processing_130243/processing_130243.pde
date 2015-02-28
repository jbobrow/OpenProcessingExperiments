
size(400,400);
background(121,0,0);
int x;
x=100;
//back square
fill(15,15,15,100);
quad(x,100,x+200,150,x+200,300,x,250);
x=150;
fill(15,15,15,30);
quad(300,150,350,150,350,300,300,300);
strokeWeight(3);
int y;
x=180;
y=200;
stroke(255,140,0);
line(x,0,y+10,400);
line(x+30,0,y+40,400);
line(x+60,0,y+70,400);
line(x+90,0,y+100,400);
//front square
strokeWeight(1);
stroke(0);
x=150;
fill(15,15,15,150);
quad(x,100,x+200,150,x+200,300,x,250);
//sides
fill(15,15,15,100);
quad(100,100,150,100,150,250,100,250);
quad(100,250,150,250,350,300,300,300);

