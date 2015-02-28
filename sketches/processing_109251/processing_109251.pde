
size(500, 500);
background(67, 169, 222);

int apple = -2;
int orange = 1;
float joke = apple;
float pl = orange;

println(apple);
apple = apple + 3;
println(apple);

println(orange);
orange = orange * orange;
println(orange);

println(joke);
joke =((orange * 3) + apple) / joke;
println(joke);

println(pl);
pl = (orange + orange + orange) / 2.0;
println(pl);

fill(183, 54, 181);
triangle(width - (height / 11), height/2, width/2, height / 11, height / 11, height/2);

fill(237, 22, 40);
rect(width/8, height/3, width/4, width/4);

fill(229,237,22);
ellipse(width/2, height/2, width/2, width/2);

stroke(22, 237, 37);
line(width/2, height/2, width/2, width/5);

fill(22, 237, 37);
triangle(width - (height/4), height/2, width/4, height/4, height/4, height/2);



