
PFont font;
float x1 = 0;
float x2 = 0;
float x3 = 0;

void setup(){
size(250,250);
font = loadFont("ArialHebrew-Bold-20.vlw");
textFont(font);
fill(0);
}
void draw(){
background(0);
fill(#FF0062);
text("L3S3E1", x1, 20);
fill(#FF0062);
text("L3S3E1", x1, 90);
fill(#FF0062);
text("L3S3E1", x1, 170);
fill(#FF0062);
text("L3S3E1", x1, 240);
x1 += 1.5;

fill(#000EFF);
text("L3S3E1", x2, 40);
fill(#000EFF);
text("L3S3E1", x2, 110);
fill(#000EFF);
text("L3S3E1", x2, 190);
x2 += 2.0;

fill(#10797C);
text("L3S3E1", x3, 60);
fill(#10797C);
text("L3S3E1", x3, 130);
fill(#10797C);
text("L3S3E1", x3, 210);
x3 += 2.5;




if (x1 > width) { 
x1 = -150; 
x2 = -150;
x3 = -150;

}
}

