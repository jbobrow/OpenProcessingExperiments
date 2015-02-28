
/* Konkuk University SOS iDesign
Name: shin yeonsik ID: dnmys11
*/

PImage img;

void setup(){
background(246,234,183);
size(600,600);
 // noLoop();
smooth();
colorMode (RGB, 600);
 img = loadImage ("201420085 yeonsik Shin.jpg"); // put the image in the same folder as the processing file
 }

void draw(){
println(mouseX + " : " + mouseY);

point(371,172);
line(-1,172,371,172);
line(395,399,78,406);

fill(mouseY,300,252,368);
ellipse(131,174,154,166);

noStroke();
fill(523,486,148);
quad(410,1,260,202,490,285,427,1);

noStroke();
fill(mouseY,258,358,306);
ellipse(440,317,255,287);

stroke(0);
strokeWeight(3);
fill(mouseX,485,180,56);
rect(551,394,49,102);

strokeWeight(8);
line(433,304,152,0);

stroke(0);
strokeWeight(5);
line(222,517,81,0);
line(600,221,457,0);
strokeWeight(3);
line(83,0,221,515);
line(600,223,455,0);
noFill();
bezier(61,439,57,379,25,333,0,308);









}
