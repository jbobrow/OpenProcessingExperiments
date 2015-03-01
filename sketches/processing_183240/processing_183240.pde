
size(500,500);
int r = 230; //define int r
int g = 240; //define int g
int b = 100; //define int b

//head
fill(r,g,b);
rect(240,200,20,100);
rect(200,130,100,100);
//neck 
fill(0);
ellipse(220,170,20,20); ellipse(280,170,20,20);
rect(150,140,200,10);

//arms
line(200,300,100,375);
line(300,300,400,375);

//body
fill(r,g,b);
ellipse(250,400,100,100);
rect(200,300,100,100);
//shoulders
fill(0);
rect(175,275,50,50);
rect(275,275,50,50);

