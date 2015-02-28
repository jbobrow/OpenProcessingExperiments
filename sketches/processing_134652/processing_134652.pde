
// Math 1: Arithmetic, Functions
// Exercises

size(500,500);
background(150);
noStroke();
fill(255,100);

int x = 50;
ellipse(width*0.5,height*0.5,x,x);
x *= 3;
ellipse(width*0.5,height*0.5,x,x);
x *= 3;
ellipse(width*0.5,height*0.5,x,x);

int a = 1;
strokeWeight(a);
stroke(255);
line(a,0,a,height);
line(width-a,0,width-a,height);
line(0,a,width,a);
line(0,height-a,width,height-a);
a *= 5;
line(a,0,a,height);
line(width-a,0,width-a,height);
line(0,a,width,a);
line(0,height-a,width,height-a);
a *= 5;
line(a,0,a,height);
line(width-a,0,width-a,height);
line(0,a,width,a);
line(0,height-a,width,height-a);
a *= 5;
line(a,0,a,height);
line(width-a,0,width-a,height);
line(0,a,width,a);
line(0,height-a,width,height-a);

float b = min(1.2,2.3,3.4);
line(b,height*0.25,b,height*0.75);
b += 20;
line(b,height*0.25,b,height*0.75);
b += 20;
line(b,height*0.25,b,height*0.75);
b += 20;
line(b,height*0.25,b,height*0.75);
b += 20;
line(b,height*0.25,b,height*0.75);
b += 20;
line(b,height*0.25,b,height*0.75);
b += 20;
line(b,height*0.25,b,height*0.75);
b += 20;
line(b,height*0.25,b,height*0.75);
b += 20;
line(b,height*0.25,b,height*0.75);
b += 20;
line(b,height*0.25,b,height*0.75);
b += 20;
line(b,height*0.25,b,height*0.75);
b += 20;
line(b,height*0.25,b,height*0.75);
b += 20;
line(b,height*0.25,b,height*0.75);
b += 20;
line(b,height*0.25,b,height*0.75);
b += 20;
line(b,height*0.25,b,height*0.75);
b += 20;
line(b,height*0.25,b,height*0.75);
b += 20;
line(b,height*0.25,b,height*0.75);
b += 20;
line(b,height*0.25,b,height*0.75);
b += 20;
line(b,height*0.25,b,height*0.75);
b += 20;
line(b,height*0.25,b,height*0.75);
b += 20;
line(b,height*0.25,b,height*0.75);
b += 20;
line(b,height*0.25,b,height*0.75);
b += 20;
line(b,height*0.25,b,height*0.75);
b += 20;
line(b,height*0.25,b,height*0.75);
b += 20;
line(b,height*0.25,b,height*0.75);

float c = max(4.5,5.6,7.8);
line(width*0.25,c,width*0.75,c);
c += 100;
line(width*0.25,c,width*0.75,c);
c += 100;
line(width*0.25,c,width*0.75,c);
c += 100;
line(width*0.25,c,width*0.75,c);
c += 100;
line(width*0.25,c,width*0.75,c);
c += 100;
line(width*0.25,c,width*0.75,c);

println(width,height);
println("x="+x);
println("a="+a);
println("b="+b);


