
PImage img;

void setup(){
background(243,235,185);
size(600,600);
 // noLoop();
smooth();
colorMode (RGB, 600);
 img = loadImage ("201420089 EOM HYE BIN.jpg"); // put the image in the same folder as the processing file
 }

void draw(){
println(mouseX + " : " + mouseY);


point(559,356);
line(315,112,-1,309);
line(412,0,309,339);
line(231,207,511,215);
line(231,268,527,272);

noFill();
bezier(410,128,410,30,490,-50,600,15);


noStroke();
fill(563,503,112);
ellipse(172,374,256,244);

fill(mouseX,589,568,364);
ellipse(163,366,196,181);


fill(mouseY,14,28,332);
ellipse(160,356,160,152);

noFill();
ellipse(163,366,196,181);


stroke(0);
line(247,222,-1,443);



}
