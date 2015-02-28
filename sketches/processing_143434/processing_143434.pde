
float centreX;
float centreY;

void setup() {
  size(500,500);
  centreX = width/2;
  centreY = height/2;
}
  
void draw() {
  
background(#FFFFFF);
fill(#FFFFFF);
stroke(#000000);
//cap//
ellipse(mouseX,mouseY-100,80,80);
rect(mouseX-40,mouseY-100,80,50);
stroke(#FFFFFF);
line(mouseX-39,mouseY-100,mouseX+39,mouseY-100);
noStroke();
//boca elipse//
fill(#EDCEB6);
ellipse(mouseX,mouseY-75,40,30);
//ulls voltant//
ellipse(mouseX-35,mouseY-100,20,20);
ellipse(mouseX+35,mouseY-100,20,20);
//ulls blanc//
fill(#FFFFFF);
ellipse(mouseX-35,mouseY-100,15,15);
ellipse(mouseX+35,mouseY-100,15,15);
//ulls blau//
fill(random(255),random(255),random(255),random(255));
ellipse(mouseX-39,mouseY-100,8,8);
ellipse(mouseX+39,mouseY-100,8,8);
//ulls negre//
fill(#000000);
ellipse(mouseX-39,mouseY-100,4,4);
ellipse(mouseX+39,mouseY-100,4,4);
//boca linea//
stroke(#000000);
line(mouseX-10,mouseY-75,mouseX+10,mouseY-75);
//cos//
fill(#FFFFFF);
ellipse(mouseX,mouseY,100,100);
stroke(#FFFFFF);
rect(mouseX-100,mouseY-50,200,50);
stroke(#000000);
line(mouseX-50,mouseY,mouseX-40,mouseY-50);
line(mouseX+50,mouseY,mouseX+40,mouseY-50);
//potes//
fill(#FFFFFF);
stroke(#000000);
rect(mouseX-40,mouseY,37,70);
rect(mouseX+3,mouseY,37,70);
stroke(#FFFFFF);
ellipse(mouseX,mouseY,95,99);
//panxa//
fill(#EDCEB6);
noStroke();
ellipse(mouseX,mouseY,40,60);

}












