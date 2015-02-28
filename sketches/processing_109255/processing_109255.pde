



size(600,600);
int P = width;
int G = height;


int x= 1;
println(x);
int y= -2;
println(y);
x= x+3;
println(x);
y= y*y;
println(y);
float A=8;
float B=-3;
A= (A-x)/ (B*y)- (B+A)+ (x-y);
println(A);



background(#1B19DE);
fill(10,100,0);
rect(P/4,G/4,P/2,G/2);
fill(100,50,0);
rect(G/10,P/5,P/10,G/10);
fill(30,70,70);
triangle(G/10,P/10,G/4,P/4,G/4,P/2); 
fill(30,10,200);
ellipse(G/2,P/2,100,100);
ellipse(G/2.8,P/2.8,150,80);
fill(100,0,0);
arc(G/1.35,P/1.35,200,100,0,PI/2);


