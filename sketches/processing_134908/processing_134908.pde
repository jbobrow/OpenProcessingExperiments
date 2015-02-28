
int redValue = 0;
int greenValue = 0;
int blueValue = 0;
int XValue1 = 0;
int YValue1 = 0;
int XValue2 = 0;
int YValue2 = 0;
int XValue3 = 0;
int YValue3 = 0;
int XValue = 240;
int YValue = 220;
int sunY = 100;
int sunX = 250;

void setup(){
  size(400, 300);
}

void draw(){
  redValue = map(mouseX, 0, width, 132, 115);
greenValue = map(mouseX, 0, width, 224, 195);
blueValue = map(mouseX, 0, width, 255, 222);
  background(redValue, greenValue, blueValue);
noStroke();

//sun
ellipseMode(CENTER);

redValue = map(mouseX, 0, width, 255, 166);
greenValue = map(mouseX, 0, width, 214, 0);
blueValue = map(mouseX, 0, width, 0, 100);
fill(redValue, greenValue, blueValue);

if (sunY > 200){
  sunY = -100;
}
else {
  sunY+.01;
}
sunY+.01;
ellipse(sunX, sunY, 120, 120);


redValue = map(mouseX, 0, width, 255, 110);
greenValue = map(mouseX, 0, width, 236, 0);
blueValue = map(mouseX, 0, width, 0, 66);
fill(redValue, greenValue, blueValue);
if (sunY-12 > 200){
  sunY = -100;
}
else {
  sunY++;
}
sunY++;
ellipse(sunX-12, sunY-12, 80, 80);


redValue = map(mouseX, 0, width, 255, 46);
greenValue = map(mouseX, 0, width, 249, 0);
blueValue = map(mouseX, 0, width, 69, 28);
fill(redValue, greenValue, blueValue);

if (sunY-20 > 200){
  sunY = -100;
}
else {
  sunY++;
}
sunY++;
ellipse(sunX-20, sunY-20, 50, 50);

//sand
redValue = map(mouseX, 0, width, 255, 0);
greenValue = map(mouseX, 0, width, 243, 204);
blueValue = map(mouseX, 0, width, 183, 47);
fill(redValue, greenValue, blueValue);
beginShape();
vertex(0, 100);
vertex(130, 110);
vertex(310, 100);
vertex(400, 110);
vertex(400, 300);
vertex(0, 300);
endShape(CLOSE);
//landscape after larger shape, before pyramids
//middle layer

noStroke();
rectMode(CORNER);

redValue = map(mouseX, 0, width, 255, 42);
greenValue = map(mouseX, 0, width, 231, 125);
blueValue = map(mouseX, 0, width, 169, 0);
fill(redValue, greenValue, blueValue);
rect(0, 230, 400, 100);

//front layer

redValue = map(mouseX, 0, width, 245, 55);
greenValue = map(mouseX, 0, width, 213, 79);
blueValue = map(mouseX, 0, width, 162, 4);
fill(redValue, greenValue, blueValue);
rect(0, 270, 400, 50);

//pyramid back
//back
redValue = map(mouseX, 0, width, 189, 53);
greenValue = map(mouseX, 0, width, 110, 0);
blueValue = map(mouseX, 0, width, 72, 105);
fill(redValue, greenValue, blueValue);
XValue1 = map(mouseY, 0, height, 140, 180);
XValue2 = map(mouseY, 0, height, 190, 300);
YValue2 = map(mouseY, 0, height, 70, 55);
XValue3 = map(mouseY, 0, height, 140, 170);
triangle(XValue1, 130, XValue2, YValue2, XValue3, 110);

//front
redValue = map(mouseX, 0, width, 237, 167);
greenValue = map(mouseX, 0, width, 193, 97);
blueValue = map(mouseX, 0, width, 134, 255);
fill(redValue, greenValue, blueValue);
XValue1 = map(mouseY, 0, height, 140, 180);
XValue3 = map(mouseY, 0, height, 190, 300);
YValue3 = map(mouseY, 0, height, 70, 55);
XValue2 = map(mouseY, 0, height, 240, 450);
triangle(XValue1, 130, XValue2, 130, XValue3, YValue3);

//pyramid front
//front
redValue = map(mouseX, 0, width, 255, 199);
greenValue = map(mouseX, 0, width, 215, 132);
blueValue = map(mouseX, 0, width, 156, 255);
fill(redValue, greenValue, blueValue);
XValue1 = map(mouseY, 0, height, 20, -30);
XValue3 = map(mouseY, 0, height, 100, 140);
YValue3 = map(mouseY, 0, height, 50, 30);
XValue2 = map(mouseY, 0, height, 180, 300);
triangle(XValue1, 160, XValue2, 160, XValue3, YValue3);

//back
redValue = map(mouseX, 0, width, 212, 90);
greenValue = map(mouseX, 0, width, 123, 59);
blueValue = map(mouseX, 0, width, 81, 115);
fill(redValue, greenValue, blueValue);
XValue1 = map(mouseY, 0, height, 20, -30);
XValue2 = map(mouseY, 0, height, 100, 140);
YValue2 = map(mouseY, 0, height, 50, 30);
triangle(XValue1, 160, XValue2, YValue2, 0, 130);


//front grass thing
noStroke();
redValue = map(mouseX, 0, width, 29, 71);
greenValue = map(mouseX, 0, width, 64, 71);
blueValue = map(mouseX, 0, width, 49, 4);
fill(redValue, greenValue, blueValue);
beginShape();
XValue = map(mouseY, 0, height, -20, 100);
vertex(XValue, 300);
XValue = map(mouseY, 0, height, 110, 180);
YValue = map(mouseY, 0, height, 220, 250);
vertex(XValue, YValue);
XValue = map(mouseY, 0, height, 260, 310);
YValue = map(mouseY, 0, height, 240, 270);
vertex(XValue, YValue);
YValue = map(mouseY, 0, height, 200, 220);
vertex(400, YValue);
vertex(400, 300);
endShape(CLOSE);

//leaf and grass folds
/*noStroke();
fill(71, 158, 121);
triangle(200, 250, 210, 230, 215, 240);
triangle(340, 255, 340, 240, 350, 260);
triangle(390, 230, 390, 255, 380, 240);*/

//grass blades and flower stems
noStroke();

XValue = map(mouseY, 0, height, 150, 240);
YValue = map(mouseY, 0, height, 180, 220);

fill(116, 237, 198);
XValue1 = map(mouseY, 0, height, 160, 250);
XValue2 = map(mouseY, 0, height, 190, 260);
triangle(XValue-30, YValue+10, XValue1, 300, XValue2, 300);

//INITIAL FLOWER!!!!
fill(108, 219, 183);
XValue1 = map(mouseY, 0, height, 120, 220);
triangle(XValue, YValue, XValue1, 300, XValue, 300);

fill(98, 199, 166);
XValue1 = map(mouseY, 0, height, 200, 265);
XValue2 = map(mouseY, 0, height, 240, 295);
i = map(mouseY, 0, height, 60, 40);
triangle(XValue+i, YValue+10, XValue1, 300, XValue2, 300);

//middle flower
fill(98, 217, 166);
XValue1 = map(mouseY, 0, height, 230, 280);
XValue2 = map(mouseY, 0, height, 260, 300);
i = map(mouseY, 0, height, 125, 70);
triangle(XValue+i, YValue, XValue1, 300, XValue2, 300);

fill(116, 237, 198);
XValue1 = map(mouseY, 0, height, 285, 315);
XValue2 = map(mouseY, 0, height, 330, 340);
i = map(mouseY, 0, height, 180, 100);
triangle(XValue+i, YValue+20, XValue1, 300, XValue2, 300);

//far right flower
fill(98, 199, 166);
XValue1 = map(mouseY, 0, height, 365, 375);
i = map(mouseY, 0, height, 205, 130);
triangle(XValue+i, YValue, XValue1, 300, 390, 300);

//green lines under the flowers
stroke(71, 158, 121);
//left
XValue1 = map(mouseY, 0, height, 140, 230);
XValue2 = map(mouseY, 0, height, 160, 250);
line(XValue, YValue, XValue1, YValue-5);
line(XValue, YValue, XValue2, YValue-5);

//middle
XValue1 = map(mouseY, 0, height, 285, 320);
XValue2 = map(mouseY, 0, height, 275, 310);
XValue3 = map(mouseY, 0, height, 260, 300);
line(XValue2, YValue, XValue1, YValue);
line(XValue2, YValue, XValue3, YValue-5);

//left
XValue1 = map(mouseY, 0, height, 365, 380);
XValue2 = map(mouseY, 0, height, 350, 365);
i = map(mouseY, 0, height, 205, 130);
line(XValue+i, YValue, XValue1, YValue);
line(XValue+i, YValue, XValue2, YValue+5);

//other flower petals
noStroke();
fill(247, 62, 23);
//left
XValue1 = map(mouseY, 0, height, 160, 245);
XValue2 = map(mouseY, 0, height, 170, 255);
i = map(mouseY, 0, height, 30, 25);
triangle(XValue, YValue, XValue1, YValue-i, XValue2, YValue-20);

XValue1 = map(mouseY, 0, height, 127, 225);
XValue2 = map(mouseY, 0, height, 140, 240);
i = map(mouseY, 0, height, 25, 20);
triangle(XValue, YValue, XValue1, YValue-20, XValue2, YValue-i);

//middle
XValue1 = map(mouseY, 0, height, 260, 300);
XValue2 = map(mouseY, 0, height, 272, 310);
XValue3 = map(mouseY, 0, height, 275, 310);
triangle(XValue3, YValue, XValue1, YValue-20, XValue2, YValue-15);

XValue1 = map(mouseY, 0, height, 300, 330);
XValue2 = map(mouseY, 0, height, 280, 320);
i = map(mouseY, 0, height, 125, 70);
s = map(mouseY, 0, height, 25, 30);
triangle(XValue+i, YValue, XValue1, YValue-20, XValue2, YValue-s);

//right
XValue1 = map(mouseY, 0, height, 330, 350);
XValue2 = map(mouseY, 0, height, 350, 360);
i = map(mouseY, 0, height, 205, 130);
s = map(mouseY, 0, height, 8, 10);
triangle(XValue+i, YValue, XValue1, YValue, XValue2, YValue-s);

XValue1 = map(mouseY, 0, height, 370, 380);
XValue2 = map(mouseY, 0, height, 350, 370);
i = map(mouseY, 0, height, 205, 130);
s = map(mouseY, 0, height, 15, 10);
triangle(XValue+i, YValue, XValue1, YValue-s, XValue2, YValue-15);

//middle petal of each flower
stroke(166, 42, 15);
fill(247, 62, 23);
//left
XValue1 = map(mouseY, 0, height, 135, 230);
XValue2 = map(mouseY, 0, height, 160, 245);
triangle(XValue, YValue, XValue1, YValue-30, XValue2, YValue-25);
//middle
XValue1 = map(mouseY, 0, height, 270, 310);
XValue2 = map(mouseY, 0, height, 290, 320);
i = map(mouseY, 0, height, 125, 70);
triangle(XValue+i, YValue, XValue1, YValue-20, XValue2, YValue-30);
//right
XValue1 = map(mouseY, 0, height, 340, 350);
XValue2 = map(mouseY, 0, height, 355, 370);
i = map(mouseY, 0, height, 205, 130);
triangle(XValue+i, YValue, XValue1, YValue-10, XValue2, YValue-10);

//dark section of petals
noStroke();
fill(166, 42, 15);
//left
XValue1 = map(mouseY, 0, height, 135, 230);
XValue2 = map(mouseY, 0, height, 160, 245);
i = map(mouseY, 0, height, 38, 30);
triangle(XValue2, YValue-25, XValue1, YValue-30, XValue+10, YValue-i);
//middle
XValue1 = map(mouseY, 0, height, 260, 300);
XValue2 = map(mouseY, 0, height, 270, 310);
i = map(mouseY, 0, height, 130, 70);
triangle(XValue1, YValue-20, XValue2, YValue-15, XValue+i, YValue-20);

XValue1 = map(mouseY, 0, height, 270, 310);
XValue2 = map(mouseY, 0, height, 290, 320);
i = map(mouseY, 0, height, 115, 70);
s = map(mouseY, 0, height, 30, 25);
triangle(XValue1, YValue-20, XValue+i, YValue-s, XValue2, YValue-30);
//right
XValue1 = map(mouseY, 0, height, 340, 350);
XValue2 = map(mouseY, 0, height, 355, 370);
i = map(mouseY, 0, height, 205, 130);
s = map(mouseY, 0, height, 25, 20);
triangle(XValue2, YValue-10, XValue+i, YValue-s, XValue1, YValue-10);
}


