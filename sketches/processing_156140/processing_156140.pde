
float scale;
float speed;
PImage scream;
PFont myfont;

void setup() {
size(500, 500);
scream = loadImage("scream-queen.jpg");
myfont = loadFont("AmericanTypewriter-CondensedBold-48.vlw");

}

void draw(){
background(255);
imageMode(CENTER);
speed = 4;
scale = map(sin(frameCount/speed), -1, 1, 1, 1.2);
image(scream, width/2, height/2, scale*scream.width, scale*scream.height);
fill(255);
textAlign(CENTER);
textFont(myfont, 60);
text("SCREAM!", random(width/2 - 50, width/2 + 50), height/2);
}


