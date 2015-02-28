
PFont font;
float x1 = 0;
float x2 = 0;

void setup(){
size(250,250);
font = loadFont("Cambria-Bold-48.vlw");
textFont(font);
fill(0);
}
void draw(){
background(225);
fill(#FF0062);
text("L3S3E1", x1, 35);
fill(#FF0062);
text("L3S3E1", x1, 138);
fill(#FF0062);
text("L3S3E1", x1, 248);
x1 += 2.0;

fill(#FF7003);
text("L3S3E1", x2, 85);
fill(#FF7003);
text("L3S3E1", x2, 190);
x2 += 3.0;


if (x1 > width) { 
x1 = -150; 
x2 = -150;

}
}

