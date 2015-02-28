
size(600,600);
background(0);
smooth();
//NAVI//
fill(140,177,193);
stroke(140,177,193);
triangle(290,295,270,250,270,275);
triangle(310,300,370,280,345,300);
triangle(290,310,270,310,285,320);
triangle(305,310,325,325,310,325);
stroke(82,162,198);
fill(82,162,198);
ellipse(300,300,30,30);
ellipse(300,330,10,10);
ellipse(300,350,10,10);
stroke(20,175,245);
fill(20,175,245);
ellipse(300,300,25,25);
fill(255);
stroke(255);
ellipse(300,300,20,20);
ellipse(300,330,7,7);
ellipse(300,350,7,7);
//POKEBALL//
fill(255,0,0);
stroke(0);
strokeWeight(2);
ellipse(300,70,50,50);
fill(255);
arc(300,70,50,50,0,PI);
stroke(0);
line(275,70,325,70);
fill(255);
ellipse(300,70,10,10);
//LOOPS//
noFill();
stroke(0,0,256,85);
int a=10;
int offset=0;
while(offset<451)
{
ellipse(300-offset,300,150,a);
ellipse(300+offset,300,150,a);
  a=a+75;
offset=offset+3;
}
stroke(105,105,105);
strokeWeight(2);
int b=10;
int donut=50;
while(b<450)
{
ellipse(300-donut,300+b,20,20);
ellipse(300+donut,300-b,20,20);
  b=b+15;
donut=donut+5;
}
int c=10;
int donuts=50;
while(c<500)
{
ellipse(300-donuts,300-c,20,20);
ellipse(300+donuts,300+c,20,20);
  c=c+15;
donuts=donuts+5;
}
stroke(255,0,0,85);
strokeWeight(1);
int d=10;
int one=20;
while(d<601)
{
ellipse(300,300+one,150,d);
ellipse(300,300-one,150,d);
  d=d+15;
one=one+1;
}
int e=10;
int onett=20;
while(e<601)
{
ellipse(300+onett,300,e,150);
ellipse(300-onett,300,e,150);
  e=e+15;
onett=onett+1;
}
int f=10;
int donett=20;
while(f<601)
{
ellipse(300+donett,300+donett,550,550);
ellipse(300-donett,300+donett,550,550);
  f=f+15;
donett=donett+1;
}
stroke(62,62,62);
int g=10;
int onit=0;
while(onit<601)
{
line(300+onit,300-b,e,g);
line(297-onit,300-b,-10,g);
  g=g+15;
onit=onit+4;
}
//FI'S SPEECH BOX//
fill(34,82,162);
stroke(7,24,54);
strokeWeight(5);
quad(100,500,500,500,500,600,100,600);
fill(7,24,54);
textSize(11);
text("Master, it appears you found Navi. After analyzing the room, I predict",111,520);
text("that your chances of saving her is 20% in your current state. Analyzing ",110,550);
text("your attitude. Your motivation to save Navi is 0%. Master, I agree.",110,580);
triangle(458,575,460,575,459,577);


