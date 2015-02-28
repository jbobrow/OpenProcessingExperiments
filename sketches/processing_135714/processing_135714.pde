
size(300,300);
println(width + "," + height);
float x, y;
x= 0.5;
y=0.4;
int z = 50;
int a;
a = 75;
noFill();
strokeWeight(3);
strokeJoin(BEVEL);
bezier(32,150,-10,110,32,70,30,75);
bezier(62,150,-10,110,62,70,60,75);
bezier(110,230,150,260,170,250,200,230);
bezier(110,250,140,280,170,280,200,250);
strokeWeight(1);
ellipse(width*x, height*y, width*0.5, height*0.66);
noStroke();
rectMode(CENTER);
fill(0, 51);
rect(z, a-10, z + 300, a + 10);
rectMode(CENTER);
fill(100,100);
rect(z, a+100, z+300, a+10);







