
int redValue = 0;
int greenValue = 0;
int blueValue = 0;

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
redValue = map(mouseX, 0, width, 255, 166);
greenValue = map(mouseX, 0, width, 214, 0);
blueValue = map(mouseX, 0, width, 0, 100);
fill(redValue, greenValue, blueValue);
ellipse(250, 100, 120, 120);


redValue = map(mouseX, 0, width, 255, 110);
greenValue = map(mouseX, 0, width, 236, 0);
blueValue = map(mouseX, 0, width, 0, 66);
fill(redValue, greenValue, blueValue);
ellipse(238, 88, 80, 80);


redValue = map(mouseX, 0, width, 255, 46);
greenValue = map(mouseX, 0, width, 249, 0);
blueValue = map(mouseX, 0, width, 69, 28);
fill(redValue, greenValue, blueValue);
ellipse(230, 80, 50, 50);
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
triangle(140, 130, 190, 70, 140, 110);

//front
redValue = map(mouseX, 0, width, 237, 167);
greenValue = map(mouseX, 0, width, 193, 97);
blueValue = map(mouseX, 0, width, 134, 255);
fill(redValue, greenValue, blueValue);
triangle(140, 130, 240, 130, 190, 70);

//pyramid front
//front
redValue = map(mouseX, 0, width, 255, 199);
greenValue = map(mouseX, 0, width, 215, 132);
blueValue = map(mouseX, 0, width, 156, 255);
fill(redValue, greenValue, blueValue);
triangle(20, 160, 180, 160, 100, 50);
//back
redValue = map(mouseX, 0, width, 212, 90);
greenValue = map(mouseX, 0, width, 123, 59);
blueValue = map(mouseX, 0, width, 81, 115);
fill(redValue, greenValue, blueValue);
triangle(20, 160, 100, 50, 0, 130);

//front grass thing
noStroke();
redValue = map(mouseX, 0, width, 29, 71);
greenValue = map(mouseX, 0, width, 64, 71);
blueValue = map(mouseX, 0, width, 49, 4);
fill(redValue, greenValue, blueValue);
beginShape();
vertex(100, 300);
vertex(180, 250);
vertex(310, 270);
vertex(400, 220);
vertex(400, 300);
endShape(CLOSE);

//leaf and grass folds
noStroke();
fill(71, 158, 121);
triangle(200, 250, 210, 230, 215, 240);
triangle(340, 255, 340, 240, 350, 260);
triangle(390, 230, 390, 255, 380, 240);

//grass blades and flower stems
noStroke();
fill(116, 237, 198);
triangle(250, 300, 260, 300, 210, 230);

fill(108, 219, 183);
triangle(220, 300, 240, 300, 240, 220);

fill(98, 199, 166);
triangle(265, 300, 295, 300, 280, 230);

fill(98, 217, 166);
triangle(280, 300, 300, 300, 310, 220);

fill(116, 237, 198);
triangle(315, 300, 340, 300, 340, 240);

fill(98, 199, 166);
triangle(400, 290, 400, 270, 370, 220);

//green lines under the flowers
stroke(71, 158, 121);
line(240, 220, 230, 215);
line(240, 220, 250, 215);
line(310, 220, 320, 220);
line(310, 220, 300, 215);
line(370, 220, 380, 220);
line(370, 220, 365, 225);

//other flower petals
noStroke();
fill(247, 62, 23);
triangle(240, 220, 245, 195, 255, 200);
triangle(240, 220, 225, 200, 240, 200);
triangle(310, 220, 300, 200, 310, 205);
triangle(310, 220, 330, 200, 320, 190);
triangle(370, 220, 350, 220, 360, 210);
triangle(370, 220, 380, 210, 370, 205);

//middle petal of each flower
stroke(166, 42, 15);
fill(247, 62, 23);
triangle(240, 220, 230, 190, 245, 195);
triangle(310, 220, 310, 200, 320, 190);
triangle(370, 220, 350, 210, 370, 210);

//dark section of petals
noStroke();
fill(166, 42, 15);
triangle(245, 195, 230, 190, 250, 190);
triangle(300, 200, 310, 205, 310, 200);
triangle(310, 200, 310, 195, 320, 190);
triangle(370, 210, 370, 200, 350, 210);
}


