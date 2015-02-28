
size(400,900);
colorMode(HSB,360,100,100);
background(50,100,100);
smooth();
strokeWeight(3);
fill(75,100,100);

//Assignment 3d: Create a composition that scales proportionally with different window sizes.

float h=(height/400);
float w=(width/400);

println(h);
println(w);

scale(w,h);
int a=15;
int b=77;
int c=10;
int d=0;
int l=30;
//Assignment 3a: Control the position of two rectangles with one variable.

rect(30,a,22,66);
rect(68,a,22,66);

//Assignment 3b: Control the position and size of two rectangles with two variables.
fill(233,58,100);
noStroke();
a+=132;
rect(15,a,b,22);
b+=22;
a-=40;
rect(42,a,22,b);
//print(a);

//Assignment 3c: Control the properties of a line and an ellipse with two variables.

stroke(1);
strokeWeight(c);
c+=300;
line(12,c, 390,c);
println(c);

c-=302;
strokeWeight(c);
stroke(300,67,80);
fill(75,100,100,d);
d+=60;
ellipse(54,250,40,60);


//Assignment 3e: Use multiplication to create a series of lines with increasing space between each.

for (int r=50; r<=350; r+=50){;
  stroke(r,130,87);
  line(l,330, l,390);
  l*=1.5;
}

