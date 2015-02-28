
PImage img;

void setup(){
background(240,240,184);
size(600,600);
 // noLoop();
smooth();
colorMode (RGB, 600);
 img = loadImage ("201420084 Sin seo i.jpg"); // put the image in the same folder as the processing file
 }

void draw(){
println(mouseX + " : " + mouseY);

noStroke();
fill(548,483,120);
quad(238,83,305,308,63,246,238,83);

fill(mouseY,186,348,262);
ellipse(254,336,270,221);

stroke(0);
strokeWeight(1);
point(24,485);
line(24,485,-1,412);
line(214,403,0,398);
line(188,225,0,222);



stroke(0);
strokeWeight(3);
fill(mouseX,420,61,128);
rect(369,394,98,75);
line(496,423,422,426);

noFill();
bezier(-1,189,8,209,8,234,-1,256);

strokeWeight(5);
line(241,83,-1,77);
line(202,0,591,488);
line(287,0,352,94);
line(427,439,497,439);

strokeWeight(8);
line(-1,103,243,328);




}
