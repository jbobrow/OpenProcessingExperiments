
PFont a;
PFont b;
PFont c;
PFont d;

String louise = "L";

void setup() {
size(250,250);
smooth();
noStroke();
background(127);
a = loadFont("AGaramondPro-Regular-100.vlw");
b = loadFont("AmericanTypewriter-LightCond-100.vlw");
c = loadFont("HelveticaNeue-Light-100.vlw");
d = loadFont("Memphis-Medium-100.vlw");
frameRate(20);
}

void draw() {
stroke(0);
fill(20,120,120,10);
textMode(CENTER);
textFont(a,100);
text("L",mouseY,mouseX);
fill(255,10);
textFont(b,100);
noStroke();
text("5",127,127);
fill(255,10);
text("G", mouseX, mouseY);
fill(0,30);
text("3T7", random(height),random(width));


}

                
                
