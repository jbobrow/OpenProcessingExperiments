

String myText;
PFont yayfont;
PImage myImage;


int xcoord = 150;
int ycoord = 200;

int xcoord2 = 200;
int ycoord2 = 40;

int xspeed = 1;
int yspeed = 2;

int xspeed2 = 2;
int yspeed2 = 4;

void setup() {
  size(1000,900);
myText = "here is some text";
myImage = loadImage("myImage.jpg");
yayfont = loadFont("AppleCasual-48.vlw");


myImage.resize(200,200);

}

void draw() {
background(0);

xcoord = xcoord + xspeed;
ycoord = ycoord + yspeed;

xcoord2 = xcoord2 + xspeed2;
ycoord2 = ycoord2 + yspeed2;

textFont(yayfont);
text(myText, xcoord, ycoord);

tint(100,100,255,100);

image(myImage, xcoord2, ycoord2);

if (xcoord > 755) {
xspeed = -1;
}

if (xcoord < 0){
xspeed = 1;
}

if (ycoord > 700){
  yspeed = -2;
}

if (ycoord < 30){
  yspeed = 2;
}


if (xcoord2 > 400) {
xspeed2 = -2;
}

if (xcoord2 < 0){
xspeed2 = 2;
}

if (ycoord2 > 400){
  yspeed2 = -4;
}

if (ycoord2 < 0){
  yspeed2 = 4;
}

}
