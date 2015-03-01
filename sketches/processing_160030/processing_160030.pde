
//Variables
color[] clr = {#FFFFFF, #FAFFE7, #F9F7C8, #E6EBC4, #9ACCAF};
color[] plt = clr;
color[] clr1 = {#5F7B7F, #415457, #283436, #19211C, #000000};
color[] plt1 = clr1;
int x = 0;
int lw = 50;
int x2 = x+50;
int xy =50;

//Setup
size(500, 500);
background(255);

//Squares
//Line1
noStroke();  
fill(plt[0]);
rect(x, x, lw, lw);
fill(plt[1]);
rect(x2, x, lw, lw);
fill(plt[2]);
rect(x2*2, x, lw, lw);
fill(plt[3]);
rect(x2*3, x, lw, lw);
fill(plt[4]);
rect(x2*4, x, lw, lw);
fill(plt1[0]);
rect(x2*5, x, lw, lw);
fill(plt1[1]);
rect(x2*6, x, lw, lw);
fill(plt1[2]);
rect(x2*7, x, lw, lw);
fill(plt1[3]);
rect(x2*8, x, lw, lw);
fill(plt1[4]);
rect(x2*9, x, lw, lw);

//Line2
fill(plt[0]);
rect(x2*9, xy, lw, lw);
fill(plt[1]);
rect(x2*8, xy, lw, lw);
fill(plt[2]);
rect(x2*7, xy, lw, lw);
fill(plt[3]);
rect(x2*6, xy, lw, lw);
fill(plt[4]);
rect(x2*5, xy, lw, lw);
fill(plt1[0]);
rect(x2*4, xy, lw, lw);
fill(plt1[1]);
rect(x2*3, xy, lw, lw);
fill(plt1[2]);
rect(x2*2, xy, lw, lw);
fill(plt1[3]);
rect(x2, xy, lw, lw);
fill(plt1[4]);
rect(x, xy, lw, lw);

//Line3
noStroke();  
fill(plt[0]);
rect(x, (xy*2) , lw, lw);
fill(plt[1]);
rect(x2, (xy*2), lw, lw);
fill(plt[2]);
rect(x2*2, (xy*2), lw, lw);
fill(plt[3]);
rect(x2*3, (xy*2), lw, lw);
fill(plt[4]);
rect(x2*4, (xy*2), lw, lw);
fill(plt1[0]);
rect(x2*5, (xy*2), lw, lw);
fill(plt1[1]);
rect(x2*6, (xy*2), lw, lw);
fill(plt1[2]);
rect(x2*7, (xy*2), lw, lw);
fill(plt1[3]);
rect(x2*8, (xy*2), lw, lw);
fill(plt1[4]);
rect(x2*9, (xy*2), lw, lw);

//Line4
fill(plt[0]);
rect(x2*9, (xy*3), lw, lw);
fill(plt[1]);
rect(x2*8, (xy*3), lw, lw);
fill(plt[2]);
rect(x2*7, (xy*3), lw, lw);
fill(plt[3]);
rect(x2*6, (xy*3), lw, lw);
fill(plt[4]);
rect(x2*5, (xy*3), lw, lw);
fill(plt1[0]);
rect(x2*4, (xy*3), lw, lw);
fill(plt1[1]);
rect(x2*3, (xy*3), lw, lw);
fill(plt1[2]);
rect(x2*2, (xy*3), lw, lw);
fill(plt1[3]);
rect(x2, (xy*3), lw, lw);
fill(plt1[4]);
rect(x, (xy*3), lw, lw);

//Line5
noStroke();  
fill(plt[0]);
rect(x, (xy*4) , lw, lw);
fill(plt[1]);
rect(x2, (xy*4), lw, lw);
fill(plt[2]);
rect(x2*2, (xy*4), lw, lw);
fill(plt[3]);
rect(x2*3, (xy*4), lw, lw);
fill(plt[4]);
rect(x2*4, (xy*4), lw, lw);
fill(plt1[0]);
rect(x2*5, (xy*4), lw, lw);
fill(plt1[1]);
rect(x2*6, (xy*4), lw, lw);
fill(plt1[2]);
rect(x2*7, (xy*4), lw, lw);
fill(plt1[3]);
rect(x2*8, (xy*4), lw, lw);
fill(plt1[4]);
rect(x2*9, (xy*4), lw, lw);

//Line6
noStroke();  
fill(plt[0]);
rect(x, (xy*5), lw, lw);
fill(plt[1]);
rect(x2, (xy*5), lw, lw);
fill(plt[2]);
rect(x2*2, (xy*5), lw, lw);
fill(plt[3]);
rect(x2*3, (xy*5), lw, lw);
fill(plt[4]);
rect(x2*4, (xy*5), lw, lw);
fill(plt1[0]);
rect(x2*5, (xy*5), lw, lw);
fill(plt1[1]);
rect(x2*6, (xy*5), lw, lw);
fill(plt1[2]);
rect(x2*7, (xy*5), lw, lw);
fill(plt1[3]);
rect(x2*8, (xy*5), lw, lw);
fill(plt1[4]);
rect(x2*9, (xy*5), lw, lw);

//Line7
fill(plt[0]);
rect(x2*9, (xy*6), lw, lw);
fill(plt[1]);
rect(x2*8, (xy*6), lw, lw);
fill(plt[2]);
rect(x2*7, (xy*6), lw, lw);
fill(plt[3]);
rect(x2*6, (xy*6), lw, lw);
fill(plt[4]);
rect(x2*5, (xy*6), lw, lw);
fill(plt1[0]);
rect(x2*4, (xy*6), lw, lw);
fill(plt1[1]);
rect(x2*3, (xy*6), lw, lw);
fill(plt1[2]);
rect(x2*2, (xy*6), lw, lw);
fill(plt1[3]);
rect(x2, (xy*6), lw, lw);
fill(plt1[4]);
rect(x, (xy*6), lw, lw);

//Line8
noStroke();  
fill(plt[0]);
rect(x, (xy*7) , lw, lw);
fill(plt[1]);
rect(x2, (xy*7), lw, lw);
fill(plt[2]);
rect(x2*2, (xy*7), lw, lw);
fill(plt[3]);
rect(x2*3, (xy*7), lw, lw);
fill(plt[4]);
rect(x2*4, (xy*7), lw, lw);
fill(plt1[0]);
rect(x2*5, (xy*7), lw, lw);
fill(plt1[1]);
rect(x2*6, (xy*7), lw, lw);
fill(plt1[2]);
rect(x2*7, (xy*7), lw, lw);
fill(plt1[3]);
rect(x2*8, (xy*7), lw, lw);
fill(plt1[4]);
rect(x2*9, (xy*7), lw, lw);

//Line9
fill(plt[0]);
rect(x2*9, (xy*8), lw, lw);
fill(plt[1]);
rect(x2*8, (xy*8), lw, lw);
fill(plt[2]);
rect(x2*7, (xy*8), lw, lw);
fill(plt[3]);
rect(x2*6, (xy*8), lw, lw);
fill(plt[4]);
rect(x2*5, (xy*8), lw, lw);
fill(plt1[0]);
rect(x2*4, (xy*8), lw, lw);
fill(plt1[1]);
rect(x2*3, (xy*8), lw, lw);
fill(plt1[2]);
rect(x2*2, (xy*8), lw, lw);
fill(plt1[3]);
rect(x2, (xy*8), lw, lw);
fill(plt1[4]);
rect(x, (xy*8), lw, lw);

//Line10
noStroke();  
fill(plt[0]);
rect(x, (xy*9) , lw, lw);
fill(plt[1]);
rect(x2, (xy*9), lw, lw);
fill(plt[2]);
rect(x2*2, (xy*9), lw, lw);
fill(plt[3]);
rect(x2*3, (xy*9), lw, lw);
fill(plt[4]);
rect(x2*4, (xy*9), lw, lw);
fill(plt1[0]);
rect(x2*5, (xy*9), lw, lw);
fill(plt1[1]);
rect(x2*6, (xy*9), lw, lw);
fill(plt1[2]);
rect(x2*7, (xy*9), lw, lw);
fill(plt1[3]);
rect(x2*8, (xy*9), lw, lw);
fill(plt1[4]);
rect(x2*9, (xy*9), lw, lw);


