
int x = 170; 
int y = 270; 
int bodyHeight = 180; 
int neckHeight = 30; 
int headHeight = 60; 

background(#E0FF00);
size(340,540);
smooth();

//head
strokeJoin(ROUND);
fill(0);
strokeWeight(8);
rect(x-40,y-150,80,headHeight);

//neck
stroke(#E0FF00);
line(x-neckHeight,y-81,x-neckHeight,y-60);
line(x+neckHeight,y-81,x+neckHeight,y-60);

//antennas
fill(0);
stroke(0);
line(x-50,y-195,x-20,y-153);
line(x+50,y-195,x+20,y-153);
fill(255);
strokeWeight(7);
ellipse(x-50,y-195,15,15);
ellipse(x+50,y-195,15,15);

//eyes
stroke(#E0FF00);
strokeWeight(1);
fill(#E0FF00);
ellipse(x-20,y-130,10,10);
ellipse(x+20,y-130,10,10);

//mouth
stroke(255);
strokeWeight(8);
line(x-20,y-110,x+20,y-110);

//body
stroke(0);
fill(0);
rect(x-90,y-60,bodyHeight,180);

//chest
fill(210);
rect(x-50,y-20,100,70);

//buttons
strokeWeight(2);
strokeJoin(ROUND);
fill(#FF0303);
rect(x-50,y+70,20,20);
fill(#0361FF);
rect(x-10,y+70,20,20);
fill(#FFF303);
rect(x+30,y+70,20,20);

//hands
fill(0);
ellipse(x-130,y+30,20,20);
ellipse(x+130,y+30,20,20);
noFill();
strokeWeight(13);
arc(x-130,y+50,30,30,-3.14,0);
arc(x+130,y+50,30,30,-3.14,0);

//feet
strokeWeight(8);
fill(0);
rect(x-70,y+150,50,30);
rect(x+20,y+150,50,30);

