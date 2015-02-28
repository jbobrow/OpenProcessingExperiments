
Boolean isMouseMoved = false;
Boolean isMouseDragged = false;
Boolean isMouseClicked = false;
Boolean words = true;
Boolean isKeyS_Pressed = false;

float[] xPos = new float[0];
float[] yPos = new float[0];
float[] xVel = new float[0];
float[] yVel = new float[0];
float[] partSize = new float[0];

PImage bkimg = null;

PFont angsanaUPCBold;
PGraphics drawBuf;

int i = 1;
float x;
float y;
float px;
float py;
float easing = 0.05;


void setup() {
size(700, 700);
smooth();
background(0);
bkimg = this.get(0,0,width,height);
drawBuf=createGraphics(width, height, JAVA2D);
angsanaUPCBold = loadFont("AngsanaUPC-Bold-24.vlw");
textFont(angsanaUPCBold, 24);
}

void draw() {

if (key =='s'||key =='S') {
words = false;
}

if (isMouseMoved) {
fill(0, 1);
// background(0,1);

if(bkimg != null)
image(bkimg,0,0);

stroke(214, 253, 1, 200);

smooth();

float targetX = mouseX;
x +=(targetX-x) *easing;
float targetY = mouseY;
y +=(targetY-y) *easing;
float weight =dist(x, y, px, py)*3;
strokeWeight(weight);
line(x, y, px, py);
py=y;
px=x;
}

if (isMouseDragged) {
fill(0, 5);
noStroke();
rect(0, 0, width, height);
}
if (isMouseClicked) {
// fill(0, 5);
background(0);
xPos = append(xPos, mouseX);
yPos = append(yPos, mouseY);
xVel = append(xVel, random(-1, 1));
yVel = append(yVel, random(-12, -6));
partSize = append(partSize, random(6, 12));

fill(214, 253, 1, 200);

for (int j = 0; j<xPos.length; j++ ) {

ellipse(xPos[j], yPos[j], partSize[j], partSize[j]);

xPos[j] += xVel[j];
yPos[j] += yVel[j];

yVel[j]+=0.1;

partSize[j] *= 0.99;
}
if (xPos.length>200) {
xPos = subset(xPos, 1);
yPos = subset(yPos, 1);
xVel = subset(xVel, 1);
yVel = subset(yVel, 1);
partSize = subset(partSize, 1);
}
if (isMouseDragged) {
int z = (int)random(15, 45);
int redcol= (int)random(0, 255), bluecol= (int)random(0, 255), greencol = (int)random(0, 255);
fill(redcol, bluecol, greencol);
ellipse(mouseX, mouseY, z, z);
}

}

if (!isKeyS_Pressed)
information();
}


void information() {
fill(215, 253, 1);
text("Hello! Human!This is CARZY TENNIS FOUNTAIN!", (width/2)-40, height/2);
text("Press S to hide the text!", (width/2)-40, height/2+20);
text("Click mouse to make a fountain, click again to stop it!", (width/2)-40, height/2+40);
text("Drag your mouse to make decorations!", (width/2)-40, height/2+60);
text("By Jihan Feng.", (width/2)-40, height/2+80);
}

void mouseClicked() {
if (isMouseClicked == false) {
isMouseClicked =true;
}
else {
isMouseClicked = false;
}
bkimg = this.get(0,0,width,height);
}

void mouseDragged() {
isMouseClicked = false;
isMouseDragged = true;
isMouseMoved = false;
fill(0, 5);
noStroke();
rect(0, 0, width, height);
if (i<5) {
i++;
return;
}
i=0;
fill(215, 253, 1, 200);
noStroke();
int z = (int)random(15, 45);
int redcol= (int)random(0, 255), bluecol= (int)random(0, 255), greencol = (int)random(0, 255);
fill(redcol, bluecol, greencol);
ellipse(mouseX, mouseY, z, z);
}

void mouseMoved() {
isMouseMoved = true;
}

void keyReleased(KeyEvent evt) {
if (key == 's' || key == 'S') {
isKeyS_Pressed = true;
}
}

