
//colorMode(RGB, 10, 9, 10, 255);
//stroke(10);
//fill(75);
//background(100);
//rect(75, 2, 32, 100);
//line(1, 0, 4, 50);
//ellipse(50,20,3,2);

//dimensons for ears
int ear1x = 85;
int ear1y = 100;
int ear2x = 415;
int earRad = 150;

//dimensions for head
int headRad = 350;
int headCentre = 250;

//dimensions for eyes
int eyeRad = 35;
int eye1x = 180;
int eye1y = 120;
int eye2x = 320;

//dimensions for mouth lines
int lineX = 100;
int lineY = 150;
int lineLength = 140;
int lineWidth = 350;

void setup(){
smooth();
size(500,450);
frameRate(200);
}

//ears
void draw(){
ellipse(ear1x,ear1y,earRad,earRad);
ellipse(ear2x,ear1y,earRad,earRad);

//head
ellipse(headCentre,headCentre,headRad,headRad);

//eyes
ellipse(eye1x,eye1y,eyeRad,eyeRad);
ellipse(eye2x,eye1y,eyeRad,eyeRad);

//mouth
line(lineX,lineY,lineLength,lineWidth);
line(lineX+100,lineY,lineLength,lineWidth);
line(lineX+100,lineY,lineLength+100,lineWidth);
line(lineX+200,lineY,lineLength+100,lineWidth);
line(lineX+200,lineY,lineLength+200,lineWidth);
line(lineX+300,lineY,lineLength+200,lineWidth);

//top right qudrant conditional
if(mouseX > 250 && mouseY > 225 ) {
ear1x = mouseX;
ear1y = mouseY;
ear2x = mouseY;
earRad += 1;
headRad += 1;
eye1x = mouseX;
eye1y = mouseY;
eye2x = mouseY;
lineX = mouseX;
lineY = mouseY;
lineLength += 1;
lineWidth += 1;

}
//bottom right qudrant conditional
if(mouseX > 250 && mouseY < 225 ) {
ear1x = mouseX;
ear1y = mouseY;
ear2x = mouseY;
earRad += 1;
headRad += 1;
eyeRad = 35;
eye1x = mouseX;
eye1y = mouseY;
eye2x = mouseY;
lineX = mouseX;
lineY = mouseY;
lineLength += 1;
lineWidth += 1;

}

//top left quadrant conditional
if(mouseX < 250 && mouseY > 225 ) {
ear1x = mouseX;
ear1y = mouseY;
ear2x = mouseY;
earRad -= 1;
headRad -= 1;
eye1x = mouseX;
eye1y = mouseY;
eye2x = mouseY;
lineX = mouseX;
lineY = mouseY;
lineLength -= 1;
lineWidth -= 1;

}

//bottom left quadrant conditional
if(mouseX < 250 && mouseY < 225 ) {
ear1x = mouseX;
ear1y = mouseY;
ear2x = mouseX;
earRad -= 1;
headRad -= 1;
eye1x = mouseX;
eye1y = mouseY;
eye2x = mouseY;
lineX = mouseX;
lineY = mouseY;
lineLength -= 1;
lineWidth -= 1;

}

}
//colour fill based on mouse position when clicking
void mousePressed() {
fill (mouseX,0,mouseY);
}




