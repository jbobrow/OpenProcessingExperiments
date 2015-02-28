
PImage ima;
PImage ima2;
PFont myfont;
PFont myfont2;

void setup() {
 size(600,350);
 ima=loadImage("hand.jpg");
 ima2=loadImage("fly.png");
 myfont=loadFont("BradleyHandITC-48.vlw");
 myfont2=loadFont("DilleniaUPCBold-48.vlw");
}

void draw() {

image(ima,0,0,600,350);
image(ima2,mouseX-80,mouseY-80,30,30);

fill(0);
textFont(myfont);
textSize(50);
text("oh...",487,260);
textFont(myfont2);
textSize(100);
fill(255,0,0);
text("hate it!",370,320);

}

