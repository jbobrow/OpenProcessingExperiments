
int sheight = 500;
int swidth = 400;

size(swidth, sheight);
println(width);
println(height);

colorMode(HSB, 360, 100, 100);

color blue = color(219, 55, 99);
color lavendar = color(289, 54, 95);
color gray = color(180);

background(blue); 

int xxx = width / 10;
int yyy = height / 10;

println(xxx);
println(yyy);

ellipse(width/3, height/2, xxx + 15, yyy + 40); //earback
rect(width/4, height/2, xxx + 65, yyy + 65, 5); //body
ellipse(width/4, height/2, xxx + 15, yyy + 40); //earfront
ellipse(width/2.5, height/1.75, xxx + 5, yyy + 5); //eye
fill(219, 0, 0);
ellipse(width/2.4, height/1.75, xxx, yyy); //pupil
