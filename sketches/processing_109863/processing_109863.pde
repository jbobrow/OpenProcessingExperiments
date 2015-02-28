
size (330, 300); 
background(#20A6F7); 

int x = 10;
int y = 20;
int diam = 30;
fill(#DEFF8B);
ellipse(x, y, diam, diam); 

x = x + 50; 
y = y + 50;
diam = diam + 50;
fill(#9A9A9D);
ellipse(x, y, diam, diam);

fill(#FC2200);
ellipse(width / 2, height / 2, width * 0.5, width * 0.5);

fill(#FF841F);
triangle(0,height / 1, width / 2, height * 2, width * 2, height / 2);

fill(0, 0, 0, 128);
rect(width / 2 - 50, height / 10 - 20, 100, 40);

fill(0, 0, 0, 50);
triangle(width / 3, 0, 0, height / 2, width + 1, width + 2); 


strokeWeight(5);
line (5,100,10,20);

strokeWeight(5);
line (10,200,20,40);

strokeWeight(5);
line (20,400,40,80);

strokeWeight(5);
line (40,800,80,160);

strokeWeight(5);
line (80,1000,100,160);




