
void setup() {
    background(255);  
    size(500,500);
  fill(0, 102,150);
  smooth();
  noStroke();
}

void draw(){

fill(158,101,170,110);
ellipse(mouseX, mouseY,100,100);
fill(134,170,105,140);
triangle(mouseX,mouseY,100,110,200,170);
fill(119,207,211,55);
triangle(mouseX,mouseY,100,450,250,450);
fill(193,35,101,45);
triangle(mouseX,mouseY,450,100,450,250);
fill(95,209,158,55);
triangle(mouseX,mouseY,85,256,170,256);
fill(227,232,101,45);
triangle(mouseX,mouseY,280,300,475,450);
fill(247,127,127,55);
triangle(mouseX,mouseY,350,65,400,75);
fill(240,161,58,55);
triangle(mouseX,mouseY,45,45,75,75);

ellipse(mouseX, mouseY, 15,15);
}


