
size(300,300);
background(#8CBDC6);
fill(#60EA26);
int shapeSize;
shapeSize=1;
println(shapeSize);
ellipse((width/2),(height/2),shapeSize,shapeSize);
shapeSize=shapeSize =3;
ellipse((width/3),(height/3),shapeSize,shapeSize);
println(shapeSize);
int g;
g= -2;
println(g);
fill(#000000);
rect((width/10),(height/2),g,g); 
g= g *g;
println(g);
rect((width/4),(height/4),g,g); 
float m;
m=25;
println(m);
fill(#F01843);
ellipse((width*0.8),(height*0.9),m,m);
m= m+m;
println(m);
rect((width*0.55),(height*0.55),m,m);
float s;
s=10.5;
println(s);
fill(#F0DA0F);
ellipse(200,35,shapeSize,m);
s= s+s;
println(s);
fill(#D382CE);
ellipse((width/4),(height/4),s,s);
float n;
n=5;
println(n);
fill(#142243);
rect((width/5),(height*0.65),(n+s),(n*(n+g)));
fill(#2AE8E6);
rect((width*0.65),(height*0.65),(m/3),(m/3));
fill(#5D1BA0);
rect((width*0),(height*0),(n*7),(n*7));
rect((width*0),(height*0.2),(n*7),(n*7));
rect((width*0),(height*0.4),(n*7),(n*7));
rect((width*0),(height*0.6),(n*7),(n*7));
rect((width*0),(height*0.8),(n*7),(n*7));
rect((width-(n*7)),(height-(n*7)),(n*7),(n*7));
rect((width-(n*7)),(height*0.65),(n*7),(n*7));
rect((width-(n*7)),(height*0.40),(n*7),(n*7));
rect((width-(n*7)),(height*0.15),(n*7),(n*7));

