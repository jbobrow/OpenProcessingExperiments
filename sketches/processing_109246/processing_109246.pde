
size(300,300);
background(#27E0FF);
int gaul = -2;
int ken = 1;
println(gaul);
println(ken);
gaul += 3;
println(gaul);
ken *= ken;
println(ken);
float sat = 8;
float lam = 9;
sat += ken;
lam /=ken;
println(sat);
println(lam);
lam -=sat;
sat *=lam;
println(sat);
println(lam);
fill(118, 20, 144, 150);
float rect1= width/4;
float rect2= height/4;
rect((width /2) - (rect1/2), (height /2) - (rect2/2), rect1, rect2);
fill(50, 230, 30, 150);
ellipse(width/2,height/2, width/2, height/2);
line((width/2) -(rect1/2),(height /2) -(rect2/2), (width/2)+ (rect1/2), (height/2) +rect2/2);
line((width/2) +(rect1/2),(height/2)-(rect2/2),(width/2)-(rect1/2),(height/2)+rect2/2);
fill(255, 255, 255, 255);
rect((width/2) -(rect1/8), (height/2)- (rect2/8),rect1/4,rect2/4);


