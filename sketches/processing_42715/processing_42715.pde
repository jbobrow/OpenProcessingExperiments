
PImage star;
PImage cat;
PFont future;
PFont miao;

void setup(){
size(1024,768);
background(0);
star = loadImage("star.png");
cat = loadImage("cat4.jpg");
future = loadFont("Chalkduster-lookatme.vlw");
miao = loadFont("HoboStd-miao.vlw");
}

void draw(){
image(cat,0,0);
image(star,mouseX,mouseY,100,100);
fill(80);
textFont(future);
textSize(50);
text("FUTURE IS WATING FOR US!",10,50);

fill(249,16,85);
textFont(miao);
textSize(30);
text("MIAO~ :)",mouseX,mouseY);

}

