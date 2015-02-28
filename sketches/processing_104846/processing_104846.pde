
size(1000,600);
colorMode(HSB, 360, 100, 100);
smooth();
noStroke();

int horizon = height/2;

color sun = color(46,92,99);
int time = 100;

int sunX = (width - 300) - time;
int sunY = horizon - time;

int skyfill = 360 * sunY / 300;

println(skyfill);

background(360 - skyfill);



//sun
fill(sun);
ellipse(sunX, sunY, 100,100);



//colorMode(RGB, 255, 255, 255);

//grass
fill(100,50, 360-skyfill);
rect(0, horizon, width, horizon);




//tree
int treeX = 100;
int treeX2 = treeX - 25; 
int treeX3 = treeX + 25;

fill(112,150,360-skyfill);
triangle(treeX, horizon - 75, treeX2, horizon - 25, treeX3, horizon - 25);
triangle(treeX, horizon - 50, 50, horizon - 5, 150, horizon - 5);
triangle(treeX, horizon - 15, 25, horizon + 15, 175, horizon +15);

pushMatrix();
translate(55,-10);
pushMatrix();
translate(30,20);
fill(115,192,360-skyfill);
triangle(treeX, horizon - 75, treeX2, horizon - 25, treeX3, horizon - 25);
triangle(treeX, horizon - 50, 50, horizon - 5, 150, horizon - 5);
triangle(treeX, horizon - 15, 25, horizon + 15, 175, horizon +15);

pushMatrix();
translate(40,70);
fill(110,143,360-skyfill);
triangle(treeX, horizon - 75, treeX2, horizon - 25, treeX3, horizon - 25);
triangle(treeX, horizon - 50, 50, horizon - 5, 150, horizon - 5);
triangle(treeX, horizon - 15, 25, horizon + 15, 175, horizon +15);

pushMatrix();
translate(55,-10);
fill(117,92,360-skyfill);
triangle(treeX, horizon - 75, treeX2, horizon - 25, treeX3, horizon - 25);
triangle(treeX, horizon - 50, 50, horizon - 5, 150, horizon - 5);
triangle(treeX, horizon - 15, 25, horizon + 15, 175, horizon +15);
