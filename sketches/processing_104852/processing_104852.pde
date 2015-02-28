
//basic
size(400,400);
smooth();
background(200);

//variables
int x=160;
int y=120;
int w=25;
int h=150;


//shadow
noStroke();
fill(0);
ellipse(width/2,y+230,200,50);

//hands
noStroke();
fill(80);
rect(x-50,y-10,w,h);
rect(x+105,y-10,w,h);
ellipse(x-30,y+160,w,h-125);
ellipse(x+120,y+160,w,h-125);

//body
noStroke();
fill(60);
rect(x-40,y+10,w+135,h);
rect(x-10,y+160,w+75,h-70);

//head
noStroke();
fill(255);
rect(x,y-60,w+55,h);
fill(0);
ellipse(x,y,w+45,h-90);
ellipse(x+80,y,w+45,h-90);
fill(255);
ellipse(x,y,w-5,h-130);
ellipse(x+80,y,w-5,h-130);
fill(0);
rect(x+15,y+40,w+25,h-110);
fill(100);
rect(x+15,y+60,w+25,h-130);
