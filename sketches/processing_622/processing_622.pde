
/* ASIER DEL ROSAL SANTAMARIA 1º MEDIA DESIGN

Istituto Europeo di Design 2008-2009

*/


float x1;
float x2;
float x3;
float x4;
float x5;
float x6; 
float x7;
float x8;

float y1;
float y2;
float y3;
float y4;
float y5;
float y6;
float y7;
float y8;

float a; 
float b; 
float c; 
float d; 
float e; 
float f; 
float g; 
float h; 


size(800,800); 
background(100,100,255); 
smooth(); 
strokeWeight(15);
stroke(255);


line(width/2,height/8,width/2,7*height/8);

line(3*width/8,height/8,width/2,2*height/8);
line(5*width/8,height/8,width/2,2*height/8);
line(3*width/8,7*height/8,width/2,6*height/8);
line(5*width/8,7*height/8,width/2,6*height/8);


line(2*width/8,6*height/8,6*width/8,2*height/8);

line(2*width/8,5*height/8,3*width/8,5*height/8);
line(3*width/8,6*height/8,3*width/8,5*height/8);
line(6*width/8,3*height/8,5*width/8,3*height/8);
line(5*width/8,2*height/8,5*width/8,3*height/8);


line(2*width/8,2*height/8,6*width/8,6*height/8);

line(2*width/8,3*height/8,3*width/8,3*height/8);
line(3*width/8,2*height/8,3*width/8,3*height/8);
line(6*width/8,5*height/8,5*width/8,5*height/8);
line(5*width/8,6*height/8,5*width/8,5*height/8);

noStroke();
fill(255,255,255,25); 

x1 = random(0,width); 
x2 = random(0,width);
x3 = random(0,width);
x4 = random(0,width); 
x5 = random(0,width); 
x6 = random(0,width); 
x7 = random(0,width);
x8 = random(0,width); 

y1 = random(0,height); 
y2 = random(0,height);
y3 = random(0,height); 
y4 = random(0,height); 
y5 = random(0,height); 
y6 = random(0,height);
y7 = random(0,height); 
y8 = random(0,height); 

a = random(100,150); 
b = random(100,150); 
c = random(100,150); 
d = random(100,150); 
e = random(10,50); 
f = random(10,50);
g = random(10,50); 
h = random(10,50); 

ellipse(x1,y1,a,a); 
ellipse(x2,y2,b,b);
ellipse(x3,y3,c,c); 
ellipse(x4,y4,d,d); 
ellipse(x6,y6,f,f);
ellipse(x7,y7,g,g); 
ellipse(x8,y8,h,h);

