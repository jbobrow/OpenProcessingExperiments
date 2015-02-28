

String myText;
PFont yayfont;

int xcoord = 150;
int ycoord = 200;

int xspeed = 1;
int yspeed = 2;

void setup() {
  size(600,400);
myText = "here is some text";
yayfont = loadFont("AppleCasual-48.vlw");
}

void draw() {
background(100);

xcoord = xcoord + xspeed;
ycoord = ycoord + yspeed;

textFont(yayfont);
text(myText, xcoord, ycoord);

if (xcoord > 255) {
xspeed = -1;
}

if (xcoord < 0){
xspeed = 1;
}

if (ycoord > 400){
  yspeed = -2;
}

if (ycoord < 30){
  yspeed = 2;
}

}
