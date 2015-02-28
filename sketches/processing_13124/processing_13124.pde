
PImage roboto;

float xpos;
float ypos;
float drag = 30;

void setup() {
size(500, 500);
roboto = loadImage("roboto.gif");
xpos = width/2;
ypos = height/2;
}


void draw() { 
background(255);

float difx = mouseX - xpos-roboto.width/2;
if (abs(difx) > 1) {
xpos = xpos + difx/drag;
xpos = constrain(xpos, 0, width-roboto.width);
} 

float dify = mouseY - ypos-roboto.height/2;
if (abs(dify) > 1) {
ypos = ypos + dify/drag;
ypos = constrain(ypos, 0, height-roboto.height);
} 


image(roboto, xpos, ypos);
} 



