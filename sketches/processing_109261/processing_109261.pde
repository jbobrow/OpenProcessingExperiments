
size(300, 300);
background(#44DFF2);
int belly = -2;
println(belly);
int sand = 1;
println(sand);
belly = belly + 3;
println(belly);
sand = sand * 1;
println(sand);
float a = 6;
float b =-8;
a = ((a - 4 + 7) / 2);
println(a);
b = ((3 +b) * 9);
println(b);

fill(#ED0C0C);
rect(width /4, height /4, width/2, height/2);
fill(#BBB8C6);
ellipse( width /4, height /4, width /2, height /2);
fill(#ffffff);
arc( width / 8, height / 8, 50, 50, 0, PI);
arc( width /3, height / 8, 50, 50, 0, PI);
noFill();
triangle(width-240, height-3, width/8, height/8, width-30 , height/30);
fill(#000E00);
strokeWeight(10);
line(width/30,height/20, width, height);






